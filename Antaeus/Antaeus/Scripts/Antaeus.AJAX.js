//// JavaScript Document
//
////定义核心使用的AJAX调用URL
////数组第一项只有GET和POST两种
////数组第二项为请求的URL和参数，参数中需要的变量值都依次用[X]代替
//
//var url = {
//	login            : ["POST", "/Account/Logon/?Username=[0]&Password=[1]&RememberMe=[2]"],
//	logout           : ["GET" , "/Account/Logout/"],
//	favoriteTagAdd   : ["POST", "/Tag/Add/Question/[0]/[1]"],
//	favoriteTagEdit  : ["POST", "/Tag/Edit/Question/[0]/[1]"],
//	rate             : ["POST", "/Question/Rate/[0]?rate=[1]"],
//	rateAverage      : ["GET" , "/Question/GetAverage/[0]"], 
//	wiki             : ["POST", "/Question/EditAnswer/[0]?WikiContent=[1]"],
//	questionFormType : ["GET" , "/Question/Form/[0]"] 
//};
//
////=============================================================================================
////这里定义所有AJAX请求的后继操作函数，函数的hash名称都是与上面url的JSON名称一致
//var fun = {};
//fun["wiki"] = function(){
//	alert("你的修改已经成功提交，感谢你的贡献。");
//	WikiEditDestory();
//};
//
//
////=============================================================================================
////函数runAJAX
////url     ：传入的是上面的URL表中的值
////para    : url表中需要的参数值
////fun     : 在ajax请求成功后要执行的函数名
////fun_para: 在ajax请求成功后要执行的函数的参数
//
//function runAJAX(url,para,fun,fun_para){
//	
//	var errorMessage = "";
//	var finalData;
//	
//	//首先判断url有没有
//	if(url[1]==null || url[1]==""){
//		errorMessage = "你不能够请求一个空的URL";
//		return false;
//	}
//		
//	//然后判断是post还是get方法
//	var ajaxType = url[0];
//	
//	var targetURL = url[1];
//	var targetPara = "";
//	
//	//判断有没有参数，如果有参数的话，则要循环替换参数
//	if(para.length>0){
//		for(i=0;i<para.length;i++){
//			targetURL = targetURL.replace("["+i+"]",para[i]);
//		}
//	}		
//	
//	//如果是post的方法，在替换完参数之后，将要把URL和para分离
//	if(ajaxType=="POST"){
//		targetPara = targetURL.split("?")[1];
//		targetURL = targetURL.split("?")[0];
//	}
//	
//	//开始进行核心的AJAX操作
//	$.ajax({
//		async    : true,
//		type     : ajaxType,
//		url      : targetURL,
//		data     : targetPara,
//		cache    : false,
//		dataType : "text",
//		timeout  : 5000,
//		error    : function(XMLHttpRequest, textStatus, errorThrown){
//    		var s1 = "";
//			var s2 = "你对于"+this.url+"的请求失败。";
//			if(textStatus=="timeout")     s1="因为超时，";
//			if(textStatus=="error")       s1="因为其它错误，";
//			if(textStatus=="notmodified") s1="因为请求页面无变化，";
//			if(textStatus=="parsererror") s1="因为请求地址不存在，";
//			alert(s1+s2);
//		},
//		success  : function(data, textStatus, XMLHttpRequest){
//			//首先判断是POST还是GET			
//			if(this.type=="POST" && data.split(":")[1]=="error"){
//				alert("发生了错误！错误原因是："+data.split(":")[1]);
//				return false;
//			}else{
//				if(this.type=="GET") $(fun_para[0]).html(data);
//				if(fun!=null) fun(fun_para);
//				return true;
//			}
//		}
//	});
//
//}


//AJAX的全局设定
$.ajaxSetup({
	async    : true,
	cache    : false,
	dataType : "text",
	timeout  : 5000,
	error    : function(XMLHttpRequest, textStatus, errorThrown){
		var s1 = "";
		var s2 = "你对于"+this.url+"的请求失败。";
		if(textStatus=="timeout")     s1="因为超时，";
		if(textStatus=="error")       s1="因为其它错误，";
		if(textStatus=="notmodified") s1="因为请求页面无变化，";
		if(textStatus=="parsererror") s1="因为请求地址不存在，";
		alert(s1+s2);
		if(g_param.ajaxEnduringObj!=null && typeof(g_param.ajaxEnduringObj)=="object")	ajaxLoading(g_param.ajaxEnduringObj);
	}
});

//所有AJAX的直接请求URL判断与控制
var ajaxFunction = {};
ajaxFunction["RateAverge"]             = function(param, callback){$.get("/Question/GetAverage/"+param.qID, callback);}
ajaxFunction["LogonContent"]           = function(param, callback){$.get("/Account/LogOnUserControl", callback);};
ajaxFunction["FormQuestionCreateLoad"] = function(param, callback){$.get("/Question/Form/" + param.type, callback);};
ajaxFunction["FavoriteAdd"]            = function(param, callback){$.get("/NormalUser/FavoriteAdd", {key:param.qType, id: param.qID},callback);}
ajaxFunction["FavoriteRemove"]         = function(param, callback){$.get("/NormalUser/FavoriteRemove", {key:param.qType,id: param.qID}, callback);}
ajaxFunction["FavoriteAddTags"]        = function(param, callback){$.get("/NormalUser/FavoriteAddTags",{key:param.qType, id : param.qID, tags:param.tags},callback);}

////rFunction系列函数用于执行各项refresh的AJAX操作
//var rFunction = {};

//rFunction["FavoriteItemsGet"] = function (param, callback) {
//	//传入参数param.qType="question"
//	$.get("",
//        function(data){ajaxCallback(data,callback);}
//	);
//};
//
////dFunction系列函数用于执行各项post类执行的AJAX操作
//var dFunction = {};
//dFunction["RateQuestion"] = function(param, callback){
//	$.get("/Question/Rate/" + param.qID, { rate: param.qValue },
//        callback
//	);
//}
//
//dFunction["FavoriteAddWithTags"] = function(param, callback){
//	//传入参数param.qID=1234,param.qType="question",param.tags="tag1,tag2,tag3"
//	$.get("",
//        function(data){ajaxCallback(data,callback);}
//	);
//}


//Refresh函数用于调用AJAX来自我刷新
function ajaxRefresh(obj, param) {
    var f = obj.attr("ajaxrefresh");
    obj.html("loading...");
    ajaxFunction[f](param, function(data) { obj.html(data); });
}

//obj发起请求的html上的obj
//param要请求的url相关需要的参数
//callback请求结束后要执行的函数

function ajaxRequest(obj,param,callback){
	//将主控元素写入全局变量，这个主要是给在任何地方控制出错回滚用的
	g_param.ajaxEnduringObj = obj;
	
	if(obj.attr("ajaxrequest")!=null && obj.attr("ajaxrequest")!=""){
		//发起请求的obj进入loading状态
		ajaxLoading(obj);
		//执行并获得ajax请求的结果
		ajaxFunction[obj.attr("ajaxrequest")](param,function(data){
			//请求结束了返回非loading状态
			ajaxLoading(obj);
			//判断请求返回的结果
			if(data.substring(0,6)=="error:"){
				alert(data.replace("error:",""));			
			}else{
				callback(data);
			}
		});	
	}
}

//函数ajaxLoading用于执行让ajax请求的主控元素进入loading状态或者回滚
function ajaxLoading(obj){
	//从全局变量中获得主控元素
	//var obj=g_param.ajaxEnduringObj;
	//判断主控元素有没有loading装态
	if(obj.next().attr("ajaxstatus")=="loading"){
		obj.next().toggle();
		obj.toggle();
	}
}


