using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pls.SimpleMongoDb;

namespace Antaeus
{
    public static class SMUtility
    {
        public static SimoSession GetSession()
        {
            return new SimoSession(CN);
        }

        static SMUtility()
        {
            CN = new SimoConnection(new SimoConnectionInfo(ConStrKey));
        }

        public static ISimoCollection GetCollection(this ISimoSession session, string collectionName)
        {
            return session[SMUtility.DB][collectionName];
        }

        public static ISimoEntityStore GetStore(this ISimoSession session)
        {
            return new SimoEntityStore(session, SMUtility.DB);
        }

        public static void CloseConnection()
        {
            if (CN.IsConnected)
            {
                CN.Disconnect();
            }
        }

        static readonly SimoConnection CN;
        const string ConStrKey = "SimpleMongoDB";


        public static string DB = "SMAntaeus";

        public const string IDProvider = "IDProvider";
    }
}
