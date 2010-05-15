<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="CreatePlan.ascx" tagname="CreatePlan" tagprefix="uc1" %>
<%@ Register src="EnduringPlan.ascx" tagname="EnduringPlan" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Plan</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript" src="/Plugins/JsCharts/jscharts.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">

<div class="blank10"></div>

<div class="column2">    
    <div class="columnleft">
    	
        
    	
        <uc1:CreatePlan ID="CreatePlan1" runat="server" />
        <div class="blank10"></div>
        <uc2:EnduringPlan ID="EnduringPlan1" runat="server" />
    	
    </div>
	<div class="blank10"></div>
</div>

</form>
</asp:Content>
