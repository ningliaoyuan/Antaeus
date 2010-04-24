using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Bson;

namespace Pls.SimpleMongoDb.Serialization
{
    public class SelectorWriter
        : ISelectorWriter
    {
        private readonly JsonSerializer _jsonSerializer;
        private readonly BsonWriter _bsonWriter;

        public SelectorWriter(Stream targetStream)
        {
            _jsonSerializer = SimoEngine.Instance.IoC.Resolve<JsonSerializer, ISelectorWriter>();
            _bsonWriter = new BsonWriter(targetStream) { Formatting = Formatting.None };
        }

        public void Write(object selector)
        {
            _jsonSerializer.Serialize(_bsonWriter, selector);
            _bsonWriter.Flush();
        }
    }
}