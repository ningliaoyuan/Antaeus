// Antaeus.UI.Form
// Version 0.1 by lanslot.liu@gmail.com

//全替换的ReplaceAll的定义
String.prototype.replaceAll=function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}
//用于全替换特殊字符
String.prototype.replaceSpecial=function(){
	return this.replaceAll("\n", "").replaceAll(" ", "").replaceAll("\t", "").replaceAll("&nbsp;", "").toLowerCase().replaceAll("<p></p>", "");
}

//函数用于执行顶端导航的AJAX提交表单
function FormLoginSubmit(place) {
	sPopup = "#PopupLoginForm";
	sUsername = $("#FormLogin" + place + " #Username").attr("value");
	sPassword = $("#FormLogin" + place + " #Password").attr("value");
	sRememberMe = $("#FormLogin" + place + " #RememberMe").attr("value");
	if (sUsername == "" || sUsername == "昵称或邮箱地址" || sPassword == "") {
		alert("用户名和密码都不能为空！");
	} else {
		$.post(
			"/Account/Logon/",
			{ Username: sUsername, Password: sPassword, RememberMe: sRememberMe },
			function(data) {
				//如果是顶端的用户登陆
				if (place == "Header") {
					if (data.indexOf("error:") >= 0) {
						$(sPopup+" #LoginErrorMessage").html(data.replace("error:", ""));
						$(sPopup+" input#Username").attr("value", sUsername);
						Popup(sPopup.replace("#",""),function(){FormLoginSubmit("Popup");});
						$(sPopup).dialog("open");
						return false;
					} else {
						$("#logon").html(data);
					}
				//如果是Popup登陆
				} else {
					if (data.indexOf("error:") >= 0) {
						alert("登录失败：" + data.replace("error:", ""));
					} else {
						$("#logon").html(data);
						$(sPopup).dialog('close');
						return false;
					}
				}
			},
			"html"
		);
	}
}

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

//Popup函数用于执行基本的Dialog调用设置
function Popup(id,fun){
    $("#"+id).dialog({ //这是对话框的基本设置
        autoOpen: false,
        width: 600,
        buttons: {
            "Ok": function() {
				if(fun==null){
					$(this).dialog("close");
				}else{
					fun();
				}
            },
            "Cancel": function() {
                $(this).dialog("close");
            }
        },
		draggable: true,
		modal: true,
		resizable:true,
		show:"slide"
    });
}

//FavoriteTagAdd函数用于添加Tag
function FavoriteTagAdd(popupid){
	Popup(popupid,function(){
		var tags = $.trim($("#FavoriteTagsInput").val());
		if(tags==""){
			alert("标签输入不能为空！");
		}else{
			$.get(
				"/tag/add/Question/1/"+tags,
				function(data){
					if($.trim(data)=="ok"){
						$("#PopupFavoriteAdd").dialog("close");
					}else{
						alert("有错误发生，你的操作没有被执行！");
					}
				}
			);
		}
	});
	$("#"+popupid).dialog("open");
}

//PopupAJAX函数用于AJAX性质地产生并且激发一个Popup
function PopupAJAX(target,fun){	
	//创建一个加载Popup的DIV，由于同页面可能有多个Popup，因此通过随机数产生ID
	var divID="Dialog"+String(parseInt(Math.random()*100000));		
	$("body").append("<div id='"+divID+"' class='hidden'></div>");
	var divObj = $("#"+divID);
	//为了避免网速问题，加入载入中的显示
	divObj.attr("title","内容载入中...");
	divObj.html("内容载入中...");
	divObj.load(target.substring(1), {}, function() {
		//还是因为滞后性因此两个都要写，一个直接改控件中的标题，一个是希望在控件在载入前改标题
		divObj.attr("title",divObj.children().attr("title"));
		$(".ui-dialog-title").html(divObj.children().attr("title"));				
	});
	//由于AJAX载入的滞后性，下面两行代码不能与前面判断相同的内容一起提取到if外面执行
	var Dialog = Popup(divID,fun);
	divObj.dialog("open");
	return false;
}

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


