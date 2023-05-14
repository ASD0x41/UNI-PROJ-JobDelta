<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="JobDelta.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/myProfile.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <form action="#" runat="server">

            <div class="header">
          <h1>My Profile</h1>
        </div>

        <div class="container">

         <div class="personal-info">
              <div class="editable" id="profile-picture">
                <asp:Image ID="ImageControl" runat="server" Height="300px" Width="300px" />
              </div>
                    
             <div class="content">
                     <div class="editable" id="fullname">
                        <h2><asp:Label ID="fullNameLabel" runat="server" Text="John Doe"></asp:Label></h2>
                     </div>

                    <div class="editable" id="Gender">
                        <p><b>Gender :</b> <asp:Label ID="genderLabel" runat="server" Text="Male"></asp:Label></p>
                    </div>
                    
                     <div class="editable" id="CNIC">
                        <p><b>CNIC :</b> <asp:Label ID="CNICLabel" runat="server" Text="0100-1234561-3"></asp:Label></p>
                    </div>   

                     <div class="editable" id="DateofBirth">
                        <p><b>Date-of-Birth :</b> <asp:Label ID="DOBLabel" runat="server"></asp:Label></p>
                    </div>   

                    <div class="editable" id="email">
                        <p><b>Email :</b> <asp:Label ID="emailLabel" runat="server" Text="john.doe@example.com"></asp:Label></p>
                    </div>

                    <div class="editable" id="Phone_Number">
                        <p><b>Phone_Number :</b> <asp:Label ID="phoneNumberLabel" runat="server" Text="0100-1234561"></asp:Label></p>
                    </div>
                    
                    <div class="editable" id="WorkAdress">
                        <p><b>Address :</b> <asp:Label ID="WorkaddressLabel" runat="server" Text="3b Street New York City"></asp:Label></p>
                    </div>             

                 <br />
                 <br />
              <a class="edit-button" id="personal-info-btn">Edit</a>
                 <br />
                 <br />
                 <br />
              <a class="edit-button" id="ChangePassword">Change-Password</a>
                 <br />
                 <br />
                 <asp:TextBox ID="ERROR" runat="server" CssClass="ERROR_txt" BorderStyle="None" Text="" ></asp:TextBox>
              <br />
             </div>
             </div>

              <br />
              <br />
              <p><asp:FileUpload ID="fileUpload" runat="server" /><br /><br /><asp:Button ID="btnUpload" runat="server" CssClass="sp_button" Text="Upload" OnClick="btnUpload_Click"/></p>

           <br/>
           <br/>
           <br/>


            <hr style="height: 6px;" />
             <hr/>
            <br />
            <h2 style="color:#ff6a00">About Me</h2>
            <p style="font-size:10px; margin-top:-15px; font-weight:bold;">( *Note : if you are a Freelancer do provide you specialization and qualification to make a good impression on Client and As a Client you should provide sufficient information about your frim or personal aims for Lancer. )</p>
            <br />
          <div class="editable" id="summary">
            <p><asp:Label ID="aboutUs" runat="server"></asp:Label></p>
            <br/>
            <br/>
              <a class="edit-button" id="summary-info-btn">Edit</a>
          </div>
            <br/>
            <br/>
            <br/>

             <hr style="height: 6px;" />

             <hr/>
           <br />
            <div class="job">
               <h2 style="color:#ff6a00" id="job-title">Banking Information</h2>
               <div class="editable" id="Accountdetail">
                        <p><b>BankAccount :</b> <asp:Label ID="BankAccountLable" runat="server"></asp:Label></p>
                    </div> 
                <div class="editable" id="Money">
                        <p><b>WalletMoney :</b> <asp:Label ID="MoneyLabel" runat="server"></asp:Label></p>
                    </div> 
                <br/>
                <br/>
            </div>
          </div>


<%-- -------------------------------------------------------------------------------------------------------------------- --%>

<div id="personal-info-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Personal Information</h2>

        <label for="name">Name:</label>
        <asp:TextBox ID="Name_I" runat="server" CssClass="form-control" Width="40%" ></asp:TextBox>

        <label for="email">Email:</label>
        <asp:TextBox ID="Email_I" runat="server" CssClass="form-control" Width="60%" ></asp:TextBox>

        <label for="phone">Phone Number:</label>
        <asp:TextBox ID="phone" runat="server" CssClass="form-control" Width="50%"></asp:TextBox>

        <label for="address">Address:</label>
        <asp:TextBox ID="address" runat="server" CssClass="form-control" Width="60%" ></asp:TextBox>
         <br />
         <br />
        <asp:Button  ID="Button1" CSSclass="edit-button" runat="server" Text="Save" onclick="btnSubmit_Click"/>
  
  </div>
</div>

<%------------------------------------------------------------------------------------------------------------------------%>

<div id="summary-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Summary</h2>
    
      <label for="summary">Summary:</label>
      <asp:TextBox id="summary_I" runat="server"></asp:TextBox>
      <asp:Button ID="BtnSignIn" CSSclass="edit-button" runat="server" Text="Save" onclick="btnUpdateAbout_Click"/>
    
  </div>
</div>



<%-- -------------------------------------------------------------------------------------------------------------------- --%>

    <div id="Password-info-modal" class="modal">
  <div class="modal-content" style="width:40%">
    <span class="close">&times;</span>
    <h2>Change Password</h2>

        <label for="OldPassword">Old Password :</label>
        <asp:TextBox ID="OldPassword" runat="server" CssClass="form-control" TextMode="Password" Width="60%" Height="20px" ></asp:TextBox>
        <br />
        <label for="NewPassword">New Password:</label>
        <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password" Width="60%" Height="20px" ></asp:TextBox>
        <label for="NewPassword2">Confirm New Password:</label>
        <asp:TextBox ID="NewPassword2" runat="server" CssClass="form-control" TextMode="Password" Width="60%" Height="20px" ></asp:TextBox>
         <br />
         <br />
        <asp:Button  ID="Change_btn" CSSclass="edit-button" runat="server" TextMode="Password" Text="Change" onclick="btnChangePassword_Click"/>
  
  </div>
</div>

<%-- -------------------------------------------------------------------------------------------------------------------- --%>
</form>

    <script src="Resources/JavaScript/MyProfile.js"></script>

</asp:Content>
