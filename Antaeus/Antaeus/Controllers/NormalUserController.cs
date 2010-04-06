using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.BL.Model;

namespace Antaeus.Controllers
{
    /// <summary>
    /// 包含所有普通用户的个人行为操作
    /// </summary>
    public class NormalUserController : Controller
    {

        //
        // GET: /NormalUser/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Rate(string kid, int rate)
        {
            // User
            return null;
        }

        public ActionResult AddFavorite(string kid, string tags)
        {
            HttpContext.GetNormalUser().AddFavorite(kid, tags);

            return null;
        }

        public ActionResult Answer(string kid, string answer, int correct, int cost)
        {
            return null;
        }


    }
}
