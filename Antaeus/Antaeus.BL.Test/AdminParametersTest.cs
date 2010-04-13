using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using System.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Antaeus;

namespace Antaeus.BL.Test
{
    [TestClass]
    public class AdminParametersTest
    {
        [TestMethod]
        public void TestSetAndGetFunction()
        {
            string connstr = ConfigurationManager.AppSettings["mongoDBTest"];
            var mongo = new Mongo(connstr);
            mongo.Connect();

            var testDB = mongo.GetDatabase("myTest");

            AdminParameters.DB = testDB;

            AdminParameters.Set(AdminParameters.SuggesttedTagsForUserFavorite, "hello");
            Assert.AreEqual(AdminParameters.Get(AdminParameters.SuggesttedTagsForUserFavorite), "hello");

            mongo.Disconnect();

        }

    }
}
