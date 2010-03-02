<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="SideControl.ascx" tagname="SideControl" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>
<%@ Register src="../PopUps/EditFavoritePopup.ascx" tagname="EditFavoritePopup" tagprefix="uc3" %>
<%@ Import Namespace="Antaeus.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Favorite
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="account column2">    
    <div class="blank10"></div> 
    <div class="columnleft">
    	<div class="box2 favorite">
			<div class="context"> 	
        		<uc2:HeaderControl ID="HeaderControl1" runat="server" />
            	<div class="blank15"></div>
                <h2>我收藏的题目</h2>
                <div class="tag-clone">
                	<a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <a href="#">标签名字(3)</a>
                    <div class="clear"></div>
                </div>
                <div class="listresult">
                	<div class="item2" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                        <div class="left">
                            <div class="note blue"><input type="checkbox" value="" /><span>选中</span>&nbsp;&nbsp; <a href="#popup_add_favorite" rel="dialog">编辑标签</a></div>
                            <div class="number">
                                <div class="n1"><b class="blue">13244</b><span>题目编号</span></div>
                                <div class="n2"><b class="green">3.5</b><span>题目价值</span></div>
                                <div class="n3"><b class="orange">55%</b><span>正确率</span></div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="summy"><a href="#"><b class="blue">Sentences Corrected:</b> test test test test test test test test test test test test test test test test test test test test test test test</a></div>
                            <div class="parameter">来自GWD，46465浏览，45讨论，更新于2010-2-28 14:00</div>
                            <div class="tags"><span>More Than</span><span>More Than</span><span>More Than</span><span>More Than</span><span>More Than</span><span>More Than</span></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_action">
						<div class="pageindex"><span>翻页：</span></div>
                    	<input type="button" class="btn-form-green" value="将选中收藏删除" />
                        <label>全选</label>
                        <input type="checkbox" />
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="columnright">
        <uc1:SideControl ID="SideControl1" runat="server" />
        <div class="blank10"></div>
    </div>
    
</div>       
<uc3:EditFavoritePopup ID="EditFavoritePopup" runat="server" />
</asp:Content>
