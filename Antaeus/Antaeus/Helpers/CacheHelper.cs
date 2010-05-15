using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace Antaeus.Helpers
{
    public class CacheHelper : ICacheHelper
    {
        public T Get<T>(string key) where T : class
        {
            T res = HttpContext.Current.Cache.Get(key) as T;

            return res;
        }

        public void Set<T>(string key, T obj, CacheItemRemovedCallback callback) where T : class
        {
            var slidingExpiration = TimeSpan.FromMinutes(15);
            HttpContext.Current.Cache.Add(key,
                obj,
                null,
                Cache.NoAbsoluteExpiration,
                slidingExpiration,
                CacheItemPriority.Normal,
                callback);
        }
    }
}