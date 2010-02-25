<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<!--如果是QuestionPlace这个参数为问题在内容前面的话，那么将显示这个-->
<%if(Model["QuestionPlace"] == "1"){ %>
<div class="item">
	<label><span>*</span>题目问题</label>
    <textarea class="inp inp1 FormOnBlurCheck" name="Question"></textarea>
    <div class="wrong margin hidden"></div>
    <div class="blank5"></div>
    <div class="margin">
    	<input type="checkbox" value="2" name="QuestionPlace" /><span>&nbsp;错了，这题问题其实在内容的后面！</span>
    </div>
</div>
<%} %>
<!--显示结束-->
<div class="item">
    <label><span>*</span>题目内容</label>
    <textarea class="inp inp1 inp4 FormOnBlurCheck" name="Content"></textarea>
    <div class="wrong margin hidden"></div>
    <div class="clear"></div>
</div>
<!--如果是QuestionPlace这个参数为问题在内容后面的话，那么将显示这个-->
<%if(Model["QuestionPlace"] == "2"){ %>
<div class="item">
	<label><span>*</span>题目问题</label>
    <textarea class="inp inp1 FormOnBlurCheck" name="Question"></textarea>
    <div class="wrong margin hidden"></div>
    <div class="blank5"></div>
    <div class="margin">
    	<input type="checkbox" value="1" name="QuestionPlace" /><span>&nbsp;错了，这题问题其实在内容的前面！</span>
    </div>
</div>
<%} %>
<!--显示结束-->
<!--如果是ChoiceNumber这个参数为5个的话，那么将显示这个-->
<%if(Model["ChoiceNumber"] == "5"){ %>
<div class="item">
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
<%} %>