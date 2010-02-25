<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Antaeus.ORM.QuestionMetaData>" %>
<p>
    <label for="T1">T1:</label>
    <%= Html.TextBox("T1") %>
    <%= Html.ValidationMessage("T1", "*") %>
    <label for="T2">T2:</label>
    <%= Html.TextBox("T2") %>
    <%= Html.ValidationMessage("T2", "*") %>
    
    <input type="hidden" value="T1,T2" />
</p>
