using System.Collections.Generic;
using System.IO;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Used to insert new documents.
    /// </summary>
    public class InsertDocumentsCommand
        : SimoCommand
    {
        /// <summary>
        /// Defines the collection to insert documents in.
        /// E.g <![CDATA["dbname.collectionname"]]>.
        /// </summary>
        public string FullCollectionName { get; set; }

        /// <summary>
        /// The documents that will be inserted.
        /// </summary>
        /// <remarks>Needs to be convertible to BSON.</remarks>
        public IList<object> Documents { get; set; }

        public InsertDocumentsCommand(ISimoConnection connection)
            : base(connection)
        {
        }

        protected override void OnEnsureValidForExecution()
        {
            if (string.IsNullOrEmpty(FullCollectionName))
                throw new SimoCommandException(ExceptionMessages.SimoCommand_IsMissingNodeName);
        }

        protected override void OnRequestSent()
        {
            var dbName = SimoHelper.GetDatabaseName(FullCollectionName);
            var cmd = new GetLastErrorCommand(Connection) { DatabaseName = dbName };
            cmd.Execute();

            if (cmd.Response.IsEmpty)
                return;

            var errMsg = MongoDbErrorMessage.FromDocument(cmd.Response.Documents[0]);
            if (errMsg == null)
                return;

            throw new SimoCommandException(ExceptionMessages.DatabaseCommand_CommandWasNotOk, errMsg);
        }

        protected override Request GenerateRequest()
        {
            return new Request(OpCodes.Insert, GenerateBody());
        }

        protected byte[] GenerateBody()
        {
            //http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-OPINSERT
            //int32     ZERO;               // 0 - reserved for future use
            //cstring   fullCollectionName; // "dbname.collectionname"
            //BSON[] documents;          // one or more documents to insert into the collection
            
            using(var stream = new MemoryStream())
            {
                using (var writer = new BodyWriter(stream))
                {
                    writer.Write(0);
                    writer.Write(FullCollectionName);
                    writer.WriteTerminator();

                    foreach (var document in Documents)
                        writer.WriteDocument(document);

                    return stream.ToArray();
                }
            }
        }
    }
}