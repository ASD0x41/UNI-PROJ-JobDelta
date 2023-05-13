<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="JobDetail_F.aspx.cs" Inherits="JobDelta.JobDetail_F" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/FreelancerDashboard.css" rel="stylesheet" />
    <link href="Resources/CSS/C_DashBoard.css" rel="stylesheet" />
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form action="#" runat="server">

        <h1>Job Details</h1>
         <asp:Label CssClass="popup-label" runat="server" Text="Job ID:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="jobIDT"  ReadOnly="true"></asp:TextBox>
         
         <br />

         <asp:Label CssClass="popup-label" runat="server" Text="Job Title:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="jobTitle"  ReadOnly="true"></asp:TextBox>

         <br />


        <asp:Label CssClass="popup-label" runat="server" Text="Category:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="jobType"  ReadOnly="true"></asp:TextBox>

         <br />


        <asp:Label CssClass="popup-label" runat="server" Text="Value:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="jobValue"  ReadOnly="true"></asp:TextBox>

         <br />


        <asp:Label CssClass="popup-label" runat="server" Text="Job Description:" ></asp:Label>
         <br />
         <br />
         <br />
         <asp:TextBox CssClass="popup-input" runat="server" ID="jobdesc" ReadOnly="true" TextMode="MultiLine" Rows="4" Style="width: 450px;" required="true"></asp:TextBox>
                      
         <br />


        <asp:Label CssClass="popup-label" runat="server" Text="Post Date:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="postdate"  ReadOnly="true"></asp:TextBox>


         <br />


        <asp:Label CssClass="popup-label" runat="server" Text="Due Date:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="duedate"  ReadOnly="true"></asp:TextBox>
        
        <h1>Proposal</h1>

         <asp:Label ID="wproposal" Visible="false" CssClass="popup-label" runat="server" Text="Write proposal to the client:" ></asp:Label>
         <br />
         <br />
         <br />
         <asp:TextBox CssClass="popup-input" Visible="false" runat="server" ID="proposal" TextMode="MultiLine" Rows="4" Style="width: 450px;" required="true"></asp:TextBox>
         
        <asp:Button ID="spropose" Visible="false" runat="server" Text="Submit Proposal"  OnClick="SubmitProposal" />
        

        <asp:Label ID="lPID" Visible="false" CssClass="popup-label" runat="server" Text="Proposal ID:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="PID"  ReadOnly="true"></asp:TextBox>
         <br />

          <asp:Label ID="lpdesc" Visible="false" CssClass="popup-label" runat="server" Text="Proposal Description:" ></asp:Label>
         <br />
         <br />
         <br />
         <asp:TextBox CssClass="popup-input" Visible="false" runat="server" ID="pdesc" ReadOnly="true" TextMode="MultiLine" Rows="4" Style="width: 450px;" required="true"></asp:TextBox>
         <br />

         <asp:Label ID="lstatus" Visible="false" CssClass="popup-label" runat="server" Text="Status:"></asp:Label>
         <asp:TextBox CssClass="popup-input" Visible="false" runat="server" ID="status"  ReadOnly="true"></asp:TextBox>

        <br />
        <asp:Label ID="ldate" CssClass="popup-label" Visible="false" runat="server" Text="Applied Date:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="date" Visible="false" ReadOnly="true"></asp:TextBox>

        <br />
        <br />
        <asp:Label ID="deliverablel" CssClass="popup-label" Visible="false" runat="server" Text="Upload Deliverable:"></asp:Label>
        <br />
        <br />
        <asp:FileUpload ID="deliverableFileUpload" Visible="false" Enabled="false" runat="server" required="true" />
        <br />
        <br />
        <asp:Button ID="markCompletedButton" Visible="false" Enabled="false" runat="server" Text="Mark as Completed" OnClick="markCompletedButton_Click"  />

        <br />
       <asp:Button Visible="false" ID="btnDownloadDeliverable" runat="server" Text="Download Deliverable" OnClick="btnDownloadDeliverable_Click" />
        <br />
        <br />
         &nbsp &nbsp &nbsp<asp:Label ID="lblDetails" runat="server" AssociatedControlID="txtDetails">Post Complaint</asp:Label><br/>
         &nbsp &nbsp &nbsp<asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Width="300px" Height="100px"></asp:TextBox><br/>
         &nbsp &nbsp &nbsp<asp:Button ID="btnPostComplaint" runat="server" Text="Post Complaint" OnClick="PostComplaint"  />


    </form>

</asp:Content>
