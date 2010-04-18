// Javascript For Default Antaeus Used
// Version 0.1, Created by Lanslot

jQuery(document).ready(function($) {

    //============================================================================
    //Question/Details页面代码
    //定义编辑器的全局变量
    var WikiEditor;
    //定义初始的WIKI内容，用于用户提交判断
    var WikiInitContent;
    //激发编辑模式
    $("#ButtonWikiEdit").click(function() {
        WikiInitContent = $("#WikiContentEditArea").html().replaceSpecial();
        if (!WikiEditor) WikiEditor = CKEDITOR.replace(document.getElementById("WikiContentEditArea"));
        $(".wiki-submit").show();
    });
    //用户取消编辑
    function WikiEditDestory() {
        if (!WikiEditor) return;
        WikiEditor.destroy();
        WikiEditor = null;
        $("#WikiContentEditArea").html(WikiInitContent);
        $(".wiki-submit").hide();
    }
    $("#WikiEditDestroy").click(function() { WikiEditDestory(); });
    //用户提交编辑内容
    $("#WikiEditSubmit").click(function() {
        content = WikiEditor.getData().replaceSpecial();
        if (content == WikiInitContent) {
            alert("你没有修改任何内容，将不会提交新的版本！");
            WikiEditDestory();
        } else {
            content = encodeURI(WikiEditor.getData());
            id = $("#QuestionID").html();
            $.post(
				"/Question/EditAnswer/" + id,
				{ WikiContent: content },
				function(data) {
				    if ($.trim(data) == "obsolete:ok") {
				        alert("你的修改已经成功提交，感谢你的贡献。");
				        WikiEditDestory();
				    } else {
				        alert("提交失败，原因是：" + data);
				    }
				}
			);
			//runAJAX(url.wiki,[$("#QuestionID").html(),encodeURI(WikiEditor.getData())],fun.wiki);
        }
    });
    //更新历史版本内容
    $(".WikiHistoryView").click(function() {
        var obj = $(this);
        if (WikiEditor) {
            WikiEditor.destroy();
            WikiEditor = null;
            $(".wiki-submit").hide();
        }
        var version = obj.attr("title");
        //缺少一个AJAX来调用对应版本的数据：wiki内容的html
        $("#WikiVersion").html(version);
        $("#WikiAuthor").html(obj.parent().prev().prev().html());
        $("#WikiTime").html(obj.parent().prev().html());
        //$("#WikiContentEditArea").html(data);
        $("#popup_wiki_history").dialog('close');
    });


    //Rate部分代码
    $("#Rate").stars({
        oneVoteOnly: true,
        inputType: "select",
        captionEl: $("#RateCap"),
        cancelShow: false,
        callback: function(ui, type, value) {
			var obj=$("#Rate");
			ajaxRequest(obj,{qID:g_param.qid,qValue:value},function(){
				ajaxRefresh($("#RateAverge"),{qID:g_param.qid});
			});		
        }
    });
	


//$("#GetMoreFavoriteItems").live("click",function(){
//	var init = $(this).html();
//	$(this).html("更多收藏读取中...请稍后...");
//	rFunction["FavoriteItemsGet"]();
//});

//这里还很有问题，明天写·~~

//$(".LinkFavoriteEdit").click(function(){
	//var qid = $(this).attr("quesid");
	//首先请求这个题目的tags
	//rFunction["FavoriteTagsGet"]({qID:qid,qType:"question"},function(data){
		//请求到tags后，要载入到popup显示
		
//		$("#PopupFavoriteEdit").dialog({ //这是对话框的基本设置
//			autoOpen: false,
//			width: 600,
//			buttons: {
//				"Ok": function() {
//					if(fun==null){
//						$(this).dialog("close");
//					}else{
//						fun();
//					}
//				},
//				"Cancel": function() {
//					$(this).dialog("close");
//				}
//			},
//			open:function(){
//				
//			},
//			draggable: true,
//			modal: true,
//			resizable:true,
//			show:"slide"
//		});
//		$("#PopupFavoriteEdit").dialog("open");
		
//		$("#FavoriteTagsEditInput").separateInput({insert: ".separate-select", required: false });
//		Popup($("#PopupFavoriteEdit"));
	//});
//});


// =========================================================================================================
// 整理后的代码
// =========================================================================================================

//0.必须要执行的一些东西
$("*[ajaxstatus='loading']").hide();


//1.顶端登陆，每个页面都要初始载入的------------------------------------------------
//1.1.对文本输入框载入聚焦后的提示去除
$("#FormLoginHeader #Username, #FormLoginHeader #Password").removeDefault();
//1.2.当聚焦在顶端导航部分的密码框内时，按回车键提交表单
$("#FormLoginHeader input[type='password']").keyup(function(event) { if (event.keyCode == 13) FormLoginSubmit("Header"); });
//1.3.当聚焦在PopUp部分的密码框内时，按回车键提交表单
$("#FormLoginPopup input[type='password']").keyup(function(event) { if (event.keyCode == 13) FormLoginSubmit("Popup"); });
//1.4.顶部登陆区域点击“登录”按钮提交表单
$("#FormLoginHeaderSubmit").click(function() { FormLoginSubmit("Header"); });


//2.WidgetFilter
$("#WidgetFilter").filter();


//3.Details那里的Tag部分的全部操作
//3.1判断默认显示状态
if(g_param.favorite){
	$("#FavoriteAlready").show();
	$("#LinkFavoriteAdd").hide();
}
//3.2初始的separateInput插件的初始化
$("#InputFavoriteTagAdd").separateInput({ width: 250,widthMin:50, insert: "#FavoriteTagRecommend", required: false });
//3.3点击添加到收藏夹的操作
$("#LinkFavoriteAdd").bind("click",function(){
	var obj=$(this);
	ajaxRequest(obj,{qID:g_param.qid,qType:"question"},function(){
		g_param.favorite = true;
		$("#LinkFavoriteAdd").hide();
		$("#LinkFavoriteAdd").next().next().show();
		//显示收藏夹设置
		$("#FavoriteAddSetting").slideDown("slow");
	});
});
//3.4保存按钮操作
$("#BtnFavoriteTagSave").bind("click",function(){
	var obj = $(this);
	var tags = $.trim($("#InputFavoriteTagAdd").val());
	if(tags==""){
		alert("标签输入不能为空！");
	}else{
		
		ajaxRequest(obj,{qID:g_param.qid,qType:"question",tags:tags},function(){
			$("#FavoriteAddSetting").slideUp("fast");
			//改变显示状态
			$(".btn-huge-favorite").hide();
			if(g_param.favorite){
				$("#FavoriteAlready").show();
			}else{
				$("#LinkFavoriteAdd").show();
			}
		});	
	}
});
//3.5取消按钮操作
$("#BtnFavoriteTagCancel").bind("click",function(){								 
	//收起菜单
	$("#FavoriteAddSetting").slideUp("fast");
	//改变显示状态
	$(".btn-huge-favorite").hide();
	if(g_param.favorite){
		$("#FavoriteAlready").show();
	}else{
		$("#LinkFavoriteAdd").show();
	}
});
//3.6从收藏夹移除的操作
$("#LinkFavoriteRemove").click(function(){
	var obj=$(this);
	ajaxRequest(obj,{qID:g_param.qid,qType:"question"},function(){
		//改变全局变量
		g_param.favorite = false;
		//清除输入框内的内容
		$("#InputFavoriteTagAdd").separateInput("reload");
		$("#InputFavoriteTagAdd").attr("tags","");
		//改变显示状态
		$("#FavoriteAlready").hide();
		$("#LinkFavoriteAdd").show();
	});
});
//3.7修改收藏夹标签的操作
$("#LinkFavoriteEdit").click(function(){
	//清除输入框内的内容
	$("#InputFavoriteTagAdd").separateInput("reload");		
	//获取用户当时添加的Tags
	var tags = $("#InputFavoriteTagAdd").attr("tags");
	if(tags!=""){
		tag=tags.split(",");
		//把获得的Tags置入
		$("#InputFavoriteTagAdd").separateInput("addtags",tag);
	}		
	//改变显示状态
	$("#FavoriteAlready").hide();
	$("#FavoriteAlready").next().show();
	$("#FavoriteAddSetting").slideDown("slow");	
	$("#InputFavoriteTagAdd").separateInput("rewidth");
});


		

//3.8Favorite页面移除收藏
$(".LinkFavoriteRemove").live("click",function(){
	var qid = $(this).parent().parent().parent().attr("quesid");
	var obj = $("#FavoriteItems div[quesid='"+qid+"']");
	var requestobj = $(this);
	ajaxRequest(requestobj,{qID:qid,qType:"question"},function(){
		obj.after("<div class='item4'>"+$("#AfterFavoriteRemove").html().replaceAll("%ID%",qid)+"</div>");
		obj.slideUp();
	});
});	
//3.9Favorite页面重新收藏
$(".ReAddFavorite").live("click",function(){	
	var qid = $(this).attr("quesid");
	var obj = $(this).parent().parent();	
	var tag = "";	
	$("#FavoriteItems div[quesid='"+qid+"'] .FavoriteItemTags i").each(function(i){tag=tag+","+$(this).html();});
	tag = tag.substring(1);	
	var requestobj = $(this);
	ajaxRequest(requestobj,{qID:qid,qType:"question",tags:tag},function(){
		$("#FavoriteItems div[quesid='"+qid+"']").slideDown();
		obj.remove();
	});	
});
//3.10Favorite页面编辑收藏标签
$("#PopupFavoriteEdit").popup({ajax:"FavoriteAddTags",submit:function(){
	//读取ajax相关的东西
	var o = $("#AntaeusUIPopupPopupFavoriteEdit .popup-save");
	var tag=$("#FavoriteTagsEditInput").val();
	var qid=$("#PopupFavoriteEdit").attr("quesid");
	//执行AJAX的请求
	ajaxRequest(o,{qID:qid,qType:"question",tags:tag},function(){
		//自刷新原来应该显示tag的地方
		
		//关闭popup
		$("#PopupFavoriteEdit").popup("close");
	});
}});
$("#FavoriteTagsEditInput").separateInput({insert: ".separate-select", required: false, width:450 });
$(".LinkFavoriteEdit").live("click",function(){
	//获得QuestionID
	var qid = $(this).parent().parent().parent().attr("quesid");
	//获得Tag
	var tag = "";	
	$("#FavoriteItems div[quesid='"+qid+"'] .FavoriteItemTags i").each(function(i){tag=tag+","+$(this).html();});
	tag = tag.substring(1);
	//首先清空输入框
	$("#FavoriteTagsEditInput").separateInput("reload");
	//将取到的Tag写入
	if(tag!="") $("#FavoriteTagsEditInput").separateInput("addtags",tag.split(","));
	
	//将AJAX需要的qid写入到popup主控
	$("#PopupFavoriteEdit").attr("quesid",qid);
	//打开Popup界面
	$("#PopupFavoriteEdit").popup("open");
	
});


//4.具体题目页的历史记录查看
$("#PopupHistory").click(function() { PopupAJAX($(this).attr("href")); });

//5.Tab的代码
TabActive();

//6.AccountSetting中的下滑效果
$("#accountSetting .item").dropdownMenu();

//7.QuestionCreate页面的复杂表单调用汇总代码
if ($("#FormQuestionCreate").length > 0) {
	//这是表单中星星评分部分的插件调用
	$("#FormRate").stars({ inputType: "select", captionEl: $("#FormRateCap"), cancelShow: false });
	//检索知识点部分拖拽的选择效果
	$(".sortbox").sortable({ connectWith: 'ul', placeholder: 'ui-state-highlight' });
	$(".sortbox").disableSelection();
	//标签输入的效果
	$(".separate[name='Tag']").separateInput({ width: 548, insert: ".separate-select", widthCssIE6: 2, required: false });
	//初始化富文本编辑框
	CKEDITOR.replace("CKEditor", { width: 545 });
	//下拉框选到其它时显示文本输入框
	$(".formstyle .judge").dropdownToggle({ judge: "other", styleClass: "inp inp2" });
	//验证为空
	$(":text[required='true']").checkRequired();
	$("textarea[required='true']").checkRequired();
	//聚焦则去掉初始的文字提示
	$("input.inp[value!='']").removeDefault();
	//七种不同题型的不同操作
	$("#FormQuestionCreateType").change(function() {
		ajaxRefresh($("#FormQuestionCreateLoad"),{type:$(this).attr("value")});
	});
}

//8.管理收藏夹改Tag
//$("#LinkFavoriteEdit").click(function(){FavoriteTagAdd("PopupFavoriteEdit");});

//9.评论的提交
$("#CommentSubmit").click(function(){
	var c = $("#CommentContent").attr("value");
	if(c!="")  window.location=$(this).attr("rel")+c;
});


//$("#PopupFavoriteAdd .separate").separateInput({ width: 548, insert: ".separate-select", widthCssIE6: 2, required: false });

//10.记录用户做题载入时间
$(".QuestionChoiceSelect").questionRecord({qid:g_param.qid,currentTime:g_param.currentTime,correct:g_param.qCorrect});


$("#FormRegisterSubmit").click(function(){
	//alert("haha");
	$("#FormRegister").submit();
});




});

