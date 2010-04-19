// Javascript For Default Antaeus Used
// Version 0.1, Created by Lanslot

jQuery(document).ready(function($) {

    //============================================================================
    //Question/Details页面代码

    //激发编辑模式
    $("#ButtonWikiEdit").click(function() {
		//将编辑器作为全局变量
        g_param.WikiInitContent = $("#WikiContentEditArea").html().replaceSpecial();
        if (!g_param.WikiEditor) g_param.WikiEditor = CKEDITOR.replace(document.getElementById("WikiContentEditArea"));
        $(".wiki-submit").show();
    });
    //用户取消编辑
    function WikiEditDestory() {
        if (!g_param.WikiEditor) return;
        g_param.WikiEditor.destroy();
        g_param.WikiEditor = null;
        $("#WikiContentEditArea").html(g_param.WikiInitContent);
        $(".wiki-submit").hide();
    }
    $("#WikiEditDestroy").click(function() { WikiEditDestory(); });
    //用户提交编辑内容
    $("#WikiEditSubmit").click(function() {
        content = g_param.WikiEditor.getData().replaceSpecial();
        if (content == g_param.WikiInitContent) {
            alert("你没有修改任何内容，将不会提交新的版本！");
            WikiEditDestory();
        } else {
            content = encodeURI(g_param.WikiEditor.getData());
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
        if (g_param.WikiEditor) {
            g_param.WikiEditor.destroy();
            g_param.WikiEditor = null;
            $(".wiki-submit").hide();
        }
        var version = obj.attr("title");
        //缺少一个AJAX来调用对应版本的数据：wiki内容的html
        $("#WikiVersion").html(version);
        $("#WikiAuthor").html(obj.parent().prev().prev().html());
        $("#WikiTime").html(obj.parent().prev().html());
        //$("#WikiContentEditArea").html(data);
        //$("#popup_wiki_history").dialog('close');
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


// =========================================================================================================
// 整理后的代码
// =========================================================================================================

//0.必须要执行的一些东西
$("*[ajaxstatus='loading']").hide();


//1.顶端登陆，每个页面都要初始载入的------------------------------------------------
//1.0.初始的popup加载设置
$("#PopupLoginForm").popup({save:"登&nbsp;&nbsp;录",ajax:"Login",submit : function(){login["SubmitPopup"]();}});
//1.1.对文本输入框载入聚焦后的提示去除
$("#FormLoginHeader #Username, #FormLoginHeader #Password").removeDefault();
//1.2.当聚焦在顶端导航部分的密码框内时，按回车键提交表单
$("#FormLoginHeader input[type='password']").keyup(function(event){if(event.keyCode==13)login["SubmitHeader"]();});
//1.3.当聚焦在PopUp部分的密码框内时，按回车键提交表单
$("#FormLoginPopup input[type='password']").keyup(function(event){if(event.keyCode==13)login["SubmitPopup"]();});
//1.4.顶部登陆区域点击“登录”按钮提交表单
$("#FormLoginHeaderSubmit").bind("click",login["SubmitHeader"]);

//2.WidgetFilter
$("#WidgetFilter").filter();


//3.与Favorite相关的全部操作，3.1-3.7为Details页面的操作，3.8-3.12为个人中心Favorite页面的操作。
//3.1判断默认显示状态
if(g_param.favorite){$("#FavoriteAlready").show();$("#LinkFavoriteAdd").hide();}
//3.2初始的separateInput插件的初始化
$("#InputFavoriteTagAdd").separateInput({ width: 250,widthMin:50, insert: "#FavoriteTagRecommend", required: false });
//3.3点击添加到收藏夹的操作
$("#LinkFavoriteAdd").bind("click",favorite["Add"]);
//3.4保存按钮操作
$("#BtnFavoriteTagSave").bind("click",favorite["TagSave"]);
//3.5取消按钮操作
$("#BtnFavoriteTagCancel").bind("click",favorite["TagCancel"]);
//3.6从收藏夹移除的操作
$("#LinkFavoriteRemove").bind("click",favorite["Remove"]);
//3.7修改收藏夹标签的操作
$("#LinkFavoriteEdit").bind("click",favorite["TagEdit"]);
//3.8Favorite页面移除收藏
$(".LinkFavoriteRemove").live("click",favorite["Delete"]);	
//3.9Favorite页面重新收藏
$(".ReAddFavorite").live("click",favorite["ReAdd"]);
//3.10Favorite页面编辑收藏标签
$("#PopupFavoriteEdit").popup({ajax:"FavoriteAddTags",submit:function(){favorite["TagModifySave"]();}});
//3.11Popup里面的separate控件的初始化
$("#FavoriteTagsEditInput").separateInput({insert: ".separate-select", required: false, width:450 });
//3.2Favorite页面点击编辑标签
$(".LinkFavoriteEdit").live("click",favorite["TagModify"]);


//4.具体题目页的历史记录查看
//$("#PopupHistory").click(function() { PopupAJAX($(this).attr("href")); });

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


//9.评论的提交
$("#CommentSubmit").click(function(){
	var c = $("#CommentContent").attr("value");
	if(c!="")  window.location=$(this).attr("rel")+c;
});


//10.记录用户做题载入时间
$(".QuestionChoiceSelect").questionRecord({qid:g_param.qid,currentTime:g_param.currentTime,correct:g_param.qCorrect});


$("#FormRegisterSubmit").click(function(){
	//alert("haha");
	$("#FormRegister").submit();
});




});

