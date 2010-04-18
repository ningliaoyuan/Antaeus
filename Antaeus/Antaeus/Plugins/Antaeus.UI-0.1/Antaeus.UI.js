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
//当在popup提交登陆时
var loginSubmitPopup = function(){
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
var loginSubmitHeader = function(){
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
//[可选]cancel - 函数 - 取消按钮的函数
//[可选]top - 数字 - 垂直方向位置。如果不写这个的话，将会默认在页面正中间显示，否则将按照这个参数值来显示位置
(function($){  
	$.fn.extend({   
	popup: function(options){
		//默认参数设置
		var defaults = { 
			width        : 500,
			save         : "保&nbsp;&nbsp;存",
			cancel       : "取消",
			ajax         : ""
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
			//opt = g_param.AntaeusUIPluginsPopup;
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
			var s1="<div class='"+attr.button+"'><a class='"+attr.save+"'%%%>"+opt.save+"</a>";
			var s2="<a class='"+attr.cancel+"'>"+opt.cancel+"</a></div>";
			var s3=" ajaxrequest='"+opt.ajax+"'";
			if(opt.ajax==""){
				$("#"+_id+" ."+attr.content).after(s1.replace("%%%","")+s2);
			}else{
				$("#"+_id+" ."+attr.content).after(s1.replace("%%%",s3)+"<a class='"+attr.loading+"' ajaxstatus='loading' style='display:none'>操作中...</a>"+s2);
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
			if(opt.submit!=null && typeof(opt.submit)=="function") {
				$("#"+_id+" ."+attr.save).bind("click",{obj:$(this)},opt.submit);
			}else{
				$("#"+_id+" ."+attr.save).bind("click",_close);
			}
			//绑定取消的函数
			if(opt.withdraw!=null && typeof(opt.withdraw)=="function"){
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
				$("#"+_id).fadeIn("fast");
			});
		};
		//关闭popup
		var _close = function(){
			$("#"+_id).fadeOut("fast",function(){
				$("#"+_cid).fadeOut("fast",function(){
					$("#"+_cid).hide();
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






