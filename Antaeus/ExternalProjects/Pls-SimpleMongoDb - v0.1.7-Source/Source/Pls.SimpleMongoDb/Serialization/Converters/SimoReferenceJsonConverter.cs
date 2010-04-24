using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using Pls.SimpleMongoDb.DataTypes;

namespace Pls.SimpleMongoDb.Serialization.Converters
{
    [Serializable]
    internal class SimoReferenceJsonConverter
        : JsonConverter
    {
        private static readonly Dictionary<Type, Func<object>> SupportedTypes =
            new Dictionary<Type, Func<object>> {
                {typeof (SimoReference), () => new SimoReference()},
                {typeof(SimoReference<Guid>), () => new SimoReference<Guid>()},
                {typeof(SimoReference<int>), () => new SimoReference<int>()},
                {typeof(SimoReference<long>), () => new SimoReference<long>()},
                {typeof(SimoReference<string>), () => new SimoReference<string>()}};

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            dynamic r = value;
            var dic = new Dictionary<string, object>
                      {
                          {"$ref", r.CollectionName},
                          {"$id", r.Id}
                      };

            serializer.Serialize(writer, dic);
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            var reference = SupportedTypes[objectType].Invoke();
            serializer.Populate(reader, reference);

            return reference;
        }

        public override bool CanConvert(Type objectType)
        {
            return SupportedTypes.ContainsKey(objectType);
        }
    }
}