<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register src="SideControl.ascx" tagname="SideControl" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AccountSetting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="account column2">    
    <div class="blank10"></div> 
    <div class="columnleft">
    	<div class="box2 asetting">
			<div class="context"> 	
        		<uc2:HeaderControl ID="HeaderControl1" runat="server" p="AccountSetting"/>
                <div class="blank15"></div>            
                <h2>我的账户设置</h2>
                <div class="items" id="accountSetting">
                    <div class="item">
                        <div class="left-nickname"></div>
                        <div class="right">
                            <h4>用户昵称</h4>
                            <p>这个昵称是你在我们网站显示的名字哦，起一个有创意的名字能够让人记住你，并且能够大大地提高魅力。并且能够大大地提高魅力。</p>
                            <div class="theform hidden">
                                <label>显示的昵称：</label>
                                <input type="text" class="inp" value="兰斯洛特" />
                                <div class="clear"></div>
                                <input type="button" class="btn-form-green" value="修改" />
                                <input type="button" class="btn-form-gray" value="取消" />
                            </div>                   
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <div class="left-password"></div>
                        <div class="right">
                            <h4>修改密码</h4>
                            <p>密码呢是一个非常重要的东西，重要性就不用我多说了吧，反正一定要弄个牛逼的密码，至少别人猜不出来啊牛逼的密码，至少别人猜不出来啊。</p>
                            <div class="theform hidden">
                                <label>登录旧密码：</label>
                                <input type="password" class="inp" value="" />
                                <div class="clear"></div>
                                <label>登录新密码：</label>
                                <input type="password" class="inp" value="" />
                                <div class="clear"></div>
                                <label>重复新密码：</label>
                                <input type="password" class="inp" value="" />
                                <div class="clear"></div>
                                <input type="button" class="btn-form-green" value="修改" />
                                <input type="button" class="btn-form-gray" value="取消" />
                            </div>                 
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <div class="left-mail"></div>
                        <div class="right">
                            <h4>邮件通知</h4>
                            <p>我知道可能你会觉得邮件很烦，你迫不及待地想取消所有的邮件，不过为了你的考试，你还是看看吧，有些邮件通知真的是很有用的。</p>
                            <div class="theform hidden">                            
                                <input type="checkbox" checked="checked" class="check" />
                                <label>我希望收到进步吧发送的“每周最新”邮件，掌握最新动态</label>
                                <div class="clear"></div>
                                <input type="checkbox" checked="checked" class="check" />
                                <label>我希望当我参与编辑的内容被别人编辑的时候收到邮件通知</label>
                                <div class="clear"></div>
                                <input type="checkbox" checked="checked" class="check" />
                                <label>我希望当我参与讨论的内容发生任何更新编辑时收到邮件通知</label>
                                <div class="clear"></div>
                                <input type="checkbox" checked="checked" class="check" />
                                <label>我希望当我参与编辑的内容发生任何新的讨论时收到邮件通知</label>
                                <div class="clear"></div>
                                <input type="button" class="btn-form-green" value="修改" />
                                <input type="button" class="btn-form-gray" value="取消" />
                            </div>                  
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="item_bottom">&nbsp;</div>                   
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
