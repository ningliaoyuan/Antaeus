<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

 <div class="item hidden">
                <div class="title">具体考试计划<span>*</span></div>
                <div class="detail" id="ReviewDetail">
                    <div class="correct">离考试你总共有&nbsp;<b><%: ViewData["days"]%>天</b>&nbsp;的复习时间，目前的计划使用了&nbsp;<b>35天</b></div>
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
                            	<input type="text" class="InputReviewDays" tipsource="#DivReviewDays1" style="width:15px" value="3" maxlength="2" />&nbsp;天
                                
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
                </div>
                <div class="clear"></div>  
            </div>
