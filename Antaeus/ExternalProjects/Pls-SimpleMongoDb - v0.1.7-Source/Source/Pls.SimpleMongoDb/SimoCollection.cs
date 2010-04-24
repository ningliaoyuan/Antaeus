using System.Collections.Generic;
using System.Linq;
using Pls.SimpleMongoDb.Commands;

namespace Pls.SimpleMongoDb
{
    public class SimoCollection
        : ISimoCollection
    {
        public ISimoDatabase Database { get; private set; }

        public string Name { get; private set; }

        public string FullCollectionName
        {
            get { return string.Format("{0}.{1}", Database.Name, Name); }
        }

        public SimoCollection(ISimoDatabase database, string name)
        {
            Database = database;
            Name = Database.Session.Pluralizer.Pluralize(name);
        }

        public void Drop()
        {
            Database.DropCollections(Name);
        }

        public void Insert(object document)
        {
            Insert(new[] { document });
        }

        public void Insert(IEnumerable<object> documents)
        {
            var cmd = new InsertDocumentsCommand(Database.Session.Connection)
                          {
                              Documents = documents.ToList(),
                              FullCollectionName = FullCollectionName
                          };
            cmd.Execute();
        }

        public void Update(object selector, object document)
        {
            var cmd = new UpdateDocumentsCommand(Database.Session.Connection)
                      {
                          Mode = UpdateModes.Upsert,
                          FullCollectionName = FullCollectionName,
                          QuerySelector = selector,
                          Document = document
                      };
            cmd.Execute();
        }

        public void UpdateMany(object selector, object document)
        {
            var cmd = new UpdateDocumentsCommand(Database.Session.Connection)
            {
                Mode = UpdateModes.MultiUpdate,
                FullCollectionName = FullCollectionName,
                QuerySelector = selector,
                Document = document
            };
            cmd.Execute();
        }

        public void Delete(object selector)
        {
            var cmd = new DeleteDocumentsCommand(Database.Session.Connection)
                          {
                              Selector = selector,
                              FullCollectionName = FullCollectionName
                          };
            cmd.Execute();
        }

        //public IList<T> FindAll<T>(object schema = null, int? limit = null, int? skip = null)
        //    where T : class
        //{
        //    return Find<T>(null, schema, limit, skip);
        //}

        //public IList<T> FindAllInfered<T>(T infered, object schema = null, int? limit = null, int? skip = null)
        //    where T : class
        //{
        //    return FindInfered<T>(infered, null, limit, skip);
        //}

        public IList<T> Find<T>(object selector = null, object schema = null, int? limit = null, int? skip = null)
            where T : class
        {
            var cmd = new QueryDocumentsCommand<T>(Database.Session.Connection)
                          {
                              FullCollectionName = FullCollectionName,
                              QuerySelector = selector,
                              DocumentSchema = schema,
                              NumberOfDocumentsToSkip = skip,
                              NumberOfDocumentsToReturn =  limit
                          };
            cmd.Execute();

            return cmd.Response.Documents;
        }

        public IList<T> FindInfered<T>(T inferedTemplate, object selector = null, int? limit = null, int? skip = null)
            where T : class
        {
            var cmd = new QueryDocumentsCommand<T>(Database.Session.Connection)
            {
                FullCollectionName = FullCollectionName,
                QuerySelector = selector,
                NumberOfDocumentsToSkip = skip,
                NumberOfDocumentsToReturn = limit
            };
            cmd.Execute();

            return cmd.Response.Documents;
        }

        public T FindOne<T>(object selector, object schema = null)
            where T : class
        {
            var result = Find<T>(selector, schema: schema);

            return result.SingleOrDefault();
        }

        public T FindOneInfered<T>(T inferedTemplate, object selector)
            where T : class
        {
            return FindInfered(inferedTemplate, selector).SingleOrDefault();
        }

        public int Count(object selector = null)
        {
            var queryCommand = new InferedCommandFactory().CreateInfered(Database.Session.Connection, new { _id = "" });
            queryCommand.FullCollectionName = FullCollectionName;
            queryCommand.QuerySelector = selector;
            queryCommand.Execute();

            return queryCommand.Response.NumberOfDocuments;
        }
    }
}