using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus
{
    public interface IIDProvider
    {
        long GetNewId(string key);
    }

    public class SimpleIDProvider : IIDProvider
    {
        #region IIDProvider Members

        public long GetNewId(string key)
        {
            while (DateTime.Now.Ticks == _lastTicks) { }

            _lastTicks = DateTime.Now.Ticks;
            return _lastTicks;
        }

        long _lastTicks;

        #endregion
    }
}
