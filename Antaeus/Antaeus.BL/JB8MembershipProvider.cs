using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using Antaeus.ORM;
using System.Text.RegularExpressions;
using System.Web.Hosting;
using System.Collections.Specialized;

namespace Antaeus.BL
{
    public class JB8MembershipProvider : MembershipProvider
    {
        public AccountService AccountService = new AccountService();
        public override void Initialize(string name, NameValueCollection config)
        {
            //// Validate arguments
            //if (config == null) throw new ArgumentNullException("config");
            if (string.IsNullOrEmpty(name)) name = "JB8MembershipProvider";
            //if (String.IsNullOrEmpty(config["description"]))
            //{
            //    config.Remove("description");
            //    config.Add("description", "Altairis simple SQL membership provider");
            //}

            // Initialize base class
            base.Initialize(name, config);

            //// Initialize current class
            //this.configuration = config;
            //System.Configuration.ConnectionStringSettings ConnectionStringSettings = System.Configuration.ConfigurationManager.ConnectionStrings[config["connectionStringName"]];
            //if (ConnectionStringSettings == null || ConnectionStringSettings.ConnectionString.Trim() == "") throw new ProviderException("Connection string cannot be blank.");
            //this.connectionString = ConnectionStringSettings.ConnectionString;
            this.ApplicationName = "JB8MembershipProvider";
        }

        public override string ApplicationName
        {
            get;
            set;
        }
       
        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {

            // Check username
            if (string.IsNullOrEmpty(username) || username.Length > 100)
            {
                status = MembershipCreateStatus.InvalidUserName;
                return null;
            }
            username = username.ToLower();
            if (AccountService.CheckUserExists(username))
            {
                status = MembershipCreateStatus.DuplicateUserName;
                return null;
            }

            // Check if password meets complexivity requirements
            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, password, true);
            OnValidatingPassword(args);
            if (args.Cancel)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            // Check e-mail
            if (!AccountService.IsEmail(email))
            {
                status = MembershipCreateStatus.InvalidEmail;
                return null;
            }
            email = email.ToLower();
            if (this.RequiresUniqueEmail && !string.IsNullOrEmpty(this.GetUserNameByEmail(email)))
            {
                status = MembershipCreateStatus.DuplicateEmail;
                return null;
            }

            // Check Password
            if (password.Length < MinRequiredPasswordLength)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            int count = 0;

            for (int i = 0; i < password.Length; i++)
            {
                if (!char.IsLetterOrDigit(password, i))
                {
                    count++;
                }
            }

            if (count < MinRequiredNonAlphanumericCharacters)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            if (PasswordStrengthRegularExpression.Length > 0)
            {
                if (!Regex.IsMatch(password, PasswordStrengthRegularExpression))
                {
                    status = MembershipCreateStatus.InvalidPassword;
                    return null;
                }
            }

            // Generate hash from password
            string passwordSalt = Membership.GeneratePassword(5, 1);
            string passwordHash = AccountService.ComputeSHA512(password + passwordSalt);

            // Insert to database
            try
            {
                using (HostingEnvironment.Impersonate())
                {
                    bool ok = AccountService.CreateUser(username, passwordHash, passwordSalt, username, email, isApproved);

                    if (!ok) status = MembershipCreateStatus.UserRejected;
                    else status = MembershipCreateStatus.Success;
                }
            }
            catch { throw; } // Security context hack for HostingEnvironment.Impersonate

            if (status == MembershipCreateStatus.Success) return this.GetUser(username, false);
            return null;
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            return AccountService.DeleteUser(username, deleteAllRelatedData);
        }

        public override bool EnablePasswordReset
        {
            get { throw new NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            // Validate arguments
            if (string.IsNullOrEmpty(username) || username.Length > 100) return null;
            username = username.ToLower();

            var user = AccountService.GetUser(username, userIsOnline);

            if (user != null)
            {
                return new MembershipUser( "JB8MembershipProvider", user.UserName, null, user.Email, string.Empty, string.Empty, user.IsApproved, !user.IsApproved, user.CreatedTime, DateTime.Now, new DateTime(), new DateTime(), new DateTime());
            }
            else
            {
                return null;
            }
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return 5; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return 0; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return 6; }
        }

        public override int PasswordAttemptWindow
        {
            get { return 15; }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new NotImplementedException(); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { return string.Empty; }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresUniqueEmail
        {
            get { return false; }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Verifies that the specified user name and password exist in the data source.
        /// </summary>
        /// <param name="username">The name of the user to validate.</param>
        /// <param name="password">The password for the specified user.</param>
        /// <returns>
        /// true if the specified username and password are valid; otherwise, false.
        /// </returns>
        public override bool ValidateUser(string username, string password)
        {
            // Validate arguments
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || username.Length > 100) return false;
            username = username.ToLower();

            var user = AccountService.GetUser(username, false);
            if (user == null)
            {
                // 用户不存在
                return false;
            }
            else
            {
                var passwordSalt = user.PasswordSalt;
                var passwordHash = user.PasswordHash;
                // Validate password
                return AccountService.ComputeSHA512(password + passwordSalt).Equals(passwordHash, StringComparison.InvariantCultureIgnoreCase);
            }
        }
  
    }
}
