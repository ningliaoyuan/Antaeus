using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;
using System.Xml.Linq;
using Antaeus.BL.Helpers;

namespace Antaeus.BL.Model
{
    public class Question : IWithRate, IWithTag
    {
        public RateService RateService = new RateService();
        public QuestionRepository QuestionRepository = new QuestionRepository();

        #region 题目基础数据
        public long QuestionID { get; set; }

        /// <summary>
        /// 题目类别：语法、逻辑、数学等
        /// </summary>
        public Category Category { get; set; }
        public string Source{get;set;}
        public string CreatedUserName { get; set; }
        public DateTime CreatedTime { get; set; }
        #endregion

        #region 用户相关数据
 

        public int ViewedCount = 100;

        public IQueryable< Comment> GetComments()
        {
            if(_comments == null)
            {
                _comments = new CommentService().GetComments(GetKeyId());
            }

            return _comments;
        }

        IQueryable< Comment> _comments;
        int _commentCount = -1;
        public int CommentCount
        {
            get
            {
                if (_commentCount == -1)
                {
                    _commentCount = GetComments().Count();
                }
                return _commentCount;
            }
        }

        public string CorrectRate = "100%";

        public DateTime ModifiedTime
        {
            get
            {
                //TODO
                return this.CreatedTime;
            }
        }

        #endregion

        public MetaData Meta
        {
            get
            {
                if (_Meta == null)
                {
                    _Meta = QuestionRepository.FindQuestionMeta(QuestionID);
                }
                return _Meta;
            }
            set
            {
                _Meta = value;
            }
        }

        private MetaData _Meta;
        public string QuestionType
        {
            get
            {
                return this.Category.QuestionType;
            }
        }


        public string GetAbstract()
        {
            string c = Meta["Content"];
            c = cleanHtmlTag(c);
            if (string.IsNullOrEmpty(c))
            {
                return "no content";
            }
            else if (c.Length <= 100)
            {
                return c;
            }
            else
            {
                return c.Substring(0, 97) + "...";
            }
        }

        string cleanHtmlTag(string source)
        {
            return source.Replace("<p>", string.Empty).Replace("</p>",string.Empty);
        }

        #region IWithRate Members

        public KEYID GetKeyId()
        {
            return new KEYID("Question", this.QuestionID);
        }
        
        #endregion
    }

    public class QuestionStatistics
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;

        public QuestionStatistics(long qid)
        {
            var con = ContextFactory.GetNewContext();

            Data.Add("A", 0);
            Data.Add("B", 0);
            Data.Add("C", 0);
            Data.Add("D", 0);
            Data.Add("E", 0);
            int sum = 0;

            var list = from item in con.UserAnswerQBs
                       where item.QuestionID == qid
                       group item by item.Answer  into ans
                       select new { answer = ans.Key, count = ans.Count()};

            foreach (var item in list)
            {
                Data[item.answer] = item.count;
                sum += item.count;
            }

            if (sum > 0)
            {
                Sum = sum;
                var correctAnswer = (from item in con.UserAnswerQBs
                                     where item.Correct == true
                                     select item.Answer).SingleOrDefault();

                if (!string.IsNullOrEmpty(correctAnswer))
                {
                    int correctCount = Data[correctAnswer];
                    if (correctCount > 0)
                    {
                        CorrectRate = correctCount * 100 / sum;
                    }
                }
            }
        }
        public int Sum = 0;
        public int CorrectRate = 0;

        public Dictionary<string, int> Data;
    }
}
