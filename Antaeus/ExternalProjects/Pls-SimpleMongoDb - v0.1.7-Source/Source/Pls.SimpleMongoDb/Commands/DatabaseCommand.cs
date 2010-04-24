using System.IO;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    public abstract class DatabaseCommand
        : SimoResponseCommand<SimoKeyValues>
    {
        /// <summary>
        /// Defines the command to execute.
        /// <![CDATA[E.g.
        /// dropDatabase : 1.0
        /// drop : CollectionName
        /// getlasterror : 1.0
        /// getpreverror : 1.0
        /// reseterror : 1.0]]>
        /// </summary>
        protected object Command { get; set; }

        protected DatabaseCommand(ISimoConnection connection, object command)
            : base(connection)
        {
            Command = command;
        }

        protected override void OnEnsureValidForExecution()
        {
            if (string.IsNullOrEmpty(NodeName))
                throw new SimoCommandException(ExceptionMessages.SimoCommand_IsMissingNodeName);
        }

        protected override Request GenerateRequest()
        {
            return new Request(OpCodes.Query, GenerateBody());
        }

        protected byte[] GenerateBody()
        {
            //http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-OPQUERY
            //int32     opts;                   // query options.
            //cstring   fullCollectionName;     // "dbname.collectionname"
            //int32     numberToSkip;           // number of documents to skip when returning results
            //int32     numberToReturn;         // number of documents to return in the first OP_REPLY
            //BSON      query;                  // query object.  See below for details.
            //BSON      returnFieldSelector;    // OPTIONAL : selector indicating the fields to return.  See below for details.

            using (var stream = new MemoryStream())
            {
                using (var writer = new BodyWriter(stream))
                {
                    writer.Write((int)QueryCommandOptions.None);
                    writer.Write(NodeName + ".$cmd");
                    writer.WriteTerminator();
                    writer.Write(0);
                    writer.Write(-1);

                    writer.WriteSelector(Command);

                    return stream.ToArray();
                }
            }
        }

        /// <summary>
        /// Overrides, since there is no need to extract more documents
        /// via cursor as a normal response command.
        /// </summary>
        /// <param name="responseStreamReader"></param>
        protected override void OnReadResponse(ResponseStreamReader responseStreamReader)
        {
            var response = responseStreamReader.Read<SimoKeyValues>();
            var document = response.ReturnedDocuments[0];
            var commandWasOk = document.GetDouble("ok") == 1.0;

            if(commandWasOk)
                return;

            var errMsg = MongoDbErrorMessage.FromDocument(document);
            if (errMsg == null)
                return;

            throw new SimoCommandException(ExceptionMessages.DatabaseCommand_CommandWasNotOk, errMsg);
        }
    }
}