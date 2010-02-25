using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Antaeus.ORM;
using Antaeus.BL.Model;

namespace Antaeus.Helpers
{
    public static class CommonDataHelper
    {
        static CategoryRepository CategoryRepository = new CategoryRepository();
        public static IEnumerable< Category> AllCategory()
        {
            return CategoryRepository.Select(c => true);
        }

        public static IEnumerable<string> AllQuestionType()
        {
            return QuestionMetaManager.QuestionMetaMap.Keys.ToList();
        }
    }
}
