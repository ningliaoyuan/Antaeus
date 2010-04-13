using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;

namespace Antaeus
{
    public class AdminParameters
    {
        public static Database DB
        {
            get
            {
                if (_DB == null)
                {
                    _DB = MongoUtility.GetMongoDatabase();
                }

                return _DB;
            }
            set
            {
                _DB = value;
            }
        }

        static Database _DB;


        public const string SuggesttedTagsForUserFavorite = "SuggesttedTagsForUserFavorite";

        static IMongoCollection AdminParametersCollection
        {
            get
            {
                return DB.GetCollection("AdminParameters");
            }

        }

        public static void Set(string key, string val)
        {
            var doc = new Document { { "key", key } };

            var res = AdminParametersCollection.FindOne(doc);
            if (res == null)
            {
                doc.Add("value", val);
                AdminParametersCollection.Insert(doc);
            }
            else
            {
                res["value"] = val;
                AdminParametersCollection.Update(res);
            }
        }
        public static string Get(string key)
        {
            var doc = new Document { { "key", key } };

            var res = AdminParametersCollection.FindOne(doc);
            if (res == null)
            {
                return string.Empty;
            }
            else
            {
                return res["value"].ToString();
            }
        }
    }
}
