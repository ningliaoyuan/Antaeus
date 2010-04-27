using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pls.SimpleMongoDb;

namespace Antaeus
{
    public class SMIDProvider : IIDProvider
    {
        #region IIDProvider Members

        public long GetNewId(string key)
        {
            IDItem idItem;
            // 获取idItem的实例，如果没有，用double check的方式创建实例
            if (!IDItems.TryGetValue(key, out idItem))
            {
                lock (_syncObj)
                {
                    if (!IDItems.TryGetValue(key, out idItem))
                    {
                        idItem = new IDItem(key);
                        IDItems.Add(key, idItem);
                    }
                }
            }

            return idItem.GetNewId();
        }
        static Dictionary<string, IDItem> IDItems = new Dictionary<string, IDItem>();
        static object _syncObj = new object();

        class IDItem
        {
            string _key;

            object _syncObj;

            long _current; // 当前最大值,已使用
            long _maxID;

            public IDItem(string key)
            {
                _key = key;
                _syncObj = new object();

                _current = 0;
                _maxID = 0;
            }

            public long GetNewId()
            {
                lock (_syncObj)
                {
                    if (_current == 0 || _current == _maxID)
                    {
                        using (var session = SMUtility.GetSession())
                        {
                            var store = session.GetStore();

                            var item = store.FindOne<IDItemData>(new { _id = _key });

                            if (item == null)
                            {
                                item = new IDItemData
                                {
                                    _id = _key,
                                    MaxID = 0,
                                    Cache = 20
                                };

                                store.Insert<IDItemData>(item);
                            }

                            _current = item.MaxID;
                            _maxID = item.MaxID + item.Cache;

                            item.MaxID = _maxID;
                            store.Update<IDItemData>(new { _id = _key }, item);
                        }
                    }
                    _current++;
                }

                return _current;
            }

            [Serializable]
            public class IDItemData:ISMObject<string>
            {
                public string _id { get; set; }
                public long MaxID;
                public int Cache;
            }

        }

        #endregion
    }

    public interface ISMObject<T>
    {
        T _id { get; set; }
    }
}
