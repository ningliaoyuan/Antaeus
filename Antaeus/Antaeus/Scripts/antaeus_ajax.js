function RateQuestion(context, uiCallback) {
    $.get("/Question/Rate/" + context.qid, { rate: context.rate },
        function(data) {
            if (data == "ok") {
                uiCallback();
                //alert("投票成功");
            } else {
                alert("投票失败");
            }
        });

};

function Refresh(eid, context) {
   
    var f = eid.attr("rel");
    
    //var oHtml = $(eid).html();
    
    $(eid).html("loading...");
    refresh_functions[f](context, function(data) { $(eid).html(data); });
}

var refresh_functions = {};

refresh_functions["GetAverage"] = function GetAverage(context, callback) {
    var qid = context.qid;
    $.get("/Question/GetAverage/" + context.qid, callback);
};

jQuery(document).ready(function($) {
    var context = { qid: 1 };
    //var s = $(".ajaxload").each(function(i){ Refresh($(this));});
    Refresh($(".ajaxload"), context);


});