using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;

namespace Antaeus.MongoDB
{
    public class MongoUtility
    {
        /// <summary>
        /// 下划线表示系统内部标识Tag， 例如 "__empty";
        /// </summary>
        public const string EmptyString = "__empty";


        public const string ConnectionString = "Server=localhost:27017";

        public void AddFavorite2222222222(string ki, string tag)
        {
            var mongo = new Mongo(ConnectionString);

            mongo.Connect();

            var antaeusDB = mongo.GetDatabase("Antaeus");

            var userFavorite = antaeusDB.GetCollection("UserFavorite");

            var doc = new Document();
        }
    }
}
