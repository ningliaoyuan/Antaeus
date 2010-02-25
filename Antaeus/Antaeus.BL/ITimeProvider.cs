using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.BL
{
   public interface ITimeProvider
    {
        DateTime Now{get;}
    }

   public class SimpleTimeProvider : ITimeProvider
   {
       #region ITimeProvider Members

       public DateTime Now
       {
           get { return DateTime.Now; }
       }

       #endregion
   }


}
