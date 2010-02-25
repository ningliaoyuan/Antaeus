// Antaeus.UI.Form
// Version 1.0 by lanslot.liu@gmail.com

// dropdownToggle方法用于当用户在下拉菜单中选择“其它”时显示文本输入框让用户输入其它的内容
// Parameters:
// [必须]judge - 字符 - 在HTML中定义的“其它”这一项的
// [必须]class - 字符 - 要新添加的input的class样式
// [可选]beforeHtml - Html - 前置的html代码
// [可选]afterHtml - Html - 后置的html代码
// [必须]required - 是否 - 是否可以为空
(function($){  
	$.fn.extend({   
	dropdownToggle: function(options){
		//默认参数设置
		var defaults = {  
			judge:"other",
			class:"",
			beforeHtml:"<div class='inp-between'>&nbsp;</div>",
			afterHtml:"",
			required:true
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);
			var requiredStr = opt.required?"required='true'":"";
			obj.after(opt.beforeHtml+"<input type='text' class='"+opt.class+"' id='dropdownToggle-target' value='' name='"+opt.judge+"' style='display:none;' "+requiredStr+" />"+opt.afterHtml);
			var target = $("#dropdownToggle-target");
			obj.change(function(){
				if(obj.val()==opt.judge){
					target.show();				
				}else{
					target.hide();
				}
			});		
		});  
	}
	});      
})(jQuery); 

// checkRequired方法用于判断是否输入为空
// [必须]text - 字符 - 出错的文字提示
// [必须]class - 字符 - 要新添加的出错信息的class样式
// [可选]beforeHtml - Html - 前置的html代码
// [可选]afterHtml - Html - 后置的html代码
(function($){  
	$.fn.extend({   
	checkRequired: function(){
		//默认参数设置
		var defaults = {  
			text:"这里的输入不能为空！",
			class:"warn",
			beforeHtml:"<div class=\"blank5\"></div>",
			afterHtml:""
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){
			var opt = options;
			var obj = $(this);
			var str = opt.beforeHtml+"<div class=\""+opt.class+"\">"+opt.text+"</div>"+opt.afterHtml;
			obj.blur(function(){
				var obj1=$(this);
				var obj2 = obj1.parent().children("."+opt.class);
				var related = obj1.attr("related");
				//这里这个定义用来判断是否真的为空
				var whether = false;
				//首先判断没有相关项的情况
				if(related==null){
					if($.trim(obj1.val())=="") whether = true;
				}else{
					$("input[related='"+related+"'], textarea[related='"+related+"']").each(function(i){
						if($.trim($(this).val())=="") whether = true;
					});
				}
				
				if(whether){
					//只有没有错误信息显示的时候才添加错误信息
					if(obj1.parent().html().indexOf(str)<0) obj1.parent().append(str);
				}else{			
					if(obj2){						
						obj2.prev().remove();
						obj2.remove();
					}
				}
			});
		});  
	}
	});      
})(jQuery); 

// removeDefault方法用于去除那些初始在文本框内的提示信息
// Parameters:无
(function($){  
	$.fn.extend({
	removeDefault: function(){
		return this.each(function(){
			var obj = $(this);
			var str = obj.val();			
			if(str!=""){ //需要判断如果没有初始值的话其实是不进行操作的
				obj.focus(function(){
					obj.val("");
				});
				obj.blur(function(){
					if($.trim(obj.val())=="") obj.val(str);
				});
			}
		});  
	}
	});      
})(jQuery); 

// 用于表单中的input元素，主要用于结构化确定化地让用户输入Tag，还可以用于让用户输入收件人之类的东西
// Parameters:
// [必须]separator - 字符 - 分隔符
// [必须]width - 数字 - input的CSS的width的像素值  
// [必须]widthMin - 数字 - 当小于此宽度时就要折行
// [必须]widthCss - 数字 - 每个块状元素显示时的CSS占位宽度
// [必选]required - 是否 - 是否可以为空
// [必选]requiredEl - 字符串 - 为空错误信息的selector
// [可选]widthCssIE6 - 数字 - CSS中用于调整子父级元素magrin会翻倍的bug，为定义的CSS中的margin的一半
// [可选]insert - 字符串 - 用于插入的链接们的父级元素选择容器，CSS选择器标准填写，例如#selector
// [必选]different - 是否 - 是否必须不一样
(function($){  
	$.fn.extend({   
	separateInput: function(options){
		//默认参数设置
		var defaults = {  
			separator:',',  
			width:550,  
			widthMin:100,
			widthCss:17,
			required:true,
			different:true
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){  
			var opt = options;			
			//外包一个显示的DIV
			$(this).wrap("<div id='separate-container'></div>");
			//增加一个inp用于显示并且执行所有操作
			$(this).after("<input type='text' id='separate-inp-show' style='width:"+opt.width+"px' />");
			//将原有的作为不可见元素
			$(this).css("display","none");
			//定义主控元素
			var obj = $(this).next("#separate-inp-show");
			//为了CSS调整增加一个html
			obj.after("<div style='clear:both; font-size:1px; line-height:1px; font-size:1px;'></div>");
			//定义各种全局变量
			var width = opt.width;
			var lineFirst = true;
			//在每次程序执行前清除一遍内容，避免刷新导致的缓存
			$(this).val("");
			var final = $(this).val();
			//定义获得最终值的地方
			var obj_return = $(this);
			//如果设置了为空的话，将为空信息的element隐藏
			if(opt.requiredEl!=null) $(opt.requiredEl).hide();
			
			//这里是最核心的一个操作，因为要用两次，所以用函数包起来
			function coreInsert(str){
				//为了万恶的IE6，要专门做个修正，这个修正还是导致有1px的不完美，而且
				if(lineFirst && opt.widthCssIE6!=null){
					obj.before("<div class='separate-item' style='_margin-left:"+opt.widthCssIE6+"px;'><span>"+str+"</span><a>x</a></div>");
				}else{
					obj.before("<div class='separate-item'><span>"+str+"</span><a>x</a></div>");
				}
				lineFirst = false;
				//计算字符占位宽度
				var widthItem = obj.prev().width();				
				//给新添加的html绑定事件			
				obj.prev().children("a").bind("click",function(){				
					var obj1=$(this).parent();
					var lineChange = false;					
					//判断当前删除元素与input之间有没有折行
					do{
						obj1 = obj1.next();
						//通过折行标签判断是否折行
						if(obj1.css("clear")=="both") lineChange = true;
					}while(obj1.attr("id")!=obj.attr("id"))			
					//如果没有折行的话，还要进行宽度的重新计算
					if(!lineChange){
						//获得宽度
						widthItem = $(this).parent().width();						
						//重新算一下宽度
						width = width + widthItem + opt.widthCss;				
						//执行宽度的重置
						obj.css("width",String(width)+"px");
					}					
					//删除最终值
					var temp = $(this).prev().html();					
					//针对只有唯一的元素时的特殊判断
					if(final.indexOf(opt.separator)<0) {
						final="";
					}else{
						//针对尾部元素进行特殊的判断删除
						if(final.indexOf(temp+opt.separator)<0){
							final = final.replace(opt.separator+temp,"");
						}else{
							//常规删除
							final = final.replace(temp+opt.separator,"");
						}
					}
					obj_return.val(final);
					//删除元素
					$(this).parent().remove();
				});
				//重新计算宽度
				width = width - widthItem - opt.widthCss;				
				//判断是否需要折行
				if(width<opt.widthMin){
					obj.before("<div style='clear:both;'></div>");
					lineFirst = true;
					width = opt.width;
				}
				//调整位置来显示
				obj.css("width",String(width)+"px");
				//将最终结果写入指定的地方
				if(final!=""){
					final = final+opt.separator+str;					
				}else{
					final = final+str;
				}
				obj_return.val(final);
			}
			
			//加了排重判断后在外面再包一个函数
			function doInsert(str){
				//判断是否为空的字符
				if(str!=""){
					//判读是否有排重
					if(opt.different && final.indexOf(str)>=0){
						//如果有重复的则标红提示
						$(".separate-item").each(function(i){
							if($.trim($(this).children().html())==str) $(this).css("border-color","#ff0000");
						});
					}else{
						 coreInsert(str);
					}
				}
			}
			
			obj.keyup(function(){
				var str = obj.val();
				var len = str.length;
				//获取最后一个输入的字符
				var str1 = str.substring(len-1,len);
				//如果输入的是指定的分隔符
				if(str1==opt.separator){
					//往前面插入一个div
					var str2 = $.trim(str.substring(0,len-1));
					//执行函数进行操作
					doInsert(str2);					
					//清除原来的输入框中的内容
					obj.val("");					
				}			
			});	
			//如果定义了链接的点击插入模式的话，执行相应的操作
			if(opt.insert!=null){
				$(opt.insert).children("a").bind("click",function(){
					doInsert($.trim($(this).html()));
				});
			}			
			obj.blur(function(){
				//如果用户输入了标签但是只是输入一个并没有输入分隔符的时候
				if(obj.val()!="") {
					doInsert($.trim(obj.val()));
					obj.val("");
				}
				//如果此项输入不能为空
				if(opt.required){
					if(obj_return.val()==""){
						$(opt.requiredEl).show();
					}else{
						$(opt.requiredEl).hide();
					}
				}
				//清空红色的边框
				$(".separate-item").css("border-color","");
			});
		});  
	}  
	});      
})(jQuery); 