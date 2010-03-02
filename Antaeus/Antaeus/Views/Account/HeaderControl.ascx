<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%string showClass = "class=\"current\""; %>
<div class="thetitle">
    <h1><span class="blue">Lanslot Liu</span> 的用户中心</h1>
    <p><span class="green">普通用户</span>，当前积分为&nbsp;<span class="orange">3942</span> ，还需要&nbsp;<span class="orange">39402</span>&nbsp;升级到<span class="green">&nbsp;高级用户</span></p>
</div>

<div class="nav">
    <a href="/Account/Index/" <%= "Index".Equals(Attributes["p"])?showClass:string.Empty %>>一览</a>
    <a href="/Account/AccountSetting/" <%= "AccountSetting".Equals(Attributes["p"])?showClass:string.Empty %>>设置</a>
    <a href="/Account/Mail/" <%= "Mail".Equals(Attributes["p"])?showClass:string.Empty %>>站内信件</a>
    <a href="/Account/Favorite/" <%= "Favorite".Equals(Attributes["p"])?showClass:string.Empty %>>收藏夹</a>
    <a href="/Account/ContentRecord/" <%= "ContentRecord".Equals(Attributes["p"])?showClass:string.Empty %> style="border:0;">内容管理</a>
</div>