<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Antaeus.ORM.Category>" %>
<%@ Register src="Sidebar.ascx" tagname="Sidebar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="left">
<uc1:Sidebar ID="Sidebar1" runat="server" />
</div>
<div class="right">
    <h1>分类>添加一个新的全局分类</h1>
    <div class="formstyle">
		<%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
        <% using (Html.BeginForm()) {%>
		<div class="item">
            <label for="Name">分类名称：</label>
            <input name="Name" id="Name" type="text" class="inp inp1" value="" />
            <div class="correct"><%= Html.ValidationMessage("Name", "*") %></div>
        </div>
        <div class="item">
            <label for="ShortName">分类缩写：</label>
            <input name="ShortName" id="ShortName" type="text" class="inp inp1" value="" />
            <div class="correct"><%= Html.ValidationMessage("ShortName", "*") %></div>
        </div>
        <div class="item">
            <label>题目类型：</label>
            <select class="inp inp2" id="QuestionType" name="QuestionType">
                <%foreach (var questionType in CommonDataHelper.AllQuestionType()) { %>
                <option value="<%=questionType%>"><%=questionType%></option>
                <% } %>
            </select>
            <div class="correct"><%= Html.ValidationMessage("QuestionType", "*") %></div>
        </div>
        <div class="item">
            <label for="QuestionNumber">阅读题数目：</label>
            <input name="meta.QuestionNumber" id="QuestionNumber" type="text" class="inp inp3" value="" />
            <div class="inp-between">请填写数字，空着代表不适用，0代表不限</div>
            <div class="correct"><%= Html.ValidationMessage("QuestionNumber", "*") %></div>
        </div>
        <div class="item">
            <label for="ChoiceNumber">选项数：</label>
            <input name="meta.ChoiceNumber" id="ChoiceNumber" type="text" class="inp inp3" value="" />
            <div class="inp-between">请填写数字，空着代表不适用</div>
            <div class="correct"><%= Html.ValidationMessage("ChoiceNumber", "*") %></div>
        </div>
        <div class="item">
            <label for="IsMultiple">单选/多选：</label>
            <select class="inp inp2" id="IsMultiple" name="meta.IsMultiple">
            	<option value="" selected="selected">不适用</option>
            	<option value="0">单选</option>
                <option value="1">多选</option>
            </select>
            <div class="correct"><%= Html.ValidationMessage("IsMultiple", "*") %></div>
        </div>
        <div class="item">
            <label for="QuestionPlace">问题位置：</label>
            <select class="inp inp2" id="QuestionPlace" name="meta.QuestionPlace">
            	<option value="" selected="selected">不适用</option>
                <option value="0">没有问题</option>
                <option value="1">在内容前面</option>
                <option value="2">在内容后面</option>
            </select>
            <div class="correct"><%= Html.ValidationMessage("CategoryID", "*") %></div>
        </div>
		<div class="item noborder">
            <label>&nbsp;</label>
            <input type="submit" class="btn-form-green" value="提交" />
        </div>    
    	<% } %>
		<div class="clear"></div>
	</div>
</div>
</asp:Content>
