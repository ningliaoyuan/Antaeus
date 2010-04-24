namespace Pls.SimpleMongoDb
{
    public static class SimoHelper
    {
        public static string GetDatabaseName(string nodeName)
        {
            var indexOfDelim = nodeName.IndexOf(".");

            return indexOfDelim > 0
                ? nodeName.Substring(0, indexOfDelim)
                : nodeName;
        }
    }
}