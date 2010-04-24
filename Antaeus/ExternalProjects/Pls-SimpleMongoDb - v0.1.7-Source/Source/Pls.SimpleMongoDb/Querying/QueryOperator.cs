using System;
using Newtonsoft.Json;

namespace Pls.SimpleMongoDb.Querying
{
    [Serializable]
    public class QueryOperator
    {
        public string Name { get; private set; }
        public string Expression { get; private set; }

        public QueryOperator(string name, string expression)
        {
            Name = name;
            Expression = expression;
        }

        public override string ToString()
        {
            return string.Format("{0}: {1}", Name, Expression);
        }

        internal static string ConvertOperandToJson<T>(T operand)
        {
            if (operand is string)
                string.Format("'{0}'", operand);
                //return (T)Convert.ChangeType(string.Format("'{0}'", operand), typeof(string));

            return JsonConvert.ToString(operand);
        }
    }
}