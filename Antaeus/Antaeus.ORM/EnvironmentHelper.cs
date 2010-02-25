using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus
{
    public class EnvironmentHelper
    {
        public static EnvironmentHelper Current
        {
            get
            {
                if (_Current == null)
                {
                    _Current = getDefaultEnvironment();
                }
                return _Current;
            }
        }
        static EnvironmentHelper _Current;

        public JB8ORMDataContextFactory ContextFactory;

        private static EnvironmentHelper getDefaultEnvironment()
        {
            EnvironmentHelper helper = new EnvironmentHelper();

            helper.ContextFactory = new JB8ORMDataContextFactory()
            {
                ContextConnectionString = ConnectionStringProvider.GetConnectionString()
            };
            return helper;
        }

    }
}
