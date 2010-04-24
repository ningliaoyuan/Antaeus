using System;
using System.Collections.Generic;
using System.Linq;

namespace Pls.SimpleMongoDb.Querying
{
    [Serializable]
    public class QueryProperty
    {
        private readonly Dictionary<string, QueryOperator> _operators;
        private readonly object _operatorsLock;

        public Query Query { get; private set; }
        public string Name { get; private set; }

        internal QueryProperty(Query query, string name)
        {
            _operators = new Dictionary<string, QueryOperator>();
            _operatorsLock = new object();

            Query = query;
            Name = name;
        }

        public QueryProperty And()
        {
            return this;
        }

        public QueryProperty And(string name)
        {
            var p = Query[name];

            return p;
        }

        internal void AddOperator(QueryOperator queryOperator)
        {
            lock(_operatorsLock)
            {
                _operators.Add(queryOperator.Name, queryOperator);
            }
        }

        public override string ToString()
        {
            var operatorsString = GetOperatorsString();

            return string.Format("{0}: {{ {1} }}", Name, operatorsString);
        }

        protected string GetOperatorsString()
        {
            var operatorsString = string.Join(", ", _operators.Values.Select(op => op.ToString()));

            return operatorsString;
        }
    }
}