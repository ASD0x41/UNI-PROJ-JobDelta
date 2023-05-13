<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_DashBoard.aspx.cs" Inherits="JobDelta.A_DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="Resources/CSS/A_DashBoarB.css" rel="stylesheet" />
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
                                <li><a>Admin Access</a></li>
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
                         <asp:LinkButton ID="Accept_btn" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("complaintID") %>' OnCommand="AcceptButton_Command" Visible='<%# !IsStatusHidden(Eval("status")) %>' />
                         <asp:LinkButton ID="Reject_btn" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("complaintID") %>' OnCommand="RejectButton_Command" Visible='<%# !IsStatusHidden(Eval("status")) %>' />
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


<%-------------------------------------------------------------------------------------------------%> 


<%-------------------------------------------------------------------------------------------------%> 

        <footer>
	             <div class="footer-container">
<<<<<<< Updated upstream
                    <div class="footer-links" style="font-weight:bold">
                      <a href="Homepage.aspx">Home</a>
                      <a href="About_Us.aspx">About Us</a>
                      <a href="How_it_works.aspx">How It Works</a>
                      <a href="https://workspace.fiverr.com/pricing/">Pricing</a>
                      <a href="FAQs.aspx">FAQ</a>
                      <a href="Our_Services.aspx">Terms of Service</a>
                      <a href="Privacy_Policy">Privacy Policy</a>
                      <a href="NewsFeed.aspx">Blog</a>
                      <a href="ContactUs.aspx">Contact Us</a>
                    </div>
                    <div class="footer-categories">
                      <h4>Categories</h4>
                      <ul>
                        <li><a href="Job_Categories.aspx">Web Development</a></li>
                        <li><a href="Job_Categories.aspx">Graphic Design</a></li>
                        <li><a href="Job_Categories.aspx">Digital Marketing</a></li>
                        <li><a href="Job_Categories.aspx">Writing & Translation</a></li>
                        <li><a href="Job_Categories.aspx">Video & Animation</a></li>
                        <li><a href="Job_Categories.aspx">Music & Audio</a></li>
                        <li><a href="Job_Categories.aspx">Programming & Tech</a></li>
                        <li><a href="Job_Categories.aspx">Business</a></li>
                      </ul>
                    </div>
                    <div class="footer-services">
                      <h4>Our Services</h4>
                      <ul>
                        <li><a href="https://www.fiverr.com/">Freelance Services</a></li>
                        <li><a href="https://www.fiverr.com/gigs/management">Managed Services</a></li>
                        <li><a href="https://www.fiverr.com/categories/business/project-management">Project Management</a></li>
                        <li><a href="https://www.fiverr.com/gigs/enterprise">Enterprise Solutions</a></li>
                        <li><a href="https://www.fiverr.com/categories/business/hr-consulting/recruiting">Talent Sourcing</a></li>
                      </ul>
                    </div>
                    <div class="footer-company">
                      <h4>Company</h4>
                      <ul>
                        <li><a href="About_Us.aspx">About Us</a></li>
                        <li><a href="https://www.fiverr.com/jobs?source=footer">Careers</a></li>
                        <li><a href="https://www.fiverr.com/news/press-releases?source=footer">Press</a></li>
                        <li><a href="https://affiliates.fiverr.com/">Affiliates</a></li>
                        <li><a href="https://investors.fiverr.com/investor-overview/default.aspx">Investors</a></li>
                      </ul>
                    </div>
                    <div class="footer-newsletter">
                      <h4>Join Our Newsletter</h4>
                      <form>
                        <input type="email" placeholder="Enter your email address">
                        <button type="submit">Subscribe</button>
                      </form>
                    </div>
                    <div class="footer-social">
                      <h4>Connect With Us</h4>
                      <div class="social-icons">
                       <a href="https://www.facebook.com/Fiverr/"><img src="Resources/Images/BG_Image/icon-1.png" style="margin-top:5px;" /></a>
					   <a href="https://twitter.com/fiverr"><img src="Resources/Images/BG_Image/icon-2.png" style="margin-top:5px;" /></a>
					   <a href="https://www.linkedin.com/company/fiverr-com"><img src="Resources/Images/BG_Image/icon-3.png" style="margin-top:5px;" /></a>
					   <a href="https://www.instagram.com/fiverr/"><img src="Resources/Images/BG_Image/icon-4.png" style="margin-top:5px;" /></a>
                      </div>
                    </div>
                  </div>
                  <div class="footer-disclaimer">
                    <p>© 2023 JOBDELTA. All rights reserved.</p>
=======
                    <p style="margin-left:40%;">© 2023 JOBDELTA. All rights reserved.</p>
>>>>>>> Stashed changes
              </div>
</footer>      

 <%-------------------------------------------------------------------------------------------------%> 

        <script src="Resources/JavaScript/A_DashBoard.js"></script>

 <%-------------------------------------------------------------------------------------------------%> 

    </form>
</body>
</html>
