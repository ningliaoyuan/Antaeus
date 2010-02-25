using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Antaeus.BL.Test
{
    /// <summary>
    /// Summary description for RateServiceTest
    /// </summary>
    [TestClass]
    public class RateServiceTest
     {
        const string KEY = "RateServiceTest";
        [TestMethod]
        public void MultipleRateTest()
        {
            var rs = TestHelper.GetTestObj<RateService>();
            rs.CanMultipleRate = true;

            int id =1;
            KEYID ki = new KEYID(KEY, id);
            while(rs.GetScore(ki).Times >0)
            {
                id++;
                ki = new KEYID(KEY, id);
            } 

            rs.Rate(TestHelper.UserName, ki, 1);
            var res = rs.Rate(TestHelper.UserName, ki, 3);
            
            Assert.IsTrue(res.IsSuccess);
            
            var score = rs.GetScore(ki);

            Assert.AreEqual(score.Times, 2);
            Assert.AreEqual(score.Sum, 4);
            Assert.AreEqual(score.Average, 2);
        }

    }
}
