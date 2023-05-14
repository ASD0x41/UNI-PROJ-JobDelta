<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="JobDelta.Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/Search.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    	<div class="container">
		<h1>Search Profile</h1>

		<form runat="server">
			


			<asp:TextBox ID="searchname" runat="server" placeholder="Search by username..."></asp:TextBox>
			<asp:button CssClass="sp_button" ID="BtnSearch" runat="server" Text="Search" onclick="BtnSearch_Click" />
		</form>

		<%--<div id="profresults" style="display:none;">--%>
            <div id="profresults">

			<div class="container">

         <div class="personal-info">
              <div class="prof" id="profile-picture">
                <asp:Image ID="ImageControl" runat="server" Height="300px" Width="300px" />
              </div>
                    
             <div class="content">
                     <div class="prof" id="fullname">
                        <h2><asp:Label ID="fullNameLabel" runat="server" Text="John Doe"></asp:Label></h2>
                     </div>

                    <div class="prof" id="Gender">
                        <p><b>Gender :</b> <asp:Label ID="genderLabel" runat="server" Text="Male"></asp:Label></p>
                    </div>
                 
                    <div class="prof" id="usertype">
                        <p><b>User Type :</b> <asp:Label ID="usrtype" runat="server" Text="None"></asp:Label></p>
                    </div>

                    <div class="prof" id="userid">
                        <p><b>User ID :</b> <asp:Label ID="idusr" runat="server" Text="-1"></asp:Label></p>
                    </div>

                    <div class="prof" id="email">
                        <p><b>Email :</b> <asp:Label ID="emailLabel" runat="server" Text="john.doe@example.com"></asp:Label></p>
                    </div>

                    <div class="prof" id="Phone_Number">
                        <p><b>Phone_Number :</b> <asp:Label ID="phoneNumberLabel" runat="server" Text="0100-1234561"></asp:Label></p>
                    </div>
                    
                    <div class="prof" id="WorkAdress">
                        <p><b>Address :</b> <asp:Label ID="WorkaddressLabel" runat="server" Text="3b Street New York City"></asp:Label></p>
                    </div>             

                 <br />
             </div>
         </div>

              <br />
           


            <hr style="height: 6px;" />
             <hr/>
            <br />
            <h2 style="color:#ff6a00">About Me</h2>
            <br />
          <div class="prof" id="summary">
            <p><asp:Label ID="aboutUs" runat="server" Text=""></asp:Label></p>
            <br/>
            <br/>
          </div>
            <br/>
            <br/>
            <br/>

           <br />
            
          </div>



		</div>

	</div>

	<script>
        function displayprofile() {

            const popup = document.querySelector("#profresults");

            popup.style.display = "flex";

            return;

        }

        function hideprofile() {

            const popup = document.querySelector("#profresults");

            popup.style.display = "none";

            return;

        }


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
