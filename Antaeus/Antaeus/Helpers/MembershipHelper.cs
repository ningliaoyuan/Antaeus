using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Antaeus.BL.Model;

namespace Antaeus
{
    public static class MembershipHelper
    {
        public static string GetUserName(this HttpContextBase httpContext)
        {
            //TODO: check null object
            return httpContext.User.Identity.Name;
        }

        public static NormalUser GetNormalUser(this HttpContextBase httpContext)
        {
            return UserFactory.GetNormalUser(httpContext.GetUserName());
        }


    }
}
