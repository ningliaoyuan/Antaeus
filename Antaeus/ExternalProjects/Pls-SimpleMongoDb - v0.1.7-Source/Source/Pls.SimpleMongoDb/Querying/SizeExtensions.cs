namespace Pls.SimpleMongoDb.Querying
{
    public static class SizeExtensions
    {
        public static QueryProperty Size(this QueryProperty property, int size)
        {
            property.AddOperator(new QueryOperator("$size", size.ToString()));

            return property;
        }
    }
}