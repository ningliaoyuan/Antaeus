using Antaeus.BL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
namespace Antaeus.BL.Test
{
    
    
    /// <summary>
    ///This is a test class for SimpleIDProviderTest and is intended
    ///to contain all SimpleIDProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class IDProviderTest
    {
        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        [TestInitialize()]
        public void MyTestInitialize()
        {
            SMUtility.DB = "SMAntaeus_Test";
        }
        
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for GetNewId
        ///</summary>
        [TestMethod()]
        public void GetNewIdTest()
        {
            SimpleIDProvider target = new SimpleIDProvider();
            string key = "GetNewIdTest";

            TestIIDProvider(target, key);
        }

        /// <summary>
        ///A test for GetNewId
        ///</summary>
        [TestMethod()]
        public void GetNewIdTestForDBProvider()
        {
            DBIDProvider target = new DBIDProvider();
            string key = "GetNewIdTestForDBProvider";

            TestIIDProvider(target, key);
        }

        [TestMethod()]
        public void GetNewIdTestForSMIDProvider()
        {
            IIDProvider target = new SMIDProvider();
            string key = "GetNewIdTestForSMIDProvider";

            TestIIDProvider(target, key);
        }

        private void TestIIDProvider(IIDProvider target, string key)
        {
            List<long> IDs = new List<long>(1000);
            for (int i = 0; i < 2102; i++)
            {
                IDs.Add(target.GetNewId(key));
            }

            CollectionAssert.AllItemsAreUnique(IDs, "存在一样的ID");
        }

       

    }
}
