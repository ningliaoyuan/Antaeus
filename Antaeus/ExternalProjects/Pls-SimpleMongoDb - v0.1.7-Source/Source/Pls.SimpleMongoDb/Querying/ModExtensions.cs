namespace Pls.SimpleMongoDb.Querying
{
    public static class ModExtensions
    {
        public static QueryProperty Mod(this QueryProperty property, int num, int denom)
        {
            var expression = string.Format("[{0},{1}]", num, denom);

            property.AddOperator(new QueryOperator("$mod", expression));

            return property;
        }
    }
}