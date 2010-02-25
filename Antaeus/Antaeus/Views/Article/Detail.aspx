<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Antaeus.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="article column2">    
    <div class="blank10"></div>
    <div class="box1 subheader">
        <div class="logo_article"></div>
        <div class="left">
            <h1>这里是文章的标题文章的标题啊标题啊</h1>
            <span>Lanslot&nbsp;创建于&nbsp;2009/6/22；&nbsp;浏览量5949</span>
            <ul>
                <li>文章的标签：</li>
                <li><a href="#">标签一</a></li>
                <li><a href="#">标签二</a></li>
                <li><a href="#">标签三</a></li>
                <li><a href="#">标签四</a></li>
            </ul>
        </div>
        <div class="rateandnext right">
            <div class="rate">
                <span>此文章的价值为&nbsp;3&nbsp;/&nbsp;5&nbsp;&nbsp;</span>
                <div class="stars"><%= Html.GetStars(3, "yellow")%></div>
            </div>
            <div class="redirect">
                <a href="#" class="next">下一篇（随机抽取）</a>
                <a href="#" class="previous">上一篇</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="blank10"></div>
    <div class="columnleft">
    	<div class="box2">
            <div class="bar2">
            	<div class="left">
                    <div class="information">当前版本&nbsp;<span class="green">1.0</span>&nbsp;由&nbsp;<span class="blue">Lanslot</span>&nbsp;更新于&nbsp;<span class="orange">2009/6/21</span>&nbsp;&nbsp;<a href="#">点击这里查看历史版本</a></div>
                	<div class="information">感谢&nbsp;<span class="blue">Lanslot</span>&nbsp;,&nbsp;<span class="blue">Ningliaoyuan</span>&nbsp;,&nbsp;<span class="blue">Lozt</span>&nbsp;对此文章所做出的贡献</div>
                </div>
                <div class="right">
                	<a class="btn-small btn-edit" href="#">编辑此文章</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="wiki">
            	<p>The fields of antebellum (pre-Civil War) political history and women’s history use separate sources and focus on separate issues.  <span class="highlight">Political historians</span>, examining sources such as voting records, newspapers, and politicians’ writings, focus on the emergence in the 1840’s of a new “American political nation,” and since women were neither voters nor politicians, they receive little discussion.  Women’s historians, meanwhile, have shown little interest in the subject of party politics, instead drawing on personal papers, legal records such as wills, and records of female associations to illuminate women’s domestic lives, their moral reform activities, and the emergence of the woman’s rights movement.</p>
            </div>
        </div>

        <div class="blank10"></div>
        <div class="box2 comment">
            <div class="bar2">
            	<div class="left">
                	<h2>评论文章</h2>
                    <div class="information">如果你有任何问题，欢迎在这里发表，大家一起来解决题目问题</div>
                </div>
                <div class="right">
                	<a class="btn-small btn-comment" href="#">发表一个新的评论</a>
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="context">
            	<div class="comm_item">
                	<div class="left"><span class="blue">Lanslot</span>&nbsp;发布于&nbsp;<span class="orange">2009/6/15 14:32</span></div>
                    <div class="right"><span class="green">1</span>&nbsp;楼</div>
                    <div class="clear"></div>
                    <p>真牛比，这个题目实在是太难了，讲解居然能够这样子来分析，我靠，我服死设计这个题目的人和读懂这个题目的人，大牛啊大牛啊。</p>
                </div>
                <div class="comm_item">
                	<div class="left"><span class="blue">Lanslot</span>&nbsp;发布于&nbsp;<span class="orange">2009/6/15 14:32</span></div>
                    <div class="right"><span class="green">2</span>&nbsp;楼</div>
                    <div class="clear"></div>
                    <p>真牛比，这个题目实在是太难了，讲解居然能够这样子来分析，我靠，我服死设计这个题目的人和读懂这个题目的人，大牛啊大牛啊。</p>
                </div>
                <div class="comm_item">
                	<div class="left"><span class="blue">Lanslot</span>&nbsp;发布于&nbsp;<span class="orange">2009/6/15 14:32</span></div>
                    <div class="right"><span class="green">3</span>&nbsp;楼</div>
                    <div class="clear"></div>
                    <p>真牛比，这个题目实在是太难了，讲解居然能够这样子来分析，我靠，我服死设计这个题目的人和读懂这个题目的人，大牛啊大牛啊。</p>
                </div>
                <div class="comm_item">
                	<div class="left"><span class="blue">Lanslot</span>&nbsp;发布于&nbsp;<span class="orange">2009/6/15 14:32</span></div>
                    <div class="right"><span class="green">4</span>&nbsp;楼</div>
                    <div class="clear"></div>
                    <p>真牛比，这个题目实在是太难了，讲解居然能够这样子来分析，我靠，我服死设计这个题目的人和读懂这个题目的人，大牛啊大牛啊。</p>
                </div>
                <div class="comm_form">
                	<textarea></textarea>
                    <br /><a class="btn-form-green" href="#">提交新的讨论发言</a>
                </div>
                               
            </div>
            <div class="bar1 indexbottom">
                <div class="barpage">
                    <span>讨论翻页：</span>
                    <%=Html.ShowPageIndex(11,40,"#","current")%>
                </div>
                
            </div> 
        </div>
        <div class="blank10"></div>
    </div>
    <div class="columnright">
    	<div class="box3 action">
        	<a href="#" class="btn-huge btn-huge-favorite"><p><b>加入到收藏夹</b><span>整理出一个自己的小题库，以后可以随时不断复习强化</span></p></a>
            <a href="#" class="btn-huge btn-huge-email"><p><b>EMAIL发送给朋友</b><span>分享给朋友或让朋友来帮助你解答问题</span></p></a>
            <a href="#" class="btn-huge btn-huge-print"><p><b>打印本页的题目和解答</b><span>将题目打印出来，拿在手上看，随时复习</span></p></a>
        </div>
        <div class="blank10"></div>
    </div>
    <div class="clear"></div>
</div>
</asp:Content>
