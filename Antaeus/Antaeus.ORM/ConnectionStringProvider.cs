using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Antaeus.ORM
{
    public static class ConnectionStringProvider
    {
        public static string GetConnectionString()
        {
            return GetConnectionString("Dev");

        }

        public static String GetConnectionString(String key)
        {
            return ConfigurationManager.ConnectionStrings[key].ConnectionString;
        }
    }
}
