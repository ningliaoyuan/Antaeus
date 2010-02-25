using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.ORM
{
    public class JB8ORMDataContextFactory
    {
        string DefaultConnectionString = ConnectionStringProvider.GetConnectionString();

        public string ContextConnectionString;

        public JB8ORMDataContext GetNewContext()
        {
            if (ContextConnectionString == null)
                ContextConnectionString = DefaultConnectionString;

            return new JB8ORMDataContext(ContextConnectionString);
        }

        public void CreateDatabase(string connectionString, bool isForced)
        {
            JB8ORMDataContext context = new JB8ORMDataContext(connectionString);
            
            if (context.DatabaseExists())
            {
                if (isForced)
                {
                    context.DeleteDatabase();
                }
                else
                {
                    throw new Exception("The database already Exists");
                }
            }

            context.CreateDatabase();
        }       
    }
}
