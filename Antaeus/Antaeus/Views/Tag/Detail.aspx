<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="../Components/FilterComponent.ascx" tagname="FilterComponent" tagprefix="uc1" %>
<%@ Import Namespace="Antaeus.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="tag column2">
	<div class="blank10"></div>
    <div class="box1">
        <h1><span class="green">标签:&nbsp;</span>ART</h1>
        <div class="hottag">			
            <span>热门搜索关键词：</span>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
            <a href="#">关键词啊</a>&nbsp;&nbsp;
        </div>
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
                <div class="item2" onclick="window.location='/Question/Details/1';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                	<div class="left">
                    	<div class="cat cat1"><b>题目</b><span>七日内刚刚更新了解答</span><div class="clear"></div></div>
                        <div class="number">
                        	<div class="n1"><b class="blue">15616</b><span>题目编号</span></div>
                            <div class="n2"><b class="green">3.5</b><span>题目价值</span></div>
                            <div class="n3"><b class="orange">44%</b><span>正确率</span></div>
                        </div>
                    </div>
                    <div class="right">
                    	<div class="summy"><b class="blue">Sentences Corrected:</b> dojsdosdjo,fjdfofjofjd dfhsojaojd dsdhio dhon ddho daowe dihd eaioh dhoa dhojod honsd </div>
                        <div class="parameter">来自GWD，16159 浏览，469 讨论，更新于 2010-3-10 19:34</div>
                        <div class="tags">
                        	<span>tag1</span>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
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
                <div class="item2" onclick="window.location='/Question/Details/1';" onmouseover="this.style.backgroundColor='#f3f7ff';" onmouseout="this.style.backgroundColor='transparent';">
                	<div class="left">
                    	<div class="cat cat3"><b>文章</b><span>七日内刚刚更新了内容</span><div class="clear"></div></div>
                        <div class="number">
                        	<div class="n1"><b class="blue">15616</b><span>文章收藏</span></div>
                            <div class="n2"><b class="green">3.5</b><span>文章价值</span></div>
                            <div class="n3"><b class="orange">46</b><span>文章评论</span></div>                            
                        </div>
                    </div>
                    <div class="right">
                    	<div class="title orange">如何比较MoreThan结构中的主客体两方</div>
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
