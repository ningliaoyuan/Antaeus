<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Antaeus.BL.Model.Question>" %>

<%@ Register src="../PopUps/QuestionReportPopup.ascx" tagname="QuestionReportPopup" tagprefix="uc1" %>
<%@ Register src="../PopUps/AddFavoritePopup.ascx" tagname="AddFavoritePopup" tagprefix="uc2" %>

<%@ Import Namespace="Antaeus.Helpers" %>
<%@ Import Namespace="Antaeus.BL.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
	<script type="text/javascript" src="/Plugins/CKEditor-3.0.1/ckeditor.js"></script>
	<script type="text/javascript">
	    g_param.qid = <%= Html.Encode(Model.QuestionID)%>; //题目的ID
		g_param.qCorrect = "<%=Html.Encode(Model.Meta["CorrectMark"])%>";  //题目的正确选项
		g_param.currentTime = new Date(); //记录页面载入当前的时间
		g_param.favorite = <%= MembershipHelper.GetNormalUser().HasFavorite("question", Model.QuestionID).ToString().ToLower()%>;
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" runat="server">

<div class="blank10"></div>
    
<div class="columnleft">    
    
</div>    

<div class="clear"></div>

<uc1:QuestionReportPopup ID="QuestionReportPopup" runat="server" />
<uc2:AddFavoritePopup ID="AddFavoritePopup" runat="server" />


</form>
</asp:Content>

