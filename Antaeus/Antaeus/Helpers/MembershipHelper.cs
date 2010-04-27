using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Antaeus.BL.Model;
using System.Web.Caching;

namespace Antaeus
{
    public static class MembershipHelper
    {
        public static string GetUserName()
        {
            //TODO: check null object
            return HttpContext.Current.User.Identity.Name;
        }

        public static NormalUser GetNormalUser()
        {
            return UserFactory.GetNormalUser(GetUserName());
        }
    }   
}
