using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace Antaeus.BL
{
    public static class NameValueCollectionExtsension
    {
        public static string GetString(this NameValueCollection form, string key)
        {
            // TODO: validate and trim
            // return string.empty when the value is null
            // prevent sql injection 
            return form[key];
        }
    }
}
