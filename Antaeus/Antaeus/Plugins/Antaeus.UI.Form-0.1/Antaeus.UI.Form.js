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
// [可选]widthCssIE6 - 数字 - CSS中用于调整子父级元素magrin会翻倍的bug，为定义的CSS中的margin的一半
// [可选]insert - 字符串 - 用于插入的链接们的父级元素选择容器，CSS选择器标准填写，例如#selector
// [必选]different - 是否 - 是否必须不一样
// [可选]tags - 字符串 - 初始载入的tag
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
		};
		//将传入参数与默认参数对比，确定最终的参数
		var opt = $.extend(defaults, options);
		
		//定义控件中所有用到ID和Class属性名
		var attr = {
			father : "separate-container",
			main   : "separate-inp-show",
			item   : "separate-item",
			clear  : "separate-item-clear",
			fix    : "separate-inp-fix"
		};
		
		//全局变量定义
		var _obj = $(this);    //用于获得返回值控制返回值的地方		
		var tip = _obj.val();  //定义原标签的默认提示文字
		var width = opt.width; //用于随时获取当前宽度
		var lineFirst = true;       //定义是否第一行		
		
		
		//初始载入时要执行的函数
		var _init = function(obj,tip){
			//在每次程序执行前清除一遍内容，避免刷新导致的缓存
			_obj.val("");
			//外包一个显示的DIV
			obj.wrap("<div id='"+attr.father+"'></div>");
			//增加一个inp用于显示并且执行所有操作
			obj.after("<input type='text' id='"+attr.main+"' style='width:"+opt.width+"px' value='"+tip+"' />");
			//将原有的作为不可见元素
			obj.hide();			
			//为了CSS调整增加一个html
			$("#"+attr.main).after("<div id='"+attr.fix+"' style='clear:both; font-size:1px; line-height:1px; font-size:1px;'></div>");
			//如果设置了为空的话，将为空信息的element隐藏
			if(opt.requiredEl!=null) $(opt.requiredEl).hide();	
		};
		
		//摧毁所有设置，让一切重回原样
		var _destory = function(){
			$(this).show();
			$("#"+attr.father).before($(this).clone());
			$("#"+attr.father).remove();
			$(opt.insert).children("a").unbind();
		};

		//删除元素的函数
		var _delete = function(){
			var obj1=$(this).parent();
			var lineChange = false;					
			//判断当前删除元素与input之间有没有折行
			do{
				obj1 = obj1.next();
				//通过折行标签判断是否折行
				if(obj1.css("clear")=="both") lineChange = true;
			}while(obj1.attr("id")!=$("#"+attr.main).attr("id"))			
			//如果没有折行的话，还要进行宽度的重新计算
			if(!lineChange){
				//获得宽度
				widthItem = $(this).parent().width();						
				//重新算一下宽度
				width = width + widthItem + opt.widthCss;				
				//执行宽度的重置
				$("#"+attr.main).css("width",String(width)+"px");
			}					
			//删除最终值
			var temp = $(this).prev().html();					
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
			//删除元素
			$(this).parent().remove();
		};
		
		//聚焦的相关操作
		var _focus = function(){
			if($(this).val()==tip) $(this).val("");
			$(this).css("color","#000");
		}
		
		var _keyup = function(){
			var str = $(this).val();
			var len = str.length;
			//获取最后一个输入的字符
			var str1 = str.substring(len-1,len);
			//如果输入的是指定的分隔符
			if(str1==opt.separator){
				//往前面插入一个div
				var str2 = $.trim(str.substring(0,len-1));
				//执行函数进行操作
				_judge(str2);					
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
		function _core(obj,str){
			
			//如果还有默认提示的话则去除
			if($("#"+attr.main).val()==tip) $("#"+attr.main).val("");
			
			//为了万恶的IE6，要专门做个修正，这个修正还是导致有1px的不完美，而且
			if(lineFirst && opt.widthCssIE6!=null){
				obj.before("<div class='"+attr.item+"' style='_margin-left:"+opt.widthCssIE6+"px;'><span>"+str+"</span><a>x</a></div>");
			}else{
				obj.before("<div class='"+attr.item+"'><span>"+str+"</span><a>x</a></div>");
			}
			lineFirst = false;
			//计算字符占位宽度
			var widthItem = obj.prev().width();				
			//给新添加的html绑定事件			
			$("."+attr.item+" a").bind("click",_delete);
			//重新计算宽度
			width = width - widthItem - opt.widthCss;				
			//判断是否需要折行
			if(width<opt.widthMin){
				obj.before("<div class='"+attr.clear+"' style='clear:both;'></div>");
				lineFirst = true;
				width = opt.width;
			}
			//调整位置来显示
			obj.css("width",String(width)+"px");
			//将最终结果写入指定的地方
			if(_obj.val()!=""){
				_obj.val(_obj.val()+opt.separator+str);					
			}else{
				_obj.val(_obj.val()+str);
			}
		}		
		
		//加了排重判断后在外面再包一个函数
		function _judge(str){
			//判断是否为空的字符
			if(str!=""){
				//判读是否有排重
				//var temp = _obj.val().indexOf(str);
				//TODO：这个排重算法错了555要好好想想
				if(opt.different && _obj.val().indexOf(str)>=0 && $.trim(_obj.val().replace(str,""))!=""){
					
					//if(_obj.val().substring())
					
					//如果有重复的则标红提示
					$("."+attr.item).each(function(i){
						if($.trim($(this).children().html())==str) $(this).css("border-color","#ff0000");
					});
				}else{
					 _core($("#"+attr.main),str);
				}
			}
		}
		
		
		return this.each(function(){  	
			
			//执行初始化函数
			_init(_obj,tip);					

			//聚焦时删除提示文字
			$("#"+attr.main).bind("focus",_focus);
			//当键盘输入文字时
			$("#"+attr.main).bind("keyup",_keyup);
			//当输入框失去聚焦
			$("#"+attr.main).bind("blur",_blur);
			
			//如果定义了链接的点击插入模式的话，执行相应的操作
			if(opt.insert!=null){
				$(opt.insert).children("a").bind("click",function(){_judge($.trim($(this).html()));});
			}
			
			

			
//			if(opt.tags!="" && opt.tags!=null){				
//				var tag=opt.tags.split(opt.separator);
//				for(var i=0;i<tag.length;i++) {coreInsert(tag[i]);}
//			}
			
			
			//这里的方法写得还是很有问题，咱时先不写了
//			if(operate=="tag" || (opt.tags!="" && opt.tags!=null)){
//				var tag=opt.tags.split(opt.separator);
//				for(var i=0;i<tag.length;i++) coreInsert(tag[i]);
//				if(_obj.val()!=""){
//					_obj.val(_obj.val()+opt.separator+opt.tags);
//				}else{
//					_obj.val(opt.tags);
//				}
//			}
			//用于清除所有已输入的标签
//			if(operate=="clear"){
//				$("#separate-container .separate-item").remove();
//				$("#separate-container ."+attr.clear).remove();
//				_obj.val("");
//			}
			
		});  
	}  
	});      
})(jQuery); 