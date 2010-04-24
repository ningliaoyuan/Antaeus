using System;
using System.Linq;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb.DataTypes
{
    internal class SimoIdCounterPart
    {
        private const int BytesLen = 3;

        private static readonly object CounterLock;
        private static int _counter;

        internal byte[] Value { get; private set; }

        static SimoIdCounterPart()
        {
            CounterLock = new object();
        }

        internal SimoIdCounterPart(byte[] value = null)
        {
            if (value != null && value.Length != BytesLen)
                throw new ArgumentException(string.Format(ExceptionMessages.SimoObjectIdCounterPart_InvalidBytesLen, BytesLen));

            Value = value ?? Generate();
        }

        private byte[] Generate()
        {
            lock (CounterLock)
            {
                _counter += 1;

                return BitConverter.GetBytes(_counter).Take(BytesLen).ToArray();
            }
        }
    }
}