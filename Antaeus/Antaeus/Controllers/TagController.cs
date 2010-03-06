using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.Helpers;
using Antaeus.BL;

namespace Antaeus.Controllers
{
    public class TagController : Controller
    {
        TagService tagService = new TagService();
        //
        // GET: /Tag/

        public ActionResult Detail()
        {
            return View();
        }

        // /Tag/Question/1001/tag1,tag2
        public ActionResult Add(string key,long id, string tags)
        {
            var username = HttpContext.GetUserName();

            var res = tagService.Add(username, new KEYID(key, id), tags);

            return Content(res.ToAjaxMessage());
        }
    


    }
}
