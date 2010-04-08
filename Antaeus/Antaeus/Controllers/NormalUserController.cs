using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.BL.Model;
using Antaeus.BL;

namespace Antaeus.Controllers
{
    /// <summary>
    /// ����������ͨ�û��ĸ�����Ϊ����
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

        public ActionResult FavoriteAdd(string key, long id)
        {
            MembershipHelper.GetNormalUser().FavoriteAdd(key, id, string.Empty);
            return Content(Result.Success().ToAjaxMessage());
        }

        public ActionResult FavoriteAddTags(string key, long id, string tags)
        {
            MembershipHelper.GetNormalUser().FavoriteAdd(key, id, tags);
            return Content(Result.Success().ToAjaxMessage());
        }

        public ActionResult FavoriteRemove(string key, long id)
        {
            MembershipHelper.GetNormalUser().FavoriteRemove(key, id);
            return Content(Result.Success().ToAjaxMessage());
        }
        

        public ActionResult Answer(string kid, string answer, int correct, int cost)
        {
            return null;
        }


    }
}
