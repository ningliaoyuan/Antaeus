namespace Pls.SimpleMongoDb.Querying
{
    public static class EqualsExtensions
    {
        public static QueryProperty IsEq<T>(this QueryProperty property, T value)
        {
            //TODO: Don't use in
            return property.In(value);
        }

        public static QueryProperty IsNotEq<T>(this QueryProperty property, T value)
        {
            //TODO: Don't use in
            return property.NotIn(value);
        }
    }
}