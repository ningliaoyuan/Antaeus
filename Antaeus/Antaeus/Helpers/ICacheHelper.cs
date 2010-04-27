using System;
namespace Antaeus
{
    interface ICacheHelper
    {
        T Get<T>(string key) where T : class;
        void Set<T>(string key, T obj, System.Web.Caching.CacheItemRemovedCallback callback) where T : class;
    }
}
