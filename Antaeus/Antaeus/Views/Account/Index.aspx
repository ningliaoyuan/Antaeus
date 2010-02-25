<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="SideControl.ascx" tagname="SideControl" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="account column2">    
    <div class="blank10"></div> 
    <div class="columnleft">
    	<div class="box2 overview">
			<div class="context"> 	
                <uc2:HeaderControl ID="HeaderControl1" runat="server" />
                <div class="blank15"></div>
                <h2>账号基本信息</h2>
                <div class="items">
                    <div class="item"><b>未读邮件</b><p>你现在有&nbsp;<span class="red">1</span>&nbsp;封未读邮件</p><div class="clear"></div></div>
                    <div class="item"><b>收藏夹</b><p>你现在收藏了&nbsp;<span class="red">34</span>&nbsp;道题目，&nbsp;<span class="red">34</span>&nbsp;个知识点，&nbsp;<span class="red">34</span>&nbsp;篇文章</p><div class="clear"></div></div>
                	<div class="item">
                    	<b>参与的内容</b>
                        <p>你创建发布了：&nbsp;<span class="red">34</span>&nbsp;道题目，&nbsp;<span class="red">34</span>&nbsp;个知识点，&nbsp;<span class="red">34</span>&nbsp;篇文章</p><div class="clear"></div>
                        <p>你参与编辑了：&nbsp;<span class="red">34</span>&nbsp;道题目，&nbsp;<span class="red">34</span>&nbsp;个知识点，&nbsp;<span class="red">34</span>&nbsp;篇文章</p><div class="clear"></div>
                        <p>你参与讨论了：&nbsp;<span class="red">34</span>&nbsp;道题目，&nbsp;<span class="red">34</span>&nbsp;个知识点，&nbsp;<span class="red">34</span>&nbsp;篇文章</p><div class="clear"></div>                        
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="item_bottom">&nbsp;</div> 
                <h2>最新通知消息</h2>
                <div class="items">
                    <div class="item_mail">
                    	<p><span class="blue">Lanslot</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;给你发了一封新的邮件</p>
                        <b>邮件标题：<a href="#">有一个问题想请教你一下！！！</a></b>
                    </div>
                    <div class="item_reply">
                    	<p><span class="blue">Ningliaoyuan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;回复了你的提问</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_comment">
                    	<p><span class="blue">Tairan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;在你参与的内容提出了一个问题</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_mail">
                    	<p><span class="blue">Lanslot</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;给你发了一封新的邮件</p>
                        <b>邮件标题：<a href="#">有一个问题想请教你一下！！！</a></b>
                    </div>
                    <div class="item_reply">
                    	<p><span class="blue">Ningliaoyuan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;回复了你的提问</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_comment">
                    	<p><span class="blue">Tairan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;在你参与的内容提出了一个问题</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_mail">
                    	<p><span class="blue">Lanslot</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;给你发了一封新的邮件</p>
                        <b>邮件标题：<a href="#">有一个问题想请教你一下！！！</a></b>
                    </div>
                    <div class="item_reply">
                    	<p><span class="blue">Ningliaoyuan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;回复了你的提问</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_comment">
                    	<p><span class="blue">Tairan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;在你参与的内容提出了一个问题</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_mail">
                    	<p><span class="blue">Lanslot</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;给你发了一封新的邮件</p>
                        <b>邮件标题：<a href="#">有一个问题想请教你一下！！！</a></b>
                    </div>
                    <div class="item_reply">
                    	<p><span class="blue">Ningliaoyuan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;回复了你的提问</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                    <div class="item_comment">
                    	<p><span class="blue">Tairan</span>&nbsp;在&nbsp;<span class="orange">2009-7-12 12:34</span>&nbsp;在你参与的内容提出了一个问题</p>
                        <b>关联知识点：<a href="#">关于定冠词和不定冠词的各种不同考法</a></b>
                    </div>
                </div>
                <div class="item_bottom">&nbsp;</div> 
            </div>
        </div>
        <div class="blank10"></div>
    </div>
    
    <div class="columnright">
        <uc1:SideControl ID="SideControl1" runat="server" />
        <div class="blank10"></div>
    </div>
    
</div>
</asp:Content>
