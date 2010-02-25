// JavaScript Document
$(document).ready(function(){
	//左侧菜单效果
	$(".menu p").click(function(){
		$(this).next().slideToggle("fast");
	});
	//文件上传框点击后选中文件的显示
	$(".file").change(function(){
		$(this).parent().prev().prev().attr("value",$(this).attr("value"));

	});
});