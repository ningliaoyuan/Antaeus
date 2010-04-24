using System;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb.DataTypes
{
    [Serializable]
    public class MongoDbErrorMessage
    {
        public static readonly MongoDbErrorMessage Blank = new MongoDbErrorMessage(string.Empty);

        public string Message { get; private set; }

        public MongoDbErrorMessage(string message = null)
                {
                    Message = message ?? ExceptionMessages.MongoErrorMessage_Default;
                }

        public static MongoDbErrorMessage FromDocument(SimoKeyValues document)
        {
            if (document.Keys.Count < 1)
                return null;

            var commandWasOk = document.GetDouble("ok") == 1.0;
            if (commandWasOk)
                return null;

            string errMsg = null;

            if (document.ContainsKey("errmsg"))
                errMsg = document.GetString("errmsg");

            return new MongoDbErrorMessage(errMsg);
        }
    }
}