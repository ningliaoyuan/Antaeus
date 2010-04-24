using System;
using System.IO;
using System.Text;

namespace Pls.SimpleMongoDb.Serialization
{
    /// <summary>
    /// Is used to generate a Request-stream, containing both the Request-header
    /// and the body containing the specific request parameters.
    /// </summary>
    public class RequestWriter
        : IDisposable
    {
        private BinaryWriter _writer;

        public Encoding Encoding
        {
            get { return SerializationConsts.DefaultEncoding; }
        }

        public RequestWriter(Stream targetStream)
        {
            _writer = new BinaryWriter(targetStream, Encoding);
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

        ~RequestWriter()
        {
            Dispose(false);
        }

        protected virtual void DisposeManagedResources()
        {
            if (_writer != null)
            {
                _writer.Dispose();
                _writer = null;
            }
        }

        #endregion

        public void Write(Request request)
        {
            OnWriteHeader(request);
            OnWriteBody(request.BodyBuffer);
        }

        private void OnWriteHeader(Request request)
        {
            _writer.Write(request.TotalLength);
            _writer.Write(request.RequestId);
            _writer.Write(request.ResponseTo);
            _writer.Write((int)request.OpCode);
            _writer.Flush();
        }

        private void OnWriteBody(byte[] bodyBuff)
        {
            _writer.Write(bodyBuff);
            _writer.Flush();
        }
    }
}