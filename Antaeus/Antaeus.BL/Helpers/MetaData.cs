using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Web.Mvc;
using Antaeus.ORM;

namespace Antaeus.BL.Helpers
{
    [ModelBinder(typeof(MetaDataModelBinder))]
    public class MetaData
    {
        public WikiService WikiService = new WikiService();
        public string this[string key]
        {
            get
            {
                string val = string.Empty;
                if(!_MetaData.TryGetValue(key, out val))
                {
                    key = "meta." + key;
                    if(!_MetaData.TryGetValue( key, out val))
                    {
                        return string.Empty;
                    }
                }

                return val; 
            }
        }
        Dictionary<string, string> _MetaData;
        public IEnumerable<string> Keys
        {
            get
            {
                return _MetaData.Keys;
            }
        }
        public string ToXml()
        {
            XElement doc = new XElement("meta");

            var els = from meta in _MetaData
                      select new XElement("i", new XAttribute("key", meta.Key), new XAttribute("val", meta.Value));
            doc.Add(els);

            return doc.ToString();
        }

        public MetaData(Dictionary<string, string> metaDic)
        {
            _MetaData = metaDic;
        }

        public MetaData(string xml)
        {
            _MetaData = new Dictionary<string, string>();
            XElement doc = XElement.Parse(xml);
            foreach (var el in doc.Elements("i"))
            {
                _MetaData.Add(el.Attribute("key").Value, el.Attribute("val").Value);
            }
        }

        public Wiki GetWiki(string key)
        {
            string wikiId = this[key];

            // 如果wikiId 格式不对，将抛出异常
            return WikiService.GetWiki(wikiId.ParseWikiKeyId());
        }

        public Result AlterWiki(string key, string username, KEYID ki)
        {
            string content = this[key];
            WikiService.InsertWiki(username, content, ki);
            _MetaData[key] = ki.ToWikiIdentity();

            return Result.Success();
        }
    }


    public class MetaDataModelBinder:IModelBinder
    {
        #region IModelBinder Members

        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var dic = new Dictionary<string,string>();

            foreach (string key in bindingContext.ValueProvider.Keys)
            {
                string pureKey;
                if (matchKey(key, out pureKey))
                {
                    ValueProviderResult valueResult;
                    if (bindingContext.ValueProvider.TryGetValue(key, out valueResult))
                    {
                        if (!string.IsNullOrEmpty(valueResult.AttemptedValue))
                        {
                            dic.Add(pureKey, valueResult.AttemptedValue);
                        }
                    }
                }
            }

            return new MetaData(dic);
        }

        private bool matchKey(string key, out string pureKey)
        {
            pureKey = string.Empty;
            if (key.StartsWith("meta."))
            {
                pureKey = key.Substring(key.IndexOf('.') + 1);
                return true;
            }

            if (MatchList!= null && MatchList.Contains(key))
            {
                pureKey = key;
                return true;
            }

            return false;
        }


        public List<string> MatchList;

        #endregion
    }

    public class MetaDataModelBinderAttribute : CustomModelBinderAttribute
    {
        private IModelBinder _binder;

        public MetaDataModelBinderAttribute()
        {
            _binder = new MetaDataModelBinder();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="matchKeys">split by ';'</param>
        public MetaDataModelBinderAttribute(string matchKeys)
        {
            _binder = new MetaDataModelBinder()
            {
                MatchList = matchKeys.Split(';').ToList()
            };
        }
        public override IModelBinder GetBinder() { return _binder; }
    }

    public static class MetaDataExtension
    {
        


        public static void SetMeta(this Category cate, MetaData meta)
        {
            cate.QuestionTypeMeta = meta.ToXml();
        }

        public static MetaData GetMeta(this Category cate)
        {
            return new MetaData(cate.QuestionTypeMeta);
        }

        public static bool GetBool(this MetaData meta, string key, bool defVal)
        {
            string raw = meta[key];
            if (string.IsNullOrEmpty(raw))
            {
                return defVal;
            }

            return Convert.ToBoolean(raw);
        }
    }
}
