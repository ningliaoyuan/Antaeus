namespace Pls.SimpleMongoDb
{
    public class SimoSessionFactory 
        : ISimoSessionFactory
    {
        public ISimoSession GetSession()
        {
            return GetSession(SimoConnectionInfo.Default);
        }

        public ISimoSession GetSession(string connectionStringName)
        {
            return GetSession(new SimoConnectionInfo(connectionStringName));
        }

        public ISimoSession GetSession(SimoConnectionInfo connectionInfo)
        {
            var cn = new SimoConnection(connectionInfo);

            return new SimoSession(cn);
        }
    }
}