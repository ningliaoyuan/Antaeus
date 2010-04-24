using System.Collections.Generic;

namespace Pls.SimpleMongoDb
{
    public interface ISimoCollection
    {
        ISimoDatabase Database { get; }
        string Name { get; }
        string FullCollectionName { get; }

        void Drop();

        void Insert(object document);
        void Insert(IEnumerable<object> documents);
        
        void Update(object selector, object document);
        void UpdateMany(object selector, object document);

        void Delete(object selector);

        //IList<T> FindAll<T>(object schema = null, int? limit = null, int? skip = null)
        //    where T : class;

        //IList<T> FindAllInfered<T>(T infered, object schema = null, int? limit = null, int? skip = null)
        //    where T : class;

        IList<T> Find<T>(object selector = null, object schema = null, int? limit = null, int? skip = null)
            where T : class;

        IList<T> FindInfered<T>(T inferedTemplate, object selector = null, int? limit = null, int? skip = null)
            where T : class;

        T FindOne<T>(object selector, object schema = null)
            where T : class;

        T FindOneInfered<T>(T inferedTemplate, object selector)
            where T : class;

        int Count(object selector = null);
    }
}