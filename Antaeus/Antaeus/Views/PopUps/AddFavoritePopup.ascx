<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="hidden">
    <div id="PopupFavoriteAdd" class="popup" title="增添到收藏夹">
    	<p>请输入你对这道题的收藏标签：</p>
        <span>标签之间请用英文逗号隔开</span>
        <div><%= Html.TextBox("FavoriteTagsInput", "")%></div>
        <p>kaoGMAT的用户一般会使用以下的标签：</p>
        <div class="tags">
        	<a href="#">Tag1</a>，
            <a href="#">Tag1</a>，
            <a href="#">Tag1</a>，
            <a href="#">Tag1</a>，
            <a href="#">Tag1</a>
        </div>
    </div>
</div>