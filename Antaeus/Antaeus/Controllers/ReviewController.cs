using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Antaeus.Controllers
{
    public class ReviewController : Controller
    {
        //
        // GET: /Review/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Edit()
        {
            return View();
        }

        public ActionResult Process()
        {
            return View();
        }
        public ActionResult Result()
        {
            return View();
        }

        // 获取整个表格
        // 传入参数：总复习天数，模式，每日复习时间
        // 返回：整个Table的html 
        public ActionResult GetTable(int days=60, int mode=0, int time=4)
        {
            ViewData["days"] = days;
            return View();
        }

        /// <summary>
        /// 获取整体复习数量和推荐描述
        /// 传入参数：模式，每日复习时间，每个的时长[数组]
        /// 返回：JSON 
        /// </summary>
        /// <param name="mode"></param>
        /// <param name="time"></param>
        /// <param name="periods">分号分隔的时间数组</param>
        /// <returns></returns>
        public ActionResult GetDesc(int mode = 0, int time = 4, string periods ="1;2")
        {
            var res = periods.Split(';').Select(s => int.Parse(s)).Select(
                t =>
                {
                    return new { qCount = t * time * 10, desc = "test" + mode };
                }).ToList();
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        // 获取单个时长的推荐描述
        // 传入参数：总复习天数，每日复习时间，项名称
        // 返回：Table的html 
        public ActionResult GetTimeTable(int days = 60, int time = 4, int mode = 0)
        {
            ViewData["days"] = days;
            return View();
        }

    }
}
