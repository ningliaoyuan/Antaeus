using System;
using System.IO;
using System.Net.Sockets;
using Pls.SimpleMongoDb.Exceptions;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb
{
    /// <summary>
    /// Used to establish connection to a MongoDB-server
    /// by communication using TCP-sockets.
    /// </summary>
    public class SimoConnection
        : ISimoConnection
    {
        private readonly object _lockSocket = new object();

        private TcpClient _socket;

        public ISimoConnectionInfo SimoConnectionInfo { get; private set; }
        public bool IsConnected { get { return _socket != null && _socket.Connected; } }

        public SimoConnection(ISimoConnectionInfo simoConnectionInfo)
        {
            if (simoConnectionInfo == null)
                throw new ArgumentNullException("simoConnectionInfo");

            SimoConnectionInfo = simoConnectionInfo;
        }

        #region Object lifetime, Disposing

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// A call to Dispose(false) should only clean up native resources.
        /// A call to Dispose(true) should clean up both managed and native resources.
        /// </summary>
        /// <param name="disposeManagedResources"></param>
        protected virtual void Dispose(bool disposeManagedResources)
        {
            if (disposeManagedResources)
                DisposeManagedResources();
        }

        ~SimoConnection()
        {
            Dispose(false);
        }

        protected virtual void DisposeManagedResources()
        {
            Disconnect();
        }

        #endregion

        public void Connect()
        {
            lock (_lockSocket)
            {
                if (IsConnected)
                    throw new SimoCommunicationException(ExceptionMessages.MongoConnection_AllreadyEstablished);

                _socket = new TcpClient();
                _socket.Connect(SimoConnectionInfo.Host, SimoConnectionInfo.Port);
            }
        }

        public void Disconnect()
        {
            lock (_lockSocket)
            {
                if (_socket != null)
                {
                    if (_socket.Connected)
                        _socket.Close();

                    _socket = null;
                }
            }
        }

        public Stream GetPipeStream()
        {
            if (!IsConnected)
                throw new SimoCommunicationException(ExceptionMessages.MongoConnection_NoPipestreamWhileDisconnected);

            return _socket.GetStream();
        }
    }
}
