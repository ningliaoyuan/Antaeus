using System;
using System.Collections.Generic;

namespace Pls.SimpleMongoDb.DataTypes
{
    [Serializable]
    public class SimoKeyValues
        : Dictionary<string, object>
    {
        public string GetString(string key)
        {
            return this[key] as string;
        }

        public double? GetDouble(string key)
        {
            return (double?) this[key];
        }
    }
}