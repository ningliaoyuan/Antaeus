using System.IO;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Command used for querying for documents.
    /// </summary>
    public class QueryDocumentsCommand<TDocument>
        : SimoResponseCommand<TDocument>
        where TDocument : class
    {
        /// <summary>
        /// Defines the collection that will be queried for documents.
        /// E.g <![CDATA["dbname.collectionname"]]>.
        /// </summary>
        public string FullCollectionName
        {
            get { return NodeName; }
            set { NodeName = value; }
        }

        /// <summary>
        /// Defines how the result will be returned.
        /// </summary>
        private QueryCommandOptions Options { get; set; }

        /// <summary>
        /// Sets the number of documents to omit - starting from
        /// the first document in the resulting dataset - when
        /// returning the result of the query.
        /// </summary>
        public int? NumberOfDocumentsToSkip { get; set; }

        /// <summary>
        /// Number of documents to return in the first reply.
        /// If numberToReturn is 0, the db will used the default
        /// return size. If the number is negative, then the
        /// database will return that number and close the cursor.
        /// No futher results for that query can be fetched.
        /// If the number is 1 it is treated as -1.
        /// </summary>
        public int? NumberOfDocumentsToReturn { get; set; }

        /// <summary>
        /// QuerySelector - defines the query criterias.
        /// </summary>
        public object QuerySelector { get; set; }

        /// <summary>
        /// Optional. Lets you control the fields to return.
        /// </summary>
        public object DocumentSchema { get; set; }

        public QueryDocumentsCommand(ISimoConnection connection)
            : base(connection)
        {
            Options = QueryCommandOptions.None;
            NumberOfDocumentsToSkip = null;
            NumberOfDocumentsToReturn = null;
        }

        protected override void OnEnsureValidForExecution()
        {
            if (string.IsNullOrEmpty(FullCollectionName))
                throw new SimoCommandException(ExceptionMessages.SimoCommand_IsMissingNodeName);
        }

        protected override Request GenerateRequest()
        {
            return new Request(OpCodes.Query, GenerateBody());
        }

        protected byte[] GenerateBody()
        {
            //http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-OPQUERY
            //int32     opts;                   // query options
            //cstring   fullCollectionName;     // "dbname.collectionname"
            //int32     numberToSkip;           // number of documents to skip when returning results
            //int32     numberToReturn;         // number of documents to return in the first OP_REPLY
            //BSON      query;                  // query object.  See below for details.
            //BSON      returnFieldSelector;    // OPTIONAL : selector indicating the fields to return.  See below for details.

            using (var stream = new MemoryStream())
            {
                using (var writer = new BodyWriter(stream))
                {
                    //Number of docs to return:
                    //  0 => the server will use the default return size;
                    // -x => If the number is negative, then the database will return that number and close the cursor.
                    //  1 => the server will treat it as -1 (closing the cursor automatically)

                    var numOfDocsToReturn = NumberOfDocumentsToReturn ?? 0;
                    if (numOfDocsToReturn > 0)
                        numOfDocsToReturn = numOfDocsToReturn*-1;

                    writer.Write((int)Options);
                    writer.Write(FullCollectionName);
                    writer.WriteTerminator();
                    writer.Write(NumberOfDocumentsToSkip ?? 0);
                    writer.Write(numOfDocsToReturn);
                    
                    writer.WriteSelector(QuerySelector ?? new object());
                    
                    if(DocumentSchema != null)
                        writer.WriteDocument(DocumentSchema);

                    return stream.ToArray();
                }
            }
        }
    }
}