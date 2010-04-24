using System;
using System.IO;
using System.Text;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Querying;

namespace Pls.SimpleMongoDb.Serialization
{
    /// <summary>
    /// Is used to generate a body-stream.
    /// </summary>
    public class BodyWriter
        : IDisposable
    {
        private BinaryWriter _binaryWriter;
        private readonly IDocumentWriter _documentWriter;
        private readonly ISelectorWriter _selectorWriter;

        public Encoding Encoding
        {
            get { return SerializationConsts.DefaultEncoding; }
        }

        public BodyWriter(Stream bodyStream)
        {
            _binaryWriter = new BinaryWriter(bodyStream, Encoding);
            _documentWriter = new DocumentWriter(bodyStream);
            _selectorWriter = new SelectorWriter(bodyStream);
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

        ~BodyWriter()
        {
            Dispose(false);
        }

        protected virtual void DisposeManagedResources()
        {
            if (_binaryWriter != null)
            {
                _binaryWriter.Dispose();
                _binaryWriter = null;
            }
        }

        #endregion

        public void Write(int value)
        {
            _binaryWriter.Write(value);
        }

        public void Write(long value)
        {
            _binaryWriter.Write(value);
        }

        public void Write(string value)
        {
            _binaryWriter.Write(Encoding.GetBytes(value));
        }

        public void WriteTerminator()
        {
            _binaryWriter.Write((byte)0);
        }

        public void WriteDocument(object value)
        {
            if (value is string)
                WriteJson(value.ToString(), _documentWriter);
            else if (value is SimoJson)
                WriteJson(value as SimoJson, _documentWriter);
            else
                WriteAsBson(value, _documentWriter);
        }

        public void WriteSelector(object value)
        {
            if (value is string || value is Query)
                WriteJson(value.ToString(), _selectorWriter);
            else if (value is SimoJson)
                WriteJson(value as SimoJson, _selectorWriter);
            else
                WriteAsBson(value, _selectorWriter);
        }

        private void WriteJson(SimoJson json, ISimoBsonWriter writer)
        {
            WriteAsBson(json.ToKeyValue(), writer);
        }

        private void WriteAsBson(object value, ISimoBsonWriter writer)
        {
            writer.Write(value);
        }
    }
}