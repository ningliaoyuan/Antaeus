using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Antaeus.Services
{
    public static class DataService
    {


        public static List<string> GetQuestionTypes()
        {
            string questionTypes = "Sentences Corrected,Reading Comprehension,Critical Reasoning,Data Sufficient,Problem Solving,Writing: Issue,Writing: Argument";
            return questionTypes.Split(',').ToList();
        }
    }
}
