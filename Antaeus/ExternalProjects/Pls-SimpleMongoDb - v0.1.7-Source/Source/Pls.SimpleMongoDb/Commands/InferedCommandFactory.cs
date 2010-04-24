namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Factory that helps you to create instances of commands that
    /// uses template objects to infer the type in conjunction with
    /// generics.
    /// </summary>
    public class InferedCommandFactory
    {
        public QueryDocumentsCommand<TDocumentInfered> CreateInfered<TDocumentInfered>(ISimoConnection connection, TDocumentInfered inferedTemplate)
            where TDocumentInfered : class
        {
            return new QueryDocumentsCommand<TDocumentInfered>(connection);
        }
    }
}