using System;

namespace Pls.SimpleMongoDb.Exceptions
{
    /// <summary>
    /// Thrown when problems with the connection to the MongoDB-server
    /// arises.
    /// </summary>
    [Serializable]
    public class SimoCommunicationException
        : SimoException
    {
        public SimoCommunicationException(string message)
            : base(message)
        {
        }
    }
}

   