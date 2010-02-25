<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.ORM.WikiContent>" %>
<div class="bar2">
    <div class="left">
        <h2>
           题目 题目解答过程</h2>
        <div class="information">
            当前版本&nbsp;<span class="green" id="WikiVersion"><%=Html.Encode(Model.Reversion)%></span>
            &nbsp;由&nbsp;<span class="blue" id="WikiAuthor"><%= Html.Encode(Model.CrUserName)%></span>
            &nbsp;更新于&nbsp;<span class="orange" id="WikiTime"><%= Html.Encode(String.Format("{0:g}",  Model.CreatedTime))%></span>
        </div>
        <div class="information">
            感谢&nbsp;
            <%for (int i = 0; i < Model.Wiki.Contributors.Count; i++)
              {%>
            <span class="blue">
                <%=Html.Encode(Model.Wiki.Contributors[i])%></span>
            <%if (i < Model.Wiki.Contributors.Count)
              { %>
            &nbsp;,&nbsp;
            <% }
                   } %>
            &nbsp;对此题目的解答所做出的贡献</div>
    </div>
    <div class="right">
        <a class="btn-small btn-edit" id="ButtonWikiEdit">编辑此题的解答过程</a>
        <div class="clear">
        </div>
        <div class="blank10">
        </div>
        <a class="btn-small btn-history" href="#popup_wiki_history" rel="dialog">查看历史版本</a>
    </div>
    <div class="clear">
    </div>
</div>
<div class="wiki" id="WikiContent">
    <div id="WikiContentEditArea">
        <p>
            <%= Model.Wiki.WikiContent.Content%></p>
    </div>
    <div class="wiki-submit hidden">
        <a class="btn-form-green" href="#" id="WikiEditSubmit">提交</a> <a class="btn-form-gray"
            href="#" id="WikiEditDestroy">取消</a>
    </div>
    <div class="clear blank15">
    </div>
</div>
