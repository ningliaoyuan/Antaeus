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

            Favorite = UserFavoriteFactory.GetUserFavorite(username);
        }

        public string Username
        {
            get;
            private set;
        }

        UserFavorite Favorite;

        public void FavoriteAdd(string key,long id, string tags)
        {
            Favorite.Update(key, id, tags);
            return;
        }

        public void FavoriteRemove(string key, long id)
        {
            Favorite.Remove(key, id);
        }



        public void GetTags()
        {
        }


        public bool HasFavorite(string key, long id)
        {
            return Favorite.HasFavorite(key, id);
        }

       
       
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
