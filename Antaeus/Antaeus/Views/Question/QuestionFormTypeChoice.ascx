<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<!--如果是QuestionPlace这个参数为问题在内容前面的话，那么将显示这个-->
<%if(Model["QuestionPlace"] == "1"){ %>
<div class="item">
    <div class="title">题目问题<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp1" name="Question" required="true"></textarea>
        <input type="checkbox" value="2" name="QuestionPlace" /><span>&nbsp;错了，这题问题其实在内容的后面！</span>
    </div>
    <div class="clear"></div>                        
</div>
<%} %>
<!--显示结束-->
<div class="item">
    <div class="title">题目内容<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp1" name="Content" required="true"></textarea>
    </div>
    <div class="clear"></div>                        
</div>
<!--如果是QuestionPlace这个参数为问题在内容后面的话，那么将显示这个-->
<%if(Model["QuestionPlace"] == "2"){ %>
<div class="item">
    <div class="title">题目问题<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp1" name="Question" required="true"></textarea>
        <input type="checkbox" value="1" name="QuestionPlace" /><span>&nbsp;错了，这题问题其实在内容的后面！</span>
    </div>
    <div class="clear"></div>                        
</div>
<%} %>
<!--显示结束-->
<!--如果是ChoiceNumber这个参数为5个的话，那么将显示这个-->
<%if(Model["ChoiceNumber"] == "5"){ %>
<div class="item">
    <div class="title">选项A<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp4" name="OptionA" required="true"></textarea>
        <div class="check check4"><div><input type="radio" name="CorrectMark" value="A" checked="checked" /><span>正确</span></div></div>
    </div>
    <div class="clear"></div>                        
</div>
<div class="item">
    <div class="title">选项B<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp4" name="OptionB" required="true"></textarea>
        <div class="check check4"><div><input type="radio" name="CorrectMark" value="B" /><span>正确</span></div></div>
    </div>
    <div class="clear"></div>                        
</div>
<div class="item">
    <div class="title">选项C<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp4" name="OptionC" required="true"></textarea>
        <div class="check check4"><div><input type="radio" name="CorrectMark" value="C" /><span>正确</span></div></div>
    </div>
    <div class="clear"></div>                        
</div>
<div class="item">
    <div class="title">选项D<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp4" name="OptionD" required="true"></textarea>
        <div class="check check4"><div><input type="radio" name="CorrectMark" value="D" /><span>正确</span></div></div>
    </div>
    <div class="clear"></div>                        
</div>
<div class="item">
    <div class="title">选项E<span>*</span></div>
    <div class="detail">
        <textarea class="textarea inp4" name="OptionE" required="true"></textarea>
        <div class="check check4"><div><input type="radio" name="CorrectMark" value="E" /><span>正确</span></div></div>
    </div>
    <div class="clear"></div>                        
</div>					
<%} %>