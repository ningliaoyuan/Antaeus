using System.Collections.Generic;

namespace Pls.SimpleMongoDb.IoC
{
    public static class ArgsExtensions
    {
        public static T Get<T>(this IList<object> args, int index)
        {
            return (T)args[index];
        }
    }
}