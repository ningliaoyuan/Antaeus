using System.Linq;

namespace Pls.SimpleMongoDb.Querying
{
    public static class AllExtensions
    {
        public static QueryProperty HasAll<T>(this QueryProperty property, params T[] values)
        {
            var expression = string.Format("[{0}]",
                                           string.Join(",", values.Select(QueryOperator.ConvertOperandToJson<T>)));

            property.AddOperator(new QueryOperator("$all", expression));

            return property;
        }
    }
}