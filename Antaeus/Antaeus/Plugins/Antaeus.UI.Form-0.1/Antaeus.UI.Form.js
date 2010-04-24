// Antaeus.UI.Form
// Version 1.0 by lanslot.liu@gmail.com

// checkAll方法用于当用户在下拉菜单中选择“其它”时显示文本输入框让用户输入其它的内容
// Parameters:
// [必须]name - 字符 - 要控制的checkbox的name
(function($){  
	$.fn.extend({   
	checkAll: function(options){
		//默认参数设置
		var defaults = {  
			name:""
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);
			obj.click(function(){
				if(obj.attr("checked")==true){
					$("input[name='"+opt.name+"']").attr("checked",true);
				}else{
					$("input[name='"+opt.name+"']").attr("checked",false);
				}
			});
		});  
	}
	});      
})(jQuery); 

// dropdownNext方法用于当用户在下拉菜单中选择某个选项时显示某一个obj
// Parameters:
// [必须]value - 字符 - 触发事件的值
// [必须]object - 对象 - 要显示的对象
(function($){  
	$.fn.extend({   
	dropdownNext: function(options){
		//默认参数设置
		var defaults = {  
			value:"",
			object:null
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);
			obj.change(function(){
				if(obj.val()==opt.value){
					opt.object.show();
				}else{
					opt.object.hide();
				}
			});
		});  
	}
	});      
})(jQuery); 

// dropdownToggle方法用于当用户在下拉菜单中选择“其它”时显示文本输入框让用户输入其它的内容
// Parameters:
// [必须]judge - 字符 - 在HTML中定义的“其它”这一项的
// [必须]styleClass - 字符 - 要新添加的input的class样式
// [可选]beforeHtml - Html - 前置的html代码
// [可选]afterHtml - Html - 后置的html代码
// [必须]required - 是否 - 是否可以为空
(function($){  
	$.fn.extend({   
	dropdownToggle: function(options){
		//默认参数设置
		var defaults = {  
			judge:"other",
			styleClass:"",
			beforeHtml:"<div class='inp-between'>&nbsp;</div>",
			afterHtml:"",
			required:true
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){ 
			var opt = options;
			var obj = $(this);
			var requiredStr = opt.required?"required='true'":"";
			obj.after(opt.beforeHtml+"<input type='text' class='"+opt.styleClass+"' id='dropdownToggle-target' value='' name='"+opt.judge+"' style='display:none;' "+requiredStr+" />"+opt.afterHtml);
			var target = $("#dropdownToggle-target");
			obj.change(function(){
				if(obj.val()==opt.judge){
					target.show();				
				}else{
					target.hide();
					target.siblings(".warn").hide();
				}
			});		
		});  
	}
	});      
})(jQuery); 

// checkRequired方法用于判断是否输入为空
// [必须]text - 字符 - 出错的文字提示
// [必须]styleClass - 字符 - 要新添加的出错信息的class样式
// [可选]beforeHtml - Html - 前置的html代码
// [可选]afterHtml - Html - 后置的html代码
(function($){  
	$.fn.extend({   
	checkRequired: function(){
		//默认参数设置
		var defaults = {  
			text:"这里的输入不能为空！",
			styleClass:"warn",
			beforeHtml:"<div class=\"blank5\"></div>",
			afterHtml:""
		}                   
		var options = $.extend(defaults, options);
		return this.each(function(){
			var opt = options;
			var obj = $(this);
			var str = opt.beforeHtml+"<div class=\""+opt.styleClass+"\">"+opt.text+"</div>"+opt.afterHtml;
			obj.blur(function(){
				var obj1=$(this);
				var obj2 = obj1.parent().children("."+opt.styleClass);
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
// [可选]insert - 字符串 - 用于插入的链接们的父级元素选择容器，CSS选择器标准填写，例如#selector
// [必选]different - 是否 - 是否必须不一样
// Methods:
// object.separateInput("reload") - 清空原来所有的输入，恢复到刚刚初始载入的时候
// object.separateInput("addtags",["tag1","tag2","tagN"]) - 给现在的插件动态添加几个tag
// object.separateInput("destory") - 摧毁原来的插件加载，解除所有的事件绑定，释放资源，一切恢复到原始状态
(function($){  
	$.fn.extend({   
	separateInput: function(options,tags){
		
		//默认参数设置
		var defaults = {  
			separator:',',  
			width:550,  
			widthMin:100,
			widthCss:10,
			required:true,
			different:true
		};
		
		var opt;
		var operation="";
		
		
		//定义控件中所有用到ID和Class属性名
		var attr = {
			father : "separate-container",
			main   : "separate-input",
			item   : "separate-item",
			fix    : "separate-fix",
			wrap   : "separate-input-wrap"
		};
		
		//全局变量定义
		var _obj = $(this);    //用于获得返回值控制返回值的地方		
		
		

		
		
		return this.each(function(){
								  
								  
			if(typeof(options)=="object"){		
				//将传入参数与默认参数对比，确定最终的参数
				opt = $.extend(defaults, options);
				//将参数写入全局变量
				g_param.AntaeusUIPluginsSeparate = opt;
			}else{
				operation = options;
				//读取全局变量中这个插件的原先设置值
				opt = g_param.AntaeusUIPluginsSeparate;
			}
			
			
			//初始载入时要执行的函数
			var _init = function(){
				//在每次程序执行前清除一遍内容，避免刷新导致的缓存
				_obj.val("");
				//外包一个显示的DIV
				_obj.wrap("<div id='"+attr.father+"' style='width:"+String(opt.width+2)+"px;'></div>");
				//增加一个inp用于显示并且执行所有操作
				_obj.after("<div id='"+attr.wrap+"'><input type='text' id='"+attr.main+"' style='width:"+String(opt.width)+"px' value='"+_obj.attr("tip")+"' /></div>");
				//将原有的作为不可见元素
				_obj.hide();			
				//为了CSS调整增加一个html
				$("#"+attr.wrap).after("<div id='"+attr.fix+"'></div>");
				//如果设置了为空的话，将为空信息的element隐藏
				if(opt.requiredEl!=null) $(opt.requiredEl).hide();
			};
			
			//再次初始地重新载入
			var _reload = function(){
				$("."+attr.item).remove();
				_obj.val("");
				$("#"+attr.main).val(_obj.attr("tip"));
				$("#"+attr.main).css("color","#ccc");
				$("#"+attr.main).css("width",String(Number($("#"+attr.father).css("width").replace("px",""))-2)+"px");
			};
			
			//中途动态地添加tag
			var _addtags = function(tags){
				//alert("haha");
				for(var i=0;i<tags.length;i++) _judge(tags[i]);
				//rewidth();
			};
			
			//摧毁所有的加载项，让一切都恢复到原始状态
			var _destory = function(){
				$("#"+attr.father).before(_obj.clone());
				//释放资源
				$("#"+attr.main).unbind();
				$("."+attr.item+" a").die();
				if(opt.insert!=null) $(opt.insert).children("a").unbind();	
				//恢复显示
				$("#"+attr.father).prev().show();
				//删除html
				$("#"+attr.father).remove();
			};
	
			//删除元素的函数
			var _delete = function(){			
				var temp = $(this).prev().html();
				//删除元素
				$(this).parent().remove();			
				//重置宽度
				rewidth();	
				//删除最终值								
				//针对只有唯一的元素时的特殊判断
				if(_obj.val().indexOf(opt.separator)<0) {
					_obj.val("");
				}else{
					//针对尾部元素进行特殊的判断删除
					if(_obj.val().indexOf(temp+opt.separator)<0){
						_obj.val(_obj.val().replace(opt.separator+temp,""));
					}else{
						//常规删除
						_obj.val(_obj.val().replace(temp+opt.separator,""));
					}
				}			
			};
			
			//重置宽度的函数
			var rewidth = function(){			
				var allwidth = 0;
				$("."+attr.item).each(function(i){
					//每次累加宽度
					allwidth = allwidth + $(this).width() + opt.widthCss;
					//如果累加到的宽度大于行宽度了，则要折行
					if(allwidth > opt.width) allwidth=$(this).width() + opt.widthCss;
				});
	
				//判断删除后的最后一行的宽度和现在的宽度比如何
				if((opt.width-allwidth)>opt.widthMin){
					$("#"+attr.main).css("width",String(opt.width-allwidth)+"px");
				}else{
					$("#"+attr.main).css("width",String(opt.width)+"px");
				}
			};
			
			//聚焦的相关操作
			var _focus = function(){
				if($(this).val()==_obj.attr("tip")) $(this).val("");
				$(this).css("color","#000");
			};
			
			var _keyup = function(){
				var str = $(this).val();
				var len = str.length;
				//获取最后一个输入的字符
				var str1 = str.substring(len-1,len);
				//如果输入的是指定的分隔符
				if(str1==opt.separator){
					//执行函数进行操作
					_judge($.trim(str.substring(0,len-1)));					
					//清除原来的输入框中的内容
					$(this).val("");					
				}
			};
			
			var _blur = function(){
				//如果用户输入了标签但是只是输入一个并没有输入分隔符的时候
				if($(this).val()!="") {
					_judge($.trim($(this).val()));
					$(this).val("");
				}
				//如果此项输入不能为空
				if(opt.required){
					if(_obj.val()==""){
						$(opt.requiredEl).show();
					}else{
						$(opt.requiredEl).hide();
					}
				}
				//清空红色的边框
				$("."+attr.item).css("border-color","");
			};
			
			//这里是最核心的一个操作，因为要用两次，所以用函数包起来
			var _core = function(str){			
				//如果还有默认提示的话则去除
				if($("#"+attr.main).val()==_obj.attr("tip")) $("#"+attr.main).val("");
				//添加一个特殊显示的Tag
				$("#"+attr.wrap).before("<div class='"+attr.item+"'><span>"+str+"</span><a></a></div>");
				//重置宽度
				rewidth();
				//将最终结果写入指定的地方
				if(_obj.val()!=""){
					_obj.val(_obj.val()+opt.separator+str);					
				}else{
					_obj.val(_obj.val()+str);
				}
			};		
			
			//加了排重判断后在外面再包一个函数
			var _judge = function(str){			
				//判断是否为空的字符
				if($.trim(str)=="") return false;
				var dothat = true;			
				//为了防止用户输入得太快了，把分隔符也输入进去了
				str = str.split(opt.separator);
				for(var j=0;j<str.length;j++){				
					//判读是否有排重
					if(opt.different && $.trim(_obj.val())!=""){
						var temp = _obj.val().split(",");
						for (var i=0;i<temp.length;i++)	if(temp[i]==str[j]) dothat = false;		
					}			
					if(dothat){
						_core(str[j]);
					}else{
						//如果有重复的则标红提示
						$("."+attr.item).each(function(i){
							if($.trim($(this).children().html())==str[j]) $(this).css("border-color","#ff0000");
						});
					}
					dothat = true;
				}
			};			
			
			if(operation==""){			
				//执行初始化函数
				_init();
				//聚焦时删除提示文字
				$("#"+attr.main).bind("focus",_focus);
				//当键盘输入文字时
				$("#"+attr.main).bind("keyup",_keyup);
				//当输入框失去聚焦
				$("#"+attr.main).bind("blur",_blur);
				//动态地给删除绑定事件
				$("."+attr.item+" a").live("click",_delete);			
				//如果定义了链接的点击插入模式的话，执行相应的操作
				if(opt.insert!=null) $(opt.insert).children("a").bind("click",function(){_judge($.trim($(this).html()));});				
			}			
			if(operation=="reload") _reload();			
			if(operation=="destory") _destory();
			if(operation=="rewidth") rewidth();
			if(operation=="addtags" && tags!=null && tags!="") _addtags(tags);			
		});  
	}  
	});      
})(jQuery); 