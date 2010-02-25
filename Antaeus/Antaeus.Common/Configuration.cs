using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Antaeus.Common
{
    public static class Configuration
    {
        public static String GetValue(String key)
        {
            return ConfigurationManager.AppSettings[key];
        }

        public static String GetValue(String key, String defaultValue)
        {
            String v = ConfigurationManager.AppSettings[key];

            if (String.IsNullOrEmpty(v))
            {
                v = defaultValue;
            }

            return v;
        }

        public static String GetConnectionString(String key)
        {
            return ConfigurationManager.ConnectionStrings[key].ConnectionString;
        }

        public static String GetConnectionString(String key, String defaultConnectionString)
        {
            String connectionString = null;

            ConnectionStringSettings csc = ConfigurationManager.ConnectionStrings[key];            

            if (null != csc)
            {
                connectionString = csc.ConnectionString;
            }
            else
            {
                connectionString = defaultConnectionString;
            }

            return connectionString;
        }
    }
}
