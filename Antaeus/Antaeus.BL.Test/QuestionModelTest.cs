using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Antaeus.BL.Model;
using System.Collections.Specialized;
using Antaeus.BL.Helpers;

namespace Antaeus.BL.Test
{
    /// <summary>
    /// Summary description for QuestionModelTest
    /// </summary>
    [TestClass]
    public class QuestionModelTest
    {
        [TestMethod]
        public void ImportData_CR()
        {
            Assert.Fail("不要乱运行这个方法");
            return;

            string username = "lanslot";
            string conStr = "Data Source=211.99.2.167;Initial Catalog=m_antaeus_temp;Persist Security Info=True;User ID=ans;Password=123456";

            DBTempDataContext con = new DBTempDataContext(conStr);

            var crs = from cr in con.TEMP_CRs
                      orderby cr.QUES_ID descending
                      select cr;
            QuestionModel qm = new QuestionModel();

            foreach (var cr in crs)
            {
                string categoryIDString = "3";
                string source = cr.QUES_SOURCE;
                Dictionary<string,string> dic = new Dictionary<string,string>();
                dic.Add("Content",cr.QUES_CONTENT);
                dic.Add("OptionA",cr.QUES_A);
                dic.Add("OptionB",cr.QUES_B);
                dic.Add("OptionC",cr.QUES_C);
                dic.Add("OptionD",cr.QUES_D);
                dic.Add("OptionE",cr.QUES_E);
                dic.Add("CorrectMark", cr.QUES_CORRECT);
                dic.Add("Question",cr.QUES_QUESTION);
                dic.Add("IsQuestionInFront",cr.QUES_PLACE?"1":"2");

                MetaData meta = new MetaData(dic);
                Question q;
                var res = qm.CreateQuestion(categoryIDString, source, username, meta, out q);
                Assert.IsTrue(res.IsSuccess, res.ErrorMessage);

                int rate = Convert.ToInt32(cr.QUES_RATE);
                res = new RateService().Rate(username, new KEYID("Question", q.QuestionID), rate);

                Assert.IsTrue(res.IsSuccess, res.ErrorMessage);
            }
        }
        [TestMethod]
        public void ImportData_SC()
        {
            Assert.Fail("不要乱运行这个方法");
            return;

            string username = "lanslot";
            string conStr = "Data Source=211.99.2.167;Initial Catalog=m_antaeus_temp;Persist Security Info=True;User ID=ans;Password=123456";

            DBTempDataContext con = new DBTempDataContext(conStr);

            var scs = from cr in con.TEMP_SCs
                      orderby cr.QUES_ID descending
                      select cr;
            QuestionModel qm = new QuestionModel();

            foreach (var sc in scs)
            {
                string categoryIDString = "1";
                string source = sc.QUES_SOURCE;
                Dictionary<string, string> dic = new Dictionary<string, string>();
                dic.Add("Content", sc.QUES_CONTENT);
                dic.Add("OptionA", sc.QUES_A);
                dic.Add("OptionB", sc.QUES_B);
                dic.Add("OptionC", sc.QUES_C);
                dic.Add("OptionD", sc.QUES_D);
                dic.Add("OptionE", sc.QUES_E);
                dic.Add("CorrectMark", sc.QUES_CORRECT);

                MetaData meta = new MetaData(dic);
                Question q;
                var res = qm.CreateQuestion(categoryIDString, source, username, meta, out q);
                Assert.IsTrue(res.IsSuccess, res.ErrorMessage);

                int rate = Convert.ToInt32(sc.QUES_RATE);
                res = new RateService().Rate(username, new KEYID("Question", q.QuestionID), rate);

                Assert.IsTrue(res.IsSuccess, res.ErrorMessage);
            }
        }
    }
}

