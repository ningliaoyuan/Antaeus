using System;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb.Serialization.Converters
{
    [Serializable]
    internal class SimoIdJsonConverter
        : JsonConverter
    {
        private readonly static Type AcceptedType = typeof(SimoId);

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            var oid = value as SimoId;

            if (SimoId.IsNullOrEmpty(oid))
                throw new SerializationException(ExceptionMessages.SimoObjectIdJsonConverter_InvalidId);

            var bsonWriter = writer as BsonWriter;

            if (bsonWriter != null)
                bsonWriter.WriteObjectId(oid);
            else
                writer.WriteValue(oid.Value);
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType != JsonToken.Bytes && !objectType.Equals(AcceptedType))
                throw new SerializationException(string.Format(ExceptionMessages.SimoIdJsonConverter_InvalidType, reader.TokenType));

            var idBytes = (byte[])reader.Value;

            return idBytes == null ? null : new SimoId(idBytes);

            //var idBytes = serializer.Deserialize<byte[]>(reader);

            //return idBytes == null ? null : new SimoId(idBytes);
        }

        public override bool CanConvert(Type objectType)
        {
            return objectType == AcceptedType;
        }
    }
}