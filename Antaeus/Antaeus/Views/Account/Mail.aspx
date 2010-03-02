<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="SideControl.ascx" tagname="SideControl" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>
<%@ Import Namespace="Antaeus.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MailInbox
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="account column2">    
    <div class="blank10"></div> 
    <div class="columnleft">
    	<div class="box2 mail">
			<div class="context"> 	
        		<uc2:HeaderControl ID="HeaderControl1" runat="server" p="Mail"/>
                <div class="subnav">
                    <a href="/Account/Mail/New/">发新的邮件</a>
                    <a href="/Account/Mail/Inbox/" class="current">收件箱</a>
                    <a href="/Account/Mail/Outbox">发件箱</a>
                    <a href="/Account/Mail/Trash/">垃圾箱</a>
                    <a href="/Account/Mail/Draft/" style="border:0;">草稿箱</a>
                </div>
            	<div class="blank15"></div>
                <h2>我的收件箱</h3>
            	<div class="items">                	
                	<div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_unread">
                    	<div class="left">
                            <b><span class="red">[未读]</span>&nbsp;这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_unread">
                    	<div class="left">
                            <b><span class="red">[未读]</span>&nbsp;这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_unread">
                    	<div class="left">
                            <b><span class="red">[未读]</span>&nbsp;这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_read">
                    	<div class="left">
                            <b>这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_unread">
                    	<div class="left">
                            <b><span class="red">[未读]</span>&nbsp;这里是邮件的标题有可能会很长的哦</b>
                            <p><span class="blue">Lanslot</span>&nbsp;发送于<span class="orange">2009-7-23 12:22</span></p>
                        </div>
                        <div class="right"><input type="checkbox" /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_action">
						<div class="pageindex"><span>翻页：</span></div>
                    	<input type="button" class="btn-form-green" value="将选中的邮件删除到垃圾箱" />
                        <label>全选</label>
                        <input type="checkbox" />
                        <div class="clear"></div>
                    </div>
                </div> 
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
