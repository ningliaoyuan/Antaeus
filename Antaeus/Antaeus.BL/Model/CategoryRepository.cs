using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;
using System.Linq.Expressions;

namespace Antaeus.BL.Model
{
    public class CategoryRepository: BaseRepository<Category>
    {
        public IIDProvider IDProvider = new DBIDProvider();

        public override Result Insert(Category cate)
        {
            if (cate.CategoryID == 0) cate.CategoryID = IDProvider.GetNewId("Category");

            var con = ContextFactory.GetNewContext();
            con.Categories.InsertOnSubmit(cate);
            con.SubmitChanges();

            return Result.Success();
        }

        public override Category Find(long id)
        {
            var cate = ContextFactory.GetNewContext().Categories.SingleOrDefault(c => c.CategoryID == id);

            if (cate == null)
            {
                throw new Exception("invalid category id:" + id.ToString());
            }
            return cate;
        }

        public override Result Delete(long id)
        {
            var con = ContextFactory.GetNewContext();
            var cate = con.Categories.SingleOrDefault(c => c.CategoryID == id);
            con.Categories.DeleteOnSubmit(cate);
            con.SubmitChanges();
         
            return Result.Success();
        }

        public override IEnumerable<Category> Select(Expression<Func<Category, bool>> predicate)
        {
            return ContextFactory.GetNewContext().Categories.Where(predicate);
        }

      
    }
}
