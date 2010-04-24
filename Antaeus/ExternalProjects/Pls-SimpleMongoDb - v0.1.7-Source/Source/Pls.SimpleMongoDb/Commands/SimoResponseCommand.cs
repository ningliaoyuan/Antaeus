using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.Commands
{
    public abstract class SimoResponseCommand<TDocument>
        : SimoCommand, ISimoResponseCommand
        where TDocument : class
    {
        /// <summary>
        /// Defines the NodeName that the command will be executed against.
        /// E.g <![CDATA["dbname"]]>.
        /// Protected since child classes should make it more clear
        /// what type of NodeName, by instead define an own property
        /// E.g <![CDATA["DataBaseName or FullCollectionName"]]> that consumes this NodeName.
        /// </summary>
        protected string NodeName { get; set; }

        public SimoCommandResponse<TDocument> Response { get; private set; }

        protected SimoResponseCommand(ISimoConnection connection)
            : base(connection)
        {
            InitializeResponse();
        }

        protected override void OnExecute(ISimoConnection connection)
        {
            InitializeResponse();

            base.OnExecute(connection);
        }

        protected override void OnRequestSent()
        {
            using (var responseStream = Connection.GetPipeStream())
            {
                using (var responseReader = new ResponseStreamReader(responseStream))
                {
                    OnReadResponse(responseReader);
                }
            }
        }

        private void InitializeResponse()
        {
            Response = new SimoCommandResponse<TDocument>();
        }

        protected virtual void OnReadResponse(ResponseStreamReader responseStreamReader)
        {
            var requestResponse = responseStreamReader.Read<TDocument>();

            Response.SetDocuments(requestResponse.ReturnedDocuments);

            if(!requestResponse.CursorExists)
                return;

            var queryCmd = this as QueryDocumentsCommand<TDocument>;
            if (queryCmd != null)
            {
                var numOfDocsToReturn = queryCmd.NumberOfDocumentsToReturn;
                if(numOfDocsToReturn > 1 && numOfDocsToReturn == requestResponse.NumberOfReturnedDocuments)
                {
                    //TODO: Kill cursor
                    return;
                }
            }

            GetMoreCommand<TDocument> getMoreCommand = null;

            while (requestResponse.CursorExists)
            {
                if(getMoreCommand == null)
                    getMoreCommand = new GetMoreCommand<TDocument>(Connection, requestResponse.CursorId.Value, requestResponse.NumberOfReturnedDocuments.Value) { FullCollectionName = NodeName };

                getMoreCommand.Execute();

                Response.AddDocuments(getMoreCommand.Response.Documents);

                if(getMoreCommand.Response.NumberOfDocuments < 1 || !getMoreCommand.CursorHasMoreResult)
                    break;
            }

            //Note that if a cursor is read until exhausted
            //(read until OP_QUERY or OP_GETMORE returns zero for the cursor id),
            //there is no need to kill the cursor.
        }
    }
}