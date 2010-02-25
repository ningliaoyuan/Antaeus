using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Antaeus.BL.Model;
using Antaeus.ORM;
using Antaeus.BL.Helpers;

namespace Antaeus.Admin.Controllers
{
    public class CategoryController : Controller
    {
        CategoryRepository CategoryRepository = new CategoryRepository();

        //
        // GET: /Category/

        public ActionResult Index()
        {
            var list = CategoryRepository.SelectAll();

            return View(list);
        }

        //
        // GET: /Category/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Category/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Category/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(string name, string shortName, string questionType, MetaData metaData)
        {
            try
            {
                Category cate = new Category()
                {
                    Name = name,
                    ShortName = shortName,
                    QuestionType = questionType
                };
                cate.SetMeta(metaData);

                CategoryRepository.Insert(cate);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Category/Edit/5
 
        public ActionResult Edit(long id)
        {
            return View(CategoryRepository.Find(id));
        }

        //
        // POST: /Category/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(long id)
        {
            CategoryRepository.Delete(id);

            return RedirectToAction("Index");
        }
    }
}
