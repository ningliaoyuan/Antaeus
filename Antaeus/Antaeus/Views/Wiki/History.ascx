<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.ORM.Wiki>" %>
    <div class="popup" title="查看历史版本">
		<table class="tablestyle" cellspacing="0" summary="Sentence Correct - 24234 的解答历史记录">
            <caption>Sentence Correct - 24234 的解答历史记录</caption>
            <tr>
                <th scope="col" class="nobg">版本号</th>
                <th scope="col">贡献者</th>
                <th scope="col">编辑时间</th>
                <th scope="col">操作</th>
            </tr>
            <%bool odd = true; %>
    <%IEnumerable<Antaeus.ORM.WikiContent> list = Model.WikiContents;
        var num = Model.WikiContents.Count;
        if(num > 10)
        {
            // 如果wiki的历史版本大于10个，取第一个和最近九个
            var l = new List<Antaeus.ORM.WikiContent>(10);
            l.Add(list.First());
            l.AddRange(list.Skip(num - 9));
            list = l;
        }
                 
        foreach (var wc in list)
       { %>
            
            <tr>
                <th scope="row" class="<%=odd ? "spec" : "specalt"%>"><%=Html.Encode(wc.Reversion)%></th>
                <td><%=Html.Encode(wc.CrUserName)%></td>
                <td><%=Html.Encode(wc.CreatedTime)%></td>
                <td><a class="WikiHistoryView" title="<%=wc.Reversion%>" href="##/wiki/details/<%=Model.KID%>?ver=<%=wc.Reversion%>" rel="popdown">查看此版本</a></td>
            </tr>
     <%odd = !odd;
       } %>
             
        </table>       
    </div>
