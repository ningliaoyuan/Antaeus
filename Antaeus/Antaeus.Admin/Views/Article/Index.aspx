<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="Sidebar.ascx" tagname="Sidebar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
<div class="left">
<uc1:Sidebar ID="Sidebar1" runat="server" />
</div>
<div class="right"></div>
    </form>
</asp:Content>
