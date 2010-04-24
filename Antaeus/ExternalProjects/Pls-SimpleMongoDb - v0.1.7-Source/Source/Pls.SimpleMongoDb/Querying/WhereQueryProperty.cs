using System;

namespace Pls.SimpleMongoDb.Querying
{
    [Serializable]
    public class WhereQueryProperty
        : QueryProperty
    {
        internal WhereQueryProperty(Query query)
            : base(query, "$where")
        {
        }

        public override string ToString()
        {
            return GetOperatorsString();
        }
    }
}