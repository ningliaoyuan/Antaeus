namespace Pls.SimpleMongoDb.Querying
{
    public static class ExistsExtensions
    {
        public static QueryProperty Exists(this QueryProperty property)
        {
            return Exists(property, true);
        }

        public static QueryProperty NotExists(this QueryProperty property)
        {
            return Exists(property, false);
        }

        private static QueryProperty Exists(QueryProperty property, bool exists)
        {
            var expression = exists.ToString().ToLower(); //QueryOperator.ConvertOperandToJson(exists);

            property.AddOperator(new QueryOperator("$exists", expression));

            return property;
        }
    }
}