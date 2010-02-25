using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;

using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Antaeus.Wiki.Test
{
    /// <summary>
    /// Summary description for WikiNameTest
    /// </summary>
    [TestClass]
    public class WikiNameTest
    {
        public WikiNameTest()
        {
        }

        [TestMethod]
        public void WikiNameEqualsTest()
        {
            string s = Guid.NewGuid().ToString();

            WikiName n1 = new WikiName(s);
            WikiName n2 = new WikiName(s);
            Assert.IsTrue(n1.Equals(n2));
            Assert.IsTrue(n2.Equals(n1));

            WikiName n3 = new WikiName(Guid.NewGuid().ToString());
            Assert.IsFalse(n1.Equals(n3));
        }

        [TestMethod]   
        [ExpectedException(typeof(WikiException))]
        public void WikiNameTextLengthOverflowExceptionTest()
        {
            Int32 total = 101;
            StringBuilder testName = new StringBuilder();
            for (int i = 0; i < total; i++)
            {
                testName.Append('A');
            }

            WikiName wikiName = new WikiName();
            wikiName.Text = testName.ToString();

            wikiName = new WikiName(testName.ToString());
        }
    }
}
