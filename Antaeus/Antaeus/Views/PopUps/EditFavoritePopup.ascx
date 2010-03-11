<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="hidden">
    <div id="PopupFavoriteEdit" class="popup" title="编辑收藏使用的标签">
    	<p>请更改你对这道题的收藏标签：</p>
        <span>标签之间请用英文逗号隔开</span>
        <div><input type="text" /></div>
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