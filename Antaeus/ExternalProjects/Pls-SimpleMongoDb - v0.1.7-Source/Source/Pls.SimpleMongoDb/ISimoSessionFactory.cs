namespace Pls.SimpleMongoDb
{
    public interface ISimoSessionFactory
    {
        ISimoSession GetSession(string connectionStringName);
        ISimoSession GetSession(SimoConnectionInfo connectionInfo);
    }
}