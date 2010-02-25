<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
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
        <div class="box2 createform">
            <div class="context">
                <div class="formstyle">
                	<div class="item">
                        <label><span>*</span>知识点类型</label>
                        <select class="inp inp2">
                            <option>Sentences Corrected</option>
                            <option>Reading Comprehension</option>
                            <option>Critical Reasoning</option>
                            <option>Data Sufficient</option>
                            <option>Problem Solving</option>
                            <option>Writing: Issue</option>
                            <option>Writing: Argument</option>
                        </select>
                    </div>
                    <div class="item">
                        <label><span>*</span>知识点标题</label>
                        <input name="" type="text" class="inp inp1" value="" />
                        <div class="clear"></div>
                    </div>
                	<div class="item">
                        <label><span>*</span>知识点内容</label>
                        <div class="textarea_wrap"><textarea class="inp" id="ta1" name="ta1"></textarea></div>
                        <script type="text/javascript" src="/Plugins/CKEditor/ckeditor.js"></script>
                        <script type="text/javascript">CKEDITOR.replace('ta1',{toolbar:[['Source','-','Bold','Italic','Underline','-','Styles','RemoveFormat']],width:507,height:300});</script>
                        <div class="description margin">请在上面输入知识点的内容。请输入除选项外的全部内容，问题部分请加粗显示。</div>
                        <div class="wrong margin">输入错误的提示语言，如果这个错误极其恶劣的话，那么这个提示也有可能会非常长的哦，那么如果很长的话，就会是这样。</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label><span>*</span>知识点的标签</label>
                        <input name="" type="text" class="inp inp1" value="" />
                        <div class="correct">正确</div>
                        <div class="description margin">请使用英文的半角逗号来分隔标签</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label><span>*</span>此知识点的价值</label>
                        <div id="rate">
                            <select class="inp inp2">
                                <option>几乎没有价值</option>
                                <option>没什么价值</option>
                                <option selected="selected">一般般吧</option>
                                <option>需要看一下</option>
                                <option>必须要看</option>
                            </select>
                        </div>
                        <div class="rate_wrap">我认为这个知识点<span id="rate_cap"></span></div>                        
                    </div>
                    <div class="item">
                        <label><span>*</span>相关联的题目</label>
                        <input name="" type="text" class="inp inp1" value="请输入现有数据库中题目的编号" />
                        <div class="correct">正确</div>
                        <div class="description margin">必填（如果一个知识点没有关联的题目的话，那么这个知识点就没有存在的必要了），请使用英文的半角逗号来分隔题目编号。</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label>相关联的其它知识点</label>
                        <input name="" type="text" class="inp inp2" value="请输入知识点标题或者标签" />
                        <input type="submit" class="btn_green" value="检索知识点" />
                        <ul class="sortbox margin bgc-gery" id="formSortResult">
                            <li class="desc">检索结果（只显示头五个结果）</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊题题...</li>
                            <li class="sortitem">检索出来的知识点的标题啊</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊</li>
                            <li class="sortitem">检索出来的知识点的标题称啊</li>
                        </ul>
                        <ul class="sortbox bgc-blue" id="formSortSelect">
                            <li class="desc">请把选中的结果拖拽到这里，并排序</li>
                        </ul>
                    </div>
                    <div class="item noborder">
                    	<div class="margin">                   	
                            <input type="submit" class="btn-form-green" value="提交我的题目" />
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
