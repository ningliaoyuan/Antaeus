<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Antaeus.BL.Model.Question>>" %>
<%@ Register src="../Components/FilterComponent.ascx" tagname="FilterComponent" tagprefix="uc1" %>
<%@ Register src="HeaderControl.ascx" tagname="HeaderControl" tagprefix="uc2" %>
<%@ Register src="../PopUps/EditFavoritePopup.ascx" tagname="EditFavoritePopup" tagprefix="uc3" %>
<%@ Import Namespace="Antaeus.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Favorite
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="account column2">    

    <div class="blank10"></div> 
    
    <div class="columnleft">
    
    	<div class="box2 favorite">
			<div class="context"> 	
        		<uc2:HeaderControl ID="HeaderControl1" runat="server" p="Favorite" />
                <div class="subnav">
                    <a href="/Account/Favorite/" class="current">全部收藏</a>
                    <a href="/Account/Favorite/Question/">题目收藏</a>
                    <a href="/Account/Favorite/Knowledge/">知识点收藏</a>
                    <a href="/Account/Favorite/Article/" style="border:0;">文章收藏</a>
                </div>
            </div>            
        </div>
        
        <div class="blank10"></div>
        
        <div class="box2 favorite">
			<div class="listresult" id="FavoriteItems">
                <div class="bar1 listtop">
                    <div class="left">当前标签&nbsp;<span>考前必看</span>&nbsp;，共&nbsp;<span>23</span>&nbsp;个收藏</div>
                </div>
                <%foreach (var item in Model)
                  {%>
                       <div class="item3" quesid="<%= Html.Encode(item.QuestionID) %>">
                	<div class="title">
                    	<div class="left"><a href="#">Sentences Corrected:&nbsp;<%= Html.Encode(item.QuestionID) %></a></div>
                        <div class="right"><span>来自：</span><b><%= Html.Encode(item.Source) %></b></div>
                        <div class="clear"></div>
                    </div>
                    <div class="main">
                    	<div class="left number"><b class="green"><%= Html.Encode(item.GetAverage().ToString("0.0")) %><i>/5</i></b><span>题目价值</span></div>
                        <div class="left number"><b class="orange"><%= Html.Encode(item.CorrectRate) %></b><span>做题正确率</span></div>
                        <div class="right">
                        	<div class="summy"><%=Html.Encode(item.GetAbstract()) %></div>
                            <div class="points"><span>考点：</span><a href="#">more than</a>&nbsp;&nbsp;<a href="#">in which</a>&nbsp;&nbsp;<a href="#">定语从句</a></div>
                            <div class="update">更新于<%= Html.Encode(item.ModifiedTime.ToStr())%></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="operate">
                    	<div class="left FavoriteItemTags"><span>收藏于</span><b>2010-04-04 13:57</b><span>收藏标签</span>
                    	<%foreach (var tag in MembershipHelper.GetNormalUser().GetTags("question",item.QuestionID).Split(','))
	                      {%>
		                    <i><%=Html.Encode(tag) %></i>
	                    <%}%>
                    	</div>
                        <div class="right"><a class="btn-action btn-action-blue LinkFavoriteEdit">修改收藏设置</a><a class="LinkFavoriteRemove">移除收藏</a></div>
                        <div class="clear"></div>
                    </div>                    
                </div>
                <%} %>
                
                <div class="item4 hidden" id="AfterFavoriteRemove">
                	<div class="content">题目&nbsp;<a href="/Question/Details/%ID%/">Sentences Corrected-%ID%</a>&nbsp;已取消收藏，重新收藏请点击&nbsp;<a href="#" class="ReAddFavorite" quesid="%ID%">恢复收藏</a></div>
                </div>
                               
            </div>
            
            
    	</div>
        
        <div class="blank5"></div>
        <div class="listresult-more" id="GetMoreFavoriteItems">查看更多收藏&nbsp;▼</div>
    
    </div>
    
    <div class="columnright">
        <div class="box3 ggarea" style="height:168px;">Advertisement Area</div>
        <div class="blank10"></div>
        <div class="box3 w-filter" id="WidgetFilter">
        	<uc1:FilterComponent ID="FilterComponent1" runat="server" test="c,b,a"/>
        </div>
        <div class="blank10"></div>
    </div>
    <div class="clear blank10"></div>
</div>       
<uc3:EditFavoritePopup ID="EditFavoritePopup" runat="server" />
</asp:Content>
