using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;
using MongoDB.Driver;

namespace Antaeus.BL.Test
{


    [TestClass]
    public class UserFavoriteTest
    {
        [TestMethod]
        public void FavoriteAdd()
        {
            string connstr = ConfigurationManager.AppSettings["mongoDBTest"];
            var mongo = new Mongo(connstr);
            mongo.Connect();

            var testDB = mongo.GetDatabase("myTest");
            UserFavorite fav = new UserFavorite(testDB, "testUserName" + DateTime.Now.ToShortTimeString());


            fav.Update("question", 101, "tag1,tag2");
            fav.Update("question", 102, "tag3,tag4");
            fav.Update("question", 104, "tag3,tag4,tag5");
            fav.Update("question", 103, "tag1,tag2");
            fav.Update("k", 101, "tag1,tag2");
            fav.Update("k", 102, "tag2,tag7");
            fav.Update("k", 103, "tag1,tag5");
            fav.Update("k", 104, "tag1,tag5");
            fav.Update("k", 105, "tag1,tag5");
            fav.Update("k", 106, "tag1,tag5");


            Assert.IsTrue(Compare(fav.GetTags("k"), "tag1,tag2,tag7,tag5"));
            Assert.IsTrue(Compare(fav.GetTags("question"), "tag1,tag2,tag3,tag4,tag5"));
            Assert.AreEqual("tag1,tag5", fav.GetTags("k", 103));
            Assert.AreEqual("tag1,tag2", fav.GetTags("question", 103));

            Assert.IsTrue(fav.GetIDs("question", "tag1").Contains(101));
            Assert.IsTrue(fav.GetIDs("question", "tag1").Contains(103));

            Assert.AreEqual(5, fav.GetIDs("k", "tag1").Count);
            Assert.AreEqual(6, fav.GetIDs("k").Count);
            Assert.AreEqual(0, fav.GetIDs("foofoo").Count);
            Assert.AreEqual(4, fav.GetIDs("question").Count);


            Assert.IsTrue(fav.HasFavorite("question", 103));
            Assert.IsFalse(fav.HasFavorite("k", 203));

            fav.Remove("question", 103);

            Assert.IsFalse(fav.HasFavorite("question", 103));

            mongo.Disconnect();
        }

        public void FavoriteUpdate_Multiple()
        {
            string connstr = ConfigurationManager.AppSettings["mongoDBTest"];
            var mongo = new Mongo(connstr);
            mongo.Connect();

            var testDB = mongo.GetDatabase("myTest");
            UserFavorite fav = new UserFavorite(testDB, "lynn");

            fav.Update("q", 1, "t1,t2,t2");
        }

        bool Compare(string list1, string list2)
        {
            var l1 = list1.Split(',').Distinct().OrderBy(i => i);
            var l2 = list2.Split(',').Distinct().OrderBy(i => i);
            if(l1.Count() != l2.Count())
            {
                return false;
            }

            return l2.SequenceEqual(l1);
        }
    }
}
