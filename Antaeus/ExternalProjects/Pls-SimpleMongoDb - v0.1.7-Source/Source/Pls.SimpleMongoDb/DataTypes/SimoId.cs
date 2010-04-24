using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using Pls.SimpleMongoDb.Exceptions;
using Pls.SimpleMongoDb.Resources;
using Pls.SimpleMongoDb.Serialization.Converters;

namespace Pls.SimpleMongoDb.DataTypes
{
    /// <summary>
    /// Represents and is compatible with the id found in MongoDb.
    /// If you want you can use another Id that is unique.
    /// </summary>
    [Serializable, JsonConverter(typeof(SimoIdJsonConverter))]
    public class SimoId
        : IEquatable<SimoId>
    {
        private byte[] _value;
        private string _valueAsString = string.Empty;
        private static readonly SimoIdBytesGenerator Generator = new SimoIdBytesGenerator();

        public static SimoId Empty
        {
            get
            {
                return new SimoId(new byte[12], true);
            }
        }

        public DateTime TimeStamp { get; private set; }

        public byte[] Value
        {
            get
            {
                return _value;
            }
            private set
            {
                _value = value;
                _valueAsString = BitConverter.ToString(Value).Replace("-", "").ToLower();
                TimeStamp = new SimoIdTimePart(_value.Take(4).ToArray()).ConvertToDateTime();
            }
        }

        public SimoId(string id)
            : this(ConvertStringToIdBytes(id), emptyBytesAreValid: false)
        {
        }

        public SimoId(byte[] value)
            : this(value, emptyBytesAreValid: false)
        {}

        private SimoId(byte[] value, bool emptyBytesAreValid)
        {
            EnsureValidByteArray(value, emptyBytesAreValid);
            Value = value;
        }

        public static SimoId NewId()
        {
            return new SimoId(Generator.New());
        }

        private static byte[] ConvertStringToIdBytes(string id)
        {
            id = id.Replace("-", "").ToLower();
            if (id.Length != 24)
                throw new ArgumentException(ExceptionMessages.MongoId_FromStringInvalidLen);

            var valueBbytes = new List<byte>(12);
            for (var c = 0; c < id.Length; c += 2)
            {
                var hexString = id.Substring(c, 2);
                var num = Int32.Parse(hexString, System.Globalization.NumberStyles.HexNumber);
                valueBbytes.Add((byte)num);
            }

            return valueBbytes.ToArray();
        }

        private static void EnsureValidByteArray(byte[] bytes, bool emptyBytesAreValid)
        {
            if (bytes == null || bytes.Length != 12)
                throw new SimoException(ExceptionMessages.SimoObjectId_InvalidBytes);

            if (emptyBytesAreValid)
                return;

            if (IdBytesAreEmpty(bytes))
                throw new SimoException(ExceptionMessages.SimoObjectId_InvalidBytes);
        }

        private static bool IdBytesAreEmpty(byte[] value)
        {
            var emptyByte = (byte)0;

            return value.Where(b => b.Equals(emptyByte)).Count() == value.Length;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as SimoId);
        }

        public bool Equals(SimoId other)
        {
            if (other == null)
                return false;

            if (ReferenceEquals(this, other))
                return true;

            if (Value.Length != other.Value.Length)
                return false;

            for (var c = 0; c < Value.Length; c++)
            {
                var bThis = Value[c];
                var bOther = other.Value[c];

                if (!bThis.Equals(bOther))
                    return false;
            }

            return true;
        }

        public override int GetHashCode()
        {
            return (_value != null ? _value.GetHashCode() : 0);
        }

        public override string ToString()
        {
            return _valueAsString;
        }

        public static implicit operator string(SimoId id)
        {
            return id.ToString();
        }

        public static implicit operator byte[](SimoId id)
        {
            return id.Value;
        }

        public static implicit operator SimoId(byte[] value)
        {
            return new SimoId(value);
        }

        public static bool IsNullOrEmpty(SimoId id)
        {
            return IsNull(id) || IsEmpty(id);
        }

        public static bool IsNull(SimoId id)
        {
            return id == null || id.Value == null;
        }

        public static bool IsEmpty(SimoId id)
        {
            return id.Equals(Empty);
        }
    }
}


