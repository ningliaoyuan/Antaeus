using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Antaeus
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               "NormalUser",
               "NormalUser/{action}",
               new { controller = "NormalUser" }
           );

            routes.MapRoute(
                "TagController",
                "Tag/{action}/{tag}",
                new { controller = "tag" }                         // Parameter defaults
            );

            routes.MapRoute(
                "Wiki",                                             // Route name
                "wiki/{action}/{keyid}",                            // URL with parameters
                new { controller = "wiki" }                         // Parameter defaults
            );

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );

            // "/Tag/Add/Question/1001/tag1,tag2"
            routes.MapRoute(
                "Tag",
                "{Controller}/{action}/{key}/{id}/{tags}"
            );
            
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
        }
    }
}