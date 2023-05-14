<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_DashBoard.aspx.cs" Inherits="JobDelta.A_DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="Resources/CSS/A_Dashboard.css" rel="stylesheet" />
    <title></title>
</head>


<body> 
    <form runat="server" action="#">

            <header>
                 <div class="header-container">
                            <div class="Heading_name">
                              <a href="#">JOB-DELTA</a>
                            </div>
                            <nav>
                              <ul>
                                <li>
                                    <a><b>Commission :</b> $<asp:Label ID="Commission" runat="server"></asp:Label></a>
                                    <a>Admin Access</a>
                                </li>
                              </ul>
                            </nav>
                            <div class="profile">
                              <a href="MyProfile.aspx"><img src="Resources/Images/BG_Image/A-1.png"/></a>
                              <div class="dropdown" style="margin-left:7px;">
                                <a href="HomePage.aspx">Logout</a>
                              </div>
                            </div>
                          </div>
                    </header> 
        

         <div class="slide2show-container" style="margin-right:8px;"> 
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-7.jpg" alt="Slide 1"/>
                <div class="slide2-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-8.jpg" alt="Slide 2"/>
                <div class="slide2-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-9.jpg" alt="Slide 3"/>
                <div class="slide2-text">
                  <h2>Grow Your Business</h2>
                  <p>Get the help you need to grow your business. Our freelancers offer a wide range of services, from web development and design to marketing and content creation, to help your business succeed.</p>
                </div>
              </div>
            </div>
                
                <br />
                <br />
                <br />

        <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center; "><strong>ALL USERS</strong></div>
        <br />

        <asp:GridView ID="GridView1" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="UserID" />
                    <asp:BoundField DataField="username" HeaderText="User_Name" />
                    <asp:BoundField DataField="fullname" HeaderText="Full_Name" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                    <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                    <asp:BoundField DataField="phonenumber" HeaderText="PhoneNo." />
                    <asp:BoundField DataField="emailaddress" HeaderText="Email" />
                    <asp:BoundField DataField="workaddress" HeaderText="WorkAddress" />
                </Columns>
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
        </asp:GridView>

        <br />
        <br />
        <br />
        
        <section class="Edit_User">

            <div style="-webkit-font-smoothing:antialiased; font-size:20px; text-align:center; "><strong>Edit User Information</strong></div>
            <br />

                <label for="U_Id">Enter User-ID: </label>
                <p style="margin-left:42%"><asp:TextBox ID="U_Id" runat="server" CssClass="form-control" Width="20%" TextMode="Number" ></asp:TextBox></p>

                <label for="UserName">UserName:</label>
                <p style="margin-left:30%"> <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Width="50%" ></asp:TextBox></p>

                <label for="Email">Email:</label>
                 <p style="margin-left:30%"><asp:TextBox ID="Email" runat="server" CssClass="form-control" Width="50%" ></asp:TextBox></p>

                <label for="CNIC">CNIC:</label>
                 <p style="margin-left:30%"><asp:TextBox ID="CNIC" runat="server" CssClass="form-control" Width="50%"></asp:TextBox></p>

                 <br />
                <asp:Button  ID="btn_Edit" CSSclass="edit-button" runat="server" Text="Save" onclick="Edit_Click"/>
  
        </section>


        <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center; "><strong>ACTIVE JOBS</strong></div>
        <br />

        <asp:GridView ID="GridView2" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="jobtitle" HeaderText="Title" />
                    <asp:BoundField DataField="jobtype" HeaderText="Type" />
                    <asp:BoundField DataField="jobvalue" HeaderText="Amount" />
                    <asp:BoundField DataField="jobdetail" HeaderText="Detail" />
                    <asp:BoundField DataField="postdate" HeaderText="PostDate" />
                    <asp:BoundField DataField="duedate" HeaderText="DueDate" />
                    <asp:BoundField DataField="jobstatus" HeaderText="Status" />
                    <asp:BoundField DataField="clientName" HeaderText="Posted By" />
                </Columns>
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
        </asp:GridView>
  

        <br />
        <br />

         <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center; "><strong>ALL PROPOSALS</strong></div>
        <br />
          
               <asp:GridView ID="GridView4" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="JobTitle" HeaderText="Title" />
                        <asp:BoundField DataField="LancerName" HeaderText="Freelancer" />
                        <asp:BoundField DataField="applydate" HeaderText="ApplyDate" />
                        <asp:BoundField DataField="proposaldetail" HeaderText="Detail" />
                        <asp:BoundField DataField="approvalstatus" HeaderText="Status" />
                    </Columns>
                 <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
              </asp:GridView>

        <br />
        <br />


         <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center; "><strong>MONEY TRANSFER</strong></div>
        <br />
          
               <asp:GridView ID="GridView5" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="JobTitle" HeaderText="Title" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" />
                        <asp:BoundField DataField="transfertime" HeaderText="Time" />
                        <asp:BoundField DataField="srcusername" HeaderText="Transfer_By" />
                        <asp:BoundField DataField="dstusername" HeaderText="Transfer_To" />
                    </Columns>
                 <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
              </asp:GridView>

        <br />
        <br />



        <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center; "><strong>ONGOING REQUEST</strong></div>
        <br />
          
               <asp:GridView ID="GridView3" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="requestdate" HeaderText="Date" />
                        <asp:BoundField DataField="details" HeaderText="Detail" />
                        <asp:BoundField DataField="requeststatus" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Resolve">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" Text="↩" CommandName="IssueID" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                 <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
              </asp:GridView>

        <br />
        <br />


        <div style="-webkit-font-smoothing:antialiased; font-size:30px; text-align:center;"><strong>COMPLAINTS</strong></div>
        <br />

         <asp:GridView ID="GridView6" runat="server" CssClass="ctable" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="Posted Against" HeaderText="Against" />
                        <asp:BoundField DataField="Job Title" HeaderText="Job" />
                        <asp:BoundField DataField="details" HeaderText="Detail" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Resolve">
                            <ItemTemplate>
                            <asp:LinkButton ID="Accept_btn" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("complaintID") ?? "" %>' OnCommand="AcceptButton_Command" Visible='<%# !IsStatusHidden(Eval("status")) %>' />
                            <asp:LinkButton ID="Reject_btn" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("complaintID") ?? "" %>' OnCommand="RejectButton_Command" Visible='<%# !IsStatusHidden(Eval("status")) %>' />
                             </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                     <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
                  </asp:GridView>

        <br />
        <br />

        

 <%-------------------------------------------------------------------------------------------------%> 

         <div class="benefits-container">
                      <h2>Benefits of being an Admin on JOB delta</h2>
                      <ul>
                        <li>
                          <img src="Resources/Images/BG_Image/A-2.gif" />
                          Complete control over the site's policies and guidelines
                        </li>
                        <li>
                          <img src="Resources/Images/BG_Image/A-3.gif"/>
                          Ability to manage and moderate user accounts and content
                        </li>
                        <li>
                          <img src="Resources/Images/BG_Image/A-4.gif" />
                          Access to valuable data and analytics about the site's performance
                        </li>
                        <li>
                          <img src="Resources/Images/BG_Image/A-5.gif" />
                          Opportunity to build and grow a community of freelancers and employers
                        </li>
                        <li>
                          <img src="Resources/Images/BG_Image/A-6.gif" />
                          Potential for increased income through revenue sharing or other compensation models
                        </li>
                      </ul>
                    </div>


                <br />
                <br />

<%-------------------------------------------------------------------------------------------------%> 



<%-------------------------------------------------------------------------------------------------%> 

        <footer>
	             <div class="footer-container">

                    <p style="margin-left:40%;">© 2023 JOBDELTA. All rights reserved.</p>
              </div>
</footer>      

 <%-------------------------------------------------------------------------------------------------%> 

        <script src="Resources/JavaScript/A_DashBoard.js"></script>

 <%-------------------------------------------------------------------------------------------------%> 

    </form>
</body>
</html>
