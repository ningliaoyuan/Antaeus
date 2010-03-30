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

    var f = eid.attr("remy");
    
    //var oHtml = $(eid).html();
    
    $(eid).html("loading...");
    refresh_functions[f](context, function(data) { $(eid).html(data); });
}

var refresh_functions = {};

refresh_functions["GetAverage"] = function (context, callback) {
    var qid = context.qid;
    $.get("/Question/GetAverage/" + qid, callback);
};

refresh_functions["LogOnUserControl"] = function (context, callback) {
    $.get("/Account/LogOnUserControl", callback);
};



jQuery(document).ready(function($) {
    //var s = $(".ajaxload").each(});

    $(".ajaxload").each(function(i) {
        Refresh(this, g_context);
    });
});