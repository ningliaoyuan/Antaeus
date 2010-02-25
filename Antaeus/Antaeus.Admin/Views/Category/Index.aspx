<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Antaeus.ORM.Category>>" %>
<%@ Register src="Sidebar.ascx" tagname="Sidebar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="left">
<uc1:Sidebar ID="Sidebar1" runat="server" />
</div>

<div class="right">
    <h1>分类>全局模块管理一览</h1>

    <table class="tablestyle">
        <thead>
            <tr>
                <td class="spec">操作</td>
                <td>编号</td>
                <td>名称</td>
                <td>略缩名</td>
                <td>类型</td>
                <td>参数设置</td>
            </tr>
		</thead>
		<tbody>  
			<% foreach (var item in Model) { %>
            <tr>
                <td class="spec">
                    <%= Html.ActionLink("Delete", "Delete", new { id=item.CategoryID }) %> |
                    <%= Html.ActionLink("Details", "Details", new { id=item.CategoryID })%>
                </td>
                <td><%= Html.Encode(item.CategoryID) %></td>
                <td><%= Html.Encode(item.Name) %></td>
                <td><%= Html.Encode(item.ShortName) %></td>
                <td><%= Html.Encode(item.QuestionType) %></td>
                <td><%= Html.Encode(item.QuestionTypeMeta) %></td>
            </tr>        
            <% } %>
		</tbody>
    </table>

</div>
</asp:Content>