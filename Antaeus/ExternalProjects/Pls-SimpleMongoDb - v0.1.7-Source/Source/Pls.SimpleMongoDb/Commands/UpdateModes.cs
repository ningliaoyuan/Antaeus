using System;

namespace Pls.SimpleMongoDb.Commands
{
    [Serializable, Flags]
    public enum UpdateModes : int
    {
        /// <summary>
        /// Updates one row and does not Upsert posts.
        /// </summary>
        Simple = 0,

        /// <summary>
        /// If set, the database will insert the supplied
        /// object into the collection if no matching document is found.
        /// </summary>
        /// <remarks>Acording to online documentation Upsert should have value 0</remarks>
        Upsert = 1,
        /// <summary>
        /// If set, the database will update all matching objects in the
        /// collection. Otherwise only updates first matching doc.
        /// </summary>
        /// <remarks>Acording to online documentation MultiUpdate should have value 1</remarks>
        MultiUpdate = 2
    }
}