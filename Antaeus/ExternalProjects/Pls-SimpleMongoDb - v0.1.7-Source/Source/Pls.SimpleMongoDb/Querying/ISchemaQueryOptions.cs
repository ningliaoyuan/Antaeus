namespace Pls.SimpleMongoDb.Querying
{
    public interface ISchemaQueryOptions
    {
        object GetSchema();
        ISchemaQueryOptions Schema(object schema);
    }
}