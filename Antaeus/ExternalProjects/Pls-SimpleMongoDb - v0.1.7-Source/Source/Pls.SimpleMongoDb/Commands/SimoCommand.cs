using System;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    /// <summary>
    /// Base-class which you can build your commands upon.
    /// </summary>
    public abstract class SimoCommand
    {
        protected ISimoConnection Connection { get; set; }

        protected SimoCommand(ISimoConnection connection)
        {
            Connection = connection;
        }

        public void Execute()
        {
            EnsureOpenConnection();
            OnEnsureValidForExecution();
            OnExecute(Connection);
        }

        private void EnsureOpenConnection()
        {
            if (!Connection.IsConnected)
                Connection.Connect();
        }

        /// <summary>
        /// Implement and throw exception <see cref="SimoCommandException"/> if
        /// the Command can not be executed due to lacking prerequisites.
        /// </summary>
        protected abstract void OnEnsureValidForExecution();

        protected virtual void OnExecute(ISimoConnection connection)
        {
            var request = GenerateRequest();

            using (var requestStream = connection.GetPipeStream())
            {
                using (var requestWriter = new RequestWriter(requestStream))
                {
                    requestWriter.Write(request);

                    OnRequestSent();
                }
            }
        }

        /// <summary>
        /// Is executed direct after the request has been sent to the MongoDb-server.
        /// Lets you perform querying for responses etc. on the same connection,
        /// before it is closed.
        /// </summary>
        protected virtual void OnRequestSent()
        {
        }

        /// <summary>
        /// Should generate the Request that will be serialized
        /// to the Network stream, hence sent to the server.
        /// </summary>
        /// <returns></returns>
        protected abstract Request GenerateRequest();
    }
}