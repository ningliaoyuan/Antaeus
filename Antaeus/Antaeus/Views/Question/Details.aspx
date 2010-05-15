<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Antaeus.BL.Model.Question>" %>

<%@ Register src="../PopUps/QuestionReportPopup.ascx" tagname="QuestionReportPopup" tagprefix="uc1" %>
<%@ Register src="../PopUps/AddFavoritePopup.ascx" tagname="AddFavoritePopup" tagprefix="uc2" %>

<%@ Import Namespace="Antaeus.Helpers" %>
<%@ Import Namespace="Antaeus.BL.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
	<script type="text/javascript" src="/Plugins/CKEditor-3.0.1/ckeditor.js"></script>
	<script type="text/javascript">
	    g_param.qid = <%= Html.Encode(Model.QuestionID)%>; //题目的ID
		g_param.qCorrect = "<%=Html.Encode(Model.Meta["CorrectMark"])%>";  //题目的正确选项
		g_param.currentTime = new Date(); //记录页面载入当前的时间
		g_param.favorite = <%= MembershipHelper.GetNormalUser().HasFavorite("question", Model.QuestionID).ToString().ToLower()%>;
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" runat="server">

<div class="blank10"></div>
<div class="column2">    
    <div class="columnleft">
    	<div class="new-box-title2">
        	<div class="left">Reading Comprehension&nbsp;&gt;&nbsp;<b class="orange">13442</b></div>
            <div class="right">
                <span>来自：</span>
                <b class="orange">GWD</b>
                <a>查看详情</a>
            </div>
            <div class="clear"></div>
        </div>   
        <div class="new-box new-ques">
            <div class="description">
                <p>According to a theory advanced by researcher Paul Martin, the wave of species extinctions that occurred in North America about 11,000 years ago, at the end of the Pleistocene era, can be directly attributed to the arrival of humans, i.e., the Paleoindians, who were ancestors of modern Native Americans.  However, anthropologist Shepard Krech points out that large animal species vanished even in areas where there is no evidence to demonstrate that Paleoindians hunted them. Nor were extinctions confined to large animals:  small animals, plants, and insects disappeared, presumably not all through human consumption.  Krech also contradicts Martin's exclusion of climatic change as an explanation by asserting that widespread climatic change did indeed occur at the end of the Pleistocene.  Still, Krech attributes secondary if not primary responsibility for the extinctions to the Paleoindians, arguing that humans have produced local extinctions elsewhere.  But, according to historian Richard White, even the attribution of secondary responsibility may not be supported by the evidence.  White observes that Martin's thesis depends on coinciding dates for the arrival of humans and the decline of large animal species, and Krech, though aware that the dates are controversial, does not challenge <span class="highlight">them; yet recent archaeological discoveries are providing evidence</span> that the date of human arrival was much earlier than 11,000 years ago.</p>
            </div>
            <div class="question">In the last sentence of the passage, the author refers to <b>"recent archaeological discoveries"</b> most probably in order to</div>
            <div class="choices">
                <input type="radio" name="choice" value="A" />
                <p>refute White's suggestion that neither Maritn nor Krech adequately account for Paleoindians' contributions to the Pleistocene extinctions</p>
                <div class="clear"></div>
                <input type="radio" name="choice" value="B" />
                <p>cast doubt on the possibility that a more definitive theory regarding the causes of the Pleistocene extinctions may be forthcoming</p>
                <div class="clear"></div>
                <input type="radio" name="choice" value="C" />
                <p>suggest that Martin's, Krech's, and White's theories regarding the Pleistocene extinctions are all open to question</p>
                <div class="clear"></div>
                <input type="radio" name="choice" value="D" />
                <p>call attention to the most controversial aspect of all the current theories regarding the Pleistocene extinctions</p>
                <div class="clear"></div>
                <input type="radio" name="choice" value="E" />
                <p>provide support for White's questioning of both Martin's and Krech's positions regarding the role of Paleoindians in the Pleistocene extinctions</p>
                <div class="clear"></div>
            </div>
        </div>
        <div class="new-box-bottom">
        	<b>恭喜你做对了！</b><br />
            <span>做完此题你的感觉如何？</span>
            <input type="radio" /><label>我<b>完全理解</b>了这道题目</label>
            <input type="radio" /><label>虽然做对，但我还有<b>不理解</b>的地方</label><br />
            <span>记录下你做题的感觉，将有助于我们分析你学习中的问题从而向你推荐更适合你的题目。</span>
        </div>
        <div class="new-box-bottom">
        	<b>你做错了！正确答案是C！</b><br />
            <span>赶紧看看下面的解答过程，学习一下吧。</span>
        </div>
        
    </div>    
    
    <div class="clear"></div>
</div>
<div class="blank10"></div>
<uc1:QuestionReportPopup ID="QuestionReportPopup" runat="server" />
<uc2:AddFavoritePopup ID="AddFavoritePopup" runat="server" />


</form>
</asp:Content>

