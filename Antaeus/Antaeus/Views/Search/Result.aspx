<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="../Components/FilterComponent.ascx" tagname="FilterComponent" tagprefix="uc1" %>
<%@ Import Namespace="Antaeus.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="search column2">
	<div class="blank10"></div>
    <div class="box1">
    	<div class="left">
            <h1>"哈哈"的搜索</h1>
            <input type="text" value="哈哈" class="text" />
            <input type="button" value="重新搜索" class="btn-form-green" />
        </div>
        <div class="right">
        	<h2>热门搜索关键词：</h2>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
            <a href="#">关键词啊</a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="blank10"></div>
    
    <div class="columnleft">
    	<div class="box2 listresult">
        	<div class="bar1 listtop">
                <div class="left">
                    共找到&nbsp;<span>29384</span>&nbsp;个结果，每页显示&nbsp;
                    <select>
                        <option>10</option>
                        <option>20</option>
                        <option>30</option>
                        <option>40</option>
                    </select>
                    &nbsp;个结果
                </div>
                <div class="report">
                    <span>找不到内容？</span>
                    <a class="btn-tiny" href="#popup_question_report" rel="dialog"><span>马上</span>告诉我们</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="context">
            	<div class="item" onclick="window.location='/Question/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Question.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/knowledge.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                <div class="item" onclick="window.location='/Article/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Article.gif" width="60" height="60" /></div>
                        <div class="category">类别：备考经验</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                <div class="item" onclick="window.location='/Question/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Question.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/knowledge.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                <div class="item" onclick="window.location='/Article/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Article.gif" width="60" height="60" /></div>
                        <div class="category">类别：备考经验</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                <div class="item" onclick="window.location='/Question/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Question.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/knowledge.gif" width="60" height="60" /></div>
                        <div class="category">类别：阅读RC</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
                <div class="item" onclick="window.location='/Article/Details/';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                    <div class="left">
                        <div class="icon"><img src="../../Contents/Icons/Article.gif" width="60" height="60" /></div>
                        <div class="category">类别：备考经验</div>
                        <div class="stars_cover"><div class="stars"><%= Html.GetStars(3.5,"gery")%></div></div>
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
    
    <div class="columnright  w-filter" id="WidgetFilter">
    	<uc1:FilterComponent ID="FilterComponent1" runat="server" />
        <div class="blank10"></div>
    </div>
</div>

</asp:Content>
