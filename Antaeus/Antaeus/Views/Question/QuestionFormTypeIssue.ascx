<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<div class="item">
    <div class="title">题目内容<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp1" name="Content" required="true"></textarea>
    </div>
    <div class="clear"></div>                        
</div>
<div class="item">
    <div class="title">题目问题<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp1" name="Question" required="true"></textarea>
    </div>
    <div class="clear"></div>                        
</div>