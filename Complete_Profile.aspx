<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Complete_Profile.aspx.cs" Inherits="JobDelta.Complete_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head runat="server">
    <link href="Resources/CSS/Complete_Profile.css" rel="stylesheet" />
    <script src="https://www.google.com/recaptcha/api.js" async="async" defer="defer"></script>
    <title></title>
</head>


<body>
    <form id="form1" action="#" runat="server">

        <div class="header">
          <h1>Complete Your Profile</h1>
        </div>

    

        <div class="profile-picture" style="margin-top:10%;">
                    <div class="upload-button-container">
                        <asp:Label ID="lblFileUpload" runat="server" AssociatedControlID="fileUpload">Select an image to upload:</asp:Label>
                        <br />
                        <br />
                        <asp:FileUpload ID="fileUpload" runat="server" />
                        <br />
                    </div>
        </div>

        <br />
        <h2>Personal Information</h2>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />

            <label for="fullname">Full Name</label>
            <asp:TextBox ID="fullname" runat="server" Width="40%" CssClass="form-control" placeholder="Enter your full name" required="required"></asp:TextBox>

            <label for="gender">Gender:</label>
            <asp:DropDownList ID="gender"  runat="server" Width="35%" CssClass="form-control" required="required">
                <asp:ListItem Value="">Select your gender</asp:ListItem>
                <asp:ListItem Value="male">Male</asp:ListItem>
                <asp:ListItem Value="female">Female</asp:ListItem>
                <asp:ListItem Value="other">Other</asp:ListItem>
            </asp:DropDownList>

            <label for="birthdate">Birthdate</label>
            <asp:TextBox ID="birthdate" runat="server" Width="30%" CssClass="form-control" type="date" required="required"></asp:TextBox>

            <label for="CNIC">CNIC</label>
            <asp:TextBox ID="CNIC" runat="server" Width="60%" CssClass="form-control" placeholder="Enter your CNIC" required="required"></asp:TextBox>

            <label for="phone">Phone Number</label>
            <asp:TextBox ID="phone" runat="server" Width="50%" CssClass="form-control" placeholder="Enter your phone number" required="required"></asp:TextBox>

            <label for="Address">Work Address</label>
            <asp:TextBox ID="workaddress" runat="server" Width="60%" CssClass="form-control" placeholder="Enter your work address"></asp:TextBox>

            <label for="bio">Bio:</label>
            <asp:TextBox ID="bio" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Something About Yourself"></asp:TextBox>

        <h2>Banking Information</h2>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />

                <label for="accountnumber">Account Number</label>
                <asp:TextBox ID="TextBox1" runat="server" Width="60%" CssClass="form-control" placeholder="Enter your account number" required="required"></asp:TextBox>

                <label for="accounttype">Account Type</label>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="40%" CssClass="form-control" required="required">
                    <asp:ListItem Value="">Select your account type</asp:ListItem>
                    <asp:ListItem Value="checking">Checking</asp:ListItem>
                    <asp:ListItem Value="savings">Savings</asp:ListItem>
                </asp:DropDownList>        
        <br />
        <br/><br/>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />
        <br/>
        <asp:button ID="SubmitBtn" runat="server" CSSclass="sp_button" BackColor="black" Text="Submit" OnClick="UpdateUserInfo_Click"></asp:button><br />

    


    </form>
    <script src="Resources/JavaScript/Complete%20profile.js"></script>

</body>
</html>
