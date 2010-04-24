using System.IO;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    public class GetMoreCommand<TDocument>
        : SimoResponseCommand<TDocument>
        where TDocument : class
    {
        private long _initialCursorId;

        /// <summary>
        /// Defines the Full-collectionname to be queried for
        /// more result.
        /// </summary>
        public string FullCollectionName
        {
            get { return NodeName; }
            set { NodeName = value; }
        }

        /// <summary>
        /// The initial ID-value of the the Cursor that this command is getting more response from.
        /// </summary>
        public long InitialCursorId
        {
            get
            {
                return _initialCursorId;
            }
            private set 
            {
                _initialCursorId = value;
                CurrentCursorId = value; 
            }
        }

        /// <summary>
        /// The current ID-value of the the Cursor that this command is getting more response from.
        /// Eventually, after Execute, this will be zero, indicating that no more results exists.
        /// </summary>
        public long CurrentCursorId { get; private set; }

        public bool CursorHasMoreResult
        {
            get { return CurrentCursorId > 0; }
        }

        /// <summary>
        /// Number of documents to return in the first reply.
        /// If numberToReturn is 0, the db will used the default
        /// return size. If the number is negative, then the
        /// database will return that number and close the cursor.
        /// No futher results for that query can be fetched.
        /// </summary>
        public int NumberOfDocumentsToReturn { get; private set; }

        public GetMoreCommand(ISimoConnection connection, long cursorId, int numberOfDocumentsToReturn)
            : base(connection)
        {
            InitialCursorId = cursorId;
            NumberOfDocumentsToReturn = numberOfDocumentsToReturn;
        }

        protected override void OnEnsureValidForExecution()
        {
            if (string.IsNullOrEmpty(NodeName))
                throw new SimoCommandException(ExceptionMessages.SimoCommand_IsMissingNodeName);
        }

        protected override Request GenerateRequest()
        {
            return new Request(OpCodes.GetMore, GenerateBody());
        }

        protected virtual byte[] GenerateBody()
        {
            //http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-OPQUERY
            //int32     ZERO;                   // 0 - reserved for future use
            //cstring   fullCollectionName;     // "dbname.collectionname"
            //int32     numberToReturn;         // number of documents to return
            //int64     cursorID                // cursorID from the OP_REPLY

            using (var stream = new MemoryStream())
            {
                using (var writer = new BodyWriter(stream))
                {
                    writer.Write(0);
                    writer.Write(NodeName);
                    writer.WriteTerminator();
                    writer.Write(NumberOfDocumentsToReturn);
                    writer.Write(InitialCursorId);

                    return stream.ToArray();
                }
            }
        }

        protected override void OnReadResponse(ResponseStreamReader responseStreamReader)
        {
            var requestResponse = responseStreamReader.Read<TDocument>();

            CurrentCursorId = requestResponse.CursorId.HasValue ? requestResponse.CursorId.Value : 0;

            Response.SetDocuments(requestResponse.ReturnedDocuments);
        }
    }
}