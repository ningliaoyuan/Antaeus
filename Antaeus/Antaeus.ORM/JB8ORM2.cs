using System.Linq;
using System.Collections.Generic;
namespace Antaeus.ORM
{
    partial class Wiki
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;

        public WikiContent WikiContent
        {
            get
            {
                if (_WikiContent == null)
                {
                    var con = ContextFactory.GetNewContext();

                    _WikiContent = System.Linq.Queryable.Single(con.WikiContents, wc => wc.WikiContentID == this.CurrentWikiContentID);
                }
                return _WikiContent;
            }
        }
        WikiContent _WikiContent;

        public IList<string> Contributors
        {
            get
            {
                if (_Contributors == null)
                {
                    var con = ContextFactory.GetNewContext();
                    _Contributors = this.WikiContents.Select(wc => wc.CrUserName).Distinct().ToList();
                }
                return _Contributors;
            }
        }
        IList<string> _Contributors;
    }
    partial class Category
    {
        public QuestionMeta QuestionMetaObj
        {
            get
            {
                if (_QuestionMeta == null)
                {
                    _QuestionMeta = QuestionMetaManager.QuestionMetaMap[this.QuestionType];
                }
                return _QuestionMeta;
            }
        }
        QuestionMeta _QuestionMeta;

    }
}
