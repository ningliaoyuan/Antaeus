namespace Pls.SimpleMongoDb.Querying
{
    public static class WhereExtensions
    {
        public static QueryProperty Where(this QueryProperty property, string expression)
        {
            return Where(property.Query, expression);
        }

        public static QueryProperty Where(this Query query, string expression)
        {
            var property = new WhereQueryProperty(query);
            property.AddOperator(new QueryOperator("$where", string.Format("\" {0} \"", expression)));

            query.AddProperty(property);

            return property;
        }
    }
}