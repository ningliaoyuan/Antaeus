using System;
using Pls.SimpleMongoDb.Globalization;

namespace Pls.SimpleMongoDb
{
    public class SimoSession
        : ISimoSession
    {
        public ISimoConnection Connection { get; private set; }

        public ISimoPluralizer Pluralizer { get; set; }

        public ISimoDatabase this[string name]
        {
            get { return GetDatabase(name); }
        }

        public SimoSession(ISimoConnection connection)
        {
            Connection = connection;
            Pluralizer = SimoEngine.Instance.IoC.Resolve<ISimoPluralizer>();
        }

        #region Object lifetime, Disposing

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// A call to Dispose(false) should only clean up native resources.
        /// A call to Dispose(true) should clean up both managed and native resources.
        /// </summary>
        /// <param name="disposeManagedResources"></param>
        protected virtual void Dispose(bool disposeManagedResources)
        {
            if (disposeManagedResources)
                DisposeManagedResources();
        }

        ~SimoSession()
        {
            Dispose(false);
        }

        protected virtual void DisposeManagedResources()
        {
            if (Connection != null)
            {
                Connection.Dispose();
                Connection = null;
            }
        }

        #endregion

        private ISimoDatabase GetDatabase(string name)
        {
            var db = new SimoDatabase(this, name);

            return db;
        }
    }
}