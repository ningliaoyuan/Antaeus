using System;
using System.Collections.Generic;

namespace Pls.SimpleMongoDb.IoC
{
    internal class IoCRegistration<T>
    {
        private readonly Dictionary<string, Func<T>> _resolversWithoutArgs;
        private readonly Dictionary<string, Func<IList<object>, T>> _resolversWithArgs;

        internal static readonly string Key = typeof (T).FullName;

        public IoCRegistration()
        {
            _resolversWithoutArgs = new Dictionary<string, Func<T>>();
            _resolversWithArgs = new Dictionary<string, Func<IList<object>, T>>();
        }

        internal T Resolve(string key = null)
        {
            key = key ?? ResolverKey.DefaultResolverKey;

            var resolver = _resolversWithoutArgs[key];

            return resolver.Invoke();
        }

        internal T Resolve(IList<object> args)
        {
            return Resolve(null, args);
        }

        internal T Resolve(string key, IList<object> args)
        {
            key = key ?? ResolverKey.DefaultResolverKey;

            var resolver = _resolversWithArgs[key];

            return resolver.Invoke(args);
        }

        internal void SetResolver(string key, Func<T> resolver)
        {
            key = key ?? ResolverKey.DefaultResolverKey;

            _resolversWithoutArgs[key] = resolver;
        }

        internal void SetResolver(string key, Func<IList<object>, T> resolver)
        {
            key = key ?? ResolverKey.DefaultResolverKey;

            _resolversWithArgs[key] = resolver;
        }
    }
}