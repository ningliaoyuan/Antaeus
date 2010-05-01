<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="home column2">
    <div class="blank10"></div>
    <div class="columnleft">
        <div class="new-box new-index-question">
            <h2>马上做题：近期最有价值的题目</h2>
            <div id="Tab">
                <ul class="tab-header">
                    <li tab="4">数&nbsp;学</li>
                    <li tab="3">RC&nbsp;阅读</li>
                    <li tab="2">CR&nbsp;逻辑</li>
                    <li class="tab-current" tab="1">SC&nbsp;语法</li>
                    <div class="clear"></div>                 
                </ul>
                <div class="tab-content" tab="1">
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
                <div class="tab-content" tab="2">
                    <div class="question">Which of the following most logically completes the argument below?</div>
                    <div class="description">
                        <p>Although the number of large artificial satellites orbiting the Earth is small compared to the number of small pieces of debris in orbit, the large satellites interfere more seriously with telescope observations because of the strong reflections they produce. Because many of those large satellites have ceased to function, the proposal has recently been made to eliminate interference from nonfunctioning satellites by exploding them in space. This proposal, however, is ill conceived, since<span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>.</p>
                    </div>
                    <div class="choices">
                        <input type="radio" name="choice" value="A" />
                        <p>many nonfunctioning satellites remain in orbit for years</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="B" />
                        <p>for satellites that have ceased to function, repairing them while they are in orbit would be prohibitively expensive</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="C" />
                        <p>there are no known previous instances of satellites' having been exploded on purpose</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="D" />
                        <p>the only way to make telescope observations without any interference from debris in orbit is to use telescopes launched into extremely high orbits around the Earth</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="E" />
                        <p>a greatly increased number of small particles in Earth's orbit would result in a blanket of reflections that would make certain valuable telescope observations impossible</p>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="tab-content" tab="3">
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
                <div class="tab-content" tab="4">
                    <div class="description">
                        <p>A glucose solution contains 15 grams of glucose per 100 cubic centimeters of solution. If 45 cubic centimeters of the solution were poured into an empty container, how many grams of glucose would be in the container?</p>
                    </div>
                    
                    <div class="choices">
                        <input type="radio" name="choice" value="A" />
                        <p>3.00</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="B" />
                        <p>5.00</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="C" />
                        <p>5.50</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="D" />
                        <p>6.50</p>
                        <div class="clear"></div>
                        <input type="radio" name="choice" value="E" />
                        <p>6.75</p>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="new-box-bottom">
            <div class="left">
                <div class="default hidden">455人做过此题后正确率为33.4%<br />共有15人参与编辑题目解答，134条讨论</div>
                <div class="correct hidden"><span>恭喜你，你做对了！</span><br />你不是蒙对的吧？点击右边按钮以查看详情</div>
                <div class="incorrect"><span>很遗憾，你做错了！</span><br />不知道怎么错的？点击右边按钮以查看详情</div>
            </div>
            <div class="right">
                <input type="button" value="查看题目的解答过程" />
                <a>再来一题</a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="blank10"></div>
<!--  注释掉原来的东西，只留下prototype相关的        
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
-->
    </div>

<!--  注释掉原来的东西，只留下prototype相关的    
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
-->
	<div class="columnright">
        
        <div class="new-box-title">题目排行榜</div>
        <div class="new-box2">
            
            <div class="accordion" id="Accordion">
                <div class="accordion-title accordion-current">
                    <span>GMAT十大语法难题</span><i>▼</i><div class="clear"></div>
                </div>                    
                <div class="accordion-content">
                    <ul>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li class="last"><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                    </ul>
                </div>                    
                <div class="accordion-title">
                    <span>GMAT十大语法难题</span><i>▼</i><div class="clear"></div>
                </div>
                <div class="accordion-content">
                    <ul>
                        <li><a href="#">CR&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">CR&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li class="last"><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                    </ul>
                </div>
                <div class="accordion-title">
                    <span>GMAT十大语法难题</span><i>▼</i><div class="clear"></div>
                </div>
                <div class="accordion-content">
                    <ul>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li class="last"><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                    </ul>
                </div>
                <div class="accordion-title">
                    <span>GMAT十大语法难题</span><i>▼</i><div class="clear"></div>
                </div>
                <div class="accordion-content">
                    <ul>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                        <li class="last"><a href="#">SC&nbsp;语法 - 12943，来自 GWD</a><br /><span>评分3.6；15人参与编辑解答；245讨论</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="blank10"></div>
    </div>
 
</div>
</asp:Content>
