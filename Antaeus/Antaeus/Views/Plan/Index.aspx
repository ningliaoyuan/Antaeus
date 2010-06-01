<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="CreatePlan.ascx" tagname="CreatePlan" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Plan</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript" src="/Plugins/Antaeus.UI-0.1/Calendar.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
<div class="blank10"></div>
  
    <div class="column-left">        
    	
        <uc1:CreatePlan ID="CreatePlan1" runat="server" />

    	
    </div>
    <div class="column-right">
    
    </div>
    <div class="clear"></div>
	<div class="blank10"></div>


</form>
</asp:Content>
