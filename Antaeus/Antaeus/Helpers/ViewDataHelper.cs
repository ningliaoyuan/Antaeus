using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Antaeus.Helpers
{
    public static class ViewDataHelper
    {
        public static Pager GetPager(this ViewDataDictionary viewData)
        {
            return viewData.GetVal<Pager>("Pager", new Pager());
        }
        public static void SetPager(this ViewDataDictionary viewData, Pager pager)
        {
            viewData["Pager"] = pager;
        }


        static T GetVal<T>(this ViewDataDictionary viewData, string key, T def)
        {
            object obj;
            if (viewData.TryGetValue(key, out obj))
            {
                return (T)obj;
            }
            else
            {
                return def;
            }
        }
    }

    public class Pager
    {
        public int CurrentPage = 1;
        public int PageCount = 10;
        public bool ReachLastPage = false;
    }
}
