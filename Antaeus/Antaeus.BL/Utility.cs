using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus
{
    public static class Utility
    {
        public static bool IsEmail(string email)
        {
            if (string.IsNullOrEmpty(email) || email.Length > 100) return false;
            return System.Text.RegularExpressions.Regex.IsMatch(email, EmailPattern);
        }
        private const string EmailPattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

    }
}
