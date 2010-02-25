using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;

using Microsoft.VisualStudio.TestTools.UnitTesting;

using Antaeus.Wiki;

namespace Antaeus.Wiki.Test
{
    /// <summary>
    /// Summary description for UnitTest1
    /// </summary>
    [TestClass]
    public class WikiTest
    {
        [TestMethod]
        public void AddWikiTest()
        {
            Guid wiki_name = Guid.NewGuid();
            WikiName name = new WikiName(wiki_name.ToString());
            WikiContent content = new WikiContent("this is wiki content...");
            Wiki wiki = new Wiki();

            wiki.Name = name;
            wiki.Content = content;

            WikiManager wm = new WikiManager();
            wm.WriteWiki(wiki);
            Wiki dbWiki = wm.GetWiki(name, new WikiVersion(1));

            Assert.IsTrue(wm.GetWikiList(name).Count == 1);
            Assert.IsTrue(wiki.Version.Value == 1);
        }

        [TestMethod]
        public void GetWikisTest()
        {
            Int32 count = 10;
            WikiManager wm = new WikiManager();
            Guid wiki_name = Guid.NewGuid();         
            WikiName name = new WikiName(wiki_name.ToString());

            for (int i = 0; i < count; i++)
            {                
                WikiContent content = new WikiContent(string.Format("this is wiki content...{0}", i));
                
                Wiki wiki = new Wiki();
                wiki.Name = name;
                wiki.Content = content;

                wm.WriteWiki(wiki);
            }

            List<Wiki> list = wm.GetWikiList(name);
            Assert.IsTrue(count == list.Count);
        }

        [TestMethod]
        public void GetLastVersionTest()
        {
            Int32 total = 100;
            String wikiName = Guid.NewGuid().ToString();
            WikiManager wm = new WikiManager();
            for (int i = 0; i < total; i++)
            {
                Wiki w = new Wiki();
                w.Name = new WikiName(wikiName);
                w.Content = new WikiContent(String.Format("{0}|{1}", wikiName, DateTime.Now.Ticks.ToString()));
                wm.WriteWiki(w);
            }

            WikiVersion latestWikiVersion = wm.GetLatestWikiVersion(new WikiName(wikiName));

            Assert.AreEqual(latestWikiVersion.Value, total);
        }
    }
}
