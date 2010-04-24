using System.Collections.Generic;
using System.Linq;
using Pls.SimpleMongoDb.Commands;
using Pls.SimpleMongoDb.DataTypes;

namespace Pls.SimpleMongoDb
{
    public class SimoDatabase
        : ISimoDatabase
    {
        public ISimoSession Session { get; private set; }

        public string Name { get; private set; }

        public ISimoCollection this[string name]
        {
            get { return GetCollection(name); }
        }

        public SimoDatabase(ISimoSession session, string name)
        {
            Session = session;
            Name = name;
        }

        public void DropDatabase()
        {
            var cmd = new DropDatabaseCommand(Session.Connection) { DatabaseName = Name };
            cmd.Execute();
        }

        public void DropCollections(params string[] collectionNames)
        {
            var collectionsAreSpecified = (collectionNames != null && collectionNames.Length > 0);
            var collectionNamesToDrop = collectionsAreSpecified
                                            ? collectionNames
                                            : GetCollectionNames(incluceSystemCollections: false);

            if (collectionNamesToDrop == null || collectionNamesToDrop.Count < 1)
                return;

            var fullCollectionNamePrefix = Name + ".";
            var prefixLen = fullCollectionNamePrefix.Length;

            var cmd = new DropCollectionCommand(Session.Connection) { DatabaseName = Name };

            foreach (var collectionName in collectionNamesToDrop)
            {
                var dropName = collectionName;

                if (collectionsAreSpecified)
                {
                    var collectionNameIsFullCollectionName = dropName.StartsWith(fullCollectionNamePrefix);
                    if (collectionNameIsFullCollectionName)
                        dropName = collectionName.Substring(prefixLen);

                    if (MongoSystem.ReservedCollections.IsReserved(dropName))
                        continue;
                }

                cmd.CollectionName = dropName;
                cmd.Execute();
            }
        }

        public IList<string> GetCollectionNames(bool incluceSystemCollections = false)
        {
            var cmd = new QueryDocumentsCommand<SimoKeyValues>(Session.Connection)
            {
                FullCollectionName = Name + ".system.namespaces"
            };
            cmd.Execute();

            var fullCollectionNamePrefix = Name + ".";
            var prefixLen = fullCollectionNamePrefix.Length;
            var fullCollectionNames = cmd.Response.Documents.Select(kv =>
                                                     {
                                                         var cn = kv.GetString("name");
                                                         var collectionNameIsFullCollectionName =
                                                             cn.StartsWith(fullCollectionNamePrefix);
                                                         if (collectionNameIsFullCollectionName)
                                                             cn = cn.Substring(prefixLen);

                                                         return cn;
                                                     });


            fullCollectionNames = incluceSystemCollections
                                      ? fullCollectionNames
                                      : fullCollectionNames.Where(cn => !MongoSystem.ReservedCollections.IsReserved(cn));

            return fullCollectionNames.ToList();
        }

        public ISimoCollection GetCollection<T>()
            where T : class
        {
            var entityName = EntityMetadata<T>.EntityName;

            return GetCollection(entityName);
        }

        private ISimoCollection GetCollection(string name)
        {
            return new SimoCollection(this, name);
        }
    }
}