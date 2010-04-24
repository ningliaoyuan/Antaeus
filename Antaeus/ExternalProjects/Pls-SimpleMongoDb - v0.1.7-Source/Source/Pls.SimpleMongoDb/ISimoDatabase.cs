using System.Collections.Generic;

namespace Pls.SimpleMongoDb
{
    public interface ISimoDatabase
    {
        ISimoSession Session { get; }
        string Name { get; }

        ISimoCollection this[string name] { get; }

        void DropDatabase();
        void DropCollections(params string[] collectionNames);

        ISimoCollection GetCollection<T>() where T : class;
        IList<string> GetCollectionNames(bool includeSystemCollections = false);
    }
}