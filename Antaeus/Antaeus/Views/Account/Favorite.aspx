<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>
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
<!--            	<div class="blank15"></div>
                <h2>我收藏的题目</h2>
                <div class="tag-clone">
                	<a href="#" class="current">全部(123)</a>
                    <%if (!string.IsNullOrEmpty(Model))
                      {
                          foreach (var tag in Model.Split(','))
                          {%>
                	       <a href="#"><%=tag%></a>
                           <%}
                      } %>                
                    <div class="clear"></div>
                </div>  -->              
            </div>            
        </div>
        
        <div class="blank10"></div>
        
        <div class="box2 favorite">
			<div class="listresult">
                <div class="bar1 listtop">
                    <div class="left">
                        当前标签&nbsp;<span>考前必看</span>&nbsp;，共&nbsp;<span>23</span>&nbsp;个收藏，每页显示&nbsp;
                        <select>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                        </select>
                        &nbsp;个收藏
                    </div>
                </div>
                
                <div class="item3">
                	<div class="title">
                    	<div class="left"><input type="checkbox" value="" name="ItemQuestion" />&nbsp;&nbsp;<a href="#">Sentences Corrected:&nbsp;34355</a></div>
                        <div class="right"><span>来自：</span><b>GWD</b></div>
                        <div class="clear"></div>
                    </div>
                    <div class="main">
                    	<div class="left number"><b class="green">3.5<i>/5</i></b><span>题目价值</span></div>
                        <div class="left number"><b class="orange">34.5%</b><span>做题正确率</span></div>
                        <div class="right">
                        	<div class="summy">test test test test test test test test test test test test test test test test test test test test test test test</div>
                            <div class="points"><span>考点：</span><a href="#">more than</a>&nbsp;&nbsp;<a href="#">in which</a>&nbsp;&nbsp;<a href="#">定语从句</a></div>
                            <div class="update">更新于2010-04-04 13:57</div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="operate">
                    	<div class="left"><span>收藏于</span><b>2010-04-04 13:57</b><span>收藏标签</span><i>考前必看</i><i>不是人做的</i><i>真TMD难</i></div>
                        <div class="right"><a class="btn-action">修改收藏设置</a><a href="#">移除收藏</a></div>
                        <div class="clear"></div>
                    </div>                    
                </div>
                
                <div class="item3">
                	<div class="title">
                    	<div class="left"><input type="checkbox" value="" name="ItemQuestion" />&nbsp;&nbsp;<a href="#">Sentences Corrected:&nbsp;34355</a></div>
                        <div class="right"><span>来自：</span><b>GWD</b></div>
                        <div class="clear"></div>
                    </div>
                    <div class="main">
                    	<div class="left number"><b class="green">3.5<i>/5</i></b><span>题目价值</span></div>
                        <div class="left number"><b class="orange">34.5%</b><span>做题正确率</span></div>
                        <div class="right">
                        	<div class="summy">test test test test test test test test test test test test test test test test test test test test test test test</div>
                            <div class="points"><span>考点：</span><a href="#">more than</a>&nbsp;&nbsp;<a href="#">in which</a>&nbsp;&nbsp;<a href="#">定语从句</a></div>
                            <div class="update">更新于2010-04-04 13:57</div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="operate">
                    	<div class="left"><span>收藏于</span><b>2010-04-04 13:57</b><span>收藏标签</span><i>考前必看</i><i>不是人做的</i><i>真TMD难</i></div>
                        <div class="right"><a class="btn-action">修改收藏设置</a><a href="#">移除收藏</a></div>
                        <div class="clear"></div>
                    </div>                    
                </div>
                <div class="item4">
                	<div class="content">题目&nbsp;<a href="#">Sentences Corrected-34355</a>&nbsp;已取消收藏，重新收藏请点击&nbsp;<a href="#">恢复收藏</a></div>
                </div>
                <div class="bar1">
                	<div class="left">
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" id="ItemQuestion" />
                        <span>全选</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <b>批量操作</b>
                        <select>
                            <option selected="selected">取消收藏</option>
                            <option>修改标签</option>
                        </select>
                        <select>
                            <option selected="selected">考前必看</option>
                            <option>真TMD难</option>
                        </select>
                    </div>
                    <div class="right">
                    	<div class="barpage"><%=Html.ShowPageIndex( this.ViewData.GetPager(),"current")%></div>
                    </div>
                </div>
                
            </div>
    	</div>
    </div>
    
    <div class="columnright">
        <div class="box3 ggarea" style="height:168px;">Advertisement Area</div>
        <div class="blank10"></div>
        <div class="box3 w-filter" id="WidgetFilter">
        	<uc1:FilterComponent ID="FilterComponent1" runat="server" />
        </div>
        <div class="blank10"></div>
    </div>
    <div class="clear blank10"></div>
</div>       
<uc3:EditFavoritePopup ID="EditFavoritePopup" runat="server" />
</asp:Content>
