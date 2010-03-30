<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
	<script type="text/javascript" src="/Plugins/CKEditor-3.0.1/ckeditor.js"></script>
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
                        <div class="title">题目类型<span>*</span></div>
                        <div class="detail">
                            <select class="inp inp2" id="FormQuestionCreateType" name="CategoryID">
								<%foreach (var category in CommonDataHelper.AllCategory()) {%>
                                <option <%= category.CategoryID == 1? "selected=\"selected\"" : string.Empty%> value="<%=category.CategoryID%>"><%=category.Name%></option>
                            	<%}%>
                            </select>
                        </div>
                        <div class="clear"></div>                        
                    </div>                   
					<div class="item">
                        <div class="title">题目来源<span>*</span></div>
                        <div class="detail">
                            <select class="inp inp2 judge" name="Source">
                                <option value="GWD" selected="selected">GWD</option>
                                <option value="PREP">PREP</option>
                                <option value="OG 11th">OG 11th</option>
                                <option value="OG 10th">OG 10th</option>
                                <option value="other">其它</option>
                            </select>
                        </div>
                        <div class="clear"></div>                        
                    </div>                                
					<!--这里开始非通用内容-->
                    <div id="FormQuestionCreateLoad" refreshme="FormQuestionCreateLoad">
                    	<div class="item">
                            <div class="title">题目内容<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp1" name="Content" required="true"></textarea>
                            </div>
                            <div class="clear"></div>                        
                        </div>
                    	<div class="item">
                            <div class="title">选项A<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp4" name="OptionA" required="true"></textarea>
                                <div class="check check4"><div><input type="radio" name="CorrectMark" value="A" checked="checked" /><span>正确</span></div></div>
                            </div>
                            <div class="clear"></div>                        
                        </div>
                        <div class="item">
                            <div class="title">选项B<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp4" name="OptionB" required="true"></textarea>
                                <div class="check check4"><div><input type="radio" name="CorrectMark" value="B" /><span>正确</span></div></div>
                            </div>
                            <div class="clear"></div>                        
                        </div>
                        <div class="item">
                            <div class="title">选项C<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp4" name="OptionC" required="true"></textarea>
                                <div class="check check4"><div><input type="radio" name="CorrectMark" value="C" /><span>正确</span></div></div>
                            </div>
                            <div class="clear"></div>                        
                        </div>
                        <div class="item">
                            <div class="title">选项D<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp4" name="OptionD" required="true"></textarea>
                                <div class="check check4"><div><input type="radio" name="CorrectMark" value="D" /><span>正确</span></div></div>
                            </div>
                            <div class="clear"></div>                        
                        </div>
                        <div class="item">
                            <div class="title">选项E<span>*</span></div>
                            <div class="detail">
                                <textarea class="textarea inp4" name="OptionE" required="true"></textarea>
                                <div class="check check4"><div><input type="radio" name="CorrectMark" value="E" /><span>正确</span></div></div>
                            </div>
                            <div class="clear"></div>                        
                        </div>					
                    </div>	
                    <!--这里结束非通用内容-->                    
                    
                    <div class="item">
                        <div class="title">题目的标签</div>
                        <div class="detail">
                            <input name="Tag" type="text" class="inp inp1 separate" value="" />
                            <div class="blank5"></div>
                            <div class="tips">请使用英文半角逗号,分隔标签，你也可以点击下面的热门标签直接插入</div>
                            <div class="blank5 clear"></div>
                            <div class="separate-select">
                                <span>热门标签：</span>
                                <a>test</a>
                                <a>werr</a>
                                <a>23fd</a>
                                <a>vdfb</a>
                                <a>sdfew</a>
                                <a>cvedwf</a>
                                <a>ewwrds</a>
                                <a>cvdf</a>
                                <a>werfew</a>
                                <a>rthy</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                        
					<div class="item">
                        <div class="title">此题的价值<span>*</span></div>
                        <div class="detail" id="FormRate">
                            <select class="inp inp2" name="Rate">
                                <option value="1">几乎没有价值</option>
                                <option value="2">没什么价值</option>
                                <option value="3" selected="selected">一般般吧</option>
                                <option value="4">需要做一下</option>
                                <option value="5">必须要做</option>
                            </select>
                            <div class="rate">我认为这道题<span id="FormRateCap"></span></div> 
                        </div> 
                        <div class="clear"></div>                                                          
                    </div>
                    
                    <div class="item">
                        <div class="title">此题与哪题很像</div>
                        <div class="detail">
                            <input name="Related" type="text" class="inp inp1 separate" value="" />
                            <div class="blank5"></div>
                            <div class="tips">非必填，请使用英文的半角逗号来分隔现有题库中的题目编号</div>
                        </div>
                        <div class="clear"></div>
                    </div>                    
                    
					<div class="item">
                        <div class="title">题目解答</div>
                        <div class="detail">
                            <textarea class="textarea inp1" id="CKEditor" name="Answer"></textarea>
                            <div class="blank5"></div>
                            <div class="tips">选填内容，请输入你初始地对于此道题目的解答说明</div>
                        </div>
                        <div class="clear"></div>                        
                    </div>
                                
                    <div class="item">
                        <div class="title">相关知识点</div>
                        <div class="detail">
                            <input name="Knowledge" type="text" class="inp inp2 margin-right" value="请输入知识点标题或者标签" />
                            <input type="button" class="btn-form-blue" value="检索知识点" />
                            <div class="blank10 clear"></div>
                            <ul class="sortbox margin-right">
                                <li class="desc">检索结果（只显示头五个结果）</li>
                                <li class="sortitem">检索出来的知识点的标题名称啊</li>
                                <li class="sortitem">检索出来的知识点的标题名称啊题题...</li>
                                <li class="sortitem">检索出来的知识点的标题啊</li>
                                <li class="sortitem">检索出来的知识点的标题名称啊</li>
                                <li class="sortitem">检索出来的知识点的标题称啊</li>
                            </ul>
                            <ul class="sortbox">
                                <li class="desc">请把选中的结果拖拽到这里，并排序</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                                
                    <div class="item noborder">
                        <div class="title"><div class="hidden"><input name="ReadContentID" type="text" value="" /></div></div>
                        <div class="detail">                            
                            <input type="submit" class="btn-form-green" value="提交我的题目" />
                            <input type="reset" class="btn-form-gray" value="重置所有输入" />
                        </div>
                        <div class="clear"></div>  
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
