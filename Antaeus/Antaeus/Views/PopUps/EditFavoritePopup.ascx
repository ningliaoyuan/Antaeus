<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="PopupFavoriteEdit" class="popup-favorite" title="编辑收藏使用的标签">
	<p class="info">你可以在下面的输入框中输入你要修改的标签，同时也可以点击常用标签直接插入</p>    
    <input type="text" id="FavoriteTagsEditInput" class="inp inp1 separate" name="tag" value="" tip="请输入英文逗号(,)以分隔标签" />
    <div class="blank5 clear"></div>
    <p class="info">常用标签：</p>
    <div class="separate-select">
        <a>考前必看</a>
        <a>非人类题目</a>
        <a>很难</a>
        <a>考点的典型题目</a>
        <a>死活就是搞不懂</a>
    </div>
</div>
