using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web.Hosting;

namespace Antaeus.ORM
{
    public class AccountService
    {
        public JB8ORMDataContextFactory ContextFactory = new JB8ORMDataContextFactory();

        public bool CreateUser(string username, string passwordHash, string passwordSalt, string displayName, string email, bool isApproved)
        {
            using (var con = ContextFactory.GetNewContext())
            {
                User user = new User()
                {
                    UserName = username,
                    PasswordHash = passwordHash,
                    PasswordSalt = passwordSalt,
                    DisplayName = displayName,
                    Email = email,
                    IsApproved = isApproved,
                    CreatedTime = DateTime.Now
                };
                con.Users.InsertOnSubmit(user);
                con.SubmitChanges();
                return true;
            }
        }

        /// <summary>
        /// Checks if the user exists.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <returns><c>true</c> if the user with given name exists; otherwise returns <c>false</c>.</returns>
        public bool CheckUserExists(string username)
        {
            if (string.IsNullOrEmpty(username)) return false;
            if (username.Length > 100) throw new ArgumentOutOfRangeException("username", "Maximum length of 100 characters exceeded");

            try
            {
                // TODO: lynn: why uses Impersonate?? 
                using (HostingEnvironment.Impersonate())
                using (var con = ContextFactory.GetNewContext())
                {
                    if (IsEmail(username))
                    {
                        return con.Users.Any(u => u.UserName == username || u.Email == username);
                    }
                    else
                    {
                        return con.Users.Any(user => user.UserName == username);
                    }
                }
            }
            catch { throw; } // Security context hack for HostingEnvironment.Impersonate
        }

        public bool IsEmail(string email)
        {
            if (string.IsNullOrEmpty(email) || email.Length > 100) return false;
            return System.Text.RegularExpressions.Regex.IsMatch(email, EmailPattern);
        }
        private const string EmailPattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

        public string ComputeSHA512(string s)
        {
            if (string.IsNullOrEmpty(s)) throw new ArgumentNullException();
            byte[] buffer = System.Text.Encoding.UTF8.GetBytes(s);
            buffer = System.Security.Cryptography.SHA512Managed.Create().ComputeHash(buffer);
            return System.Convert.ToBase64String(buffer).Substring(0, 86); // strip padding
        }



        public bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            using (var con = ContextFactory.GetNewContext())
            {
                var user = GetUser(username, false);
                con.Users.DeleteOnSubmit(user);
                con.SubmitChanges();
                return true;
            }
        }

        public User GetUser(string username, bool userIsOnline)
        {
            using (var con = ContextFactory.GetNewContext())
            {
                if (IsEmail(username))
                {
                    return con.Users.SingleOrDefault(u => u.UserName == username || u.Email == username);
                }
                else
                {
                    return con.Users.SingleOrDefault(u => u.UserName == username);
                }
            }
        }
    }
}
