using System.Collections.Generic;

namespace Pls.SimpleMongoDb
{
    public static class MongoSystem
    {
        public static class ReservedCollections
        {
            private static readonly HashSet<string> ReservedCollectionNames = new HashSet<string> {"system.indexes"};

            public static bool IsReserved(string collectionName)
            {
                return collectionName.Contains(".$") || ReservedCollectionNames.Contains(collectionName);
            }
        }
    }
}