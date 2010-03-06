﻿// Javascript For Default Antaeus Used
// Version 0.1, Created by Lanslot

jQuery(document).ready(function($) {
	
    //==============================================================================
    //Tab的调用函数
    function ActiveTab(data) {
        $(data.tabname + " li").mouseover(function() { $(this).addClass(data.hover); });
        $(data.tabname + " li").mouseout(function() { $(this).removeClass(data.hover); });
        $(data.tabname + " li").click(function() {
            var target = $(this);
            var current = $(this).parent().children("." + data.selected);
            current.removeClass(data.selected);
            target.addClass(data.selected);
            if (current.attr("rel") != target.attr("rel")) {
                $(current.attr("rel")).fadeOut("normal", function() { $(target.attr("rel")).show(); });
            }
        });
    }
    //==============================================================================
    //所有Tab的调用代码
    var Tab = {
        tabname: ".tab",    //定义Tab最外面包含的类
        selected: "selected",    //定义Tab选中的CSS样式
        hover: "hover"           //定义Tab鼠标移上去时的鼠标样式
    };
    ActiveTab(Tab);

    //==============================================================================
    //Account/AccountSetting/的效果
    $("#accountSetting .item").mouseover(function() {
        if (jQuery(this).children(".right").children(".theform").css("display") == "none") {
            jQuery(this).css("background-color", "#cadfec");
        } else {
            jQuery(this).css("cursor", "auto");
        }
    });
    $("#accountSetting .item").mouseout(function() {
        jQuery(this).css("background-color", "#fff");
    });
    $("#accountSetting .item").click(function() {
        if (jQuery(this).children(".right").children(".theform").css("display") == "none") {
            $("#accountSetting .item").each(function(n) {
                jQuery(this).removeClass("current");
                jQuery(this).children(".right").children(".theform").hide();
                jQuery(this).css("cursor", "pointer");
            });
            jQuery(this).children(".right").children(".theform").slideDown("slow");
            jQuery(this).addClass("current");
        }
    });
    $("#accountSetting .item .theform .btn-form-gray").click(function() {
        jQuery(this).parent().slideUp("slow");
        jQuery(this).parent().parent().parent().removeClass("current");
        jQuery(this).parent().parent().parent().css("cursor", "pointer");
    });

    //函数用于当表单项重载入时的验证代码重载入
    function FormReload() {
        //1.onfocus时内置提示文字消失，需要此项操作的项必须有class=FormOnFocusClear
        $(".FormOnFocusClear").focus(function() { this.value = ""; });
        //2.对于文本输入的东西，当onBlur时要验证是否为空并给出提示信息，需要此项操作的项必须有class=FormOnBlurCheck
        $(".FormOnBlurCheck").blur(function() {
            var obj = $(this);
            if (obj.attr("value") == "") {
                obj.siblings(".wrong").html("这项内容不能为空的！！！");
                obj.siblings(".wrong").show();
            } else {
                obj.siblings(".wrong").hide();
            }
        });
    }
    //初始载入表单验证操作==========================================================================
    FormReload();
    //------------------------------------------------------------------------------
    //提交表单的触发代码
    //这是正常提交表单的模式，只不过是原来需要一个Button来提交表单，现在任何一个class名为FormSubmit的东西都可以提交ID为FormSubmit的表单了
    $(".FormSubmit").click(function() { $("#FormSubmit").submit(); });
    //------------------------------------------------------------------------------
    //这是表单中星星评分部分的插件调用
    $("#FormRate").stars({
        inputType: "select",
        captionEl: $("#FormRateCap"),
        cancelShow: false
    });
    //特殊表单的特殊操作==========================================================================

    //1.FormLogin登录表单的特殊操作
    //当聚焦在顶端导航部分的密码框内时，按回车键提交表单
//    $("#FormLoginHeader input[type='password']").keyup(function(event) { if (event.keyCode == 13) FormLoginSubmit("Header"); });
//    $("#FormLoginPopup input[type='password']").keyup(function(event) { if (event.keyCode == 13) FormLoginSubmit("Popup"); });
//    //AJAX方式触发表单，仅用在Master页面中的顶端登录
//    $("#FormLoginHeaderSubmit").click(function() { FormLoginSubmit("Header"); });

    //2.FormQuestionCreate题目创建表单的特殊操作
    //CSS原因，这里修正一下SourceOther的显示
    $("#FormQuestionCreate .hidden").hide();
    //当选择其它时，出现文本输入框
    $("#FormQuestionCreateSource").change(function() {
        var obj = $("#FormQuestionCreateSourceOther");
        if ($(this).attr("value") == "其它") {
            obj.attr("value", "");
            obj.show();
        } else {
            obj.hide();
            obj.attr("value", "");
        }
    });
    //七种不同题型的不同操作
    $("#FormQuestionCreateType").change(function() {
        var obj = $(this);
        obj.next().show();
        var QCT = obj.attr("value")
        $.get("/Question/Form/" + QCT, function(data) {
            //alert(data);
            if (data != null) {
                $("#FormQuestionCreateLoad").html(data);
                FormReload();
            }
            obj.next().hide();
        });
    });
    //检索知识点部分拖拽的选择效果
    $(".FormQuestionCreateSort").sortable({
        connectWith: 'ul',
        placeholder: 'ui-state-highlight'
    });
    $("#FormQuestionCreateSortResult, #FormQuestionCreateSortSelect").disableSelection();


    //============================================================================
    //Question/Details页面代码
    //定义编辑器的全局变量
    var WikiEditor;
    //定义初始的WIKI内容，用于用户提交判断
    var WikiInitContent;


    //激发编辑模式
    $("#ButtonWikiEdit").click(function() {
        //$("#WikiContent").wrapInner("<textarea name='Wiki' id='WikiContentTextarea' style='width: 670px; height: 300px'></textarea>");
        //$("#WikiContent").append("<div class='clear blank10'></div>");
        WikiInitContent = $("#WikiContentEditArea").html().replaceAll("\n", "").replaceAll(" ", "").replaceAll("\t", "").replaceAll("&nbsp;", "").toLowerCase().replaceAll("<p></p>", "");
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
        content = WikiEditor.getData().replaceAll("\n", "").replaceAll(" ", "").replaceAll("\t", "").replaceAll("&nbsp;", "").toLowerCase().replaceAll("<p></p>", "");
        //alert(content);
        //alert(WikiInitContent)
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
				    if (data == "ok") {
				        alert("你的修改已经成功提交，感谢你的贡献。");
				        WikiEditDestory();
				    } else {
				        alert("提交失败，原因是：" + data);
				    }
				}
			);
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
		callback: function(ui, type, value){
			$("#Rate").hide();
			$("#Rating").show();
			var id=$("#Rate").attr("rel");
			//alert(id);
			$.get("/Question/Rate/"+id,{rate:value},function(data){
				if(data=="ok"){
					//alert("投票成功");
				}else{
					alert("投票失败");
				}
				$("#Rate").show();
				$("#Rating").hide();
			});
		}
    });
	
	//用户做题
	
	//记录载入时间
	var CurrentTime = new Date();
	var QuestionChoiceSelect = true;
	$(".QuestionChoiceSelect").click(function(){
		//只判断第一次点击
		if(QuestionChoiceSelect){		
			var correct = $("#QuestionChoiceCorrected").html();
			var DoTime = new Date();
			var TheTime = parseInt((DoTime-CurrentTime)/1000);
			var Correct = 0;
			var id=$("#Rate").attr("title");
			var Answer = $(this).attr("value");
			
			if (Answer==correct) {
				$("#QuestionChoiceCorrectShow").show();
				Correct = 1;
			}else{
				$("#QuestionChoiceWrongShow").show();
			}
			QuestionChoiceSelect = false;
			$.get("/Question/Answer/"+id,{answer:Answer, correct:Correct, cost:TheTime},function(data){alert(data);});
			
		}
	});
	
	//评论的提交
	$("#CommentSubmit").click(function(){
		//alert("haha");
		//$("#CommentForm").submit();
		var c = $("#CommentContent").attr("value");

		if(c!="")  window.location=$(this).attr("rel")+c;
	});

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

//3.具体题目页给题目加Tag
$("#PopupFavorite").click(function(){FavoriteTagAdd("PopupFavoriteAdd");});

//4.具体题目页的历史记录查看
$("#PopupHistory").click(function(){PopupAJAX($(this).attr("href"));});

});