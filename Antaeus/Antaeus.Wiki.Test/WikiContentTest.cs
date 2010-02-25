using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Antaeus.Wiki.Test
{
    [TestClass]
    public class WikiContentTest
    {
        

        [TestMethod]
        [ExpectedException(typeof(WikiException))]
        public void WikiContentTextLengthOverflowExceptionTest()
        {
            Int32 total = 4001;
            StringBuilder testContent = new StringBuilder();
            for (int i = 0; i < total; i++)
            {
                testContent.Append('A');
            }

            WikiContent wikiContent = new WikiContent(testContent.ToString());
            wikiContent.Text = testContent.ToString();
        }
    }
}
