<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="hidden">
    <div id="PopupFavoriteEdit" class="popup" title="编辑收藏使用的标签">
        <div class="formstyle">
            <div class="item item-one">
                <div class="detail">
                    <input type="text" id="FavoriteTagsInput" class="inp inp1 separate" name="tag" value="" />
                    <div class="blank5"></div>
                    <div class="tips">请使用英文半角逗号,分隔标签，你也可以点击下面的推荐标签直接插入</div>
                    <div class="blank5 clear"></div>
                    <div class="separate-select">
                        <span>kaoGMAT推荐你使用：</span>
                        <a>考前必看</a>
                        <a>非人类题目</a>
                        <a>很难</a>
                        <a>考点的典型题目</a>
                        <a>死活就是搞不懂</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>       
    	</div>  
    </div>
</div>