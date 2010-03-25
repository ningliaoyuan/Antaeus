// JavaScript Document

//定义核心使用的AJAX调用URL
//{n}参数名称[n]参数值

var url = {
	login            : "/Account/Logon/?Username=[0]&Password=[1]&RememberMe=[2]",
	logout           : "/Account/Logout/",
	favoriteTagAdd   : "/Tag/Add/Question/[0]/[1]",
	favoriteTagEdit  : "/Tag/Edit/Question/[0]/[1]",
	rate             : "/Question/Rate/[0]?rate=[1]",
	wiki             : "/Question/EditAnswer/[0]?WikiContent=[1]",
	questionFormType : "/Question/Form/[0]" 
};

var fun = {
	wiki : function(){
		alert("你的修改已经成功提交，感谢你的贡献。");
		WikiEditDestory();
	}
};

function runAJAX(url,para,fun){
	
	var errorMessage = "";
	var finalData;
	
	//首先判断url有没有
	if(url==null || url==""){
		errorMessage = "你不能够请求一个空的URL";
		return false;
	}
		
	//然后判断是post还是get方法
	var ajaxType = (url.indexOf("?")>0) ? "POST" : "GET";
	
	var targetURL = url;
	var targetPara = "";
	
	//判断有没有参数，如果有参数的话，则要循环替换参数
	if(para.length>0){
		for(i=0;i<para.length;i++){
			targetURL = targetURL.replace("["+i+"]",para[i]);
		}
	}		
	
	//如果是post的方法，在替换完参数之后，将要把URL和para分离
	if(ajaxType=="POST"){
		targetPara = targetURL.split("?")[1];
		targetURL = targetURL.split("?")[0];
	}
	
	//alert(ajaxType+" | "+targetURL+"?"+targetPara);
	
	//开始进行核心的AJAX操作
	$.ajax({
		async    : true,
		type     : ajaxType,
		url      : targetURL,
		data     : targetPara,
		cache    : false,
		dataType : "json",
		timeout  : 5000,
		error    : function(XMLHttpRequest, textStatus, errorThrown){
    		var s1 = "";
			var s2 = "你对于"+this.url+"?"+this.data+"的请求失败。";
			if(textStatus=="timeout")     s1="因为超时，";
			if(textStatus=="error")       s1="因为其它错误，";
			if(textStatus=="notmodified") s1="因为请求页面无变化，";
			if(textStatus=="parsererror") s1="因为请求地址不存在，";
			errorMessage = s1+s2;
			//alert(this.data);
		},
		success  : function(data, textStatus, XMLHttpRequest){
			alert("haha2");
			//定义判断请求返回是不是正确需要的数值
			if(data.status=="error"){
				errorMessage = data.errorMessage;
			}else if(data.status=="success"){
				finalData = data.htmlText;
			}else{
				errorMessage = "服务器端没有返回预想的结果！";
			}
		}
	});
	
	//最终返回调用结果
	if(errorMessage!=""){
		alert(errorMessage);
	}else{
		fun(finalData);
	}	
	//return false;
}