using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL
{
    public class WikiService
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();

        public Wiki GetWiki(KEYID keyId)
        {
            var con = ContextFactory.GetNewContext();
            var wiki = (from w in con.Wikis
                        where w.KID == keyId.ToString()
                        select w).Single();

            return wiki;
        }

        public WikiContent GetWikiContent(KEYID ki, string reversion)
        {
            var con = ContextFactory.GetNewContext();
            var wc = (from w in con.WikiContents
                        where w.KID == ki.ToString() && w.Reversion == reversion
                        select w).Single();
            return wc;
        }

        public Result InsertWiki(string username, string content, KEYID keyId)
        {
            var wikiContent = CreateWikiContent(username, content, keyId, "0");
            var wiki = new Wiki()
            {
                KID = keyId.ToString(),
                CrUserName = username,
                CreatedTime = TimeProvider.Now,
                CurrentWikiContentID = wikiContent.WikiContentID,
                MaxReversion = wikiContent.Reversion
            };

            var con = ContextFactory.GetNewContext();

            con.Wikis.InsertOnSubmit(wiki);
            con.WikiContents.InsertOnSubmit(wikiContent);

            con.SubmitChanges();

            return Result.Success();
        }

        public Result AddWikiContent(string username, string content, KEYID keyId, bool isMainReversion)
        {

            // 默认将新添加的WikiContent作为最新的Wiki内容
            var con = ContextFactory.GetNewContext();

            var wiki = (from w in con.Wikis
                        where w.KID == keyId.ToString()
                        select w).Single();

            string reversion = addVersion(wiki.MaxReversion, isMainReversion);
            var wikiContent = CreateWikiContent(username, content, keyId, reversion);


            wiki.CurrentWikiContentID = wikiContent.WikiContentID;
            wiki.MaxReversion = wikiContent.Reversion;

            con.WikiContents.InsertOnSubmit(wikiContent);

            con.SubmitChanges();

            return Result.Success();
        }

        public string addVersion(string maxReversion, bool isMainReversion)
        {
            int main, sub;
            string[] vers = maxReversion.Split('.');

            if (vers.Length == 2)
            {
                main = Convert.ToInt32(vers[0]);
                sub = Convert.ToInt32(vers[1]);
            }
            else if (vers.Length == 1)
            {
                main = Convert.ToInt32(vers[0]);
                sub = 0;
            }
            else
            {
                throw new Exception(string.Format("reversion的格式不对： {0}",maxReversion));
            }

            if (isMainReversion)
            {
                main++;
            }
            else
            {
                sub++;
            }

            return string.Format("{0}.{1}", main.ToString(), sub.ToString());
        }

        WikiContent CreateWikiContent(string username, string content, KEYID keyId, string reversion)
        {
            var wikiContent = new WikiContent()
            {
                WikiContentID = IDProvider.GetNewId("WikiContent"),
                KID = keyId.ToString(),
                Content = content,
                CrUserName = username,
                CreatedTime = TimeProvider.Now,
                Reversion = reversion
            };

            return wikiContent;
        }
    }

    public static class WikiIdentity
    {
        const string Prefix = "wiki:";

        public static bool IsWikiIdentity(this string key)
        {
            // WikiIdentity的格式应该是 wiki:key:id
            if (key.StartsWith(Prefix))
            {
                return KEYID.Valid( key.Substring(Prefix.Length));
            }
         
            return false;
        }

        public static KEYID ParseWikiKeyId(this string key)
        {
            if (!key.IsWikiIdentity())
            {
                throw new Exception(string.Format("the key {0} is not a valid WikiIdentity", key));
            }

            return new KEYID(key.Substring(Prefix.Length));
        }

        public static string ToWikiIdentity(this KEYID ki)
        {
            return Prefix + ki.ToString();
        }
    }
    public static class WikiExtension
    {
 
    }

}

