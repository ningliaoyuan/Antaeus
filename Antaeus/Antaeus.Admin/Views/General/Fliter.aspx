<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>站点设置&nbsp;&gt;&nbsp;过滤设置</h1>
<div class="main">
    <form class="formstyle">    
        <div class="item">
            <div class="title">不允许注册的邮箱</div>
            <div class="detail">
                <textarea class="textarea inp1"></textarea>
                <div class="blank5"></div>
                <div class="tips">上述邮箱将被禁止注册，请以英文逗号,隔开</div>
            </div>
            <div class="clear"></div>                        
        </div>
        <div class="item">
            <div class="title">不允许注册的昵称</div>
            <div class="detail">
                <textarea class="textarea inp1"></textarea>
                <div class="blank5"></div>
                <div class="tips">上述昵称将被禁止注册，请以英文逗号,隔开</div>
            </div>
            <div class="clear"></div>                        
        </div>
        <div class="item">
            <div class="title">违禁关键字</div>
            <div class="detail">
                <textarea class="textarea inp1"></textarea>
                <div class="blank5"></div>
                <div class="tips">上述关键字发表时将被屏蔽，请以英文逗号,隔开</div>
            </div>
            <div class="clear"></div>                        
        </div>
        <div class="item">
            <div class="title">屏蔽的IP地址</div>
            <div class="detail">
                <textarea class="textarea inp1"></textarea>
                <div class="blank5"></div>
                <div class="tips">上述IP地址将不能访问网站，请以英文逗号,隔开</div>
            </div>
            <div class="clear"></div>                        
        </div>    
    </form>
</div>
</asp:Content>