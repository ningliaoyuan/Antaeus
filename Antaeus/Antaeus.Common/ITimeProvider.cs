using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus
{
    public interface ITimeProvider
    {
        DateTime Now { get; }
        string NowStr { get; }
    }

    public static class TimeProvider
    {
        public static ITimeProvider Singleton
        {
            get
            {
                if (_Singleton == null)
                {
                    _Singleton = new SimpleTimeProvider();
                }
                return _Singleton;
            }
        }

        static ITimeProvider _Singleton;
    }


   public class SimpleTimeProvider : ITimeProvider
   {
       #region ITimeProvider Members

       public DateTime Now
       {
           get { return DateTime.Now; }
       }

       public string NowStr
       {
           get { return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); }
 
       }
       #endregion
   }


}
