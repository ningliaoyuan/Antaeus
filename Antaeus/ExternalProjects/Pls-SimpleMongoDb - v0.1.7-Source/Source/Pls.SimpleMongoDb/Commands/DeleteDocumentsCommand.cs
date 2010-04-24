using System.IO;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Used to delete existing documents.
    /// </summary>
    public class DeleteDocumentsCommand
        : SimoCommand
    {
        /// <summary>
        /// Defines the collection to remove documents from.
        /// E.g <![CDATA["dbname.collectionname"]]>.
        /// </summary>
        public string FullCollectionName { get; set; }

        /// <summary>
        /// Defines the query object that is used to
        /// identify documents to delete.
        /// </summary>
        /// <remarks>Needs to be convertible to BSON.</remarks>
        public object Selector { get; set; }

        public DeleteDocumentsCommand(ISimoConnection connection)
            : base(connection)
        {
        }

        protected override void OnEnsureValidForExecution()
        {
            if (string.IsNullOrEmpty(FullCollectionName))
                throw new SimoCommandException(ExceptionMessages.SimoCommand_IsMissingNodeName);
        }

        protected override Request GenerateRequest()
        {
            return new Request(OpCodes.Delete, GenerateBody());
        }

        protected byte[] GenerateBody()
        {
            //http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-OPDELETE
            //int32     ZERO;                   // 0 - reserved for future use
            //cstring   fullCollectionName;     // "dbname.collectionname"
            //int32     ZERO;                   // 0 - reserved for future use
            //BSON      selector;               // BSON document that represent the query used
                                                // to select the documents to be removed. The
                                                // selector will contain one or more elements,
                                                // all of which must match for a document to be
                                                //removed from the collection
            using (var stream = new MemoryStream())
            {
                using (var writer = new BodyWriter(stream))
                {
                    writer.Write(0);
                    writer.Write(FullCollectionName);
                    writer.Write(0);
                    writer.WriteTerminator();
                    writer.WriteSelector(Selector ?? new object());

                    return stream.ToArray();
                }
            }
        }
    }
}