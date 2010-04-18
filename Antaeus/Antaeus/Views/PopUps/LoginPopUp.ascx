<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="PopupLoginForm" title="用户登陆">
    <b id="LoginErrorMessage"></b>
    <%using (Html.BeginForm("LogOn", "Account", FormMethod.Post, new { id = "FormLoginPopup" }))  {%>
    <div class="loginform">
        <div class="email"><%= Html.TextBox("Username", "")%></div>
        <div class="password"><%= Html.Password("Password", "")%></div>
        <div class="auto"><span><%= Html.CheckBox("RememberMe") %>下次自动登录</span></div>
        <div class="forgot"><a href="/Account/ForgetPassword/">救救我！忘记密码了</a></div>
        <div class="register"><a href="<%=Url.Action("Register","Account")%>">注册新用户</a></div>
    </div>
    <%}%>
</div>