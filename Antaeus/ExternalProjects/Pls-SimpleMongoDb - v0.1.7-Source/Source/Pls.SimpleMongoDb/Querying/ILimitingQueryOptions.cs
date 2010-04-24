namespace Pls.SimpleMongoDb.Querying
{
    public interface ILimitingQueryOptions
    {
        int? GetSkip();
        int? GetLimit();
        ILimitingQueryOptions Skip(int? value);
        ILimitingQueryOptions Limit(int? value);
    }
}