using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Antaeus.Helpers
{
    public static class MembershipHelper
    {
        public static string GetUserName(this HttpContextBase httpContext)
        {
            //TODO: check null object
            return httpContext.User.Identity.Name;
        }
    }
}
