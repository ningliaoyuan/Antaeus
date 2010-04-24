using System;

namespace Pls.SimpleMongoDb.IoC
{
    internal class ResolverKey
    {
        internal const string DefaultResolverKey = "DEFAULT";
    }

    internal class ResolverKey<T>
    {
        internal static readonly Type Type = typeof (T);
        internal static readonly string Value = Type.FullName;
    }
}