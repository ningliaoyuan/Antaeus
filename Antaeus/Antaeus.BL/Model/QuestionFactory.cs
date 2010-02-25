using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using Antaeus.ORM;
using Antaeus.BL.Helpers;

namespace Antaeus.BL.Model
{
    public class QuestionFactory
    {
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();
        public CategoryRepository CategoryRepository = new CategoryRepository();
        public WikiService WikiService = new WikiService();

        public Question CreateQuestion(string categoryIDString, string source, string userName, MetaData meta)
        {
            long categoryID = Convert.ToInt64(categoryIDString);
            var category = CategoryRepository.Find(categoryID);

            Question question = new Question();
            question.QuestionID = IDProvider.GetNewId("QuestionID");
            question.CreatedTime = TimeProvider.Now;
            question.CreatedUserName = userName;
            question.Category = category;
            question.Source = source;

            meta.AlterWiki("Answer", userName, new KEYID("QuestionAnswer", question.QuestionID));

            question.Meta = meta;

            return question;
        }

     
        bool GetBoolForIsQuestionInFront(string IsQuestionInFront)
        {
            return Convert.ToInt32(IsQuestionInFront) == 1;
        }


        public Question ReconstructQuestion(QB qb, MetaData meta)
        {
            Question question = new Question();

            question.QuestionID = qb.QuestionID;
            question.Category = CategoryRepository.Find(qb.CategoryID);
            question.Source = qb.Source;
            question.CreatedUserName = qb.CrUserName;
            question.CreatedTime = qb.CrTime;
            if (meta != null)
            {
                question.Meta = meta;
            }

            return question;
        }
    }
}