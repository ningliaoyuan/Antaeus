using System;
using System.Collections.Generic;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Querying;

namespace Pls.SimpleMongoDb
{
    public interface ISimoEntityStore
    {
        ISimoSession Session { get; }
        ISimoDatabase Database { get; }

        void Drop();
        void DropEntityCollection<T>() where T : class;
        void DropEntityCollections();

        void Insert<T>(T entity) where T : class;
        void Insert(string entityName, object entity);

        void Insert<T>(IEnumerable<T> documents) where T : class;
        void Insert(string entityName, IEnumerable<object> entities);

        void Update<T>(object selector, T entity) where T : class;
        void Update(string entityName, object selector, object entity);

        void UpdateMany<T>(object selector, T document) where T : class;
        void UpdateMany(string entityName, object selector, object entity);

        void Delete<T>(object selector) where T : class;
        void Delete(string entityName, object selector);

        IList<T> Query<T>(Action<Query> queryInitializer, Action<IQueryOptions> optionsInitializer = null) where T : class;
        T QueryOne<T>(Action<Query> queryInitializer, Action<ISchemaQueryOptions> optionsInitializer = null) where T : class;

        IList<T> FindAll<T>(Action<IQueryOptions> optionsInitializer = null) where T : class;
        IList<T> FindAllInfered<T>(T infered, Action<IQueryOptions> optionsInitializer = null) where T : class;
        IList<T> FindAllInfered<T>(T infered, string entityName, Action<IQueryOptions> optionsInitializer = null) where T : class;

        IList<T> Find<T>(object selector, Action<IQueryOptions> optionsInitializer = null) where T : class;
        IList<T> FindInfered<T>(T infered, object selector, Action<IQueryOptions> optionsInitializer = null) where T : class;
        IList<T> FindInfered<T>(T infered, string entityName, object selector, Action<IQueryOptions> optionsInitializer = null) where T : class;
        
        T FindOne<T>(object selector, Action<ISchemaQueryOptions> optionsInitializer = null) where T : class;
        T FindOneInfered<T>(T infered, object selector, Action<ISchemaQueryOptions> optionsInitializer = null) where T : class;
        T FindOneInfered<T>(T infered, string entityName, object selector, Action<ISchemaQueryOptions> optionsInitializer = null) where T : class;

        int Count<T>(object selector = null) where T : class;

        SimoReference Reference<T>(SimoId id) where T : class;
        SimoReference Reference(string entityName, SimoId id);
        SimoReference<TId> Reference<T, TId>(TId id) where T : class;
        SimoReference<TId> Reference<TId>(string entityName, TId id);

        string GetEntityCollectionName<T>() where T : class;
    }
}