using System;
using System.Collections.Generic;
using System.Configuration;
using Pls.SimpleMongoDb.Exceptions;
using Pls.SimpleMongoDb.Resources;

namespace Pls.SimpleMongoDb
{
    /// <summary>
    /// Settings used to connect to the server.
    /// ConnectionString can be used. See examples for, formatting.
    /// </summary>
    /// <example>
    /// <![CDATA[
    /// <connectionStrings>
    ///     <add name="MyCn" connectionString="host:localhost;port:27017" />
    /// </connectionStrings>
    /// ]]>
    /// </example>
    [Serializable]
    public class SimoConnectionInfo
        : ISimoConnectionInfo, IEquatable<SimoConnectionInfo>
    {
        public const string DefaultHost = "localhost";
        public const int DefaultPort = 27017;

        public string Host { get; private set; }
        public int Port { get; private set; }

        public static SimoConnectionInfo Default
        {
            get { return new SimoConnectionInfo(DefaultHost, DefaultPort); }
        }

        public SimoConnectionInfo(string connectionStringName)
        {
            var connectionString = ConfigurationManager.ConnectionStrings[connectionStringName];
            if(connectionString == null)
                throw new SimoCommunicationException(ExceptionMessages.ConnectionInfo_MissingConnectionStringEntry);

            var parts = GetConnectionStringParts(connectionString.ConnectionString);

            Func<string, string, string> stringParser =
                (key, def) =>
                    {
                        return parts.ContainsKey(key) ? parts[key] : def;
                    };
            Func<string, int, int> intParser =
                (key, def) =>
                    {
                        return parts.ContainsKey(key) ? int.Parse(parts[key]) : def;
                    };

            Host = stringParser("host", DefaultHost);
            Port = intParser("port", DefaultPort);
        }

        public SimoConnectionInfo(string host, int port)
        {
            Host = host;
            Port = port;
        }

        private Dictionary<string, string> GetConnectionStringParts(string connectionString)
        {
            var parts = new Dictionary<string, string>();

            var keyValues = connectionString.Split(";".ToCharArray());
            foreach (var keyValue in keyValues)
            {
                var tmp = keyValue.Split(":".ToCharArray());
                parts.Add(tmp[0], tmp[1]);
            }

            return parts;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as SimoConnectionInfo);
        }

        public bool Equals(SimoConnectionInfo other)
        {
            if (other == null)
                return false;
            if (ReferenceEquals(this, other))
                return true;
            
            return Equals(other.Host, Host) && other.Port == Port;
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return ((Host != null ? Host.GetHashCode() : 0)*397) ^ Port;
            }
        }
    }
}