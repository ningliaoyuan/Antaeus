using System;
using System.Collections.Generic;

namespace Pls.SimpleMongoDb.IoC
{
    public interface ISimoIoC
    {
        void RegisterNoArgs<TDefinition>(Func<TDefinition> resolver);
        void RegisterNoArgs<TDefinition, TImplementation>(Func<TDefinition> resolver);
        void RegisterNoArgs<TDefinition>(string resolverkey, Func<TDefinition> resolver);
        void RegisterWithArgs<TDefinition>(Func<IList<object>, TDefinition> resolver);
        void RegisterWithArgs<TDefinition, TImplementation>(Func<IList<object>, TDefinition> resolver);
        void RegisterWithArgs<TDefinition>(string resolverkey, Func<IList<object>, TDefinition> resolver);
        TDefinition Resolve<TDefinition, TImplementation>();
        TDefinition Resolve<TDefinition>(string key = null);
        TDefinition Resolve<TDefinition>(IList<object> args);
        TDefinition Resolve<TDefinition, TImplementation>(IList<object> args);
        TDefinition Resolve<TDefinition>(string key, IList<object> args);
    }
}