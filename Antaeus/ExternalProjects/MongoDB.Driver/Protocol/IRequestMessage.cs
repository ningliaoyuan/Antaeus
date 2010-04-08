﻿using System.IO;

namespace MongoDB.Driver.Protocol
{
    /// <summary>
    /// A Message that is to be written to the database.
    /// </summary>
    public interface IRequestMessage
    {
        void Write (Stream stream);
    }
}
