using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL
{
    public interface IIDProvider
    {
        long GetNewId(string key);
    }

    public class DBIDProvider : IIDProvider
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;

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
                        idItem = new IDItem(key, ContextFactory);
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
            string Key;
            object _syncObj;
            JB8ORMDataContextFactory ContextFactory;

            public IDItem(string key, JB8ORMDataContextFactory contextFactory)
            {
                Key = key;
                ContextFactory = contextFactory;
                _syncObj = new object();

                _current = 0;
                _maxID = 0;
            }

            long _current; // 当前最大值,已使用
            long _maxID;
            void createItem()
            {
                var con = ContextFactory.GetNewContext();

                var item = new ID()
                           {
                               Key = Key,
                               MaxID = 0,
                               Cache = 20
                           };
                // create new item with the key
                con.IDs.InsertOnSubmit(item);
                con.SubmitChanges();
            }

            public long GetNewId()
            {
                lock (_syncObj)
                {
                    if (_current == 0 || _current == _maxID)
                    {
                        var con = ContextFactory.GetNewContext();
                        var item = con.IDs.SingleOrDefault(id => id.Key == Key);
                        if (item == null)
                        {
                            createItem();
                            item = con.IDs.Single(id => id.Key == Key);
                        }

                        _current = item.MaxID;
                        _maxID = item.MaxID + item.Cache;

                        item.MaxID = _maxID;
                        con.SubmitChanges();
                    }
                    _current++;
                }

                return _current;
            }
        }
    }

    public class SimpleIDProvider : IIDProvider
    {
        #region IIDProvider Members

        public long GetNewId(string key)
        {
            while (DateTime.Now.Ticks == _lastTicks) { }

            _lastTicks = DateTime.Now.Ticks;
            return _lastTicks;
        }

        long _lastTicks;

        #endregion
    }

}
