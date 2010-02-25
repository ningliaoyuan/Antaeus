<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailsTemp
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>临时的Question/Detail页面</h2>

<table border="1">
	<tr>
    	<td>题目编号：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目创建者：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目创建时间：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目浏览量：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目来源：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目评分：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目标签：</td>
        <td></td>
    </tr>
    <tr>
    	<td>题目所属分类：</td>
        <td></td>
    </tr>
</table>

<p>题目内容：</p>
<p>题目问题：</p>
<p>题目选项1：</p>
<p>题目选项2：</p>
<p>题目选项3：</p>
<p>题目选项4：</p>
<p>题目选项5：</p>
<p>题目答案：</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="link" runat="server">
</asp:Content>
