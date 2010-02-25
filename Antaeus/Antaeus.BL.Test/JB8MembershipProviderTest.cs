using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Security;
using Antaeus.BL;
using Antaeus.BL.Test;

namespace Antaeus.ORM.Test
{
    
    
    /// <summary>
    ///This is a test class for JB8MembershipProviderTest and is intended
    ///to contain all JB8MembershipProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class JB8MembershipProviderTest
    {
        /// <summary>
        ///A test for CreateUser
        ///</summary>
        [TestMethod()]
        public void CreateUserTest()
        {
            JB8MembershipProvider target = new JB8MembershipProvider()
            {
                AccountService = new AccountService()
                {
                    ContextFactory = TestHelper.GetTestDBContextFactory()
                }
            };
            
            string username = "test";
            string password = "123456";
            string email = "test@jb8.com";
            string passwordQuestion = string.Empty; 
            string passwordAnswer = string.Empty; 
            bool isApproved = false; 
            object providerUserKey = null; 
            MembershipCreateStatus status;
            MembershipCreateStatus statusExpected =  MembershipCreateStatus.Success;

            if (target.GetUser(username, false) != null)
            {
                target.DeleteUser(username, true);
            }

            var newUser = target.CreateUser(username, password, email, passwordQuestion, passwordAnswer, isApproved, providerUserKey, out status);
            Assert.AreEqual(statusExpected, status);

            Assert.AreEqual(username.ToLower(), newUser.UserName);

            Assert.IsTrue(target.ValidateUser(username,password));
        }
    }
}
