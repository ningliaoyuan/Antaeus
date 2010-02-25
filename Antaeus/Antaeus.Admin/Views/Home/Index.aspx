<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome To Antaeus Project Admin Page</h2>
    <p>
        To learn more about Antaeus visit <a href="http://antaeus.jinbu8.com" title="Antaeus Project">http://antaeus.jinbu8.com</a>.
    </p>
</asp:Content>
