<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Process</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server"></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LinkContent" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="blank10"></div>

<div class="column1">    

    	
        <div class="new-box-title2">
        	<div class="left">复习做题ing（第<b>5</b>题/共<b>20</b>题）</div>
			<div class="right"><a href="/Plan/">中止复习</a></div>
            <div class="clear"></div>
        </div>
        <div class="new-box">
        	<div class="new-index-question">
                <div class="description">
                    <p>In April 1997, Hillary Rodham Clinton hosted an all-day White House scientific conference on new findings <span class="underline">that indicates a child's acquiring language, thinking, and emotional skills as</span> an active process that may be largely completed before age three.</p>
                </div>
                <div class="choices">
                    <input type="radio" name="choice" value="A" />
                    <p>that indicates a child's acquiring language, thinking, and emotional skills as</p>
                    <div class="clear"></div>
                    <input type="radio" name="choice" value="B" />
                    <p>that are indicative of a child acquiring language, thinking, and emotional skills as</p>
                    <div class="clear"></div>
                    <input type="radio" name="choice" value="C" />
                    <p>to indicate that when a child acquires language, thinking, and emotional skills, that it is</p>
                    <div class="clear"></div>
                    <input type="radio" name="choice" value="D" />
                    <p>indicating that a child's acquisition of language, thinking, and emotional skills is</p>
                    <div class="clear"></div>
                    <input type="radio" name="choice" value="E" />
                    <p>indicative of a child's acquisition of language, thinking, and emotional skills as</p>
                    <div class="clear"></div>
                </div>
            </div>
		</div>
        <div class="new-box-bottom"><button>Confirm</button></div>
    	

	<div class="blank10"></div>
</div>

</asp:Content>