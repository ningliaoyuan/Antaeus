<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="new-box-title2">创建自己的学习计划</div>
<div class="new-box">
    <div class="formstyle">
        <div class="item">
            <div class="title">选择考试时间<span>*</span></div>
            <div class="detail">
                 <input name="date" type="text" class="inp inp1" value="" />
                 <div class="blank5"></div>
                 <div class="tips">输入格式：年-月-日，例如2010-5-24</div>
            </div>
            <div class="clear"></div>                        
        </div>
        <div class="item">
            <div class="title">复习模式<span>*</span></div>
            <div class="detail">
                <div class="check check1">
                    <div><input type="radio" value="all" checked="checked" /><span>全面复习：将平均分配不同题型的复习时间</span></div>
                    <div><input type="radio" value="verbal" /><span>偏重语文：语文部分的复习时间将占多数</span></div>
                    <div><input type="radio" value="sc" /><span>偏重SC：语法题（Sentences Corrected）的复习时间将会加长</span></div>
                    <div><input type="radio" value="cr" /><span>偏重CR：逻辑题（Critical Reasoning）的复习时间将会加长</span></div>
                    <div><input type="radio" value="rc" /><span>偏重RC：阅读题（Reading Comprehension）的复习时间将会加长</span></div>
                    <div><input type="radio" value="math" /><span>偏重数学：数学题（Data Sufficient & Problem Solving）的复习时间将会加长</span></div>
                </div>
            </div>
            <div class="clear"></div>  
        </div>
        <div class="item noborder">
            <div class="title">&nbsp;</div>
            <div class="detail">
                <input type="button" class="btn-form-green" value="继续下一步" />
            </div>
            <div class="clear"></div>  
        </div>
        <div class="item">
            <div class="title">每日复习时间<span>*</span></div>
            <div class="detail">
                <div class="check">
                    <div><input type="radio" checked="checked" /><span>每天大约6小时</span></div>
                    <div><input type="radio" /><span>每天大约4小时</span></div>
                    <div><input type="radio" /><span>每天大约2小时</span></div>
                </div>                        
            </div>
            <div class="clear"></div>  
        </div>
        <div class="item">
            <div class="title">具体考试计划<span>*</span></div>
            <div class="detail">
                <table class="tablestyle" cellspacing="0">
                    <tr>
                        <th scope="col" abbr="Configurations" class="nobg">编号</th>
                        <th scope="col" abbr="Dual 1.8GHz">题型</th>
                        <th scope="col" abbr="Dual 2GHz">数量</th>
                        <th scope="col" abbr="Dual 2GHz">时长</th>
                        <th scope="col" abbr="Dual 2.5GHz">开始时间</th>
                        <th scope="col" abbr="Dual 2.5GHz">结束时间</th>
                        <th scope="col" abbr="Dual 2.5GHz">推荐描述</th>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">1</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">2</th>
                        <td class="alt">
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td class="alt">754</td>
                        <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">3</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">4</th>
                        <td class="alt">
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td class="alt">754</td>
                        <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">5</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">6</th>
                        <td class="alt">
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td class="alt">754</td>
                        <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">7</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">8</th>
                        <td class="alt">
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td class="alt">754</td>
                        <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">9</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">10</th>
                        <td class="alt">
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td class="alt">754</td>
                        <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="spec">11</th>
                        <td>
                            <select>
                                <option value="sc" selected="selected">SC语法</option>
                                <option value="rc">RC阅读</option>
                                <option value="cr">CR逻辑</option>
                                <option value="ps">PS数学</option>
                                <option value="ds">DS数学</option>
                                <option value="wr">AWA作文</option>
                                <option value="re">综合复习</option>
                            </select>
                        </td>
                        <td>754题</td>
                        <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                        <td>2010-5-24</td>
                        <td>2010-6-11</td>
                        <td>覆盖90%必须题目</td>
                    </tr>
                    <tr>
                        <th scope="row" class="specalt">12</th>
                        <td class="alt">模考</td>
                        <td class="alt">5套</td>
                        <td class="alt"><input type="text" style="width:15px" value="5" />&nbsp;天</td>
                        <td class="alt">2010-5-24</td>
                        <td class="alt">2010-6-11</td>
                        <td class="alt">控制很好的pace</td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>  
        </div>
        <div class="item">
            <div class="title">休息时间<span>*</span></div>
            <div class="detail">
                <select class="inp inp1">
                    <option value="7" selected="selected">每周日休息</option>
                    <option value="1">每周一休息</option>
                    <option value="2">每周二休息</option>
                    <option value="3">每周三休息</option>
                    <option value="4">每周四休息</option>
                    <option value="5">每周五休息</option>
                    <option value="6">每周六休息</option>
                </select>
            </div>
            <div class="clear"></div>                        
        </div>
        <div class="item noborder">
            <div class="title">&nbsp;</div>
            <div class="detail">
                <input type="button" class="btn-form-green" value="保存计划" />
            </div>
            <div class="clear"></div>  
        </div>
    </div>
    <div class="clear"></div> 
</div>