using System;
using Pls.SimpleMongoDb.DataTypes;
using Pls.SimpleMongoDb.Exceptions;

namespace Pls.SimpleMongoDb.Commands
{
    [Serializable]
    public class SimoCommandException
        : SimoException
    {
        public MongoDbErrorMessage MongoDbDbMessage { get; private set; }

        public SimoCommandException(string message, MongoDbErrorMessage mongoDbDbMessage = null)
            : base(message)
        {
            MongoDbDbMessage = mongoDbDbMessage ?? MongoDbErrorMessage.Blank;
        }
    }
}