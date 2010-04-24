using System;

namespace Pls.SimpleMongoDb
{
    internal static class EntityMetadata<T>
    {
        internal static Type Type { get; private set; }

        internal static string EntityName
        {
            get { return Type.Name; }
        }

        static EntityMetadata()
        {
            Type = typeof(T);
        }
    }
}