<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="SideControl.ascx" tagname="SideControl" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>
<%@ Import Namespace="Antaeus.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ContentRecord
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="account column2">    
    <div class="blank10"></div> 
    <div class="columnleft">
    	<div class="box2 content">
			<div class="context"> 	
        		<uc2:HeaderControl ID="HeaderControl1" runat="server" p="ContentRecord" />
                <div class="subnav">
                    <a href="/Account/Favorite/Incorrected/" class="current">我做错的题目</a>
                    <a href="/Account/ContentRecord/Publish/">我的浏览记录</a>
                    <a href="/Account/ContentRecord/Publish/">我发布的内容</a>
                    <a href="/Account/ContentRecord/Edit/">我参与编辑的内容</a>
                    <a href="/Account/ContentRecord/Comment/" style="border:0;">我发表的讨论</a>
                </div>
            	<div class="blank15"></div>
                <h2>我参与编辑的内容</h3>
                <div class="items">
                	<div class="item_question">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">题目编号：29304</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这道题目的解答过程</p>
                    </div>
                    <div class="item_knowledge">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">知识点超级长的一个标题的内容的</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这个知识点的讲解</p>
                    </div>
                    <div class="item_article">
                        <b><span class="orange">[备考经验]</span>&nbsp;<a href="#">文章超级长的别欧体的巴哈叮咚的不能死</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这篇文章</p>
                    </div>
                    <div class="item_question">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">题目编号：29304</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这道题目的解答过程</p>
                    </div>
                    <div class="item_knowledge">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">知识点超级长的一个标题的内容的</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这个知识点的讲解</p>
                    </div>
                    <div class="item_article">
                        <b><span class="orange">[备考经验]</span>&nbsp;<a href="#">文章超级长的别欧体的巴哈叮咚的不能死</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这篇文章</p>
                    </div>
                    <div class="item_question">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">题目编号：29304</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这道题目的解答过程</p>
                    </div>
                    <div class="item_knowledge">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">知识点超级长的一个标题的内容的</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这个知识点的讲解</p>
                    </div>
                    <div class="item_article">
                        <b><span class="orange">[备考经验]</span>&nbsp;<a href="#">文章超级长的别欧体的巴哈叮咚的不能死</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这篇文章</p>
                    </div>
                    <div class="item_question">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">题目编号：29304</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这道题目的解答过程</p>
                    </div>
                    <div class="item_knowledge">
                        <b><span class="orange">[阅读]</span>&nbsp;<a href="#">知识点超级长的一个标题的内容的</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这个知识点的讲解</p>
                    </div>
                    <div class="item_article">
                        <b><span class="orange">[备考经验]</span>&nbsp;<a href="#">文章超级长的别欧体的巴哈叮咚的不能死</a></b>
                        <p>我在&nbsp;<span class="orange">2007-12-12 11:23</span>&nbsp;编辑了这篇文章</p>
                    </div>
                    <div class="item_action">
						<div class="pageindex"><span>翻页：</span></div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="columnright">
        <uc1:SideControl ID="SideControl1" runat="server" />
        <div class="blank10"></div>
    </div>
    
</div>
</asp:Content>
