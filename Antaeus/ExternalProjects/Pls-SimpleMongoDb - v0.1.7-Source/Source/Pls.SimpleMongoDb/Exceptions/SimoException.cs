using System;

namespace Pls.SimpleMongoDb.Exceptions
{
    [Serializable]
    public class SimoException
        : Exception
    {
        public SimoException(string message)
            : base(message)
        {
        }
    }
}