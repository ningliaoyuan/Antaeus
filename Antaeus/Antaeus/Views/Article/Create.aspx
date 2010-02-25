<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="article column2">
    
    <div class="blank10"></div>
    
    <div class="box1 subheader">
        <div class="logo_article"></div>
        <div class="left">
            <h1>GMAT百科文章库</h1>
            <span>当前共有293篇文章，2938人参与编辑，29345条相关讨论</span>
            <ul>
                <li><a href="/Article/List/">考试介绍</a></li>
                <li><a href="/Article/List/">考场信息</a></li>
                <li><a href="/Article/List/">举办机构介绍</a></li>
                <li><a href="/Article/List/">备考经验</a></li>
            </ul>
        </div>
        <div class="create right">
            <span>不知道应该如何选择文章？</span>
            <a class="btn-big-1" href="/Article/Create/"><p><b>点击这里</b><br /><span>查看推荐的文章</span></p></a>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="blank10"></div>
	<div class="columnleft">
        <div class="box2">
            <div class="context">
                <div class="formstyle">
                	<div class="blank10"></div>
                	<div class="item">
                        <label><span>*</span>文章类型</label>
                        <select class="inp inp2">
                            <option>考试说明</option>
                            <option>考场信息</option>
                            <option>备考经验</option>
                            <option>创建一个新的类别</option>
                        </select>
                    </div>
                    <div class="item">
                        <label><span>*</span>文章标题</label>
                        <input name="" type="text" class="inp inp1" value="" />
                        <div class="clear"></div>
                    </div>
                	<div class="item">
                        <label><span>*</span>文章内容</label>
                        <div class="textarea_wrap"><textarea class="inp" id="ta1" name="ta1"></textarea></div>
                        <script type="text/javascript" src="/Plugins/CKEditor/ckeditor.js"></script>
                        <script type="text/javascript">CKEDITOR.replace('ta1',{toolbar:[['Source','-','Bold','Italic','Underline','-','Styles','RemoveFormat']],width:507,height:300});</script>
                        <div class="description margin">请在上面输入题目的内容。请输入除选项外的全部内容，问题部分请加粗显示。</div>
                        <div class="wrong margin">输入错误的提示语言，如果这个错误极其恶劣的话，那么这个提示也有可能会非常长的哦，那么如果很长的话，就会是这样。</div>
                        <div class="clear"></div>
                    </div>                    
                    <div class="item">
                        <label><span>*</span>文章的标签</label>
                        <input name="" type="text" class="inp inp1" value="" />
                        <div class="correct">正确</div>
                        <div class="description margin">请使用英文的半角逗号来分隔标签</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label><span>*</span>此文章的价值</label>
                        <div id="rate">
                            <select class="inp inp2">
                                <option>几乎没有价值</option>
                                <option>没什么价值</option>
                                <option selected="selected">一般般吧</option>
                                <option>需要看一下</option>
                                <option>必须要看</option>
                            </select>
                        </div>
                        <div class="rate_wrap">我认为这篇文章<span id="rate_cap"></span></div>                        
                    </div>
                    <div class="item noborder">
                    	<div class="margin">                   	
                            <input type="submit" class="btn-form-green" value="提交我的文章" />
                            <input type="reset" class="btn-form-gray" value="重置所有输入" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="blank10"></div>
    </div>
    <div class="columnright">
        <div class="box3">打散</div>
        <div class="blank10"></div>
    </div>
    
</div>
</asp:Content>
