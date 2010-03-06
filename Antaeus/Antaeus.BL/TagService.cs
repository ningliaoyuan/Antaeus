using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL
{
    public class TagService
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();

        public Result Add(string userName, KEYID keyId, string tags)
        {
            var con = ContextFactory.GetNewContext();

            foreach (var tag in tags.Split(','))
            {
                string tagTrim = tag.Trim();
                if (!string.IsNullOrEmpty(tagTrim))
                {
                    Tag tagItem = new Tag()
                    {
                        KID = keyId.ToString(),
                        CrUserName = userName,
                        CreatedTime = TimeProvider.Now,
                        Tags = tagTrim,
                        TagID = IDProvider.GetNewId("Tag")
                    };
                    con.Tags.InsertOnSubmit(tagItem);
                }
            }

            con.SubmitChanges();

            return Result.Success();
        }

        public string GetTags(KEYID ki, int count)
        {
            var con = ContextFactory.GetNewContext();
            var list = from t in con.Tags
                       where t.KID == ki.ToString()
                       group t by t.Tags into t2
                       orderby t2.Count()
                       select t2.Key;
            return string.Join(",", list.Take(count).ToArray());
        }

        public IQueryable<string> GetKIs(string tag)
        {
            tag = tag.Trim();

            var con = ContextFactory.GetNewContext();
            var list = from t in con.Tags
                       where t.Tags == tag
                       group t by t.KID into ki
                       orderby ki.Count()
                       select ki.Key;
            return list; 
        }
    }
    
    public interface IWithTag : IHasKEYID
    {
    }

    public static class TagHelper
    {
        static TagService TagService = new TagService();
        public static string GetTags(this IWithTag model, int count)
        {
            KEYID ki = model.GetKeyId();
            return TagService.GetTags(ki, count);
        }
    }
}
