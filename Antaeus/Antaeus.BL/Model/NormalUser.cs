using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;

namespace Antaeus.BL.Model
{
    public class NormalUser
    {
        public NormalUser(string username)
        {
            Username = username;
        }

        public string Username
        {
            get;
            private set;
        }

        public void AddFavorite(string kid, string tags)
        {
            string key = new KEYID(kid).KEY;
            long id= new KEYID(kid).ID;

            FavoriteQuestion[id] = tags;
            return;
        }


        public void GetTags()
        {
        }

        FavoriteSet FavoriteQuestion;

    }

        
    class Favorite:Dictionary<string,FavoriteSet>
    {
    }

    class FavoriteSet : Dictionary<long,stirng>
    {
    }


    public class UserFactory
    {
        public static NormalUser GetNormalUser(string username)
        {
            var user = CacheHelper.Get<NormalUser>(username, delegate()
            {
                return new NormalUser(username);
            });

            return user;
        }
    }

    public class CacheHelper
    {
        public static T Get<T>(string key, Func<T> create) where T:class
        {
            // 将对象类型合并到key里
            key = string.Concat(typeof(T).ToString(), "_", key);

            var cache = HttpContext.Current.Cache;

            T res = cache.Get(key) as T;
            if (res != null)
            {
                return res;
            }
            else
            {
                res= create();

                cache.Insert(key, res);

                return res;
            }
        }
    }
}
