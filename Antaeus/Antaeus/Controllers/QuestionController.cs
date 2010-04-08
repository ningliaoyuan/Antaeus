using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.BL.Model;
using Antaeus.Helpers;
using Antaeus.BL;
using Antaeus.ORM;
using Antaeus.BL.Helpers;
namespace Antaeus.Controllers
{
    public class QuestionController : Controller
    {
        QuestionModel QuestionModel = new QuestionModel();
        CategoryRepository CategoryRepository = new CategoryRepository();
        WikiService WikiService = new WikiService();
        //
        // GET: /Question/
        public ActionResult Index(int? page, int? pagecount)
        {
            page = page.HasValue ? page : 1;
            pagecount = pagecount.HasValue ? pagecount : 10;
            IEnumerable<Question> questions = QuestionModel.SelectQuestion((page.Value - 1) * pagecount.Value, pagecount.Value);

            Pager p = new Pager()
            {
                CurrentPage = page.Value,
                PageCount = pagecount.Value,
                ReachLastPage = questions.Count() < pagecount.Value
            };
            this.ViewData.SetPager(p);

            return View(questions);
        }


        //
        // GET: /Question/Details/5

        public ActionResult Details(long id)
        {
            Question question = QuestionModel.Find(id);

            return View(question);
        }

        //
        // GET: /Question/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Question/Create

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize]
        public ActionResult Create(FormCollection collection,
            [MetaDataModelBinder("Content;ReadContent;Question;IsQuestionInFront;OptionA;OptionB;OptionC;OptionD;OptionE;CorrectMark;Answer")]
            MetaData meta)
        {
            try
            {
                string source = collection.GetString("Source");
                string categoryIDString = collection.GetString("CategoryID");
                string username = MembershipHelper.GetUserName();

                Question question;
                Result res = QuestionModel.CreateQuestion(categoryIDString, source, username, meta, out question);

                if (!res.IsSuccess)
                {
                    Response.Write(res.ErrorMessage);
                    Response.End();
                }

                // TODO: user Rate

                //Related
                //Knowledge
                //Tag
                string tags = collection["Tag"];
                TagService.GetTagProvider().Add(username, question.GetKeyId(), tags);

                //Answer

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        //
        // GET: /Question/Edit/5

        public ActionResult Edit(int id)
        {
            Question question = QuestionModel.Find(id);

            return View(question);
        }

        //
        // POST: /Question/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(int id)
        {
            // TODO:
            return View("index");
        }

        public ActionResult List()
        {
            return View();
        }

        public ActionResult Form(long id)
        {
            // id 为category id
            Category cate = CategoryRepository.Find(id);

            return PartialView(cate.QuestionMetaObj.CreateForm, cate.GetMeta());
        }

        public ActionResult DetailsTemp()
        {
            return View();
        }

        public ActionResult EditAnswer(long id, string wikiContent)
        {
            var ki = new KEYID("QuestionAnswer", id);
            var res = WikiService.AddWikiContent(MembershipHelper.GetUserName(), HttpUtility.UrlDecode(wikiContent), ki, false);

            return Content("obsolete:" + res.ToAjaxMessage());
        }

        [Authorize]
        public ActionResult Rate(long id, int rate)
        {
            var username = MembershipHelper.GetUserName();
            var res = new RateService().Rate(username, new KEYID("Question", id), rate);

            return Content(res.ToAjaxMessage());
        }

        public ActionResult GetAverage(long id)
        {
            var username = MembershipHelper.GetUserName();

            Question question = QuestionModel.Find(id);

            return Content(question.GetAverage().ToString("0.0"));
        }


        [Authorize]
        public ActionResult Comment(long id, string content)
        {
            var username = MembershipHelper.GetUserName();
            var res = new CommentService().AddComment(username, content, new KEYID("Question", id), "0");
            return RedirectToAction("Details", new { id = id });
        }

        public ActionResult Answer(long id, string answer, int correct,int cost)
        {
            var username = MembershipHelper.GetUserName();
            var res = QuestionModel.Answer(id, answer, correct, cost, username);
            return Content(res.ToAjaxMessage());
        }

    }
}
