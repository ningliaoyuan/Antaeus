using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Antaeus.ORM
{
    public class QuestionMeta
    {
        public string CreateForm;
        public string DetailsForm;
        public string MetaEditForm;
    }   

    public static class QuestionMetaManager
    {
        public static Dictionary<string, QuestionMeta> QuestionMetaMap
        {
            get
            {
                if (_QuestionMetaMap == null)
                {
                    _QuestionMetaMap = new Dictionary<string, QuestionMeta>();
                    _QuestionMetaMap.Add("选择题", new QuestionMeta()
                    {
                        CreateForm = "QuestionFormTypeChoice",
                        DetailsForm = "QuestionViewTypeChoice"
                    }
                        );
                    _QuestionMetaMap.Add("作文题", new QuestionMeta()
                    {
                        CreateForm = "QuestionFormTypeIssue",
                        DetailsForm = "QuestionViewTypeIssue"
                    }
                        );
                    _QuestionMetaMap.Add("阅读题", new QuestionMeta()
                    {
                        CreateForm = "QuestionFormTypeReading",
                        DetailsForm = "QuestionViewTypeReading"
                    }
                        );
                }
                return _QuestionMetaMap;
            }
        }

        static Dictionary<string, QuestionMeta> _QuestionMetaMap;
    }
}
