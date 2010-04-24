using System;

namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Defines possible message types.
    /// </summary>
    /// <seealso cref="http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol#MongoWireProtocol-ClientRequestMessages"/>
    [Serializable]
    public enum OpCodes
    {
        /// <summary>
        /// Reply to a client request. responseTo is set.
        /// </summary>
        Reply = 1,
        /// <summary>
        /// Generic msg command followed by a string.
        /// </summary>
        Msg = 1000,
        /// <summary>
        /// Update document.
        /// </summary>
        Update = 2001,
        /// <summary>
        /// Insert new document.
        /// </summary>
        Insert = 2002,
        /// <summary>
        /// Is this used?
        /// </summary>
        GetByOId = 2003,
        /// <summary>
        /// Find a collection.
        /// </summary>
        Query = 2004,
        /// <summary>
        /// Get more data from a query. See Cursors.
        /// </summary>
        GetMore = 2005,
        /// <summary>
        /// Delete documents.
        /// </summary>
        Delete = 2006,
        /// <summary>
        /// Tell database client is done with a cursor.
        /// </summary>
        KillCursors = 2007
    }
}