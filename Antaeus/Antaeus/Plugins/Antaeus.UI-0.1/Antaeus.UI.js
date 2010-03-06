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
						DialogLoad(sPopup.replace("#",""),function(){FormLoginSubmit("Popup");});
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

//DialogLoad函数用于执行基本的Dialog调用设置
function DialogLoad(ID,fun){
    $("#"+ID).dialog({ //这是对话框的基本设置
        autoOpen: false,
        width: 600,
        buttons: {
            "Ok": function() {
				fun();
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

//DialogRun函数用于执行Dialog的全部行为
// 关联于DialogLoad函数		
//============================================================================
//如果一个链接点击时需要激发Dialog，请在这个链接的HTML代码标签内加入rel='dialog'
//下面是这个操作的代码，激发后将动态产生一个DIV层，来载入Dialog
//关于Dialog的设置属性，请参见前面的DialogLoad函数的设定，这个函数将再次判断ID来确定“OK”按钮和“Cancel”按钮的操作
function dialogRun(ID,fun) {  //这是点击相关链接触发对话框事件的定义
	var target = $("#"+ID).attr("href");
	
	//创建一个加载Popup的DIV，由于同页面可能有多个Popup，因此通过随机数产生ID
	var divID="Dialog"+String(parseInt(Math.random()*100000));		
	$("body").append("<div id='"+divID+"' class='hidden'></div>");
	var divObj = $("#"+divID);
	
	//判断是直接性DIV载入还是AJAX载入
	if(target[1]!="#"){ //直接DIV载入
		divObj.html($(target).html());
		divObj.attr("title",$(target).attr("title"));
		var Dialog = DialogLoad(divID,fun);
		divObj.dialog("open");
	}else{ //AJAX载入
		//为了避免网速问题，加入载入中的显示
		divObj.attr("title","内容载入中...");
		divObj.html("内容载入中...");
		divObj.load(target.substring(2), {}, function() {
			//还是因为滞后性因此两个都要写，一个直接改控件中的标题，一个是希望在控件在载入前改标题
			divObj.attr("title",divObj.children().attr("title"));
			$(".ui-dialog-title").html(divObj.children().attr("title"));				
		});
		//由于AJAX载入的滞后性，下面两行代码不能与前面判断相同的内容一起提取到if外面执行
		var Dialog = DialogLoad(divID,fun);
		divObj.dialog("open");
	}
	return false;
}
			


