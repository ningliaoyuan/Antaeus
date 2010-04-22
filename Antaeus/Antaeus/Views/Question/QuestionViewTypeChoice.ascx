<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.BL.Model.Question>" %>

<div class="ques_content">
	<% if(Model.Meta["QuestionPlace"]=="0"){ %>          
         <p><%= Model.Meta["Content"]%></p>
    <%}
    else if (Model.Meta["QuestionPlace"] == "1")
    {%>
    	<b><%=Html.Encode(Model.Meta["Question"])%></b>
    	<p><%= Model.Meta["Content"]%></p>
    <%}else{%>
    	<p><%= Model.Meta["Content"]%></p>
    	<b><%=Html.Encode(Model.Meta["Question"])%></b>
    <%}%>
</div>
<div class="ques_options">
    <div class="option">
        <input type="radio" name="option" value="A" class="QuestionChoiceSelect" />
        <label><%=Html.Encode(Model.Meta["OptionA"])%></label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="B" class="QuestionChoiceSelect" />
        <label><%=Html.Encode(Model.Meta["OptionB"])%></label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="C" class="QuestionChoiceSelect" />
        <label><%=Html.Encode(Model.Meta["OptionC"])%></label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="D" class="QuestionChoiceSelect" />
        <label><%=Html.Encode(Model.Meta["OptionD"])%></label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="E" class="QuestionChoiceSelect" />
        <label><%=Html.Encode(Model.Meta["OptionE"])%></label>
    </div>
</div>
<div class="bar1">
    <div class="barinfo" id="QuestionChoiceWrongShow">
        你答错了。。。正确答案&nbsp;&nbsp;<span class="rbgc-red"><%=Html.Encode(Model.Meta["CorrectMark"])%></span>&nbsp;&nbsp;
    </div>
    <div class="barinfo" id="QuestionChoiceCorrectShow">恭喜你答对了！</div>
    <div class="report">
        <span>题目有误？</span>
        <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
    </div>
</div>