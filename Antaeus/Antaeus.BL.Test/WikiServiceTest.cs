using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Antaeus.BL.Test
{
    /// <summary>
    /// Summary description for WikiServiceTest
    /// </summary>
    [TestClass]
    public class WikiServiceTest
     {
        public IIDProvider IDProvider = new DBIDProvider();
        const string KEY = "WikiServiceTest";
        
        [TestMethod]
        public void InsertWikiTest()
        {
            var ws = TestHelper.GetTestObj<WikiService>();

            long id = IDProvider.GetNewId("InsertWikiTest");

            KEYID ki = new KEYID(KEY, id);

            var res = ws.InsertWiki("test", "init content", ki);

            Assert.IsTrue(res.IsSuccess);

            var wiki = ws.GetWiki(ki);

            Assert.AreEqual(wiki.CrUserName, "test");
            Assert.AreEqual(wiki.WikiContent.Content, "init content");
        }

        [TestMethod]
        public void AddWikiContentTest()
        {
            var ws = TestHelper.GetTestObj<WikiService>();

            long id = IDProvider.GetNewId("InsertWikiTest");

            KEYID ki = new KEYID(KEY, id);

            var res = ws.InsertWiki("test", "init content", ki);

            Assert.IsTrue(res.IsSuccess);

            var wiki = ws.GetWiki(ki);

            Assert.AreEqual(wiki.CrUserName, "test");
            Assert.AreEqual(wiki.WikiContent.Content, "init content");
            Assert.AreEqual(wiki.WikiContent.CrUserName, "test");

            res = ws.AddWikiContent("lanslot", "second content", ki, true);
            res = ws.AddWikiContent("lynn", "third content", ki,false);

            Assert.IsTrue(res.IsSuccess);

            var wiki2 = ws.GetWiki(ki);
            Assert.AreEqual(wiki2.CrUserName, "test");
            Assert.AreEqual(wiki2.WikiContent.Content, "third content");
            Assert.AreEqual(wiki2.WikiContent.CrUserName, "lynn");
            Assert.AreEqual(wiki2.WikiContent.Reversion, "1.1");

        }

        [TestMethod]
        public void AddReversionTest()
        {
            var ws = TestHelper.GetTestObj<WikiService>();

            Assert.AreEqual(ws.addVersion("0", true), "1.0");
            Assert.AreEqual(ws.addVersion("0", false), "0.1");
            Assert.AreEqual(ws.addVersion("23.34", true), "24.34");
            Assert.AreEqual(ws.addVersion("23.34", false), "23.35");

        }

    }
}
