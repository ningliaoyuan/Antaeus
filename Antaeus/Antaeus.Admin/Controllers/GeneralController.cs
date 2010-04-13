using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Antaeus.Admin.Controllers
{
    public class GeneralController : Controller
    {
        //
        // GET: /General/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Fliter()
        {
            return View();
        }
        public ActionResult FavoriteTagRecommend()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult FavoriteTagRecommend(string tags)
        {
            if (!string.IsNullOrEmpty(tags))
            {
                AdminParameters.Set(AdminParameters.SuggesttedTagsForUserFavorite, tags);
            }

            return RedirectToAction("FavoriteTagRecommend");
        }

    }
}
