using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.MongoDB
{
    public class FavoriteItem:ItemBase
    {
        public string _id;
        public string UserName;

        public string Tag = MongoUtility.EmptyString; 

        public string KeyID;
    }

}
