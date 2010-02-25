using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;
using System.Xml.Linq;
using Antaeus.BL.Helpers;

namespace Antaeus.BL.Model
{
    public class Question : IWithRate
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
            c = cleanTag(c);
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

        string cleanTag(string source)
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
}
