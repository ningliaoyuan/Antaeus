<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Antaeus.BL.Model.Question>>" %>
<%@ Register src="../PopUps/QuestionReportPopup.ascx" tagname="QuestionReportPopup" tagprefix="uc1" %>
<%@ Register src="../Components/FilterComponent.ascx" tagname="FilterComponent" tagprefix="uc2" %>
<%@ Import Namespace="Antaeus.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" runat="server">

<div class="ques_know column2">
    
    <div class="blank10"></div>
    
    <div class="box1 subheader">
        <div class="logo_question"></div>
        <div class="left">
            <h1>GMAT题库中心</h1>
            <span>当前共有29384道题目，2938人编辑解答，293045条相关讨论</span>
            <ul>
                <li><a href="/Question/List/">必做经典难题</a></li>
                <li><a href="/Question/List/">Top100</a></li>
                <li><a href="/Question/List/">最新机经</a></li>
                <li><a href="/Question/List/">最有争议题目</a></li>
            </ul>
        </div>
        <div class="create right">
            <span>你还有我们没有的题目？</span>
            <a class="btn-big-1" href="/Question/Create/"><p><b>点击这里</b><br /><span>创建一个新的题目</span></p></a>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="blank10"></div>
    
    <div class="columnleft">
        <div class="box2 listresult">
            <div class="bar1 listtop">
                <div class="left">
                    共找到&nbsp;<span>29384</span>&nbsp;道题目，每页显示&nbsp;
                    <select>
                        <option>10</option>
                        <option>20</option>
                        <option>30</option>
                        <option>40</option>
                    </select>
                    &nbsp;道题目
                </div>
                <div class="report">
                    <span>找不到题目？</span>
                    <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
                </div>
            </div>
            
            <div class="context">

                <% foreach (var item in Model) { %>

                
                <div class="item2" onclick="window.location='/Question/Details/<%= Html.Encode(item.QuestionID) %>';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                	<div class="left">
                    	<div class="note blue">7日内刚更新过题目解答</div>
                        <div class="number">
                        	<div class="n1"><b class="blue"><%= Html.Encode(item.QuestionID) %></b><span>题目编号</span></div>
                            <div class="n2"><b class="green"><%= Html.Encode(item.GetAverage().ToString("0.0"))%></b><span>题目价值</span></div>
                            <div class="n3"><b class="orange"><%= Html.Encode(item.CorrectRate) %></b><span>正确率</span></div>
                        </div>
                    </div>
                    <div class="right">
                    	<div class="summy"><b class="blue"><%= Html.Encode(item.Category.Name) %>:</b> <%=Html.Encode(item.GetAbstract()) %> </div>
                        <div class="parameter">来自<%= Html.Encode(item.Source) %>，<%= Html.Encode(item.ViewedCount)%> 浏览，<%= Html.Encode(item.CommentCount)%> 讨论，更新于 <%= Html.Encode(item.ModifiedTime.ToStr())%></div>
                        <div class="tags">
                         <%foreach (var tag in item.GetTags(6).Split(','))
                           {%>
                                <span><%=tag%></span>
                         <%}%>
                         </div>
                    </div>
                    <div class="clear"></div>
                </div>
                
                
                <% } %>
                
                
            
            </div>
            
            <div class="bar1">
                <div class="barpage">
                <%=Html.ShowPageIndex( this.ViewData.GetPager(),"current")%>
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
</form>
</asp:Content>