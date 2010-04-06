using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.MongoDB
{
    public interface IFavoriteProvider
    {
        void Add(string userName, string tags, string keyID);

        string GetTags(string userName, string keyID);

        IEnumerable<string> GetKeyIDs(string userName);

    }

    public static class FavoriteProvider
    {
        
    }

    public class FavoriteProvider_Mongo : IFavoriteProvider
    {

        #region IFavoriteProvider Members

        public void Add(string userName, string tags, string keyID)
        {
            throw new NotImplementedException();
        }

        public string GetTags(string userName, string keyID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<string> GetKeyIDs(string userName)
        {
            throw new NotImplementedException();
        }

        #endregion
    }

}
