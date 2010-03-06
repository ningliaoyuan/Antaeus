// Antaeus.UI.Form
// Version 0.1 by lanslot.liu@gmail.com

//全替换的ReplaceAll的定义
String.prototype.replaceAll=function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

//函数用于执行顶端导航的AJAX提交表单
function FormLoginSubmit(place) {
	sPopup = "#PopupLoginForm";
	sUsername = $("#FormLogin" + place + " #Username").attr("value");
	sPassword = $("#FormLogin" + place + " #Password").attr("value");
	sRememberMe = $("#FormLogin" + place + " #RememberMe").attr("value");
	//alert(sUsername+","+sPassword+","+sRememberMe);
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
						DialogLoad(sPopup.replace("#",""));
						$(sPopup).dialog("open");
						return false;
					} else {
						$("#logon").html(data);
					}
				//如果是Popup登陆
				} else {
					if (data.indexOf("LoginErrorMessage") >= 0) {
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


// filter方法用于动态提供筛选
// Parameters:
// [必须]ajax - 字符 - 发送请求的URL

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