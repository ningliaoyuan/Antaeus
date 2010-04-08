using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;

namespace Antaeus
{
    public static class MongoUtility
    {
        /// <summary>
        /// 下划线表示系统内部标识Tag， 例如 "__empty";
        /// </summary>
        public const string EmptyString = "__empty";

        public const string ConnectionString = "Server=localhost:27017";

        public static T Get<T>(this Document d, string key, T defaultVal)
        {
            var obj = d[key];
            if (obj is T)
            {
                return (T)obj;
            }
            else
            {
                return defaultVal;
            }
        }

        public static T Get<T>(this Document d, string key)
        {
            return Get<T>(d, key, default(T));
        }

        public static Database GetMongoDatabase()
        {
            if (_MongoDatabase == null)
            {
                //string connstr = ConfigurationManager.AppSettings["mongoDBTest"];
                string connstr = ConnectionString;

                var mongo = new Mongo(connstr);
                mongo.Connect();

                _MongoDatabase = mongo.GetDatabase("Antaeus_v1");
            }
            return _MongoDatabase;
        }

        static Database _MongoDatabase;

    }
}
