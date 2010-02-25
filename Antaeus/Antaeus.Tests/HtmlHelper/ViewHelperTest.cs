using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Antaeus.Helpers;

namespace Antaeus.Tests.HtmlHelper
{
    /// <summary>
    /// Summary description for ViewHelperTest
    /// </summary>
    [TestClass]
    public class ViewHelperTest
    {
        public ViewHelperTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void TestRenderNormalInput()
        {
            //
            // TODO: Add test logic	here
            //

            string result = ViewHelper.RenderNormalInput(null, "testName", "单个文本输入框", true, 1, "default");

            Assert.IsTrue(result.Contains("<div class=\"item\">"));
            Assert.IsTrue(result.Contains("<div class=\"title\">单个文本输入框<span>*</span></div>"));
            Assert.IsTrue(result.Contains(" value=\"default\""));

            result = ViewHelper.RenderNormalInput(null, "testName", "222", false, 1, "default2");

            Assert.IsTrue(result.Contains("<div class=\"item\">"));
            Assert.IsTrue(result.Contains("<div class=\"title\">222</div>"));
            Assert.IsTrue(result.Contains(" value=\"default2\""));
        }
[TestMethod]
        public void TestRenderNormalInput()
        {
            string result = ViewHelper.RenderNormalInput2(new { name = "aaa", type = 1 });

            Assert.IsTrue(result.Contains("aaa"));
            
        }
    }
}
