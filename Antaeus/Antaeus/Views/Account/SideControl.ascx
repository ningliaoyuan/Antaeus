<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="box3 w-activate">
	<h3 class="box-title">请激活你的账号</h3>
	<div class="box-content">        
        <div class="line-text">
            <p>一封邮件已经发送到你的电子邮箱地址，请点击邮件中的链接来激活你的账号。如果未收到邮件，请点击下面的链接。</p>
            <a href="#">重新发送电子邮件</a>
        </div>
        <div class="line-email">邮件地址：Lanslot.liu@gmail.com</div>
        <div class="line-time">激活时间：剩余&nbsp;<span class="rbgc-red">&nbsp;15&nbsp;</span>&nbsp;天</div>
    </div>
</div>
<div class="blank10"></div>
<div class="box3 w-progress">
	<h3 class="box-title">你的学习进度</h3>
    <div class="box-content">        
        <div class="tab tab-color" id="AccountTab2">
            <ul>
                <li rel="#AccountTab2-1" class="tab-color-blue selected">题库</li>
                <li rel="#AccountTab2-2" class="tab-color-green">知识点</li>
                <li rel="#AccountTab2-3" class="tab-color-red">文章</li>
            </ul>
            <div class="tab-content tab-content-blue" id="AccountTab2-1">
                <img src="../../Contents/Images/icon_up.gif" />
                <p>你以平均每天&nbsp;<b>45</b>&nbsp;题的速度，完成了题库中&nbsp;<b>56%</b>&nbsp;的题目</p>                            
            </div>
            <div class="tab-content tab-content-green hidden" id="AccountTab2-2">
                <img src="../../Contents/Images/icon_down.gif" />
                <p>你以平均每天&nbsp;<b>45</b>&nbsp;篇的速度，看完了&nbsp;<b>56%</b>&nbsp;的知识点</p>                            
            </div>
            <div class="tab-content tab-content-red hidden" id="AccountTab2-3">
                <img src="../../Contents/Images/icon_up.gif" />
                <p>你以平均每天&nbsp;<b>45</b>&nbsp;篇的速度，看完了&nbsp;<b>56%</b>&nbsp;的文章</p>                           
            </div>
        </div>
    </div>
</div>  
<div class="blank10"></div>
<div class="box3"><img src="../../Contents/Temp/DataCollection1.jpg" /></div>
<div class="blank10"></div>
<div class="box3 w-today">
	<h3 class="box-title">今日的进步吧</h3>
	<div class="box-content">    	
        <div class="tab tab-black" id="AccountTab1">
            <ul>
                <li rel="#AccountTab1-1" class="selected">题库</li>
                <li rel="#AccountTab1-2">知识点</li>
                <li rel="#AccountTab1-3">文章</li>
            </ul>
            <div class="tab-content" id="AccountTab1-1">
                <div class="line line-add"><a href="#">39493:</a>&nbsp;<b class="orange">Lanslot</b>&nbsp;<span>新添加了题目</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了题目</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了题目</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了题目</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
            </div>
            <div class="tab-content hidden" id="AccountTab1-2">
            	<div class="line line-add"><a href="#">39493:</a>&nbsp;<b class="orange">Lanslot</b>&nbsp;<span>新添加了知识点</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了知识点</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了知识点</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了知识点</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
            </div>
            <div class="tab-content hidden" id="AccountTab1-3">
            	<div class="line line-add"><a href="#">39493:</a>&nbsp;<b class="orange">Lanslot</b>&nbsp;<span>新添加了文章</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了文章</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了文章</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论在文章</span></div>
                <div class="line line-comment"><a href="#">39493:</a>&nbsp;<b class="orange">Ningliaoyuan</b>&nbsp;<span>发表了新留言</span></div>
                <div class="line line-edit"><a href="#">39493:</a>&nbsp;<b class="orange">Tairan</b>&nbsp;<span>编辑了文章</span></div>
                <div class="line line-reply"><a href="#">39493:</a>&nbsp;<b class="orange">Lozt</b>&nbsp;<span>回复了讨论</span></div>
            </div>
        </div>
    </div>
</div>