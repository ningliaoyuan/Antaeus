<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<div class="item">
    <label><span>*</span>题目内容</label>
    <textarea class="inp inp1 inp4 FormOnBlurCheck" name="Content"></textarea>
    <div class="wrong margin hidden"></div>
    <div class="clear"></div>
</div>
<div class="item">
	<label><span>*</span>题目问题</label>
    <textarea class="inp inp1 FormOnBlurCheck" name="Question"></textarea>
    <div class="wrong margin hidden"></div>
</div>