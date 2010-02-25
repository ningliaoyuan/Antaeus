using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    public class WikiVersion
    {
        private static log4net.ILog logger;
        static WikiVersion()
        {
            logger = log4net.LogManager.GetLogger(typeof(WikiVersion));
        }


        public const Int32 MaxValue = Int32.MaxValue;

        private Int32 version;

        public WikiVersion(String version)
            : this()
        {
            try
            {
                this.version = int.Parse(version);
            }
            catch (Exception ex)
            {
                logger.Error(ex.ToString());
                throw;
            }
        }

        public WikiVersion(Int32 version)
            : this()
        {
            this.version = version;
        }

        public WikiVersion()
        {

        }

        public Int32 Value
        {
            get { return this.version; }
        }

        public override string ToString()
        {
            return this.version.ToString();
        }

        public override bool Equals(object obj)
        {
            if (obj == null)
            {
                return false;
            }

            if (obj.GetType() != this.GetType())
            {
                return false;
            }

            if (this.version != (obj as WikiVersion).version)
            {
                return false;
            }

            return true;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
