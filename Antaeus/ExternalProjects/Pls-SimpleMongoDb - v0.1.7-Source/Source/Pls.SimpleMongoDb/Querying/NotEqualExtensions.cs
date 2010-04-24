namespace Pls.SimpleMongoDb.Querying
{
    public static class NotEqualExtensions
    {
        public static QueryProperty NotEq<T>(this QueryProperty property, T operand)
        {
            AddExpression(property, "$ne", QueryOperator.ConvertOperandToJson<T>(operand).ToString());
            //AddExpression(property, "$ne",
            //    operand is string ? 
            //        string.Format("'{0}'", operand) : 
            //        operand.ToString());

            return property;
        }

        private static void AddExpression(QueryProperty property, string operatorName, string value)
        {
            var expression = value;

            property.AddOperator(new QueryOperator(operatorName, expression));
        }
    }
}