<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理界面登录</title>
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
</head>
<body class="homelogin">

<div class="top">Antaeus Admin Page</div>
<div class="content">
    <div class="left">
    	<div class="title">用户登录：</div>
        <% using (Html.BeginForm()) { %>
            <span>邮箱账号：</span>
            <%= Html.TextBox("username") %>
            <%= Html.ValidationMessage("username") %>
            <span>密码：</span>
            <%= Html.Password("password") %>
            <%= Html.ValidationMessage("password") %>
            <span><%= Html.CheckBox("rememberMe") %>记住我的登录信息</span>
            <span><%= Html.ValidationSummary("Login was unsuccessful. Please correct the errors and try again.") %></span>
            <input type="submit" value="进入网站" class="submit-green" />
            <span><a href="/Account/ForgetPassword/">额。。。我忘记密码了。。。</a></span>
        <% } %>
    </div>
</div>
</body>
</html>
