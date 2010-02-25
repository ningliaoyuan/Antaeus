using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using Antaeus.BL.Helpers;
using Antaeus.ORM;

namespace Antaeus.BL.Model
{
    public class QuestionModel
    {
        public QuestionRepository QuestionRepository = new QuestionRepository();
        public RateService RateService = new RateService();

        public Question Find(long id)
        {
            return QuestionRepository.Find(id);
        }

        public Result CreateQuestion(string categoryIDString, string source , string userName,MetaData meta, out Question question)
        {            
            var qd = QuestionRepository.QuestionFactory.CreateQuestion(categoryIDString, source, userName, meta);
            
            var res = QuestionRepository.Insert(qd);

            if (res.IsSuccess)
            {
                question = qd;
            }
            else
            {
                question = null;
            }

            return res;
        }

        public Result Solve(string userName,long id)
        {
            throw new NotImplementedException();
        }

        public Result Rate(string userName, long id, int rate)
        {
            return RateService.Rate(userName, new KEYID("Question", id), rate);
        }

        public IEnumerable<Question> SelectQuestion(int start, int count)
        {
            // TODO:
            return QuestionRepository.SelectQuestion(start, count);
        }

        public Result Answer(long id, string answer, int correct, int cost, string userName)
        {
            UserAnswerQB a = new UserAnswerQB()
            {
                UserAnswerQBID = IDProvider.GetNewId("UserAnswerQBID"),
                Answer = answer.Trim(),
                Correct = correct == 1,
                Cost = cost,
                CrUserName = userName,
                CrTime = TimeProvider.Now,
                QuestionID = id
            };
            var con = ContextFactory.GetNewContext();
            con.UserAnswerQBs.InsertOnSubmit(a);
            con.SubmitChanges();

            return Result.Success();
        }

            
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;

    }
}
