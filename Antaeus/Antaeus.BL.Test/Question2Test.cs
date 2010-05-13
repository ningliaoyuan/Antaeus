using Antaeus.BL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System;
namespace Antaeus.BL.Test
{
    
    
    /// <summary>
    ///This is a test class for SimpleIDProviderTest and is intended
    ///to contain all SimpleIDProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class Question2Test
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
       
        #endregion

        [TestMethod]
        public void CreateQuestion2Test()
        {
            IIDProvider idprovider = new SMIDProvider();
            var repo = new Question2Repo(idprovider);
            Question2 q = repo.Create();
            q.Title = "testTitle";
            q.CrUserName = "lynn";
            q.Content = "content";
            q.CrTime = DateTime.Now;

            q = repo.Save(q);

            Assert.IsNotNull(q._id);
            Assert.AreEqual("testTitle", q.Title); 

        }

      

       

    }
}
