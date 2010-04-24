using System;
using System.Collections.Generic;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Querying;

namespace Pls.SimpleMongoDb
{
    /// <summary>
    /// Allows you to work on a higher level with MongoDB, so that
    /// you don't explicitly have to work with Databases and Collections.
    /// If the Session.SimoPluralizer is enabled, all entitynames will be
    /// pluralized, hence stored in a collection with a pluralized name.
    /// If you use any of the generic overloads, the typename of the
    /// passed entity will be pluralized and used as collectionname.
    /// </summary>
    public class SimoEntityStore
        : ISimoEntityStore
    {
        public ISimoDatabase Database { get; private set; }

        public ISimoSession Session { get; private set; }

        public SimoEntityStore(ISimoSession session, string databaseName)
        {
            Session = session;
            Database = Session[databaseName];
        }

        public void Drop()
        {
            Database.DropDatabase();
        }

        public void DropEntityCollection<T>()
            where T : class 
        {
            var collectionName = GetEntityCollectionName<T>();
            Database.DropCollections(collectionName);
        }

        public void DropEntityCollections()
        {
            Database.DropCollections();
        }

        public void Insert<T>(T entity)
             where T : class
        {
            GetEntityCollection<T>().Insert(entity);
        }

        public void Insert(string entityName, object entity)
        {
            GetEntityCollection(entityName).Insert(entity);
        }

        public void Insert<T>(IEnumerable<T> entities)
            where T : class
        {
            GetEntityCollection<T>().Insert(entities);
        }

        public void Insert(string entityName, IEnumerable<object> entities)
        {
            GetEntityCollection(entityName).Insert(entities);
        }

        public void Update<T>(object selector, T entity)
            where T : class
        {
            GetEntityCollection<T>().Update(selector, entity);
        }

        public void Update(string entityName, object selector, object entity)
        {
            GetEntityCollection(entityName).Update(selector, entity);
        }

        public void UpdateMany<T>(object selector, T entity)
            where T : class
        {
            GetEntityCollection<T>().UpdateMany(selector, entity);
        }

        public void UpdateMany(string entityName, object selector, object entity)
        {
            GetEntityCollection(entityName).UpdateMany(selector, entity);
        }

        public void Delete<T>(object selector)
            where T : class
        {
            GetEntityCollection<T>().Delete(selector);
        }

        public void Delete(string entityName, object selector)
        {
            GetEntityCollection(entityName).Delete(selector);
        }

        public IList<T> Query<T>(Action<Query> queryInitializer, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var query = Querying.Query.New(queryInitializer);

            return Find<T>(query, optionsInitializer);
        }

        public T QueryOne<T>(Action<Query> queryInitializer, Action<ISchemaQueryOptions> optionsInitializer = null)
            where T : class
        {
            var query = Querying.Query.New(queryInitializer);

            return FindOne<T>(query, optionsInitializer);
        }

        public IList<T> FindAll<T>(Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            return Find<T>(null, optionsInitializer);
        }

        public IList<T> FindAllInfered<T>(T infered, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return FindInfered(infered, options);
        }

        public IList<T> FindAllInfered<T>(T infered, string entityName, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return FindInfered(infered, entityName, options);
        }

        public IList<T> Find<T>(object selector, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection<T>().Find<T>(selector, options.GetSchema(), options.GetLimit(), options.GetSkip());
        }

        public IList<T> FindInfered<T>(T infered, object selector, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection<T>().Find<T>(selector, options.GetSchema(), options.GetLimit(), options.GetSkip());
        }

        public IList<T> FindInfered<T>(T infered, string entityName, object selector, Action<IQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection(entityName).Find<T>(selector, options.GetSchema(), options.GetLimit(), options.GetSkip());
        }

        public T FindOne<T>(object selector = null, Action<ISchemaQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if(optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection<T>().FindOne<T>(selector, options.GetSchema());
        }

        public T FindOneInfered<T>(T infered, object selector = null, Action<ISchemaQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection<T>().FindOne<T>(selector, options.GetSchema());
        }

        public T FindOneInfered<T>(T infered, string entityName, object selector = null, Action<ISchemaQueryOptions> optionsInitializer = null)
            where T : class
        {
            var options = new QueryOptions();

            if (optionsInitializer != null)
                optionsInitializer.Invoke(options);

            return GetEntityCollection(entityName).FindOne<T>(selector, options.GetSchema());
        }

        public int Count<T>(object selector = null)
            where T : class
        {
            return GetEntityCollection<T>().Count(selector);
        }

        public SimoReference Reference<T>(SimoId id) where T : class
        {
            var entityName = EntityMetadata<T>.EntityName;

            return Reference(entityName, id);
        }

        public SimoReference Reference(string entityName, SimoId id)
        {
            entityName = Session.Pluralizer.Pluralize(entityName);
            
            return new SimoReference { CollectionName = entityName, Id = id };
        }

        public SimoReference<TId> Reference<T, TId>(TId id) where T : class
        {
            var entityName = EntityMetadata<T>.EntityName;

            return Reference(entityName, id);
        }

        public SimoReference<TId> Reference<TId>(string entityName, TId id)
        {
            entityName = Session.Pluralizer.Pluralize(entityName);

            return new SimoReference<TId> { CollectionName = entityName, Id = id };
        }

        private ISimoCollection GetEntityCollection<T>()
            where T : class
        {
            return Database.GetCollection<T>();
        }

        private ISimoCollection GetEntityCollection(string entityName)
        {
            return Database[entityName];
        }

        public string GetEntityCollectionName<T>()
            where T : class
        {
            return EntityMetadata<T>.EntityName;
        }
    }
}