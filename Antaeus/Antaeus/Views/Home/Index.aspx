<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="home column2">
    <div class="blank10"></div>
    <div class="columnleft">
        <div class="box2 aggd">
            <img src="../../Contents/Temp/IndexAD.jpg" width="700" height="300" />
        </div>
        <div class="blank10"></div>
        <div class="box2 thebox">
        	<h2 class="question">马上做一道推荐的经典题目</h2>
            <div class="tab tab-gray tab-inline">
                <ul>
                    <li rel="#indexTab1-4">数学</li>
                    <li rel="#indexTab1-3">RC阅读</li>
                    <li rel="#indexTab1-2">CR逻辑</li>
                    <li rel="#indexTab1-1" class="selected">SC语法</li>
                </ul>
                <div class="tab-content" id="indexTab1-1">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                    <b>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</b>
                    <div class="form">
                        <input type="checkbox" value="A" /><label>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</label>
                        <div class="clear"></div>
                        <input type="checkbox" value="B" /><label>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</label>
                        <div class="clear"></div>
                        <input type="checkbox" value="C" /><label>Contrary to popular belief, Lorem Ipsum is not simply random text.</label>
                        <div class="clear"></div>
                        <input type="checkbox" value="D" /><label>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</label>
                        <div class="clear"></div>
                        <input type="checkbox" value="E" /><label>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</label>
                        <div class="clear"></div>
                    </div>                    
                </div>
                <div class="tab-content hidden" id="indexTab1-2">
                    asdfghjkl
                </div>
                <div class="tab-content hidden" id="indexTab1-3">
                    qwertyuiop
                </div>
                <div class="tab-content hidden" id="indexTab1-4">
                    zxcvbnm
                </div>
            </div>
            <div class="bar">
            	<div class="left">
                	<span class="green correct">恭喜你答对了</span>
                    <span>这题的统计正确率是33.3%，看来你水平还不错嘛</span>
                </div>
                <div class="right">
                	<input type="button" class="btn-form-blue" value="查看详细解答和讨论" />
                    <input type="button" class="btn-form-green" value="再来一题" />
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="blank10"></div>
        <div class="box2 thebox">
        	<h2 class="knowledge">马上学习系统推荐的知识点</h2>
            <div class="tab tab-gray tab-inline">
                <ul>
                    <li rel="#indexTab2-4">数学</li>
                    <li rel="#indexTab2-3">RC阅读</li>
                    <li rel="#indexTab2-2">CR逻辑</li>
                    <li rel="#indexTab2-1" class="selected">SC语法</li>
                </ul>
                <div class="tab-content" id="indexTab2-1">
                    <b>Contrary to popular belief, Lorem Ipsum is not simply random text.</b>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                </div>
                <div class="tab-content hidden" id="indexTab2-2">
                    asdfghjkl
                </div>
                <div class="tab-content hidden" id="indexTab2-3">
                    qwertyuiop
                </div>
                <div class="tab-content hidden" id="indexTab2-4">
                    zxcvbnm
                </div>
            </div>
            <div class="bar">
            	<div class="left">
                	<span class="green">这个知识点的浏览量是23042，重要度为5</span>
                    <span class="spangery">这个知识点关联的题目是：<a href="#">3434</a>、<a href="#">3534</a>、<a href="#">3434</a>、<a href="#">3534</a></span>
                </div>
                <div class="right">
                	<input type="button" class="btn-form-blue" value="查看详细内容和讨论" />
                    <input type="button" class="btn-form-green" value="再看一个" />
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="blank10"></div>
        <div class="box2 thebox">
        	<h2 class="list">必须要练习的各种难题和经典题</h2>
            <div class="tab tab-gray tab-inline">
                <ul>
                    <li rel="#indexTab3-5">作文</li>
                    <li rel="#indexTab3-4">数学</li>
                    <li rel="#indexTab3-3">RC阅读</li>
                    <li rel="#indexTab3-2">CR逻辑</li>
                    <li rel="#indexTab3-1" class="selected">SC语法</li>
                </ul>
                <div class="items" id="indexTab3-1">
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="item"><a href="#">阅读：34359</a><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p></div>
                    <div class="clear"></div>
                </div>
                <div class="tab-content hidden" id="indexTab3-2">hahahahahahahahahahaha</div>
                <div class="tab-content hidden" id="indexTab3-3">xixixixixixixixixixixi</div>
                <div class="tab-content hidden" id="indexTab3-4">wuwuwuwuwuwuwuwuwuwuwu</div>
                <div class="tab-content hidden" id="indexTab3-5">dgdgdgdgdgdgdgdgdgdgdg</div>
            </div>
            <div class="blank15"></div>
        </div>
        <div class="blank10"></div>
    </div>
    
    <div class="columnright">
        <%if (Request.IsAuthenticated)
          { %>
    	<div class="box3 w-minifeed">
        	<h3 class="box-title">最新通知消息</h3>
            <div class="box-content">
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
                <div class="line ucomment"><span class="blue">Lanslot</span>&nbsp;回复了你的提问</div>
                <div class="line ask"><span class="blue">Lanslot</span>&nbsp;在你编辑的题目上提了个问题</div>
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
                <div class="line inbox"><span class="blue">Lanslot</span>&nbsp;给你发了一封站内邮件</div>
            </div>
        </div>
        <div class="blank10"></div>
        <%}
          else
          {%>
        <div class="box3 w-info">
        	<h3 class="box-title">GMAT备考指南</h3>
            <div class="box-content">
                <div class="image"><img src="../../Contents/Temp/Index.GMAT.jpg" /></div>
                <p>GMAT考试是由GMAC举办地美国商学院研究生入学考试。GMAT考试是由GMAC举办地美国商学院研究生入学考试。</p>
                <a href="#">什么样的人需要进行GMAT考试？</a>
                <a href="#">GMAT考试考什么？</a>
                <a href="#">GMAT考试是怎样进行的？</a>
                <a href="#">GMAT考试是如何判分的？</a>
                <div class="blank5"></div>
            </div>
            <div class="box-bar"><a href="#">查看完整的备考指南</a></div>
        </div>
        <div class="blank10"></div>
        <%}%>
        <div class="box3 w-comment">
        	<div class="box-bar-color box-bar-blue"><h3 class="box-title-white">最新提问与讨论</h3></div>
            <div class="box-content">
                <h4><a href="#">逻辑CR：3849</a></h4>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                <b class="orange">Lanslot&nbsp;在2009/6/28&nbsp;发表道</b>
                <p>这一题看不懂啊，谁来给我解答一下啊，人不会都死光了了吧。</p>
                <div class="blank5"></div>
            </div>
            <div class="box-bar"><a href="#">我来回答</a></div>
        </div>
        <div class="blank10"></div>
        <div class="box3 w-rank">
        	<div class="box-bar-color box-bar-orange"><h3 class="box-title-white">排行榜</h3></div>
            <div class="box-content">
                <div class="line"><p><b>1&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;123&nbsp;</i>题</span></div>
                <div class="line"><p><b>2&nbsp;</b>Ningliaoyuan</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;113&nbsp;</i>题</span></div>
                <div class="line"><p><b>3&nbsp;</b>Tairanwang</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;109&nbsp;</i>题</span></div>
                <div class="line"><p><b>4&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;97&nbsp;</i>题</span></div>
                <div class="line"><p><b>5&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;96&nbsp;</i>题</span></div>
                <div class="line"><p><b>6&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;83&nbsp;</i>题</span></div>
                <div class="line"><p><b>7&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;76&nbsp;</i>题</span></div>
                <div class="line"><p><b>8&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;65&nbsp;</i>题</span></div>
                <div class="line"><p><b>9&nbsp;</b>Lanslot</p><span>今天<i>&nbsp;5&nbsp;</i>小时做了<i>&nbsp;9&nbsp;</i>题</span></div>
            </div>
        </div>
        <div class="blank10"></div>
        <div class="box3 w-tag">
        	<div class="box-bar-color box-bar-green"><h3 class="box-title-white">热门标签</h3></div>
            <div class="box-content">
            	<a class="tag2" href="/Tag/Detail/">Art</a>
                <a class="tag1" href="#">Lorem</a>
                <a class="tag1" href="#">Ipsum</a>
                <a class="tag2" href="#">is</a>
                <a class="tag2" href="#">simply</a>
                <a class="tag2" href="#">dummy</a>
                <a class="tag4" href="#">text</a>
                <a class="tag3" href="#">of</a>
                <a class="tag3" href="#">the</a>
                <a class="tag3" href="#">printing</a>
                <a class="tag2" href="#">and</a>
                <a class="tag1" href="#">typesetting</a>
                <a class="tag2" href="#">industry</a>
                <a class="tag4" href="#">Lorem</a>
                <a class="tag3" href="#">Ipsum</a>
                <a class="tag3" href="#">has</a>
                <a class="tag3" href="#">been</a>
                <a class="tag3" href="#">the</a>
                <a class="tag1" href="#">industry's</a>
                <a class="tag1" href="#">standard</a>
                <a class="tag2" href="#">dummy</a>
                <a class="tag1" href="#">text</a>
                <a class="tag2" href="#">ever</a>
                <a class="tag3" href="#">since</a>
                <a class="tag3" href="#">the</a>
                <a class="tag3" href="#">1500s</a>
                <a class="tag4" href="#">when</a>
                <a class="tag4" href="#">an</a>
                <a class="tag4" href="#">unknown</a>
                <a class="tag1" href="#">printer</a>
                <a class="tag2" href="#">took</a>
                <a class="tag2" href="#">Art</a>
                <a class="tag1" href="#">Lorem</a>
                <a class="tag1" href="#">Ipsum</a>
                <a class="tag2" href="#">is</a>
                <a class="tag2" href="#">simply</a>
                <a class="tag2" href="#">dummy</a>
                <a class="tag4" href="#">text</a>
                <a class="tag3" href="#">of</a>
                <a class="tag3" href="#">the</a>
                <a class="tag3" href="#">printing</a>
                <a class="tag2" href="#">and</a>
                <a class="tag1" href="#">typesetting</a>
                <a class="tag2" href="#">industry</a>
                <a class="tag4" href="#">Lorem</a>
                <a class="tag3" href="#">Ipsum</a>
                <a class="tag3" href="#">has</a>
                <a class="tag3" href="#">been</a>
                <a class="tag3" href="#">the</a>
                <a class="tag1" href="#">industry's</a>
                <a class="tag1" href="#">standard</a>
                <a class="tag2" href="#">dummy</a>
                <a class="tag1" href="#">text</a>
                <a class="tag2" href="#">ever</a>
                <a class="tag3" href="#">since</a>
                <a class="tag3" href="#">the</a>
                <a class="tag3" href="#">1500s</a>
                <a class="tag4" href="#">when</a>
                <a class="tag4" href="#">an</a>
                <a class="tag4" href="#">unknown</a>
                <a class="tag1" href="#">printer</a>
                <a class="tag2" href="#">took</a>
                <div class="clear"></div>
            </div>
        </div>
        <div class="blank10"></div>
    </div>
    
</div>
</asp:Content>
