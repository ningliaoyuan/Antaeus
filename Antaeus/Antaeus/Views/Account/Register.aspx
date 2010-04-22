<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="account column1">
        <div class="blank10">
        </div>
        <div class="box1">
            <div class="subheader2">
                <h1>
                    马上注册进步吧</h1>
                <h3>
                    只需要5秒钟就能享受进步吧为会员提供的所有服务</h3>
                <span>
                    <%= Html.ViewData.ModelState.IsValid?string.Empty:"出错啦出错啦，看看下面哪里输错了！！！" %></span>
            </div>
            <%using (Html.BeginForm("Register", "Account", FormMethod.Post, new { id = "FormRegister" }))
              {%>
            <div class="form">
                <div class="item">
                    <label>
                        用户昵称</label>
                    <%= Html.TextBox("username") %>
                    <span>中文字符、英文字母、数字和下划线</span> 
                    <span class="alert"><%= Html.ValidationMessage("username") %></span>
                </div>
                <div class="item">
                    <label>
                        登录邮箱</label>
                    <%= Html.TextBox("email") %>
                    <% if (MvcHtmlString.IsNullOrEmpty(Html.ValidationMessage("email")))
                       {%>
                    <span>这是你登陆、找回密码的唯一凭证</span>
                    <%}
                       else
                       { %>
                    <span class="alert">
                        <%=  Html.ValidationMessage("email")%></span>
                    <%}%>
                </div>
                <div class="item">
                    <label>
                        登陆密码</label>
                    <%= Html.Password("password") %>
                    <span>至少输入<%=Html.Encode(ViewData["PasswordLength"])%>个字符</span> <span class="alert">
                        <%= Html.ValidationMessage("password") %></span>
                </div>
                <div class="item">
                    <label>
                        确认密码</label>
                    <%= Html.Password("confirmPassword") %>
                    <span>请再次输入密码</span> <span class="alert">
                        <%= Html.ValidationMessage("confirmPassword") %></span>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="submit">
                <a class="btn-big-2" id="FormRegisterSubmit">
                    <p>
                        <b>马上注册</b><br />
                        <span>享受最全面的服务</span></p>
                </a>
                <div class="terms">
                    <input type="checkbox" checked="checked" />
                    <span>我已经阅读并同意<a href="#">“进步吧网站服务条款”</a></span>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <% } %>
            <div class="clear">
            </div>
        </div>
        <div class="blank10">
        </div>
    </div>
</asp:Content>
