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
        <div class="item noborder">
            <div class="title">&nbsp;</div>
            <div class="detail">
                <input type="button" class="btn-form-green" value="确认" />
            </div>
            <div class="clear"></div>  
        </div>
        <div class="item noborder">
            <div class="title">具体考试计划<span>*</span></div>
            <div class="detail">
            </div>
            <div class="clear"></div>  
        </div>
    

        <table class="tablestyle" cellspacing="0">
            <tr>
                <th scope="col" abbr="Configurations" class="nobg">编号</th>
                <th scope="col" abbr="Dual 1.8GHz">题型</th>
                <th scope="col" abbr="Dual 2GHz">题目数</th>
                <th scope="col" abbr="Dual 2GHz">时长</th>
                <th scope="col" abbr="Dual 2.5GHz">开始时间</th>
                <th scope="col" abbr="Dual 2.5GHz">结束时间</th>
                <th scope="col" abbr="Dual 2.5GHz">推荐描述</th>
            </tr>
            <tr>
                <th scope="row" class="spec">1</th>
                <td>
                    <select>
                        <option value="sc" selected="selected">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">2</th>
                <td class="alt">
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re" selected="selected">Review</option>
                    </select>
                </td>
                <td class="alt">754</td>
                <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="spec">3</th>
                <td>
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc" selected="selected">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">4</th>
                <td class="alt">
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re" selected="selected">Review</option>
                    </select>
                </td>
                <td class="alt">754</td>
                <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="spec">5</th>
                <td>
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr" selected="selected">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">6</th>
                <td class="alt">
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re" selected="selected">Review</option>
                    </select>
                </td>
                <td class="alt">754</td>
                <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="spec">7</th>
                <td>
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps" selected="selected">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">8</th>
                <td class="alt">
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re" selected="selected">Review</option>
                    </select>
                </td>
                <td class="alt">754</td>
                <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="spec">9</th>
                <td>
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds" selected="selected">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">10</th>
                <td class="alt">
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr">Writing</option>
                        <option value="re" selected="selected">Review</option>
                    </select>
                </td>
                <td class="alt">754</td>
                <td class="alt"><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="spec">11</th>
                <td>
                    <select>
                        <option value="sc">Sentences Corrected</option>
                        <option value="rc">Reading Comprehension</option>
                        <option value="cr">Critical Reasoning</option>
                        <option value="ps">Problem Solving</option>
                        <option value="ds">Data Sufficient</option>
                        <option value="wr" selected="selected">Writing</option>
                        <option value="re">Review</option>
                    </select>
                </td>
                <td>754</td>
                <td><input type="text" style="width:15px" value="3" />&nbsp;天</td>
                <td>2010-5-24</td>
                <td>2010-6-11</td>
                <td>覆盖到90%必须复习的题目</td>
            </tr>
            <tr>
                <th scope="row" class="specalt">12</th>
                <td class="alt">模考</td>
                <td class="alt">5套</td>
                <td class="alt"><input type="text" style="width:15px" value="5" />&nbsp;天</td>
                <td class="alt">2010-5-24</td>
                <td class="alt">2010-6-11</td>
                <td class="alt">控制很好的pace和临场感</td>
            </tr>
        </table>
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