using System;

namespace Pls.SimpleMongoDb.Commands
{
    [Serializable]
    public enum QueryCommandOptions : int
    {
        None = 0,
        TailableCursor = 2,
        SlaveOk = 4,
        NoCursorTimeOut = 16
    }
}