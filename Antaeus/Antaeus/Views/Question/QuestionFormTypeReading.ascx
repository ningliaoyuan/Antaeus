<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<div class="item">
    <label>添加模式</label>
    <select class="inp inp1">
        <option value="0" selected="selected">新添一篇阅读文章和题目</option>
        <option value="1">为已有的阅读文章添加一个题目</option>
    </select>
</div>
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
<div class="item" id="QuesCreate_Options">
    <label><span>*</span>题目的五个选项</label>                            
    <textarea class="inp inp1 FormOnBlurCheck" name="OptionA"></textarea><div class="inp-between">选项A</div>
    <div class="wrong margin hidden"></div>
    <div class="blank5"></div>
    <div class="margin">
        <input type="radio" name="CorrectMark" value="A" checked="checked" /><span>&nbsp;这是正确选项</span>
    </div>
    <div class="blank5"></div>
    <div class="margin">                                                        
        <textarea class="inp inp1 FormOnBlurCheck" name="OptionB"></textarea><div class="inp-between">选项B</div>
        <div class="wrong hidden"></div>
        <div class="blank5"></div>
        <input type="radio" name="CorrectMark" value="B" /><span>&nbsp;这是正确选项</span>
    </div>
    <div class="blank5"></div>
    <div class="margin">                                  
        <textarea class="inp inp1 FormOnBlurCheck" name="OptionC"></textarea><div class="inp-between">选项C</div>
        <div class="wrong hidden"></div>
        <div class="blank5"></div>
        <input type="radio" name="CorrectMark" value="C" /><span>&nbsp;这是正确选项</span>
    </div>
    <div class="blank5"></div>
    <div class="margin">                                  
        <textarea class="inp inp1 FormOnBlurCheck" name="OptionD"></textarea><div class="inp-between">选项D</div>
        <div class="wrong hidden"></div>
        <div class="blank5"></div>
        <input type="radio" name="CorrectMark" value="D" /><span>&nbsp;这是正确选项</span>
    </div>
    <div class="blank5"></div>
    <div class="margin">                                  
        <textarea class="inp inp1 FormOnBlurCheck" name="OptionE"></textarea><div class="inp-between">选项E</div>
        <div class="wrong hidden"></div>
        <div class="blank5"></div>
        <input type="radio" name="CorrectMark" value="E" /><span>&nbsp;这是正确选项</span>
    </div>
</div>