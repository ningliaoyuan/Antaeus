using System;
using Newtonsoft.Json;
using Pls.SimpleMongoDb.Serialization.Converters;

namespace Pls.SimpleMongoDb.DataTypes
{
    [Serializable, JsonConverter(typeof(SimoReferenceJsonConverter))]
    public class SimoReference
        : SimoReference<SimoId>
    {
    }

    [Serializable, JsonConverter(typeof(SimoReferenceJsonConverter))]
    public class SimoReference<T>
    {
        [JsonProperty(PropertyName = "$ref")]
        public string CollectionName { get; set; }

        [JsonProperty(PropertyName = "$id")]
        public T Id { get; set; }
    }
}