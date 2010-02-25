<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ForgetPassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="account column1">
    
    <div class="blank10"></div>
    <div class="box1">
        <div class="subheader2">
        	<h1>请在下面输入你的邮箱地址找回密码</h1>
            <h3>您将在三分钟内收到Jinbu8.com发出的一份验证邮件，请按照邮件提示来重置密码</h3>
        </div>
        <div class="form">
        	<div class="item2">
        		<label>登录邮箱地址</label>
                <input type="text" />
                <span>请输入你登陆的邮箱地址</span>
                <span class="alert"></span>
            </div>
            <div class="clear"></div>
        </div>
        <div class="submit">
        	<a href="#" class="subbutton"><img src="../../Contents/Buttons/btn-big-1.gif" width="34" height="49" />&nbsp;&nbsp;发送邮件！</a>
        </div>
        <div class="blank10"></div>
    </div>
    <div class="blank10"></div>
    <div class="box1">
        <div class="subheader2">
        	<h1>请在下面输入您的新密码</h1>
            <h3>这次要记住，不要再忘记密码了</h3>
        </div>
        <div class="form">
            <div class="item">&nbsp;</div>
        	<div class="item">
        		<label>登陆密码</label>
                <%= Html.Password("password") %>
                <span>至少输入6个字符</span>
                <span class="alert">密码输入错误了~~必须要什么什么的东西</span>
            </div>
            <div class="item">
        		<label>确认密码</label>
                <%= Html.Password("confirmPassword") %>
                <span>请再次输入密码</span>
                <span class="alert"></span>
            </div>
            <div class="clear"></div>
        </div>
        <div class="submit">
        	<a href="#" class="subbutton"><img src="../../Contents/Buttons/btn-big-1.gif" width="34" height="49" />&nbsp;&nbsp;确认更改！</a>
        </div>
        <div class="blank10"></div>
    </div>
    <div class="blank10"></div>
</div>

</asp:Content>
