using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;
using System.Linq.Expressions;
using Antaeus.BL.Helpers;

namespace Antaeus.BL.Model
{
    public class QuestionRepository : IRepository<Question>
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;

        public QuestionFactory QuestionFactory = new QuestionFactory();
        
        /// <summary>
        /// TODO: Only support choice question now
        /// </summary>
        /// <param name="q"></param>
        /// <returns></returns>
        public Result Insert(Question q)
        {
            var con = ContextFactory.GetNewContext();
            
            var qb = new QB()
            {
                QuestionID = q.QuestionID,
                CategoryID = q.Category.CategoryID,
                Source = q.Source,
                CrUserName = q.CreatedUserName,
                CrTime = q.CreatedTime,
                Abstract = q.GetAbstract()
            };
            con.QBs.InsertOnSubmit(qb);

            var qD = new QD()
            {
                QuestionID = q.QuestionID,
                SourceXml = q.Meta.ToXml(),
                QuestionType = q.QuestionType
            };
            con.QDs.InsertOnSubmit(qD);

            con.SubmitChanges();

            return Result.Success();
        }

        /// <summary>
        /// TODO: Only support choice question now
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Question Find(long id)
        {
            var con = ContextFactory.GetNewContext();

            var qb = con.QBs.SingleOrDefault(q => q.QuestionID == id);

            if(qb == null)
            {
                throw new Exception("invalid question id:" + id);
            }

            var meta = FindQuestionMeta(id);
            Question question = QuestionFactory.ReconstructQuestion(qb, meta);

            return question;
        }

        public MetaData FindQuestionMeta(long id)
        {
            var con = ContextFactory.GetNewContext();
            var source = (from q in con.QDs
                         where q.QuestionID == id
                         select q.SourceXml).First();

            return new MetaData(source);
        }

        public Result Delete(long id)
        {
            var con = ContextFactory.GetNewContext();

            var qb = con.QBs.SingleOrDefault(q => q.QuestionID == id);
            var qd = con.QDs.SingleOrDefault(q => q.QuestionID == id);

            con.QBs.DeleteOnSubmit(qb);
            con.QDs.DeleteOnSubmit(qd);

            con.SubmitChanges();

            return Result.Success();
        }


        #region IRepository<Question> Members


        public IEnumerable<Question> Select(Expression<Func<Question, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        #endregion

        public IEnumerable<Question> SelectQuestion(int start, int count)
        {
            var con = ContextFactory.GetNewContext();

            var qs = con.QBs
                .Skip(start)
                .Take(count)
                .Select(qb => QuestionFactory.ReconstructQuestion(qb, null));

            return qs;
        }
    }
}
