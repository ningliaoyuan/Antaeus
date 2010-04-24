using System;
using System.Collections.Generic;

namespace Pls.SimpleMongoDb.IoC
{
    public class SimoIoC : ISimoIoC
    {
        private readonly Dictionary<string, object> _iocRegistrations;
        private readonly object _iocRegistrationsLock;

        public SimoIoC()
        {
            _iocRegistrations = new Dictionary<string, object>();
            _iocRegistrationsLock = new object();
        }

        public void RegisterNoArgs<TDefinition>(Func<TDefinition> resolver)
        {
            RegisterNoArgs(null, resolver);
        }

        public void RegisterNoArgs<TDefinition, TImplementation>(Func<TDefinition> resolver)
        {
            RegisterNoArgs(ResolverKey<TImplementation>.Value, resolver);
        }

        public void RegisterNoArgs<TDefinition>(string resolverkey, Func<TDefinition> resolver)
        {
            var registration = GetIocRegistration<TDefinition>();
            registration.SetResolver(resolverkey, resolver);
        }

        public void RegisterWithArgs<TDefinition>(Func<IList<object>, TDefinition> resolver)
        {
            RegisterWithArgs(null, resolver);
        }

        public void RegisterWithArgs<TDefinition, TImplementation>(Func<IList<object>, TDefinition> resolver)
        {
            RegisterWithArgs(ResolverKey<TImplementation>.Value, resolver);
        }

        public void RegisterWithArgs<TDefinition>(string resolverkey, Func<IList<object>, TDefinition> resolver)
        {
            var registration = GetIocRegistration<TDefinition>();
            registration.SetResolver(resolverkey, resolver);
        }

        public TDefinition Resolve<TDefinition, TImplementation>()
        {
            return Resolve<TDefinition>(ResolverKey<TImplementation>.Value);
        }

        public TDefinition Resolve<TDefinition>(string key = null)
        {
            var registration = GetIocRegistration<TDefinition>();

            return registration.Resolve(key);
        }

        public TDefinition Resolve<TDefinition>(IList<object> args)
        {
            return Resolve<TDefinition>(null, args);
        }

        public TDefinition Resolve<TDefinition, TImplementation>(IList<object> args)
        {
            return Resolve<TDefinition>(ResolverKey<TImplementation>.Value, args);
        }

        public TDefinition Resolve<TDefinition>(string key, IList<object> args)
        {
            var registration = GetIocRegistration<TDefinition>();

            return registration.Resolve(key, args);
        }

        private IoCRegistration<TDefinition> GetIocRegistration<TDefinition>()
        {
            lock (_iocRegistrationsLock)
            {
                var key = IoCRegistration<TDefinition>.Key;

                if(!_iocRegistrations.ContainsKey(key))
                    _iocRegistrations.Add(key, new IoCRegistration<TDefinition>());

                return (IoCRegistration<TDefinition>)_iocRegistrations[IoCRegistration<TDefinition>.Key];    
            }
        }
    }
}