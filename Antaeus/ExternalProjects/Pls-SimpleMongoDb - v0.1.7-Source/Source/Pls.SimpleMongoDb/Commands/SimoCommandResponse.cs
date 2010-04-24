using System;
using System.Collections.Generic;

namespace Pls.SimpleMongoDb.Commands
{
    [Serializable]
    public class SimoCommandResponse<TDocument>
        where TDocument : class 
    {
        private readonly List<TDocument> _documents;

        public IList<TDocument> Documents
        {
            get { return _documents; }
        }

        public bool IsEmpty
        {
            get { return NumberOfDocuments < 1; }
        }

        public int NumberOfDocuments
        {
            get { return Documents.Count; }
        }

        public SimoCommandResponse()
        {
            _documents = new List<TDocument>();
        }
        
        public void SetDocuments(IList<TDocument> documents)
        {
            _documents.Clear();
            
            AddDocuments(documents);
        }

        public void AddDocuments(IList<TDocument> documents)
        {
            if (documents != null && documents.Count > 0)
                _documents.AddRange(documents);
        }
    }
}