using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Bson;

namespace Pls.SimpleMongoDb.Serialization
{
    public class DocumentWriter 
        : IDocumentWriter
    {
        private readonly JsonSerializer _jsonSerializer;
        private readonly BsonWriter _bsonWriter;

        public DocumentWriter(Stream targetStream)
        {
            _jsonSerializer = SimoEngine.Instance.IoC.Resolve<JsonSerializer, IDocumentWriter>();
            _bsonWriter = new BsonWriter(targetStream) { Formatting = Formatting.None };
        }

        public void Write(object document)
        {
            _jsonSerializer.Serialize(_bsonWriter, document);
            _bsonWriter.Flush();
        }
    }
}