<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Helpers.MetaData>" %>
<%@ Import Namespace="Antaeus.BL.Helpers" %>

<div class="item">
    <div class="title">添加模式<span>*</span></div>
    <div class="detail">
        <select class="inp inp2 judge" name="judgeshsh">
            <option value="0" selected="selected">新添一篇阅读文章和题目</option>
            <option value="other">为已有的阅读文章添加一个题目</option>
        </select>
    </div>
    <div class="clear"></div>                        
</div>
                                
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