﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="PopupFavoriteEdit" title="编辑收藏使用的标签">
    <div class="formstyle">
        <div class="item item-one">
            <div class="detail">
                <input type="text" id="FavoriteTagsEditInput" class="inp inp1 separate" name="tag" value="" tip="请输入英文逗号(,)以分隔标签" />
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
