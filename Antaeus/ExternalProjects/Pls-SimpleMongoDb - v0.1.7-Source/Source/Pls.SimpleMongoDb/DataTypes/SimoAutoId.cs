using System;

namespace Pls.SimpleMongoDb.DataTypes
{
    [Serializable]
    public class SimoAutoId
    {
        private SimoId Id { get; set; }

        public SimoAutoId()
            : this(SimoId.NewId())
        {
        }

        private SimoAutoId(SimoId id)
        {
            Id = id;
        }

        public static implicit operator SimoId(SimoAutoId simoAutoId)
        {
            return simoAutoId.Id;
        }

        public static implicit operator SimoAutoId(SimoId id)
        {
            return new SimoAutoId(id);
        }
    }
}