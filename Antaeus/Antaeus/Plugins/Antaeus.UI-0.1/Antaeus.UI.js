// Antaeus.UI.Form
// Version 0.1 by lanslot.liu@gmail.com

// Code Standard
// 1.命名全部统一使用firstSecondThird

//全替换的ReplaceAll的定义
String.prototype.replaceAll=function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}
//用于全替换特殊字符
String.prototype.replaceSpecial=function(){
	return this.replaceAll("\n", "").replaceAll(" ", "").replaceAll("\t", "").replaceAll("&nbsp;", "").toLowerCase().replaceAll("<p></p>", "");
}

//下面两个函数都是login操作的函数
var login = {};
//当在popup提交登陆时
login["SubmitPopup"] = function(){
	//获得ajax请求需要的值
	var _un = $("#FormLoginPopup #Username").val();
	var _psd = $("#FormLoginPopup #Password").val();
	var _remember = $("#FormLoginPopup #RememberMe").val();
	
	//为空判断
	if(_un==""||_psd==""){
		$("#PopupLoginForm #LoginErrorMessage").html("用户名密码都不能为空！");
	}else{	
		ajaxRequest(
			$("#AntaeusUIPopupPopupLoginForm .popup-save"),
			{un:_un,psd:_psd,remember:_remember},
			function(){
				ajaxRefresh($("#LogonContent"));
				$("#PopupLoginForm").popup("close");
			},
			function(data){
				$("#PopupLoginForm #LoginErrorMessage").html(data);
			}
		);
	}
};
//当在顶端提交时
login["SubmitHeader"] = function(){
	var _un = $("#FormLoginHeader #Username").val();
	var _psd = $("#FormLoginHeader #Password").val();
	var _remember = $("#FormLoginHeader #RememberMe").val();
	
	//为空判断
	if(_un==""||_psd==""){
		$("#PopupLoginForm #LoginErrorMessage").html("用户名密码都不能为空！");
		$("#PopupLoginForm").popup("open");
	}else{	
		ajaxRequest(
			$("#FormLoginHeaderSubmit"),
			{un:_un,psd:_psd,remember:_remember},
			function(){
				ajaxRefresh($("#LogonContent"));			
			},
			function(data){
				$("#PopupLoginForm #LoginErrorMessage").html(data);
				$("#FormLoginPopup #Username").val(_un);
				$("#FormLoginPopup #Password").val("");
				$("#PopupLoginForm").popup("open");
			}
		);
	}
};

//Favorite相关的全部函数
var favorite = {};
//添加到收藏夹
favorite["Add"] = function(){
	var obj=$(this);
	ajaxRequest(obj,{qID:g_param.qid,qType:"question"},function(){
		g_param.favorite = true;
		$("#LinkFavoriteAdd").hide();
		$("#LinkFavoriteAdd").next().next().show();
		//显示收藏夹设置
		$("#FavoriteAddSetting").slideDown("slow");
	});
};
//给收藏的题目添加Tag
favorite["TagSave"] = function(){
	var obj = $(this);
	var tags = $.trim($("#InputFavoriteTagAdd").val());
	if(tags==""){
		alert("标签输入不能为空！");
	}else{
		ajaxRequest(obj,{qID:g_param.qid,qType:"question",tags:tags},function(){
			$("#FavoriteAddSetting").slideUp("fast");
			//改变显示状态
			$(".btn-huge-favorite").hide();
			if(g_param.favorite){
				$("#FavoriteAlready").show();
			}else{
				$("#LinkFavoriteAdd").show();
			}
		});	
	}
};
//取消添加Tag
favorite["TagCancel"] = function(){								 
	//收起菜单
	$("#FavoriteAddSetting").slideUp("fast");
	//改变显示状态
	$(".btn-huge-favorite").hide();
	if(g_param.favorite){
		$("#FavoriteAlready").show();
	}else{
		$("#LinkFavoriteAdd").show();
	}
};
//删除Tag在detail页面
favorite["Remove"] = function(){
	var obj=$(this);
	ajaxRequest(obj,{qID:g_param.qid,qType:"question"},function(){
		//改变全局变量
		g_param.favorite = false;
		//清除输入框内的内容
		$("#InputFavoriteTagAdd").separateInput("reload");
		$("#InputFavoriteTagAdd").attr("tags","");
		//改变显示状态
		$("#FavoriteAlready").hide();
		$("#LinkFavoriteAdd").show();
	});
};
//修改Tag在Detail页面
favorite["TagEdit"] = function(){
	//清除输入框内的内容
	$("#InputFavoriteTagAdd").separateInput("reload");		
	//获取用户当时添加的Tags
	var tags = $("#InputFavoriteTagAdd").attr("tags");
	if(tags!=""){
		tag=tags.split(",");
		//把获得的Tags置入
		$("#InputFavoriteTagAdd").separateInput("addtags",tag);
	}		
	//改变显示状态
	$("#FavoriteAlready").hide();
	$("#FavoriteAlready").next().show();
	$("#FavoriteAddSetting").slideDown("slow");	
	$("#InputFavoriteTagAdd").separateInput("rewidth");
};
//删除收藏在Favorite页面
favorite["Delete"] = function(){
	var qid = $(this).parent().parent().parent().attr("quesid");
	var obj = $("#FavoriteItems div[quesid='"+qid+"']");
	var requestobj = $(this);
	ajaxRequest(requestobj,{qID:qid,qType:"question"},function(){
		obj.after("<div class='item4'>"+$("#AfterFavoriteRemove").html().replaceAll("%ID%",qid)+"</div>");
		obj.slideUp();
	});
};
//重新收藏在Favorite页面
favorite["ReAdd"] = function(){	
	var qid = $(this).attr("quesid");
	var obj = $(this).parent().parent();	
	var tag = "";	
	$("#FavoriteItems div[quesid='"+qid+"'] .FavoriteItemTags i").each(function(i){tag=tag+","+$(this).html();});
	tag = tag.substring(1);	
	var requestobj = $(this);
	ajaxRequest(requestobj,{qID:qid,qType:"question",tags:tag},function(){
		$("#FavoriteItems div[quesid='"+qid+"']").slideDown();
		obj.remove();
	});	
};
//修改Tag的popup的保存在Favorite页面
favorite["TagModifySave"] = function(){
	//读取ajax相关的东西
	var o = $("#AntaeusUIPopupPopupFavoriteEdit .popup-save");
	var tag=$("#FavoriteTagsEditInput").val();
	var qid=$("#PopupFavoriteEdit").attr("quesid");
	//执行AJAX的请求
	ajaxRequest(o,{qID:qid,qType:"question",tags:tag},function(){
		//刷新原来应该显示tag的地方
		$(".item3[quesid='"+qid+"'] .FavoriteItemTags i").remove();
		var temp = tag.split(",");
		for(var i=0;i<temp.length;i++) $(".item3[quesid='"+qid+"'] .FavoriteItemTags").append("<i>"+temp[i]+"</i>");
		//关闭popup
		$("#PopupFavoriteEdit").popup("close");
	});
};
//修改Tag在Favorite页面
favorite["TagModify"] = function(){
	//获得QuestionID
	var qid = $(this).parent().parent().parent().attr("quesid");
	//获得Tag
	var tag = "";	
	$("#FavoriteItems div[quesid='"+qid+"'] .FavoriteItemTags i").each(function(i){tag=tag+","+$(this).html();});
	tag = tag.substring(1);
	//首先清空输入框
	$("#FavoriteTagsEditInput").separateInput("reload");
	//将取到的Tag写入
	if(tag!="") $("#FavoriteTagsEditInput").separateInput("addtags",tag.split(","));	
	//将AJAX需要的qid写入到popup主控
	$("#PopupFavoriteEdit").attr("quesid",qid);
	//打开Popup界面
	$("#PopupFavoriteEdit").popup("open",{openAfter:function(){$("#FavoriteTagsEditInput").separateInput("rewidth");}});
};

//filter方法用于动态提供筛选
//Parameters:
//[必须]ajax - 字符 - 发送请求的URL
(function($){  
	$.fn.extend({   
	filter: function(options){
		//默认参数设置
		var defaults = {  
			ajax:""
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var objID = $(this).attr("id");
			
			$("#"+objID+" .select ul li, #WidgetFilter .tag ul li").mouseover(function() {
				if ($(this).hasClass("now")) {
					if (!$(this).hasClass("all")) $(this).addClass("delete");
				} else {
					$(this).addClass("add");
				}
			});
		
			$("#"+objID+" .select ul li, #WidgetFilter .tag ul li").mouseout(function() {
				if ($(this).hasClass("add")) $(this).removeClass("add");
				if ($(this).hasClass("delete")) $(this).removeClass("delete");
			});
		
			$("#"+objID+" .select ul li, #WidgetFilter .tag ul li").click(function() {
				if ($(this).hasClass("all")) {
					$(this).siblings(".now").removeClass("now");
					$(this).addClass("now");
				} else {
					$(this).siblings(".all").removeClass("now");
					if ($(this).hasClass("now")) {
						$(this).removeClass("now");
						if (!$(this).siblings().is(".now")) $(this).siblings(".all").addClass("now");
					} else {
						$(this).addClass("now");
					}
				}
				//这里最终还需要一个判断当前选择了什么参数并且做出AJAX操作的代码
		
			});
		
			$("#"+objID+" .sort ul li").mouseover(function() {
				if ($(this).hasClass("upnow")) $(this).addClass("down");
				if ($(this).hasClass("downnow")) $(this).addClass("up");		
			});
		
			$("#"+objID+" .sort ul li").mouseout(function() {
				if ($(this).hasClass("up")) $(this).removeClass("up");
				if ($(this).hasClass("down")) $(this).removeClass("down");
			});
		
			$("#"+objID+" .sort ul li").click(function() {
				if ($(this).hasClass("upnow")) {
					$(this).attr("class", "downnow");
				} else {
					$(this).attr("class", "upnow");
				}
			});			
		});  
	}
	});      
})(jQuery); 

//TabActive方法用于Tab效果
function TabActive(data) {
	if(data==null){
		//默认的初始参数设置
		var data = {
			tabname: ".tab",    //定义Tab最外面包含的类
			selected: "selected",    //定义Tab选中的CSS样式
			hover: "hover"           //定义Tab鼠标移上去时的鼠标样式
		};
	}
	$(data.tabname + " li").mouseover(function() { $(this).addClass(data.hover); });
	$(data.tabname + " li").mouseout(function() { $(this).removeClass(data.hover); });
	$(data.tabname + " li").click(function() {
		var target = $(this);
		var current = $(this).parent().children("." + data.selected);
		current.removeClass(data.selected);
		target.addClass(data.selected);
		if (current.attr("rel") != target.attr("rel")) {
			$(current.attr("rel")).fadeOut("normal", function() { $(target.attr("rel")).show(); });
		}
	});
}

//dropdownMenu方法用于下滑式显示内容
//Parameters:
//[必须]childObj - 字符 - 要显示的子集内容的obj选择器
//[必须]mouseoverColor - 字符 - 鼠标移上去时变化的背景色
//[必须]mouseoutColor - 字符 - 鼠标移开后的原始背景色
//[必须]currentClass - 字符 - 当前所在的css class
//[必须]cancelButton - 字符 - 取消按钮的obj选择器
(function($){  
	$.fn.extend({   
	dropdownMenu: function(options){
		//默认参数设置
		var defaults = {  
			childObj:".theform",
			mouseoverColor:"#cadfec",
			mouseoutColor:"#fff",
			currentClass:"current",
			cancelButton:".cancel-button"
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);			
			obj.mouseover(function() {
				if (jQuery(this).children(".right").children(opt.childObj).css("display") == "none") {
					jQuery(this).css("background-color", opt.mouseoverColor);
				} else {
					jQuery(this).css("cursor", "auto");
				}
			});
			obj.mouseout(function() {
				jQuery(this).css("background-color", opt.mouseoutColor);
			});
			obj.click(function() {
				if (jQuery(this).children(".right").children(opt.childObj).css("display") == "none") {
					obj.each(function(n) {
						jQuery(this).removeClass(opt.currentClass);
						jQuery(this).children(".right").children(opt.childObj).hide();
						jQuery(this).css("cursor", "pointer");
					});
					jQuery(this).children(".right").children(opt.childObj).slideDown("slow");
					jQuery(this).addClass(opt.currentClass);
				}
			});
			$(opt.cancelButton).click(function() {
				jQuery(this).parent().slideUp("slow");
				jQuery(this).parent().parent().parent().removeClass(opt.currentClass);
				jQuery(this).parent().parent().parent().css("cursor", "pointer");
			});
		});  
	}
	});      
})(jQuery); 

//questionRecord方法用于记录用户的做题时间
//Parameters:
//[必须]currentTime - 时间 - 页面载入时间
//[必须]rightIDr - 字符 - 正确时的显示DIV ID
//[必须]wrongID - 字符 - 错误时的显示DIV ID
//[必须]qid - 字符 - 要控制的题目的ID
//[必须]correct - 字符 - 正确选项
//[必须]unbindSelecter - 字符 - 解除绑定的选择器
(function($){  
	$.fn.extend({   
	questionRecord: function(options){
		//默认参数设置
		var defaults = {  
			currentTime    : new Date(),
			rightID        : "#QuestionChoiceCorrectShow",
			wrongID        : "#QuestionChoiceWrongShow",
			qid            : "",
			correct        : "",
			unbindSelecter : ".QuestionChoiceSelect"
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);		
			obj.bind("click",function(){
				var DoTime = new Date();
				var TheTime = parseInt((DoTime-opt.currentTime)/1000);
				var Correct = 0;
				var id=opt.qid;
				var Answer = $(this).attr("value");				
				if (Answer==opt.correct) {
					$(opt.rightID).show();
					Correct = 1;
				}else{
					$(opt.wrongID).show();
				}
				
				ajaxFunction["QuestionRecord"]({qID:id,answer:Answer, correct:Correct, time:TheTime},function(){});
				
				$(opt.unbindSelecter).unbind("click");
			});
		});  
	}
	});      
})(jQuery); 

//popup方法用于弹出popup选择窗口
//Parameters:
//[必须]width - 宽度 - popup窗口的宽度
//[必须]save - 字符 - 保存按钮的文字
//[必须]cancel - 字符 - 取消按钮的文字
//[必须]submit - 函数 - 保存按钮的函数
//[必须]ajax - 字符 - ajax操作的标识符，如果为空的话，则意味着没有ajax操作
//[必须]button - 字符 - "all","none","save"代表三种显示状态：save和cancel都有，没有按钮条，只有save按钮
//[必须]btnLeft - 数字 - 按钮距离左边的位置
//[可选]cancel - 函数 - 取消按钮的函数
//[可选]top - 数字 - 垂直方向位置。如果不写这个的话，将会默认在页面正中间显示，否则将按照这个参数值来显示位置
// "open" Method的参数
//[可选]openAfter - 函数 - Popup打开后要执行的函数
// "close" Method的参数
//[可选]closeAfter - 函数 - 关闭后要执行的函数
(function($){  
	$.fn.extend({   
	popup: function(options,param){
		//默认参数设置
		var defaults = { 
			width        : 500,
			save         : "保&nbsp;&nbsp;存",
			cancel       : "取消",
			ajax         : "",
			btnLeft      : 0,
			button       : "save",
			submit       : function(){},
			openAfter    : function(){},
			closeAfter   : function(){}
		};                   
		var opt;
		var operation="";
		if(typeof(options)=="object" || options==null){		
			//将传入参数与默认参数对比，确定最终的参数
			opt = $.extend(defaults, options);
			//将参数写入全局变量
			//g_param.AntaeusUIPluginsPopup = opt;
		}else{
			operation = options;
			//读取全局变量中这个插件的原先设置值
			opt = param;
		}
		
		//定义控件中所有用到ID和Class属性名
		var attr = {
			main   : "popup",
			title  : "popup-title",
			close  : "popup-close",
			content: "popup-content",
			button : "popup-button",
			save   : "popup-save",
			cancel : "popup-cancel",
			cover  : "popup-cover",
			loading: "popup-loading"
		};
		
		//获得确定的页面的高度，IE6专用
		var _panelHeight = function(){return ($(window).height()>$(document).height())?$(window).height():$(document).height();}
		//获得滚动条高度，IE6专用
		var _scrollHeight = function(){
			var temp = (opt.top==null)?parseInt(($(window).height()-$("#"+_id).height())/2):opt.top;
			return $(document).scrollTop()+temp;
		}
		
		//确定当前控制元素
		var _obj = $(this);
		////这里加入一个ID的属性，用于在一个页面有多个Popup的情况下的区别
		var _id = "AntaeusUIPopup"+_obj.attr("id");
		//cover也要加入ID属性！
		var _cid = "AntaeusUIPopupCover"+_obj.attr("id");
		
		//初始化popup
		var _init = function(){
			
			//首先构建popup的dom结构代码
			_obj.wrap("<div class='"+attr.content+"'></div>");
			var tempH = String(parseInt(opt.width/2));
			
			_obj.parent().wrap("<div id='"+_id+"' class='"+attr.main+"' style='width:"+String(opt.width)+"px; margin-left:-"+tempH+"px;'></div>");
			$("#"+_id+" ."+attr.content).before("<div class='"+attr.title+"'><span>"+_obj.attr("title")+"</span><a class='"+attr.close+"'>&nbsp;</a></div>");
			//这里需要根据ajax的状态来判断写入什么样的按钮代码
			var s1="<div class='"+attr.button+"' style='padding-left:"+String(15+opt.btnLeft)+"px'><a class='"+attr.save+"'%%%>"+opt.save+"</a>";
			//判断是不是没有cancel按钮
			var s2=(opt.button=="save")?"":"<a class='"+attr.cancel+"'>"+opt.cancel+"</a></div>";
			//AJAX的属性
			var s3=" ajaxrequest='"+opt.ajax+"'";
			if(opt.button!="none"){
				if(opt.ajax==""){
					$("#"+_id+" ."+attr.content).after(s1.replace("%%%","")+s2);
				}else{
					$("#"+_id+" ."+attr.content).after(s1.replace("%%%",s3)+"<a class='"+attr.loading+"' ajaxstatus='loading' style='display:none'>操作中...</a>"+s2);
				}
			}
			$("#"+_id).after("<div id='"+_cid+"' class='"+attr.cover+"'></div>");
		
			//在IE6的情况下，当windows窗口变化时自动调整cover的高度
			//IE6不支持positon:fixed的属性，因此需要用absolute这样子来强制控制高度
			if($.browser.msie && $.browser.version=="6.0"){
				//调整cover的高度和宽度
				$("#"+_cid).css("position","absolute");
				$("#"+_cid).height(_panelHeight());
				$("#"+_cid).width($(window).width());
				
				//调整main的高度
				$("#"+_id).css("position","absolute");
				$("#"+_id).css("top",String(_scrollHeight())+"px");
				
				$(window).resize(function(){
					$("#"+_cid).height(_panelHeight());
					$("#"+_cid).width($(window).width());
					$("#"+_id).css("top",String(_scrollHeight())+"px");
				});
				//TODO:出横向滚动条的时候的位置变化，现在只有纵向的
				$(window).scroll(function(){
					$("#"+_id).css("top",String(_scrollHeight())+"px");
					$("#"+_cid).width($(document).scrollLeft()+$(window).width());
				});
			}else{
				//初始化cover的高度
				$("#"+_cid).height($(window).height());
				$(window).resize(function(){$("#"+_cid).height($(window).height());});			
				//初始化popup的高度
				tempH = String(parseInt($("#"+_id).height()/2));
				if(opt.top==null){
					$("#"+_id).css("top","50%");
					$("#"+_id).css("margin-top","-"+tempH+"px");
				}else{
					$("#"+_id).css("top",String(opt.top)+"px");
				}
			}
			
			//绑定保存的函数
			if(opt.submit!=null && typeof(opt.submit)=="function" && opt.button!="none") {
				$("#"+_id+" ."+attr.save).bind("click",{obj:$(this)},opt.submit);
			}else{
				$("#"+_id+" ."+attr.save).bind("click",_close);
			}
			//绑定取消的函数
			if(opt.withdraw!=null && typeof(opt.withdraw)=="function" && opt.button=="all"){
				$("#"+_id+" ."+attr.cancel).bind("click",{obj:$(this)},opt.withdraw);
			}else{
				$("#"+_id+" ."+attr.cancel).bind("click",_close);
			}
			//绑定关闭的函数
			$("#"+_id+" ."+attr.close).bind("click",_close);
		};
		
		//废除popup
		var _destory = function(){
			//首先将内容克隆复制到底部
			_obj.hide();
			$("body").append(_obj.clone());
			//然后删除html
			$("#"+_id).remove();
		};
		
		//打开popup
		var _open = function(){
			$("#"+_cid).css("display","block");
			//不知道为啥jQuery1.4.2的fadeTo失效了
			$("#"+_cid).animate({opacity: '+0.5'}, "fast",function(){
				if(operation=="open" && opt!=null){
					$("#"+_id).fadeIn("fast",function(){opt.openAfter();});
				}else{
					$("#"+_id).fadeIn("fast");
				}
			});
		};
		//关闭popup
		var _close = function(){
			$("#"+_id).fadeOut("fast",function(){
				$("#"+_cid).fadeOut("fast",function(){
					if(operation=="close" && opt!=null){
						$("#"+_cid).hide(function(){opt.closeAfter();});
					}else{
						$("#"+_cid).hide();
					}
				});
			});
		};

		
		return this.each(function(){ 
			if(operation=="")        _init();
			if(operation=="destory") _destory();
			if(operation=="open")    _open();
			if(operation=="close")   _close();
		});  
	}
	});      
})(jQuery); 

(function($){  
	$.fn.extend({   
	tab: function(options){
		//默认参数设置
		var defaults = {  
			trigger : "click"
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);		
			
			//隐藏所有的内容Tab
			obj.children(".tab-content").hide();
			//获得当前显示的Tab
			var current = obj.children(".tab-header").children(".tab-current").attr("tab");
			//显示这个Tab
			obj.children(".tab-content[tab='"+current+"']").show();
			
			obj.children(".tab-header").children("li").bind("click",function(){
				obj.children(".tab-header").children(".tab-current").removeClass("tab-current");
				$(this).addClass("tab-current");
				
				var n = $(this).attr("tab");
				obj.children(".tab-content").hide();
				obj.children(".tab-content[tab='"+n+"']").slideDown("slow");
				
			});
			
		});  
	}
	});      
})(jQuery); 

(function($){  
	$.fn.extend({   
	accordion: function(options){
		//默认参数设置
		var defaults = {  
			trigger : "click"
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);		
			
			//首先隐藏所有内容
			obj.children(".accordion-content").hide();
			//显示当前显示的accordion
			obj.children(".accordion-current").next().show();
			//obj.children(".accordion-current").children("i").html("▲");
			//点击的滑动效果
			
			obj.children(".accordion-title").click(function(){
				if(!$(this).hasClass("accordion-current")){
					obj.children(".accordion-title").removeClass("accordion-current");
					obj.children(".accordion-content").hide();
					$(this).next().slideDown("slow");
					$(this).addClass("accordion-current");
				}
			});
			
		});  
	}
	});      
})(jQuery); 


//tipInput方法用于做实时提示
//parameters:
//[必须]width - 数字 - 提示框的宽度
//[必须]position - 数字 - 三角指示符针对边缘的距离，单位为px，针对tip的left距离
//[必须]top - 数字 - tip对应在Y轴与触发元素的偏移像素值
//[必须]left - 数字 - tip对应在X轴与触发元素的偏移像素值
//[必须]list - 字符 - list的CSS选择符
//[必须]selector - 字符 - 数值的CSS选择符
//[可选]regex - 正则表达式 - 限制输入使用的正则表达式
//[可选]afterBlur - 函数 - 当blur时要执行的操作，输入参数为input的value

//注意在html中，trigger的元素有tipsource属性，属性写法是"#div"意味着内容从本页面的一个div中获得
(function($){  
	$.fn.extend({   
	tipInput: function(options){
		//默认参数设置
		var defaults = {  
			width : 200,
			position : 20,
			top : 0,
			left : 0,
			list : "li",
			selector : "span"
		}
		

		var options = $.extend(defaults, options);		
		var opt = options;
		var obj = $(this);
		//提示框obj
		var obj_tip = $(obj.attr("tipsource"));
		//用于判断是否应该blur
		var hasBlur = true;
		
		//隐藏提示的函数
		var _hidden = function(){
			obj_tip.hide();
			$(".tip-black, .tip-triangle").hide();
		};
		
		//函数用于获得提示框的绝对位置
		var p = function(){
			//获得当前元素的位置
			var offset = obj.offset();
			return {
				left    : offset.left + opt.left,
				top     : offset.top + obj.height() + opt.top,
				triLeft : offset.left + opt.left + opt.position,
				triTop  :  offset.top + obj.height() + opt.top -4
			};
		};
		
		
		return this.each(function(){ 
							
			//当input聚焦的时候激发提示框
			obj.bind("focus",function(){
				
				//写入div的html代码
				//首先定义tip的核心内容				
				obj_tip.css("position","absolute");
				obj_tip.css("display","block");
				obj_tip.css("z-index","100");
				obj_tip.offset({top:p().top+10,left:p().left+10});
				obj_tip.width(opt.width);
				
				//判断有没有底部覆盖的层
				if($(".tip-black").length>0){
					$(".tip-black").css("top",String(p().top)+"px");
					$(".tip-black").css("left",String(p().left)+"px");
					$(".tip-black").width(opt.width+20);
					$(".tip-black").height(obj_tip.height()+20);
					$(".tip-black").show();
				}else{
					$("body").append("<div class=\"tip-black\" style=\"position:absolute; top:"+String(p().top)+"px; left:"+String(p().left)+"px; background-color:#000; width:"+String(opt.width+20)+"px; height:"+String(obj_tip.height()+20)+"px; filter:alpha(opacity=30); opacity:0.3; -moz-opacity:0.3; z-index:99;\"></div>");
				}

				//判断有没有三角形定位层
				if($(".tip-triangle").length>0){
					$(".tip-triangle").css("top",String(p().triTop)+"px");
					$(".tip-triangle").css("left",String(p().triLeft)+"px");
					$(".tip-triangle").show();
				}else{
					$("body").append("<div class=\"tip-triangle\" style=\"position:absolute; top:"+String(p().triTop)+"px; left:"+String(p().triLeft)+"px; z-index:100; width:15px; height:15px; font-size:15px; line-height:15px; text-align:center; overflow:hidden; color:#fff;\">▲</div>");
				}
				
			});
			
			//提示框内条目的hover效果
			$(obj.attr("tipsource")+" "+opt.list).hover(
				function(){$(this).addClass("hover");},
				function(){$(this).removeClass("hover");}
			);
			//当鼠标在提示区域内点击时，不激发blur事件
			$(obj.attr("tipsource")+" "+opt.list).mousedown(function(){hasBlur=false;});
			
			//关闭Tip
			obj.bind("blur",function(){
				//避免点击触发blur事件
				if(hasBlur) {
					//隐藏Tip
					_hidden();
					//执行定义blur函数
					opt.afterBlur(obj.val());
				}
			});
			
			//当选择框点击时的操作
			$(obj.attr("tipsource")+" "+opt.list).bind("click",function(){				
				//获取选中的天数
				var n = $(this).find(opt.selector).html();
				//写入到input
				obj.val(n);
				//将避免激发blur的参数重置
				hasBlur = true;
				//隐藏那个提示
				_hidden();
				//执行定义blur函数
				opt.afterBlur(obj.val());
			});
			
			//在浏览器窗口大小发生变化时重定位提示框位置
			$(window).resize(function(){
				obj_tip.offset({top:p().top+10,left:p().left+10});
				$(".tip-black").css("top",String(p().top)+"px");
				$(".tip-black").css("left",String(p().left)+"px");
				$(".tip-triangle").css("top",String(p().triTop)+"px");
				$(".tip-triangle").css("left",String(p().triLeft)+"px");
			});
			
			//键盘输入的限制
			if(opt.regex!=null){			
				//不允许直接输入规定正则表达式的内容
				obj.bind("keyup",function(){obj.val(obj.val().replace(opt.regex,''));});				
				//不允许通过复制粘贴来输入正则表达式规定的内容，通过动态委派事件onbeforepaste
				if(window.addEventListener){//非IE浏览器
					obj.addEventListener("onbeforepaste",function(){clipboardData.setData('text',clipboardData.getData('text').replace(opt.regex,''));},false);
				}else{
					obj.attachEvent('onbeforepaste',function(){clipboardData.setData('text',clipboardData.getData('text').replace(opt.regex,''));});
				}
			}
			
//		    TODO : 键盘的上下和回车操作
//			obj.keydown(function(e){
//				switch(e.keyCode){
//				  case 38: // 向上按键
//					break;
//				  case 40: // 向下按键
//					break;
//				  case 13: // 回车键
//					break;
//				  case 27: // ESC键
//					break;
//				  default:
//					break;
//				}
//			});
			
		});  
	}
	});      
})(jQuery);


