<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="ques_content">
	<% if(Model.Meta["QuestionPlace"]=="0"){ %>          
         <%= Html.Encode(Model.Meta["Content"])%>
    <%}
    else if (Model.Meta["QuestionPlace"] == "1")
    {%>
    	<b><%=Html.Encode(Model.Meta["Question"])%></b>
    	<%= Html.Encode(Model.Meta["Content"])%>
    <%}else{%>
    	<%= Html.Encode(Model.Meta["Content"])%>
    	<b><%=Html.Encode(Model.Meta["Question"])%></b>
    <%}%>
</div>
<div class="bar1">
    <div class="report">
        <span>题目有误？</span>
        <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
    </div>
</div>