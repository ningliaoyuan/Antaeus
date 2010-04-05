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
			dFunction["RateQuestion"](
				{qID:g_param.qid,qValue:value},
				function(){ajaxRefresh($("#RateAverge"),{qID:g_param.qid});}
			);			
        }
    });
	
	//记录用户做题载入时间
	$(".QuestionChoiceSelect").questionRecord({qid:g_param.qid,currentTime:g_param.currentTime,correct:g_param.qCorrect});
	



// =========================================================================================================
// 整理后的代码
// =========================================================================================================


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
//3.1datail页面收藏夹的显示
//$("#FavoriteTagAddInput").separateInput("init",{ width: 250,widthMin:50,widthCss:24, insert: "#FavoriteTagRecommend", widthCssIE6: 2, required: false });
$("#FavoriteTagAddInput").separateInput({ width: 250,widthMin:50,widthCss:24, insert: "#FavoriteTagRecommend", widthCssIE6: 2, required: false,tags:"a,b,c" });
//3.2初始状态的判断显示
if(g_param.favorite){
	$("#FavoriteAlready").show();
	$("#FavoriteNot").hide();
}
//3.3点击添加到收藏夹的操作
$("#LinkFavoriteAdd").click(function(){
	FavoriteTagAdd({
		content:"#FavoriteAddSetting",
		father:"#LinkFavoriteAdd",
		save:"#FavoriteTagSave",
		cancel:"#FavoriteTagCancel",
		input:"#FavoriteTagAddInput",
		hoverClass:"btn-huge-hover"
	});
});
//3.4从收藏夹移除
$("#LinkFavoriteRemove").click(function(){
	dFunction["FavoriteRemove"]({qID:g_param.qid,qType:"question"}, function(){
		//改变显示状态
		$("#FavoriteNot").show();
		$("#FavoriteAlready").hide();
		$("#LinkFavoriteAdd #FA1").show();
		$("#LinkFavoriteAdd #FA2").hide();
		g_param.favorite = false;
	});
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
		Refresh($("#FormQuestionCreateLoad"),{type:$(this).attr("value")});
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




});
