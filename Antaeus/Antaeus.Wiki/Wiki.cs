using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    public class Wiki
    {
        public Wiki()
        {
            Name = new WikiName();
            Content = new WikiContent();
            Version = new WikiVersion();
            CreatedAt = new DateTime();
        }

        private WikiName name;

        public WikiName Name
        {
            get { return name; }
            set { name = value; }
        }

        private WikiContent content;

        public WikiContent Content
        {
            get { return content; }
            set { content = value; }
        }

        private WikiVersion version;

        public WikiVersion Version
        {
            get { return version; }
            set { version = value; }
        }

        private DateTime createdAt;

        public DateTime CreatedAt
        {
            get { return createdAt; }
            set { createdAt = value; }
        }

    }
}
