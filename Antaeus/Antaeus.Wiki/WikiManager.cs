using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.Wiki.Data;

namespace Antaeus.Wiki
{
    public class WikiManager : IWikiProvider
    {
        private WikiDbManager dbManager;

        public WikiManager()
        {
            dbManager = new WikiDbManager();
        }

        #region IWikiProvider Members

        public void WriteWiki(Wiki wiki)
        {
            dbManager.WriteWiki(wiki);
        }

        public void WriteWiki(WikiName name, WikiContent content)
        {
            dbManager.WriteWiki(name, content);
        }

        public Wiki GetLatestWiki(WikiName name)
        {
            return this.dbManager.GetLatestWiki(name);
        }

        public Wiki GetWiki(WikiName name, WikiVersion version)
        {
            return dbManager.GetWikiByVerslion(name, version);
        }

        public WikiVersion GetLatestWikiVersion(WikiName name)
        {
            return dbManager.GetLatestVersion(name);
        }

        public List<Wiki> GetWikiList(WikiName name)
        {
            return dbManager.GetWikisByName(name);
        }

        public void RestoreTo(WikiName name, WikiVersion version)
        {
            Wiki o = dbManager.GetWikiByVerslion(name, version);
            Wiki n = new Wiki();
            n.Name = o.Name;
            n.Content = o.Content;

            dbManager.WriteWiki(n);
        }

        #endregion
    }
}
