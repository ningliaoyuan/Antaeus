// JavaScript Document

//定义核心使用的AJAX调用URL
//{n}参数名称[n]参数值

var url = {
	login            : ["POST", "/Account/Logon/?Username=[0]&Password=[1]&RememberMe=[2]"],
	logout           : ["GET" , "/Account/Logout/"],
	favoriteTagAdd   : ["POST", "/Tag/Add/Question/[0]/[1]"],
	favoriteTagEdit  : ["POST", "/Tag/Edit/Question/[0]/[1]"],
	rate             : ["POST", "/Question/Rate/[0]?rate=[1]"],
	rateAverage      : ["GET" , "/Question/GetAverage/[0]"], 
	wiki             : ["POST", "/Question/EditAnswer/[0]?WikiContent=[1]"],
	questionFormType : ["GET" , "/Question/Form/[0]"] 
};

//=============================================================================================
var fun = {};

fun["wiki"] = function(){
	alert("你的修改已经成功提交，感谢你的贡献。");
	WikiEditDestory();
};


//=============================================================================================
//函数runAJAX
function runAJAX(url,para,fun,fun_para){
	
	var errorMessage = "";
	var finalData;
	
	//首先判断url有没有
	if(url[1]==null || url[1]==""){
		errorMessage = "你不能够请求一个空的URL";
		return false;
	}
		
	//然后判断是post还是get方法
	var ajaxType = url[0];
	
	var targetURL = url[1];
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
	
	//开始进行核心的AJAX操作
	$.ajax({
		async    : true,
		type     : ajaxType,
		url      : targetURL,
		data     : targetPara,
		cache    : false,
		dataType : "text",
		timeout  : 5000,
		error    : function(XMLHttpRequest, textStatus, errorThrown){
    		var s1 = "";
			var s2 = "你对于"+this.url+"?"+this.data+"的请求失败。";
			if(textStatus=="timeout")     s1="因为超时，";
			if(textStatus=="error")       s1="因为其它错误，";
			if(textStatus=="notmodified") s1="因为请求页面无变化，";
			if(textStatus=="parsererror") s1="因为请求地址不存在，";
			errorMessage = s1+s2;
		},
		success  : function(data, textStatus, XMLHttpRequest){
			//alert(this.type);
			//首先判断是POST还是GET			
			if(this.type=="POST" && data.split(":")[1]=="error"){
				alert("发生了错误！错误原因是："+data.split(":")[1]);
				return false;
			}else{
				if(this.type=="GET"){
					//alert(fun_para[0]);
					$(fun_para[0]).html(data);
				}else{
					if(fun!=null) fun(fun_para);
				}
				return true;
					//fun(fun_para,data);
//				}
			}
		}
	});

}