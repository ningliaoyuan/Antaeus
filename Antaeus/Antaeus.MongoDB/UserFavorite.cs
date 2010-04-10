using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;

namespace Antaeus
{
    /// <summary>
    /// TODO: an idea 
    /// </summary>
    public class UserFavorite
    {
        public Database DB;

        #region properties
        IMongoCollection UserFavoriteCollection;
        Document List
        {
            get
            {
                if (_List == null)
                {
                    var list = InternalDocument["list"] as Document;
                    if (list == null)
                    {
                        list = new Document();
                        InternalDocument["list"] = list;
                    }
                    _List = list;
                }
                return _List;
            }
        }
        Document _List;

        Document KeyTag
        {
            get
            {
                if (_KeyTag == null)
                {
                    var keyTag = InternalDocument["keyTag"] as Document;
                    if (keyTag == null)
                    {
                        keyTag = new Document();
                        InternalDocument["keyTag"] = keyTag;
                    }
                    _KeyTag = keyTag;
                }
                return _KeyTag;
            }
        }
        Document _KeyTag;
        #endregion

        #region Update Actions
        public UserFavorite(Database db, string username)
        {
            DB = db;
            UserFavoriteCollection = DB["UserFavorite"];

            // initial from db
            var spec = new Document() { 
                    { "username", username }
                };

            InternalDocument = UserFavoriteCollection.FindOne(spec);

            if (InternalDocument == null)
            {
                InternalDocument = new Document { { "username", username } };
                DB["UserFavorite"].Insert(InternalDocument);
            }
        }

        public void Update(string key, long id, string tags)
        {

            Document previousItem = List.Get<Document>(GetKey(key, id));

            Document item = new Document{
                    {"key",key},
                    {"id",id},
                    {"Time",DateTime.Now},
                    {"tags",tags}
                };

            List[GetKey(key, id)] = item;

            // TODO: compare tags changed 
            if (previousItem != null)
            {
            }


            foreach (var tag in tags.Split(','))
            {
                if (string.IsNullOrEmpty(tag)) continue;

                var tagDoc = KeyTag[tag] as Document;
                if (tagDoc == null)
                {
                    KeyTag[tag] = new Document{
                        {"__tag",tag},
                        {key,1}
                    };
                }
                else
                {

                    int? i = tagDoc[key] as int?;
                    if (i.HasValue)
                    {
                        tagDoc[key] = i + 1;
                    }
                    else
                    {
                        tagDoc[key] = 1;
                    }
                }
            }

            UserFavoriteCollection.Update(InternalDocument);
        }

        public void Remove(string key, long id)
        {
            List.Remove(GetKey(key, id));
            UserFavoriteCollection.Update(InternalDocument);
        }
        #endregion

        #region read-only methods
        public string GetTags(string key, long id)
        {
            var item = List[GetKey(key, id)] as Document;

            if (item == null) return string.Empty;

            return (string)item["tags"];
        }

        public string GetTags(string key)
        {
            var res = from item in KeyTag.Values.OfType<Document>()
                      where (item[key] as int?) > 0
                      select item["__tag"] as string;

            return string.Join(",", res.Distinct().ToArray());
        }

        public List<long> GetIDs(string key, string tag)
        {
            var res = from item in List.Values.OfType<Document>()
                      where item.Get<string>("key") == key && item.Get<string>("tags").Split(',').Contains(tag)
                      orderby item.Get<long>("id") descending
                      select item.Get<long>("id");
                      
            return res.ToList();
        }
        public List<long> GetIDs(string key)
        {
            var res = from item in List.Values.OfType<Document>()
                      where item.Get<string>("key") == key
                      orderby item.Get<long>("id") descending
                      select item.Get<long>("id");

            return res.ToList();
        }
        public Document InternalDocument;

        private string GetKey(string key, long id)
        {
            return string.Concat(key, '_', id);
        }



        public bool HasFavorite(string key, long id)
        {
            Document item = List.Get<Document>(GetKey(key, id));
            return item != null;
        }


        public List<long> GetIds(string key, long minId, int count)
        {
            var res = from item in List.Values.OfType<Document>()
                      where item.Get<string>("key") == key && item.Get<long>("id") < minId
                      orderby item.Get<long>("id") descending
                      select item.Get<long>("id");

            return res.Take(count).ToList();
        }

        #endregion

    }


    public class UserFavoriteFactory
    { 
        public static UserFavorite GetUserFavorite(string username)
        {
            var db = MongoUtility.GetMongoDatabase();
            
            return new UserFavorite(db, username);
        }
    }
}
