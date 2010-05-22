<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="new-box-title2">
	<div class="left">当前正在进行的学习计划</div>
    <div class="right"><a href="/Plan/Edit/">查看计划详情与修改计划</a></div>
</div>
<div class="new-box">
	<div class="info">
    	<div class="all">当前的学习进度：<b class="blue">良好</b></div>
        <div class="today">今天要完成的学习内容：Sentences Corrected<b class="green">400</b>题，相关知识点学习<b class="green">10</b>篇</div>
        <div class="star-from-previous bgc-red white">你上次的复习中断了，下面的开始复习将从中断的地方重新开始</div>
        <div class="start">
        	<span>每次学习</span>
            <select>
            	<option value="10">10题</option>
                <option value="15">15题</option>
                <option value="20">20题</option>
                <option value="25">25题</option>
                <option value="30">30题</option>
                <option value="35">35题</option>
                <option value="40">40题</option>
            </select>
            <a href="/Plan/Process/" class="btn-form-green">开始复习</a>
        </div>
    </div>
	<div id="chart">学习计划正在载入中...</div>
    <script type="text/javascript">
//		var myChart = new JSChart('chart', 'line');
//		myChart.setDataXML("/Plugins/JsCharts/data.xml");
//		myChart.draw();
//		myChart.resize(680,500);
	</script>
</div>