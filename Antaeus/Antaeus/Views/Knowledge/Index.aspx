<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="../PopUps/QuestionReportPopup.ascx" tagname="QuestionReportPopup" tagprefix="uc1" %>
<%@ Register src="../Components/FilterComponent.ascx" tagname="FilterComponent" tagprefix="uc2" %>
<%@ Import Namespace="Antaeus.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="ques_know column2">
    
    <div class="blank10"></div>
    
    <div class="box1 subheader">
        <div class="logo_knowledge"></div>
        <div class="left">
            <h1>GMAT知识点中心</h1>
            <span>当前共有293个知识点讲解，2938人参与编辑知识点讲解，29345条相关讨论</span>
            <ul>
                <li><a href="/Knowledge/List/">语法大全</a></li>
                <li><a href="/Knowledge/List/">逻辑分析</a></li>
                <li><a href="/Knowledge/List/">数学全集</a></li>
                <li><a href="/Knowledge/List/">作文精要</a></li>
            </ul>
        </div>
        <div class="create right">
            <span>不知道应该如何选择知识点？</span>
            <a class="btn-big-1" href="/Knowledge/List/"><p><b>点击这里</b><br /><span>查看推荐的学习顺序</span></p></a>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="blank10"></div>
    
    <div class="columnleft">
        <div class="box2 listresult">
            <div class="bar1 listtop">
                <div class="left">
                    共找到&nbsp;<span>29384</span>&nbsp;个知识点，每页显示&nbsp;
                    <select>
                        <option>10</option>
                        <option>20</option>
                        <option>30</option>
                        <option>40</option>
                    </select>
                    &nbsp;个知识点
                </div>
                <div class="report">
                    <span>找不到题目？</span>
                    <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
                </div>
            </div>
            
            <div class="context">
                
               <div class="item2" onclick="window.location='/Question/Details/1';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                	<div class="left">
                    	<div class="cat cat2"><b>知识点</b><span>七日内刚刚更新了内容</span><div class="clear"></div></div>
                        <div class="number">
                        	<div class="n1"><b class="blue">15616</b><span>知识点收藏</span></div>
                            <div class="n2"><b class="green">3.5</b><span>知识点价值</span></div>
                            <div class="n3"><b class="orange">466</b><span>相关题目</span></div>                            
                        </div>
                    </div>
                    <div class="right">
                    	<div class="title green">如何比较MoreThan结构中的主客体两方</div>
                        <div class="parameter">lanslot创建，16159 浏览，469 讨论，更新于 2010-3-10 19:34</div>
                        <div class="tags">
                        	<span>tag1</span>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            
            </div>
            
            <div class="bar1">
                <div class="barpage">
                    <%//Html.ShowPageIndex( 10,"current")%>
                </div>
                <div class="report">
                    <span>找不到题目？</span>
                    <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
                </div>
            </div>
            
        </div>
        <div class="blank10"></div>
    </div>    
    
    <div class="columnright w-filter" id="WidgetFilter">
        <uc2:FilterComponent ID="FilterComponent1" runat="server" />
        <div class="blank10"></div>
    </div>

    <div class="clear"></div>
    
</div>
<uc1:QuestionReportPopup ID="QuestionReportPopup1" runat="server" />
</asp:Content>
