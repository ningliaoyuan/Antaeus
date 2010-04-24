using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Querying;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb.Serialization.Converters
{
    [Serializable]
    internal class SimoRegexJsonConverter
        : JsonConverter
    {
        private static readonly Type SupportedType = typeof(SimoRegex);

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            var bw = writer as BsonWriter;

            if (bw == null)
                throw new NotSupportedException(ExceptionMessages.SimoRegexJsonConverter_OnlySupportsBsonWriter);

            var regex = (SimoRegex)value;
            bw.WriteRegex(regex.Expression, regex.Options);
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            throw new NotSupportedException();
        }

        public override bool CanConvert(Type objectType)
        {
            return objectType.Equals(SupportedType);
        }
    }
}