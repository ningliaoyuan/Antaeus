<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="PopupLoginForm" class="popup-login" title="用户登陆">
    <p id="LoginErrorMessage" class="alert"></p>
    <%using (Html.BeginForm("LogOn", "Account", FormMethod.Post, new { id = "FormLoginPopup", @class="formpopup" }))  {%>
		<div class="item">
        	<label>昵称或邮箱：</label>
			<%= Html.TextBox("Username", "" ,new { @class="inp" })%>
            <a href="<%=Url.Action("Register","Account")%>" target="_blank">没有账号？马上注册</a>
        </div>
        <div class="item">
        	<label>登录密码：</label>
			<%= Html.Password("Password", "" ,new { @class="inp" })%>
            <a href="/Account/ForgetPassword/" target="_blank">忘记密码了？</a>
        </div>
        <div class="item">
        	<label>&nbsp;</label>
			<%= Html.CheckBox("RememberMe") %><span>下次自动登录</span>
        </div>
    <%}%>
</div>