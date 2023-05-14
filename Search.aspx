<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="JobDelta.Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/Search.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    	<div class="container">
		<h1>Search Profile</h1>

		<form runat="server">
			<label for="account-type" style="margin-left:17%;">Account Type:</label>
			<select id="account-type">
				<option value="">All</option>
				<option value="Freelancer">Freelancer</option>
				<option value="Client">Client</option>
			</select>

			<label for="occupation">Occupation:</label>
			<select id="occupation">
				<option value="">All</option>
				<option value="developer">Developer</option>
				<option value="designer">Designer</option>
				<option value="writer">Writer</option>
				<option value="consultant">Consultant</option>
			</select>

			<input type="text" id="search" placeholder="Search profiles...">
			<asp:button CssClass="sp_button" ID="BtnSearch" runat="server" Text="Search" onclick="BtnSearch_Click" />
		</form>

		<div id="results">
			<!-- Profiles will be displayed here -->
		</div>

	</div>

	<script>
        /*const form = document.querySelector('form');
        const accountTypeSelect = document.getElementById('account-type');
        const occupationSelect = document.getElementById('occupation');
        const searchInput = document.getElementById('search');
        const resultsDiv = document.getElementById('results');

        form.addEventListener('submit', e => {
            e.preventDefault();
            const accountType = accountTypeSelect.value;
            const occupation = occupationSelect.value;
            const searchTerm = searchInput.value;
            // Perform search and display results
            // You can use an AJAX request to a server-side script to retrieve and display the results dynamically
        });*/
    </script>

</asp:Content>
