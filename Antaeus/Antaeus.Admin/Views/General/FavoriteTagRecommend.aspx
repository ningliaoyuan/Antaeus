<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>全局设置&nbsp;&gt;&nbsp;设置收藏默认推荐标签</h1>
    <div class="main">
    	<h2>当前正在使用的标签</h2>
        <p>标签1,标签2,标签3</p>
        <h2>设置标签</h2>
    	<form class="formstyle">
        	<div class="item">
                <div class="title">输入标签<span>*</span></div>
                <div class="detail">
                    <textarea class="textarea inp1"></textarea>
                </div>
                <div class="clear"></div>                        
            </div>
            <div class="item noborder">
                <div class="title">&nbsp;</div>
                <div class="detail">
                    <input type="submit" class="btn-form-green" value="提交" />
                </div>
                <div class="clear"></div>  
            </div>      
        </form>
    
    </div>
</asp:Content>
