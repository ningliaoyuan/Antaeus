using System;
using System.Collections.Generic;
using System.Linq;

namespace Pls.SimpleMongoDb.Querying
{
    [Serializable]
    public class Query
    {
        private readonly Dictionary<string, QueryProperty> _properties;
        private readonly object _propertiesLock;

        public QueryProperty this[string name]
        {
            get
            {
                return GetProperty(name);
            }
        }

        private Query()
        {
            _propertiesLock = new object();
            _properties = new Dictionary<string, QueryProperty>();
        }

        public static Query New(Action<Query> initialize)
        {
            var q = new Query();
            
            initialize(q);

            return q;
        }

        private QueryProperty GetProperty(string name)
        {
            lock (_propertiesLock)
            {
                if(!_properties.ContainsKey(name))
                    _properties.Add(name, new QueryProperty(this, name));
            }

            return _properties[name];
        }

        internal void AddProperty(QueryProperty property)
        {
            lock (_propertiesLock)
            {
                _properties.Add(property.Name, property);
            }
        }

        public static implicit operator string(Query query)
        {
            return query.ToString();
        }

        public override string ToString()
        {
            var propertiesString = string.Join(", ", _properties.Values.Select(v => v.ToString()));

            return string.Format("{{ {0} }}", propertiesString);
        }
    }
}