using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL.Test
{
    public static class TestHelper
    {
        public static JB8ORMDataContextFactory GetTestDBContextFactory()
        {
            return new JB8ORMDataContextFactory() { ContextConnectionString = ConnectionStringProvider.GetConnectionString() };
        }

        public static T GetTestObj<T>() where T : new()
        {
            return new T(); 
        }

        public const string UserName = "test";
    }
}
