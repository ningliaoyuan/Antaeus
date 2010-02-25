<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="thetitle">
    <h1><span class="blue">Lanslot Liu</span> 的用户中心</h1>
    <p><span class="green">普通用户</span>，当前积分为&nbsp;<span class="orange">3942</span> ，还需要&nbsp;<span class="orange">39402</span>&nbsp;升级到<span class="green">&nbsp;高级用户</span></p>
</div>
<div class="nav">
    <a href="/Account/Index/" class="current">一览</a>
    <a href="/Account/AccountSetting/">设置</a>
    <a href="/Account/Mail/">站内信件</a>
    <a href="/Account/Favorite/">收藏夹</a>
    <a href="/Account/ContentRecord/" style="border:0;">内容管理</a>
</div>

<!-- 一览和设置均没有二级菜单 -->

<div class="subnav">
    <a href="/Account/Mail/New/">发新的邮件</a>
    <a href="/Account/Mail/Inbox/" class="current">收件箱</a>
    <a href="/Account/Mail/Outbox">发件箱</a>
    <a href="/Account/Mail/Trash/">垃圾箱</a>
    <a href="/Account/Mail/Draft/" style="border:0;">草稿箱</a>
</div>

<!--<div class="subnav">
    <a href="/Account/Favorite/Incorrected/" class="current">我做错的题目</a>
    <a href="/Account/Favorite/Question/">题目收藏</a>
    <a href="/Account/Favorite/Knowledge/">知识点收藏</a>
    <a href="/Account/Favorite/Article/" style="border:0;">文章收藏</a>
</div>-->

<!--<div class="subnav">
    <a href="/Account/ContentRecord/Publish/" class="current">我发布的内容</a>
    <a href="/Account/ContentRecord/Edit/">我参与编辑的内容</a>
    <a href="/Account/ContentRecord/Comment/" style="border:0;">我发表的讨论</a>
</div>-->