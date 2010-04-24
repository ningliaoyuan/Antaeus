using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Pls.SimpleMongoDb.Commands;
using Pls.SimpleMongoDb.Exceptions;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb.Serialization
{
    /// <summary>
    /// Is used to generate a Response from a Response-stream, containing both the
    /// Response-header and the body containing the specific request parameters.
    /// </summary>
    public class ResponseStreamReader
        : IDisposable
    {
        private BinaryReader _reader;
        private readonly DocumentReader _documentReader;

        public Encoding Encoding
        {
            get { return SerializationConsts.DefaultEncoding; }
        }

        public ResponseStreamReader(Stream responseStream)
        {
            _reader = new BinaryReader(responseStream, Encoding);
            _documentReader = new DocumentReader(responseStream);
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

        ~ResponseStreamReader()
        {
            Dispose(false);
        }

        protected virtual void DisposeManagedResources()
        {
            if (_reader != null)
            {
                _reader.Close();
                _reader.Dispose();
                _reader = null;
            }
        }

        #endregion

        public Response<TDocument> Read<TDocument>()
            where TDocument : class 
        {
            var response = new Response<TDocument>();

            OnReadHeader(response);
            OnReadBody(response);

            return response;
        }

        private void OnReadHeader<TDocument>(Response<TDocument> response)
        {
            response.TotalLength = _reader.ReadInt32();
            response.RequestId = _reader.ReadInt32();
            response.ResponseTo = _reader.ReadInt32();
            response.OpCode = (OpCodes)_reader.ReadInt32();

            //TODO: Verify response.ResponseTo against request.RequestID

            if(!response.OpCode.HasValue)
                throw new SimoCommunicationException(ExceptionMessages.ResponseReader_MissingOpCodeInResponse);

            if(response.OpCode.Value != OpCodes.Reply)
                throw new SimoCommunicationException(string.Format(
                    ExceptionMessages.ResponseReader_WrongOpCodeInResponse, 
                    OpCodes.Reply,
                    response.OpCode));
        }

        private void OnReadBody<TDocument>(Response<TDocument> response)
            where TDocument : class
        {
            response.ResponseFlag = _reader.ReadInt32();
            response.CursorId = _reader.ReadInt64();
            response.StartingFrom = _reader.ReadInt32();
            response.NumberOfReturnedDocuments = _reader.ReadInt32();

            var returnedDocuments = new List<TDocument>();

            for (var i = 0; i < response.NumberOfReturnedDocuments.Value; i++)
            {
                var document = _documentReader.ReadDocument<TDocument>();
                returnedDocuments.Add(document);
            }

            response.SetDocuments(returnedDocuments);
        }
    }
}