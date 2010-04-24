using System.Collections.Generic;

namespace Pls.SimpleMongoDb.DataTypes
{
    /// <summary>
    /// Generates a byte-array that is a valid representation of
    /// the MongoDB ObjectId, which is specified as:
    /// A BSON ObjectID is a 12-byte value consisting of 
    /// a 4-byte timestamp,
    /// a 3-byte machine id,
    /// a 2-byte process id, and
    /// a 3-byte counter.
    /// </summary>
    internal class SimoIdBytesGenerator
    {
        
        private readonly SimoIdMachinePart _machinePart;
        private readonly SimoIdProcessPart _processPart;

        internal SimoIdBytesGenerator()
        {
            _machinePart = new SimoIdMachinePart();
            _processPart = new SimoIdProcessPart();
        }

        internal byte[] New()
        {
            var bytes = new List<byte>(12);
            var timePart = new SimoIdTimePart();
            var counterPart = new SimoIdCounterPart();

            bytes.AddRange(timePart.Value);
            bytes.AddRange(_machinePart.Value);
            bytes.AddRange(_processPart.Value);
            bytes.AddRange(counterPart.Value);

            return bytes.ToArray();
        }
    }
}