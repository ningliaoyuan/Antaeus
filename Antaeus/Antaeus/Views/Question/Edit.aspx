<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Antaeus.Models.ANT_QUESTION>" %>

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
                <label for="QUES_ID">QUES_ID:</label>
                <%= Html.TextBox("QUES_ID", Model.QUES_ID) %>
                <%= Html.ValidationMessage("QUES_ID", "*") %>
            </p>
            <p>
                <label for="QUES_CONTENT">QUES_CONTENT:</label>
                <%= Html.TextBox("QUES_CONTENT", Model.QUES_CONTENT) %>
                <%= Html.ValidationMessage("QUES_CONTENT", "*") %>
            </p>
            <p>
                <label for="QUES_ASK">QUES_ASK:</label>
                <%= Html.TextBox("QUES_ASK", Model.QUES_ASK) %>
                <%= Html.ValidationMessage("QUES_ASK", "*") %>
            </p>
            <p>
                <label for="QUES_TYPE">QUES_TYPE:</label>
                <%= Html.TextBox("QUES_TYPE", Model.QUES_TYPE) %>
                <%= Html.ValidationMessage("QUES_TYPE", "*") %>
            </p>
            <p>
                <label for="QUES_KNOWLEDGE">QUES_KNOWLEDGE:</label>
                <%= Html.TextBox("QUES_KNOWLEDGE", Model.QUES_KNOWLEDGE) %>
                <%= Html.ValidationMessage("QUES_KNOWLEDGE", "*") %>
            </p>
            <p>
                <label for="QUES_CATEGORY">QUES_CATEGORY:</label>
                <%= Html.TextBox("QUES_CATEGORY", Model.QUES_CATEGORY) %>
                <%= Html.ValidationMessage("QUES_CATEGORY", "*") %>
            </p>
            <p>
                <label for="QUES_RELATED">QUES_RELATED:</label>
                <%= Html.TextBox("QUES_RELATED", Model.QUES_RELATED) %>
                <%= Html.ValidationMessage("QUES_RELATED", "*") %>
            </p>
            <p>
                <label for="QUES_SOURCE">QUES_SOURCE:</label>
                <%= Html.TextBox("QUES_SOURCE", Model.QUES_SOURCE) %>
                <%= Html.ValidationMessage("QUES_SOURCE", "*") %>
            </p>
            <p>
                <label for="QUES_VALUE">QUES_VALUE:</label>
                <%= Html.TextBox("QUES_VALUE", String.Format("{0:F}", Model.QUES_VALUE)) %>
                <%= Html.ValidationMessage("QUES_VALUE", "*") %>
            </p>
            <p>
                <label for="QUES_VIEW">QUES_VIEW:</label>
                <%= Html.TextBox("QUES_VIEW", Model.QUES_VIEW) %>
                <%= Html.ValidationMessage("QUES_VIEW", "*") %>
            </p>
            <p>
                <label for="QUES_COMMENT_COUNT">QUES_COMMENT_COUNT:</label>
                <%= Html.TextBox("QUES_COMMENT_COUNT", Model.QUES_COMMENT_COUNT) %>
                <%= Html.ValidationMessage("QUES_COMMENT_COUNT", "*") %>
            </p>
            <p>
                <label for="QUES_CREATEDATE">QUES_CREATEDATE:</label>
                <%= Html.TextBox("QUES_CREATEDATE", String.Format("{0:g}", Model.QUES_CREATEDATE)) %>
                <%= Html.ValidationMessage("QUES_CREATEDATE", "*") %>
            </p>
            <p>
                <label for="QUES_CREATEUSER_ID">QUES_CREATEUSER_ID:</label>
                <%= Html.TextBox("QUES_CREATEUSER_ID", Model.QUES_CREATEUSER_ID) %>
                <%= Html.ValidationMessage("QUES_CREATEUSER_ID", "*") %>
            </p>
            <p>
                <label for="QUES_CREATEUSER_NICKNAME">QUES_CREATEUSER_NICKNAME:</label>
                <%= Html.TextBox("QUES_CREATEUSER_NICKNAME", Model.QUES_CREATEUSER_NICKNAME) %>
                <%= Html.ValidationMessage("QUES_CREATEUSER_NICKNAME", "*") %>
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

