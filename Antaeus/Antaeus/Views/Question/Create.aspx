<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">

    <link rel="stylesheet" href="/Plugins/Kissy-1.0.0-Build242/themes/default/editor-min.css" type="text/css"/>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

<div class="ques_know column2">
    
    <div class="blank10"></div>
        
    <div class="box1 subheader">
        <div class="logo_question"></div>
        <div class="left">
            <h1>创建一道新的题目</h1>
            <span>非常感谢您的提交。因为政策原因，您所提交的题目将会先接受管理员的审核。</span>
            <ul>
                <li>没想好放什么：</li>
                <li><a href="#">必做经典难题</a></li>
                <li><a href="#">Top100</a></li>
                <li><a href="#">最新机经</a></li>
                <li><a href="#">最有争议题目</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="blank10"></div>
    
    <div class="columnleft">
    
        <div class="box2 createform">
            <div class="context">
            	<% using (Html.BeginForm()){%>
                <div class="formstyle" id="FormQuestionCreate">
                	<div class="item">
                        <label><span>*</span>题目类型</label>
                        <select class="inp inp2" id="FormQuestionCreateType" name="CategoryID">
                        <%foreach (var category in CommonDataHelper.AllCategory()) {%>
                        	<option <%= category.CategoryID == 1? "selected=\"selected\"" : string.Empty%> value="<%=category.CategoryID%>"><%=category.Name%></option>
                        <%}%>
                        </select>
                        <div class="inp-between red hidden">题型信息载入中...请不要进行操作</div>
                    </div>
                    
                    <div class="item">
                                    <div class="title">单个文本输入框<span>*</span></div>
                                    <div class="detail">
                                        <input type="text" class="inp inp1" value="" />                                       
                                    </div>
                                    <div class="clear"></div>                        
                     </div>
                                
                    <div class="item">
                        <label><span>*</span>题目来源</label>
                        <select class="inp inp2" id="FormQuestionCreateSource" name="SourceSelect">
                            <option selected="selected">GWD</option>
                            <option>PREP</option>
                            <option>OG 11th</option>
                            <option>OG 10th</option>
                            <option>其它</option>
                        </select>
                        <input name="Source" type="text" class="inp inp2 hidden" value="" id="FormQuestionCreateSourceOther" />
                    </div>
                    <div id="FormQuestionCreateLoad">
                        <div class="item">
                            <label><span>*</span>题目内容</label>
                            <textarea class="inp inp1 inp4 FormOnBlurCheck" name="Content"></textarea>
                            <div class="wrong margin hidden"></div>
                            <div class="clear"></div>
                        </div>
                        <div class="item" id="QuesCreate_Options">
                            <label><span>*</span>题目的五个选项</label>                            
                            <textarea class="inp inp1 FormOnBlurCheck" name="OptionA"></textarea><div class="inp-between">选项A</div>
                            <div class="wrong margin hidden"></div>
                            <div class="blank5"></div>
                            <div class="margin">
                            	<input type="radio" name="CorrectMark" value="A" checked="checked" /><span>&nbsp;这是正确选项</span>
                            </div>
                            <div class="blank5"></div>
                            <div class="margin">                                                        
                                <textarea class="inp inp1 FormOnBlurCheck" name="OptionB"></textarea><div class="inp-between">选项B</div>
                                <div class="wrong hidden"></div>
                                <div class="blank5"></div>
                                <input type="radio" name="CorrectMark" value="B" /><span>&nbsp;这是正确选项</span>
                            </div>
                            <div class="blank5"></div>
                            <div class="margin">                                  
                                <textarea class="inp inp1 FormOnBlurCheck" name="OptionC"></textarea><div class="inp-between">选项C</div>
                                <div class="wrong hidden"></div>
                                <div class="blank5"></div>
                                <input type="radio" name="CorrectMark" value="C" /><span>&nbsp;这是正确选项</span>
                            </div>
                            <div class="blank5"></div>
                            <div class="margin">                                  
                                <textarea class="inp inp1 FormOnBlurCheck" name="OptionD"></textarea><div class="inp-between">选项D</div>
                                <div class="wrong hidden"></div>
                                <div class="blank5"></div>
                                <input type="radio" name="CorrectMark" value="D" /><span>&nbsp;这是正确选项</span>
                            </div>
                            <div class="blank5"></div>
                            <div class="margin">                                  
                                <textarea class="inp inp1 FormOnBlurCheck" name="OptionE"></textarea><div class="inp-between">选项E</div>
                                <div class="wrong hidden"></div>
                                <div class="blank5"></div>
                                <input type="radio" name="CorrectMark" value="E" /><span>&nbsp;这是正确选项</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <label><span>*</span>题目的标签</label>
                        <input name="Tag" type="text" class="inp inp1" value="" />
                        <div class="description margin">请使用英文的半角逗号来分隔标签</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label><span>*</span>你认为此题的价值</label>
                        <div id="FormRate">
                            <select class="inp inp2" name="Rate">
                                <option value="1">几乎没有价值</option>
                                <option value="2">没什么价值</option>
                                <option value="3" selected="selected">一般般吧</option>
                                <option value="4">需要做一下</option>
                                <option value="5">必须要做</option>
                            </select>
                        </div>
                        <div class="rate_wrap">我认为这道题<span id="FormRateCap"></span></div>                        
                    </div>
                    <div class="item">
                        <label>你认为此题与哪题像</label>
                        <input name="Related" type="text" class="inp inp1" value="" />
                        <div class="description margin">非必填，请使用英文的半角逗号来分隔现有题库中的题目编号</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label>题目解答</label>
                        <div class="textarea_wrap"><textarea class="inp inp1 inp4" name="Answer"></textarea></div>
                        <div class="description margin">选填内容，请输入你初始地对于此道题目的解答说明</div>
                        <div class="clear"></div>
                    </div>
                    <div class="item">
                        <label>相关联的知识点</label>
                        <input name="Knowledge" type="text" class="inp inp2" value="请输入知识点标题或者标签" />
                        <input type="button" class="btn-form-blue" value="检索知识点" />
                        <ul class="sortbox margin bgc-gery FormQuestionCreateSort" id="FormQuestionCreateSortResult">
                            <li class="desc">检索结果（只显示头五个结果）</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊题题...</li>
                            <li class="sortitem">检索出来的知识点的标题啊</li>
                            <li class="sortitem">检索出来的知识点的标题名称啊</li>
                            <li class="sortitem">检索出来的知识点的标题称啊</li>
                        </ul>
                        <ul class="sortbox bgc-blue FormQuestionCreateSort" id="FormQuestionCreateSortSelect">
                            <li class="desc">请把选中的结果拖拽到这里，并排序</li>
                        </ul>
                    </div>
                    <div class="item noborder">
                    	<div class="hidden">
                        	<input name="ReadContentID" type="text" value="" />
                        </div>
                        <div class="margin">                   	
                            <input type="submit" class="btn-form-green" value="提交我的题目" />
                            <input type="reset" class="btn-form-gray" value="重置所有输入" />
                        </div>                        
                    </div>
                </div>
                <%} %>
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
