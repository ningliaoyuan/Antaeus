using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using log4net;

using Antaeus.Common;
using Antaeus.ORM;

namespace Antaeus.Wiki.Data
{
    internal sealed class WikiDbManager
    {
        public JB8ORMDataContextFactory ContextFactory = new JB8ORMDataContextFactory();
        
        private readonly String connectionString;

        private static ILog logger;

        static WikiDbManager()
        {
            logger = LogManager.GetLogger(typeof(WikiDbManager));
        }

        internal WikiDbManager()
        {
            connectionString = Configuration.GetConnectionString("WikiDbConnectionString", @"Data Source=ZIZ-LYNNING-02;Initial Catalog=Antaeus2.Database;Integrated Security=True");
        }

        internal List<Wiki> GetWikisByName(WikiName name)
        {
            List<Wiki> list = new List<Wiki>();
            var con = ContextFactory.GetNewContext();
            list = (from wiki in con.Wikis
                    where wiki.Name == name.Text
                    select new Wiki()
                    {
                        Content = new WikiContent(wiki.Content),
                        Name = new WikiName(wiki.Name),
                        Version = new WikiVersion(wiki.Version),
                        CreatedAt = wiki.CreatedAt
                    }).ToList();
            return list;

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = connectionString;

                SqlCommand cmd = connection.CreateCommand();                

                cmd.CommandText = "SELECT * FROM [Wiki] WHERE name='" + name.Text + "'";
                
                logger.Info(cmd.CommandText);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        Wiki wiki = new Wiki();
                        WikiName n = new WikiName(reader.GetString(1));
                        WikiContent c = new WikiContent(reader.GetString(2));
                        WikiVersion v = new WikiVersion(reader.GetInt32(3));
                        wiki.Name = n;
                        wiki.Content = c;
                        wiki.Version = v;
                        wiki.CreatedAt = reader.GetDateTime(4);

                        list.Add(wiki);
                    }

                }
                finally
                {
                    if (!reader.IsClosed)
                    {
                        reader.Close();
                    }
                }

            }

            return list;
        }

        internal bool IsExist(WikiName name)
        {
            var con = ContextFactory.GetNewContext();
            var wiki = con.Wikis.SingleOrDefault(w => w.Name == name.Text);
            return wiki != null;
        }

        internal WikiVersion GetLatestVersion(WikiName name)
        {
            if (!this.IsExist(name))
            {
                logger.Debug(String.Format("{0} was not found", name.Text));
                throw new WikiException(String.Format("Wiki {0} was not found", name.Text));
            }

            WikiVersion version = null;

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = connectionString;
                connection.Open();
                SqlCommand cmd = connection.CreateCommand();

                cmd.CommandText = "SELECT TOP 1 * FROM [Wiki] WHERE name=@name ORDER BY version DESC";

                cmd.Parameters.AddWithValue("@name", name.Text);
                
                logger.Info(cmd.CommandText);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    version = new WikiVersion(reader.GetInt32(3));
                }
            }

            return version;
        }

        internal void WriteWiki(WikiName name, WikiContent content)
        {
            Wiki wiki = new Wiki();
            wiki.Name = name;
            wiki.Content = content;

            WriteWiki(wiki);
        }

        internal void WriteWiki(Wiki wiki)
        {
            if (this.IsExist(wiki.Name))
            {
                WikiVersion oldVer = this.GetLatestVersion(wiki.Name);

                int nv = int.Parse(oldVer.ToString());

                WikiVersion newVer = new WikiVersion(++nv);

                wiki.Version = newVer;
            }
            else
            {
                wiki.Version = new WikiVersion(1);
            }

            wiki.CreatedAt = DateTime.Now;

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = connectionString;
                connection.Open();

                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "INSERT INTO wiki (Name, Content, Version, CreatedAt) VALUES ( @name, @content, @version, @createdAt)";

                cmd.Parameters.AddWithValue("@name", wiki.Name.Text);
                cmd.Parameters.AddWithValue("@content", wiki.Content.Text);
                cmd.Parameters.AddWithValue("@version", wiki.Version.ToString());
                cmd.Parameters.AddWithValue("@createdAt", wiki.CreatedAt);

                logger.Info(cmd.CommandText);

                int result = cmd.ExecuteNonQuery();

                if (result == 0)
                {
                    throw new WikiException("Write wiki faild");
                }
            }
        }

        internal Wiki GetLatestWiki(WikiName name)
        {
            return GetWikiByVerslion(name, this.GetLatestVersion(name));
        }

        internal Wiki GetWikiByVerslion(WikiName name, WikiVersion ver)
        {
            Wiki wiki = null;

            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = connectionString;

                SqlCommand cmd = connection.CreateCommand();

                cmd.CommandText = "SELECT TOP 1 * FROM [Wiki] WHERE [Name]=@name ORDER BY [Version] DESC";
                cmd.Parameters.AddWithValue("@name", name.Text);
                
                logger.Info(cmd.CommandText);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    wiki = new Wiki();
                    wiki.Name = new WikiName(reader.GetString(1));
                    wiki.Content = new WikiContent(reader.GetString(2));
                    wiki.Version = new WikiVersion(reader.GetInt32(3));
                    wiki.CreatedAt = reader.GetDateTime(4);
                }
            }

            if (wiki == null)
            {

                throw new WikiException("The Wiki not found.");
            }

            return wiki;
        }
    }
}
