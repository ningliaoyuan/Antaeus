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
                
                <div class="item" onclick="window.location='/Knowledge/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="knowledgeleft">
                        <div class="questionidtext">知识点类别：</div>
                        <div class="questionid">阅读RC</div>
                        <div class="stars"><%= Html.GetStars(3.5,"gery")%></div>
                    </div>
                    <div class="right">
                        <h2>知识点的超级长可能的一种标题的方式啊</h2>
                        <div class="parameter">
                            <span>Lanslot</span>&nbsp;更新于&nbsp;
                            <span>2008/11/23</span>&nbsp;&nbsp;|&nbsp;&nbsp;创建于&nbsp;
                            <span>2009/6/23</span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span>6487</span>&nbsp;次浏览&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span>12</span>&nbsp;个评论
                        </div>
                        <div class="text">Windows Azure Storage allows application developers to store their data in the cloud, so the application can access its data from anywhere at any time, store any amount of data an for any length of time, and be confident that the data is durable and will not be lost.</div>
                        <div class="tag"><span>标签：</span>More Than, 超级难题, 其他标签, As ... As</div>
                    </div>
                    <div class="clear"></div>
                </div>
                
                <div class="item" onclick="window.location='/Knowledge/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="knowledgeleft">
                        <div class="questionidtext">知识点类别：</div>
                        <div class="questionid">阅读RC</div>
                        <div class="stars"><%= Html.GetStars(3.5,"gery")%></div>
                    </div>
                    <div class="right">
                        <h2>知识点的超级长可能的一种标题的方式啊</h2>
                        <div class="parameter">
                            <span>Lanslot</span>&nbsp;更新于&nbsp;
                            <span>2008/11/23</span>&nbsp;&nbsp;|&nbsp;&nbsp;创建于&nbsp;
                            <span>2009/6/23</span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span>6487</span>&nbsp;次浏览&nbsp;&nbsp;|&nbsp;&nbsp;
                            <span>12</span>&nbsp;个评论
                        </div>
                        <div class="text">Windows Azure Storage allows application developers to store their data in the cloud, so the application can access its data from anywhere at any time, store any amount of data an for any length of time, and be confident that the data is durable and will not be lost.</div>
                        <div class="tag"><span>标签：</span>More Than, 超级难题, 其他标签, As ... As</div>
                    </div>
                    <div class="clear"></div>
                </div>
            
            </div>
            
            <div class="bar1">
                <div class="barpage">
                    <%=Html.ShowPageIndex(11,40,"#","current")%>
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
