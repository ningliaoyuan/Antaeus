using System;

namespace Pls.SimpleMongoDb.Querying
{
    [Serializable]
    public class QueryOptions 
        : IQueryOptions
    {
        private object _schema;
        private int? _skip;
        private int? _limit;

        public QueryOptions()
        {
            _schema = null;
            _limit = null;
            _skip = null;
        }

        public object GetSchema()
        {
            return _schema;
        }

        public int? GetSkip()
        {
            return _skip;
        }

        public int? GetLimit()
        {
            return _limit;
        }

        public ISchemaQueryOptions Schema(object schema)
        {
            _schema = schema;
            return this;
        }

        public ILimitingQueryOptions Skip(int? value)
        {
            _skip = value;
            return this;
        }

        public ILimitingQueryOptions Limit(int? value)
        {
            _limit = value;
            return this;
        }
    }
}