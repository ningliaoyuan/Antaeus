<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>站点设置&nbsp;&gt;&nbsp;基本设置</h1>
<div class="main">
    <form class="formstyle">    
        <div class="item">
            <div class="title">站点域名<span>*</span></div>
            <div class="detail">
                <input type="text" class="inp inp1" value="kaogmat.com" />
                <div class="blank5"></div>
                <div class="tips">这里是输入提示的信息</div>
            </div>
            <div class="clear"></div>                        
        </div>    
    </form>
</div>
</asp:Content>
