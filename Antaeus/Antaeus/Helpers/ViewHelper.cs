using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Text;
using Antaeus.Services;

namespace Antaeus.Helpers
{
    public static class ViewHelper
    {
        public static string FormItemBeginHtml(string title, bool required) {
            string requiredStr1 = required ? "<span>*</span>" : string.Empty;
            StringBuilder sb = new StringBuilder();
			sb.Append("<div class=\"item\">");
			sb.Append("<div class=\"title\">"+title+requiredStr1+"</div>");
			sb.Append("<div class=\"detail\">");
            return sb.ToString();
        }
        public static string FormItemEndHtml = "</div><div class=\"clear\"></div></div>";
		
		public static string FormTextbox(this HtmlHelper Html, string name, string title, bool required, int type, string def, string tips, bool position, string between)
        {
            // name     : 表单的取得唯一名称，多个的话用,隔开
            // title    : 整个表单项的标题名字
            // required : 是否必填
            // type     : 哪种类型的，目前支持123三种类型，详情查看表单template
            // def      : 初始的提示文字，多个的话用,隔开
            // tips     : 提示信息，可以为空
            // position : 表单项中间插入的文字位置，只有前或者后两种，true为前，flase为后
            // between  : 表单项中间插入的文字，多个的话用,隔开
			
            string requiredStr2 = required ? " required=\"true\"" : string.Empty;
			
			StringBuilder sb = new StringBuilder();

            //首先载入通用的开始头部
            sb.Append(FormItemBeginHtml(title,required));

            if (position && between != "") sb.Append("<div class=\"inp-between\">" + between + "</div>");
            sb.Append("<input type=\"text\" class=\"inp inp" + type.ToString() + "\" value=\"" + def + "\" name=\"" + name + "\"" + requiredStr2 + " />");
            if (!position && between != "") sb.Append("<div class=\"inp-between\">" + between + "</div>");

			if(tips!=null){
				sb.Append("<div class=\"blank5\"></div>");
				sb.Append("<div class=\"tips\">"+tips+"</div>");
			}

            //最后加入结尾的关闭Html
            sb.Append(FormItemEndHtml);



            var list = "a,b".Split(',');
            var l = new List<string>();

           



            return sb.ToString();
        }

        public static string FormTextbox(this HtmlHelper Html, string name, string title, bool required, string def, string tips, bool position, string between) {
            return "haha";
        }

        public static string RenderNormalInput(this HtmlHelper Html, string name, string title, bool required,int type, string def)
        {
            //<div class="item">
            // <div class="title">单个文本输入框<span>*</span></div>
            // <div class="detail">
            //     <input type="text" class="inp inp1" value="" />                                       
            // </div>
            // <div class="clear"></div>                        
            //</div>
            string templete = "<div class=\"item\"><div class=\"title\">{1}{2}</div><div class=\"detail\"><input name=\"{0}\" type=\"text\" class=\"inp inp{3}\" value=\"{4}\" /></div><div class=\"clear\"></div></div>";
            string requiredStr = "<span>*</span>";

            string res = string.Format(templete, name, title, required ? requiredStr : string.Empty, type.ToString(), def);

            return res;
        }

     
        public static string ShowPageIndex(this HtmlHelper Html, Pager pager, string className)
        {
            int amountPage = pager.ReachLastPage ? pager.CurrentPage : pager.CurrentPage + 20;

            StringBuilder sb = new StringBuilder();
            string link = @"<a href=""\question\index?page={0}&pagecount={1}"">{2}</a>";
            string span = @"<span class='{0}'>{1}</span>";


            for (int i = 1; i <= amountPage; i++)
            {
                if (pager.CurrentPage == i)
                {
                    sb.Append(string.Format(span, className, i.ToString()));
                }
                else
                {
                    sb.Append(string.Format(link, i.ToString(), pager.PageCount.ToString(), i.ToString()));
                }

                if (pager.CurrentPage - 4 > 1 && i==1)
                {
                    sb.Append("<span>...</span>");
                    i = pager.CurrentPage - 5;
                }

                if (pager.CurrentPage + 4 < amountPage && i == pager.CurrentPage + 4)
                {
                    sb.Append("<span>...</span>");
                    i = amountPage - 1;
                }
            }


                return sb.ToString();
        }

        public static string GetQuestionTypeOptions(this HtmlHelper Html)
        {
            string option = "<option>{0}</option>";
            var options = from type in DataService.GetQuestionTypes()
                          select string.Format(option, type.Trim());

            string result = string.Join(string.Empty, options.ToArray());

            return result;
        }

        public static string ToStr(this DateTime dt)
        {
            return dt.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
}
