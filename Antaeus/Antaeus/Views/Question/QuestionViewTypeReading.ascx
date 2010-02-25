<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="ques_content">             
    <%= Html.Encode(Model.Meta["Content"])%>
    <b><%=Html.Encode(Model.Meta["Question"])%></b>
</div>
<div class="ques_options">
    <div class="option">
        <input type="radio" name="option" value="A" class="QuestionChoiceSelect" />
        <label>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues</label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="B" class="QuestionChoiceSelect" />
        <label>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues</label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="C" class="QuestionChoiceSelect" />
        <label>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues</label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="D" class="QuestionChoiceSelect" />
        <label>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues</label>
    </div>
    <div class="option">
        <input type="radio" name="option" value="E" class="QuestionChoiceSelect" />
        <label>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues</label>
    </div>
</div>
<div class="bar1">
    <div class="barinfo" id="QuestionChoiceWrongShow">
        你答错了。。。正确答案&nbsp;&nbsp;<span class="rbgc-red" id="QuestionChoiceCorrected"><%=Html.Encode(Model.Meta["CorrectMark"])%></span>&nbsp;&nbsp;
    </div>
    <div class="barinfo" id="QuestionChoiceCorrectShow">恭喜你答对了！</div>
    <div class="report">
        <span>题目有误？</span>
        <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
    </div>
</div>