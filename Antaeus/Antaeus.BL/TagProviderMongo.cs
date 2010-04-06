using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.BL
{
    public interface ITagProvider
    {
       Result Add(string userName, KEYID keyId, string tags);
       string GetTags(KEYID ki, int count);
       IQueryable<string> GetKIs(string tag);
       string GetTagsByUserName(string username, int count);
       bool HasBeenTagged(string username, KEYID kEYID);
    }

    public static class TagService
    {
        public static ITagProvider GetTagProvider()
        {
            return new TagProviderDB();
        }
    }

    public interface IWithTag : IHasKEYID
    {
    }

    public static class TagHelper
    {
        static ITagProvider TagProvider = TagService.GetTagProvider();
        public static string GetTags(this IWithTag model, int count)
        {
            KEYID ki = model.GetKeyId();
            return TagProvider.GetTags(ki, count);
        }
    }

    public class TagProviderMongo
    {

    }

}
