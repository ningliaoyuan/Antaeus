using System;
using Pls.SimpleMongoDb.Commands;

namespace Pls.SimpleMongoDb.Serialization
{
    /// <summary>
    /// Represents a request that is sent to the server to
    /// perform a command.
    /// </summary>
    /// <seealso cref="http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-StandardMessageHeader"/>
    [Serializable]
    public class Request
    {
        /// <summary>
        /// Each serialization writes
        /// Length, RequestId, ResponseTo and OpCode; which
        /// all are ints, hence 16 bytes are required.
        /// </summary>
        private const int InitialSerializationHeaderLength = 16;
        
        /// <summary>
        /// The Total length of the Request-bytes.
        /// </summary>
        public int TotalLength
        {
            get { return InitialSerializationHeaderLength + BodyBuffer.Length; }
        }

        /// <summary>
        /// Client or database-generated identifier for this Request.
        /// </summary>
        public int RequestId
        {
            get { return 0; }
        }

        /// <summary>
        /// RequestID from the original request (used in reponses from db)
        /// </summary>
        public int ResponseTo
        {
            get { return 0; }
        }

        /// <summary>
        /// Request type. <see cref="OpCodes"/> for possible codes.
        /// </summary>
        public OpCodes OpCode { get; private set; }

        /// <summary>
        /// The body bytes containing e.g serialized data for <see cref="OpCodes.Insert"/>.
        /// </summary>
        public byte[] BodyBuffer { get; private set;}

        public Request(OpCodes opCode, byte[] bodyBuffer)
        {
            OpCode = opCode;
            BodyBuffer = bodyBuffer ?? new byte[0];
        }
    }
}