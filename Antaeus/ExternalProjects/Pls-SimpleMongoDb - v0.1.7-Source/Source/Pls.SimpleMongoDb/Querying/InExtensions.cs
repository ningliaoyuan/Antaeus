using System.Linq;

namespace Pls.SimpleMongoDb.Querying
{
    public static class InExtensions
    {
        public static QueryProperty In<T>(this QueryProperty property, params T[] operands)
        {
            return Add(property, "$in", operands);
        }

        public static QueryProperty NotIn<T>(this QueryProperty property, params T[] operands)
        {
            return Add(property, "$nin", operands);
        }

        private static QueryProperty Add<T>(QueryProperty property, string operatorName, params T[] operands)
        {
            var expression = string.Format("[{0}]",
                                          string.Join(",", operands.Select(QueryOperator.ConvertOperandToJson)));

            property.AddOperator(new QueryOperator(operatorName, expression));

            return property;
        }
    }
}