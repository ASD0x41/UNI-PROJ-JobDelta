<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="JobDetail_C.aspx.cs" Inherits="JobDelta.JobDetail_C" %>
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
        
        <br />
         <asp:Label ID="lancerWorkingl" CssClass="popup-label" runat="server" Visible="false" Text="Freelancer:"></asp:Label>
         <asp:TextBox CssClass="popup-input" runat="server" ID="lancerWorking" Visible="false"  ReadOnly="true"></asp:TextBox>

         <br />

         <asp:Label CssClass="popup-label" ID="propl" runat="server" Visible ="false" Text="Proposals:"></asp:Label>
         <br />

          <asp:GridView ID="ProposalGridView" Visible="false" runat="server" AutoGenerateColumns="False" OnRowCommand="ProposalGridView_RowCommand" CssClass="J_Grid">
                <Columns>
                    <asp:BoundField DataField="proposalID" HeaderText="Posting ID" />
                    <asp:BoundField DataField="lancerID" HeaderText="Freelancer ID" />
                    <asp:BoundField DataField="proposaldetail" HeaderText="Description" />
                    <asp:BoundField DataField="approvalStatus" HeaderText="Status" />
                    <asp:BoundField DataField="applydate" HeaderText="Apply Date" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:LinkButton CssClass="sp_button" ID="lnkEdit" runat="server" Text="Select" CommandName="Select" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>        
            </asp:GridView>

         <br />
        <br />
       <asp:Button Visible="false" ID="btnDownloadDeliverable" runat="server" Text="Download Deliverable" OnClick="btnDownloadDeliverable_Click" />



     </form>
</asp:Content>
