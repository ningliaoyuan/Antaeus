using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;

using NUnit.Framework;

namespace Antaeus.Wiki.Test
{
    /// <summary>
    /// Summary description for WikiVersionTeset
    /// </summary>
    [TestFixture]
    public class WikiVersionTeset
    {
        public WikiVersionTeset()
        {
       
        }

       
        [Test]
        public void WikiVersionEqualsTest()
        {
            WikiVersion v1 = new WikiVersion(1);
            WikiVersion v2 = new WikiVersion(1);
            Assert.IsTrue(v1.Equals(v2));
            Assert.IsTrue(v2.Equals(v1));

            WikiVersion v3 = new WikiVersion(2);
            Assert.IsFalse(v1.Equals(v3));
            Assert.IsFalse(v3.Equals(v1));
        }
    }
}
