namespace Pls.SimpleMongoDb.Serialization
{
    public interface IDocumentReader
    {
        T ReadDocument<T>()
            where T : class;
    }
}