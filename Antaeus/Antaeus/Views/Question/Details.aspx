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
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" runat="server">

<div class="ques_know column2">
	
    <div class="blank10"></div>
        
    <div class="box1 subheader">
        <div class="logo_question"></div>
        <div class="left">
            <h1>Sentences Corrected:&nbsp;<span id="QuestionID"><%= Html.Encode(Model.QuestionID) %></span></h1>
            <span><%= Html.Encode(Model.CreatedUserName) %>&nbsp;创建于&nbsp;<%= Html.Encode(Model.CreatedTime.ToStr())%>；&nbsp;浏览量<%= Html.Encode(Model.ViewedCount) %>；题目来自于<%= Html.Encode(Model.Source) %></span>
            <ul>
                <li>题目标签：</li>
                <%foreach (var tag in Model.GetTags(6).Split(','))
                  {%>
                     <li><a href="/tag/detail/<%=tag%>"><%=tag%></a></li>
                <%}%>
            </ul>
        </div>
        <div class="rateandnext right">
            <div class="rate">
                <span>此题的价值为&nbsp;<b id="RateAverge" refreshme="RateAverge"><%=Model.GetAverage().ToString("0.0")%></b>&nbsp;/&nbsp;5&nbsp;&nbsp;</span>
                <div id="Rate" rel="<%=Model.QuestionID %>">
	                <%=Html.RateSelect(Model.GetAverage())%>
                </div>
                <!--<div id="Rating" class="hidden">正在投票中...</div> -->              
            </div>
            <div class="redirect">
                <a href="#" class="next">下一题（随机抽取）</a>
                <a href="#" class="previous">上一题</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    
	<div class="columnleft">    
        
        <div class="blank10"></div>
        
        <div class="box2">
            <% Html.RenderPartial(Model.Category.QuestionMetaObj.DetailsForm, Model); %>
        </div>
        <div class="blank10"></div>
        
        <div class="box2 answer">
        <%Antaeus.ORM.Wiki anwser =Model.Meta.GetWiki("Answer");  %>
            <div class="bar2">
            	<div class="left">
                	<h2>题目解答过程</h2>
                    <div class="information">
                    	当前版本&nbsp;<span class="red" id="WikiVersion"><%=Html.Encode(anwser.WikiContent.Reversion)%></span>&nbsp;由&nbsp;<span class="blue" id="WikiAuthor"><%= Html.Encode(anwser.WikiContent.CrUserName)%></span>&nbsp;更新于&nbsp;<span class="orange" id="WikiTime"><%= Html.Encode(String.Format("{0:g}",  anwser.WikiContent.CreatedTime))%></span>&nbsp;最新版本是&nbsp;<span class="green" id="WikiVersion"><%=Html.Encode(anwser.WikiContent.Reversion)%></span>
                    </div>
                	<div class="information">感谢&nbsp;
                	<%for (int i=0;i<anwser.Contributors.Count; i++)
                   {%>
                      <span class="blue"> <%=Html.Encode(anwser.Contributors[i])%></span>
                      <%if(i<anwser.Contributors.Count){ %>
                      &nbsp;,&nbsp;
                    <% }
                   } %>
                	&nbsp;对此题目的解答所做出的贡献</div>
                </div>
                <div class="right">
                	<a class="btn-small btn-edit" id="ButtonWikiEdit">编辑此题的解答过程</a>
                    <div class="clear"></div><div class="blank10"></div>
                    <a class="btn-small btn-history" id="PopupHistory"  href="#/wiki/history/<%= anwser.KID%>">查看历史版本</a>                   
                </div>
                <div class="clear"></div>
            </div>
            <div class="wiki" id="WikiContent">
            	<%if(string.IsNullOrEmpty(anwser.WikiContent.Content)){ %>
                    <div class="nocontent">这道题目目前还没有题目解答，你如果正确地完成了这道题目，我们非常欢迎你把你的解答过程分享给大家。<a href="#" id="LinkWikiEdit">点击这里立即编辑题目</a></div>
                <%} %>
            	<div id="WikiContentEditArea">
                	<p><%= anwser.WikiContent.Content%></p>
            	</div>
                <div class="wiki-submit hidden">
                	<a class="btn-form-green" href="#" id="WikiEditSubmit">提交</a>
                    <a class="btn-form-gray" href="#" id="WikiEditDestroy">取消</a>
                </div>
                <div class="clear blank15"></div>

            </div>
        </div>
        <div class="blank10"></div>
        <div class="box2 survey">
            <div class="bar2">
            	<h2>请你对这道题作出评价</h2>
                <div class="information">作出评价将可以获得积分哦，将更有助于我们了解你并对你做出推荐</div>
            </div>
            <div class="context">
            	<div class="sur_form">
                	<h4>这道题你自己做得怎么样？</h4>                    
                    <span><input type="radio" name="do" />额。。。我是蒙对的</span>                    
                    <span><input type="radio" name="do" />这么简单必然做对啊</span>                    
                    <span><input type="radio" name="do" />虽然当时不肯定答案还是做对了</span>                    
                    <span><input type="radio" name="do" />完全不懂蒙错了</span>                    
                    <span><input type="radio" name="do" />气死我了，又粗心</span>
                    <div class="clear"></div>
                    <div class="blank10"></div>
                </div>
                <div class="blank10"></div>
                <div class="sur_form">
                	<h4>这道题看完解答后懂了不？</h4>                    
                    <span><input type="radio" name="do" />懂！！！原来如此啊！</span>                    
                    <span><input type="radio" name="do" />还是不懂。。。我能力不够吧</span>                    
                    <span><input type="radio" name="do" />还是不懂。。。解答太烂了</span>
                    <div class="clear"></div>
                    <div class="blank10"></div>
                </div>
            </div>
        </div>
        <div class="blank10"></div>
        <div class="box2 comment">
            <div class="bar2">
            	<div class="left">
                	<h2>讨论题目</h2>
                    <div class="information">如果你有任何问题，欢迎在这里发表，大家一起来解决题目问题</div>
                </div>
                <div class="right">
                	<a class="btn-small btn-comment" href="#">发表一个新的评论</a>
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="context">            
            <%
                int floor = 0;
                foreach (var com in Model.GetComments())
              {
                  floor++;
                  %>
            	<div class="comm_item">
                	<div class="left"><span class="blue"><%=com.CrUserName %></span>&nbsp;发布于&nbsp;<span class="orange"><%=com.CreatedTime.ToStr() %></span></div>
                    <div class="right"><span class="green"><%=floor.ToString() %></span>&nbsp;楼</div>
                    <div class="clear"></div>
                    <p><%=Html.Encode(com.Content) %></p>
                </div>
             <%}
                if (floor == 0)
                { %>
            	<div class="comm_no">目前还没有人对这个题目提出问题和讨论，您如果对于这道题有任何的问题，请一定在下面提出来，热心的其它用户们一定会马上为您解答的。</div>
              <%} %>             
                <div class="comm_form">
                	<textarea id="CommentContent" name="content"></textarea>
                    <br /><a class="btn-form-green" id="CommentSubmit" rel="/Question/comment/<%=Model.QuestionID %>?content=">提交新的讨论发言</a>
                </div>
                               
            </div>
            <div class="bar1 indexbottom">
                <div class="barpage">
                    <span>讨论翻页：</span>

                </div>
                
            </div> 
        </div>
        <div class="blank10"></div>
    </div>
    
    <div class="columnright">
    	<div class="blank10"></div>
        <div class="box3">
        <%if (Convert.ToBoolean(this.ViewData["Tagged"]))
          { %>
            <a class="btn-huge btn-huge-favorite btn-huge-already"><p><b>此题已在收藏夹</b><span>你已经将此题加入到收藏夹了</span></p></a>
        <%}
          else
          { %>        
            <a href="#" class="btn-huge btn-huge-favorite" id="LinkFavoriteAdd"><p><b>加入到收藏夹</b><span>整理出一个自己的小题库，以后可以随时不断复习强化</span></p></a>
        <%} %>
            <a href="#" class="btn-huge btn-huge-email"><p><b>EMAIL发送给朋友</b><span>分享给朋友或让朋友来帮助你解答问题</span></p></a>
            <a href="#" class="btn-huge btn-huge-print"><p><b>打印本页的题目和解答</b><span>将题目打印出来，拿在手上看，随时复习</span></p></a>
        </div>
        <div class="blank10"></div>
        <div class="box3 w-precentage">
        	<h3 class="box-title">
            	题目统计数据
                <div class="right">
                	<span>正确率</span>
                    <b>45%</b>
                </div>
            </h3>
            <div class="context">
            	<div class="col1"><div style="height:45px;"></div><span>45%</span><b>选A</b></div>
				<div class="col2"><div style="height:5px;"></div><span>5%</span><b>选B</b></div>
                <div class="col3"><div style="height:20px;"></div><span>20%</span><b>选C</b></div>
                <div class="col4"><div style="height:13px;"></div><span>13%</span><b>选D</b></div>
                <div class="col5"><div style="height:17px;"></div><span>17%</span><b>选E</b></div>
            </div>
        </div>
        <div class="blank10"></div>
        <div class="box3 w-related">
            <h3 class="box-title">相关的知识点</h3>
            <div class="context">
            	<div class="item">
                	<b>知识点的标题</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>知识点的标题</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>知识点的标题</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>知识点的标题</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>知识点的标题</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
            </div>
            <div class="blank10"></div>
        </div>
        <div class="blank10"></div>
        <div class="box3 w-related">
            <h3 class="box-title">相关的其它题目</h3>
            <div class="context">
            	<div class="item">
                	<b>阅读：28393</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>阅读：28393</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>阅读：28393</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>阅读：28393</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
                <div class="item">
                	<b>阅读：28393</b>
                    <span>价值3.5</span>
                    <p>标签：核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛,&nbsp;核设,&nbsp;哈哈,&nbsp;很多嘛</p>
                </div>
            </div>
            <div class="blank10"></div>
        </div>
        <div class="blank10"></div>
    </div>
    
    <div class="clear"></div>
</div>
<uc1:QuestionReportPopup ID="QuestionReportPopup" runat="server" />
<uc2:AddFavoritePopup ID="AddFavoritePopup" runat="server" />


</form>
</asp:Content>

