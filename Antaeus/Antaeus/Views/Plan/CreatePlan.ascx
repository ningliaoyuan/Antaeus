﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="box2">
	<div class="box-title1">
    	<h1>创建自己的复习计划</h1>
        <!--<span>查看详细说明</span>-->
        <div class="clear"></div>
    </div>
	<div class="box-content">
    	<div class="formstyle">
            <div class="item">
                <div class="title">复习结束时间<span>*</span></div>
                <div class="detail">
                     <input name="date" type="text" class="inp inp2" id="InputDate" required="true" value="" readonly="readonly" />
                </div>
                <div class="clear"></div>                        
            </div>
            <div class="item">
                <div class="title">复习模式<span>*</span></div>
                <div class="detail">
                    <div class="check check1" id="RadioMode">
                        <div><input type="radio" name="mode" value="all" checked="checked" /><span>全面复习：将平均分配不同题型的复习时间</span></div>
                        <div><input type="radio" name="mode" value="verbal" /><span>偏重语文：语文部分的复习时间将占多数</span></div>
                        <div><input type="radio" name="mode" value="sc" /><span>偏重SC：语法题（Sentences Corrected）的复习时间将会加长</span></div>
                        <div><input type="radio" name="mode" value="cr" /><span>偏重CR：逻辑题（Critical Reasoning）的复习时间将会加长</span></div>
                        <div><input type="radio" name="mode" value="rc" /><span>偏重RC：阅读题（Reading Comprehension）的复习时间将会加长</span></div>
                        <div><input type="radio" name="mode" value="math" /><span>偏重数学：数学题（Data Sufficient & Problem Solving）的复习时间将会加长</span></div>
                        <div class="hidden"><input type="radio" name="mode" value="customize" /><span>自定义：自己决定各个部分的时间</span></div>
                    </div>
                </div>
                <div class="clear"></div>  
            </div>
            <div class="item noborder">
                <div class="title">&nbsp;</div>
                <div class="detail">
                    <input type="button" id="BtnCreatePlanNext" class="btn-form-green" value="继续下一步" />
                </div>
                <div class="clear"></div>  
            </div>
            <div class="item hidden">
                <div class="title">每日复习时间<span>*</span></div>
                <div class="detail">
                    <div class="check">
                        <div><input type="radio" name="time" checked="checked" /><span>每天大约6小时</span></div>
                        <div><input type="radio" name="time" /><span>每天大约4小时</span></div>
                        <div><input type="radio" name="time" /><span>每天大约2小时</span></div>
                    </div>                        
                </div>
                <div class="clear"></div>  
            </div>
            <div class="item hidden">
                <div class="title">具体考试计划<span>*</span></div>
                <div class="detail" id="PlanDetail">
                    <div class="correct">离考试你总共有&nbsp;<b>35天</b>&nbsp;的复习时间，目前的计划使用了&nbsp;<b>35天</b></div>
                    <table class="tablestyle" cellspacing="0">
                        <tr>
                            <th scope="col" class="nobg">编号</th>
                            <th scope="col">题型</th>
                            <th scope="col">时长</th>
                            <th scope="col">数量</th>
                            <th scope="col">推荐描述</th>                            
                            <th scope="col">开始时间</th>
                            <th scope="col">结束时间</th>                            
                        </tr>
                        <tr>
                            <th scope="row" class="spec">1</th>
                            <td>SC语法</td>
                            <td>
                            	<input type="text" class="InputPlanDays" tipsource="#DivPlanDays1" style="width:15px" value="3" maxlength="2" />&nbsp;天
                                
                            </td>
                            <td>754题</td>
                            <td>覆盖90%必须题目</td>
                            <td>2010-5-24</td>
                            <td>2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="specalt">2</th>
                            <td class="alt">综合回顾</td>
                            <td class="alt"><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td class="alt">754题</td>
                            <td class="alt">覆盖90%必须题目</td>
                            <td class="alt">2010-5-24</td>
                            <td class="alt">2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="spec">3</th>
                            <td>CR逻辑</td>
                            <td><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td>754题</td>
                            <td>覆盖90%必须题目</td>
                            <td>2010-5-24</td>
                            <td>2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="specalt">4</th>
                            <td class="alt">综合回顾</td>
                            <td class="alt"><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td class="alt">754题</td>
                            <td class="alt">覆盖90%必须题目题目题目</td>
                            <td class="alt">2010-5-24</td>
                            <td class="alt">2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="spec">5</th>
                            <td>RC阅读</td>
                            <td><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td>754题</td>
                            <td>覆盖90%必须题目</td>
                            <td>2010-5-24</td>
                            <td>2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="specalt">6</th>
                            <td class="alt">综合复习</td>
                            <td class="alt"><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td class="alt">754题</td>
                            <td class="alt">覆盖90%必须题目</td>
                            <td class="alt">2010-5-24</td>
                            <td class="alt">2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="spec">7</th>
                            <td>DS数学</td>
                            <td><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td>754题</td>
                            <td>覆盖90%必须题目</td>
                            <td>2010-5-24</td>
                            <td>2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="specalt">8</th>
                            <td class="alt">综合复习</td>
                            <td class="alt"><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td class="alt">754题</td>
                            <td class="alt">覆盖90%必须题目</td>
                            <td class="alt">2010-5-24</td>
                            <td class="alt">2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="spec">9</th>
                            <td>PS数学</td>
                            <td><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td>754题</td>
                            <td>覆盖90%必须题目</td>
                            <td>2010-5-24</td>
                            <td>2010-6-11</td>
                        </tr>
                        <tr>
                            <th scope="row" class="specalt">10</th>
                            <td class="alt">综合复习</td>
                            <td class="alt"><input type="text" style="width:15px" value="3" maxlength="2" />&nbsp;天</td>
                            <td class="alt">754题</td>
                            <td class="alt">覆盖90%必须题目</td>
                            <td class="alt">2010-5-24</td>
                            <td class="alt">2010-6-11</td>
                        </tr>
                    </table>
                    <div class="plan-days hidden" id="DivPlanDays1">
                        <table>
                            <tr><td><span>15</span>&nbsp;天</td><td>900题</td><td>覆盖100%重要的题目</td></tr>
                            <tr><td><span>25</span>&nbsp;天</td><td>900题</td><td>覆盖100%重要的题目</td></tr>
                            <tr><td><span>13</span>&nbsp;天</td><td>900题</td><td>覆盖100%重要的题目</td></tr>
                            <tr><td><span>5</span>&nbsp;天</td><td>900题</td><td>覆盖100%重要的题目</td></tr>
                            <tr><td><span>1</span>&nbsp;天</td><td>900题</td><td>覆盖100%重要的题目</td></tr>
                            <tr class="delete"><td><span>0</span>&nbsp;天</td><td colspan="2">删除此阶段</td></tr>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>  
            </div>
            <div class="item hidden">
                <div class="title">休息时间<span>*</span></div>
                <div class="detail">
                    <select class="inp inp2">
                        <option value="0" selected="selected">每周日休息</option>
                        <option value="1">每周一休息</option>
                        <option value="2">每周二休息</option>
                        <option value="3">每周三休息</option>
                        <option value="4">每周四休息</option>
                        <option value="5">每周五休息</option>
                        <option value="6">每周六休息</option>
                    </select>
                    <div class="blank5"></div>
                    <div class="tips">经科学研究，每周休息一天有助于知识沉淀</div>
                </div>
                <div class="clear"></div>                        
            </div>
            <div class="item noborder hidden">
                <div class="title">&nbsp;</div>
                <div class="detail">
                    <input type="button" class="btn-form-green" value="保存计划" />
                </div>
                <div class="clear"></div>  
            </div>
        </div>
        <div class="clear"></div>     
    
    </div>
</div>

