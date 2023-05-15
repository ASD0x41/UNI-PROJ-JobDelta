<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="JobDelta.Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/search.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    	<div class="container">
		

		<form runat="server">		
            
             <script type="text/javascript">


                 function hideElements() {
                     var personalInfoElements = document.querySelectorAll('.personal-info');
                     var aInfoElements = document.querySelectorAll('.A_info');

                     personalInfoElements.forEach(function (element) {
                         element.style.visibility = 'hidden';
                     });

                     aInfoElements.forEach(function (element) {
                         element.style.visibility = 'hidden';
                     });
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

            <div style="margin-left:19%;">
                <h1 style="margin-left:18%;">Search Profile</h1>
			<asp:TextBox ID="searchname" CssClass="S_Bar" runat="server" placeholder="Search by username..."></asp:TextBox>
			<asp:button CssClass="sp_button" ID="BtnSearch" runat="server" Text="Search" onclick="BtnSearch_Click" />
            </div>
            <br />
            <br />
            <br />

		</form>

		<%--<div id="profresults" style="display:none;">--%>
            <div id="profresults">

<div class="container" >

         <div class="personal-info">
              <div class="prof" id="profile-picture">
                <asp:Image ID="ImageControl" runat="server" Height="300px" Width="300px" />
              </div>
                    
             <div class="content">
                     <div class="prof" id="fullname">
                        <h2><asp:Label ID="fullNameLabel" runat="server" Text=""></asp:Label></h2>
                     </div>

                    <div class="prof" id="Gender">
                        <p><b>Gender :</b> <asp:Label ID="genderLabel" runat="server" Text=""></asp:Label></p>
                    </div>
                 
                    <div class="prof" id="usertype">
                        <p><b>User Type :</b> <asp:Label ID="usrtype" runat="server" Text=""></asp:Label></p>
                    </div>

                    <div class="prof" id="userid">
                        <p><b>User ID :</b> <asp:Label ID="idusr" runat="server" Text=""></asp:Label></p>
                    </div>

                    <div class="prof" id="email">
                        <p><b>Email :</b> <asp:Label ID="emailLabel" runat="server" Text=""></asp:Label></p>
                    </div>

                    <div class="prof" id="Phone_Number">
                        <p><b>Phone_Number :</b> <asp:Label ID="phoneNumberLabel" runat="server" Text=""></asp:Label></p>
                    </div>
                    
                    <div class="prof" id="WorkAdress">
                        <p><b>Address :</b> <asp:Label ID="WorkaddressLabel" runat="server" Text=""></asp:Label></p>
                    </div>             

                 <br />
             </div>
         </div>
         </div>

              <br />
           

       <div class="A_info">

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

</asp:Content>
