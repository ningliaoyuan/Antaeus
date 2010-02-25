using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.BL;
using Antaeus.Helpers;
using Antaeus.ORM;

namespace Antaeus.Controllers
{
    public class WikiController : Controller
    {
        WikiService WikiService = new WikiService();

        public ActionResult History(string keyid)
        {
            var ki = new KEYID(keyid);
            Wiki w = WikiService.GetWiki(ki);

            return View(w);
        }

        //
        // GET: /Wiki/Details/5

        public ActionResult Details(string keyid, string ver)
        {
            var ki = new KEYID(keyid);
            WikiContent wc = WikiService.GetWikiContent(ki, ver);
            
            return View(wc);
        }

        //
        // GET: /Wiki/Edit/5

        public ActionResult Edit(string keyid, string wikiContent)
        {
            var ki = new KEYID(keyid);
            var res = WikiService.AddWikiContent(HttpContext.GetUserName(), HttpUtility.UrlDecode(wikiContent), ki, false);

            return Content(res.ToAjaxMessage());
        }

    }
}
