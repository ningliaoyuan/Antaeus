using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    [Serializable]
    public sealed class WikiException : Exception
    {
        public WikiException()
            : base()
        { }

        public WikiException(string message)
            : base(message)
        { }

        public WikiException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
