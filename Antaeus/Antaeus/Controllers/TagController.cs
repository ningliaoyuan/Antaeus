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
        ITagProvider TagProvider = TagService.GetTagProvider();
 

        //
        // GET: /Tag/

        public ActionResult Detail(string tag,int? page, int? pagecount)
        {
            int count = pagecount.HasValue ? pagecount.Value : 10;
            int start = page.HasValue ? (page.Value - 1)*count: 0;

            List<string> kiList = TagProvider.GetKIs(tag).Skip(start).Take(count).ToList();

            return View(kiList);
        }

        // /Tag/Question/1001/tag1,tag2
        public ActionResult Add(string key,long id, string tags)
        {
            var username = MembershipHelper.GetUserName();

            var res = TagProvider.Add(username, new KEYID(key, id), tags);

            return Content(res.ToAjaxMessage());
        }
    


    }
}
