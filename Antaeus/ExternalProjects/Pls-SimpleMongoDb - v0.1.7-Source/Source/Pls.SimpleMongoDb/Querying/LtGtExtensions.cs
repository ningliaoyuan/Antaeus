namespace Pls.SimpleMongoDb.Querying
{
    public static class LtGtExtensions
    {
        public static QueryProperty Gt<T>(this QueryProperty property, T operand)
        {
            AddExpression(property, "$gt", operand.ToString());

            return property;
        }

        public static QueryProperty GtEq<T>(this QueryProperty property, T operand)
        {
            AddExpression(property, "$gte", operand.ToString());

            return property;
        }

        public static QueryProperty Lt<T>(this QueryProperty property, T operand)
        {
            AddExpression(property, "$lt", operand.ToString());

            return property;
        }

        public static QueryProperty LtEq<T>(this QueryProperty property, T operand)
        {
            AddExpression(property, "$lte", operand.ToString());

            return property;
        }

        public static QueryProperty Between<T>(this QueryProperty property, T min, T max)
        {
            AddExpression(property, "$gte", min.ToString());
            AddExpression(property, "$lte", max.ToString());

            return property;
        }

        private static void AddExpression(QueryProperty property, string operatorName, string value)
        {
            var expression = value;

            property.AddOperator(new QueryOperator(operatorName, expression));
        }
    }
}