<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Antaeus.ORM.Category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="CategoryID">CategoryID:</label>
                <%= Html.TextBox("CategoryID", Model.CategoryID) %>
                <%= Html.ValidationMessage("CategoryID", "*") %>
            </p>
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name", Model.Name) %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
                <label for="ShortName">ShortName:</label>
                <%= Html.TextBox("ShortName", Model.ShortName) %>
                <%= Html.ValidationMessage("ShortName", "*") %>
            </p>
            <p>
                <label for="QuestionType">QuestionType:</label>
                <%= Html.TextBox("QuestionType", Model.QuestionType) %>
                <%= Html.ValidationMessage("QuestionType", "*") %>
            </p>
            <p>
                <label for="QuestionTypeMeta">QuestionTypeMeta:</label>
                <%= Html.TextBox("QuestionTypeMeta", Model.QuestionTypeMeta) %>
                <%= Html.ValidationMessage("QuestionTypeMeta", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

