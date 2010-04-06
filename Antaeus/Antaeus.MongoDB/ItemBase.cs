using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Antaeus.MongoDB
{
    public class ItemBase
    {
        public ItemBase(string crUserName, string crDateTime)
        {
            CrDateTime = crDateTime;
            CrUserName = crUserName;
        }

        public ItemBase()
        {
            string crDateTime = "";
            string crUserName = MongoUtility.EmptyString;

            if (HttpContext.Current != null && HttpContext.Current.User != null &&
                HttpContext.Current.User.Identity != null)
            {
                crUserName = HttpContext.Current.User.Identity.Name;
            }

            CrDateTime = crDateTime;
            CrUserName = crUserName;
        }

        public string CrDateTime;
        public string CrUserName;

    }
}
