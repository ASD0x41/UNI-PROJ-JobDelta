<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_DashBoard.aspx.cs" Inherits="JobDelta.A_DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="Resources/CSS/A_DashBoard.css" rel="stylesheet" />
    <title></title>
</head>


<body> 
    <form runat="server">

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
                              <a href="MyProfile.aspx"><img src="https://img.icons8.com/ios-filled/100/FFFFFF/user-male-circle.png"/></a>
                              <div class="dropdown" style="margin-left:7px;">
                                <a href="HomePage.aspx">Logout</a>
                              </div>
                            </div>
                          </div>
                    </header> 
        
                 <div class="benefits-container">
                      <h2>Benefits of being an Admin on JOB delta</h2>
                      <ul>
                        <li>
                          <img src="https://imgs.search.brave.com/3yLl3JRwjeYm9rq9-S6cnAMwdHxXUxdusKH6Q2uvr3A/rs:fit:800:600:1/g:ce/aHR0cHM6Ly9jb2Rl/c3lhcmlhaDEyMi5n/aXRodWIuaW8vYXNz/ZXRzL2ltYWdlcy9w/cm9qZWN0L2NvZGVz/eWFyaWFoL3ZlY3Rv/cjIuZ2lm.gif" />
                          Complete control over the site's policies and guidelines
                        </li>
                        <li>
                          <img src="https://media4.giphy.com/media/s99VUdNNp2kzYJDq4B/200.webp?cid=ecf05e47gmo44mavemilj5y12e8t82vg8t2mvwi0lboghvyt&rid=200.webp&ct=s"/>
                          Ability to manage and moderate user accounts and content
                        </li>
                        <li>
                          <img src="https://media4.giphy.com/media/QJ8bR5An4VC59FvVcx/200w.webp?cid=ecf05e47aalz27t3t7xxmgu3q2io63ydnf75go9eg8mt91ak&rid=200w.webp&ct=s" />
                          Access to valuable data and analytics about the site's performance
                        </li>
                        <li>
                          <img src="https://media4.giphy.com/media/gRYTjQAs04Pfydymgc/200w.webp?cid=ecf05e47aalz27t3t7xxmgu3q2io63ydnf75go9eg8mt91ak&rid=200w.webp&ct=s" />
                          Opportunity to build and grow a community of freelancers and employers
                        </li>
                        <li>
                          <img src="https://media4.giphy.com/media/EyoiQkwpR5zesB0qoo/200.webp?cid=ecf05e47bcr8qjfyjd1cq9ve8a3b02s9rflrbk2lyusonxhx&rid=200.webp&ct=s" />
                          Potential for increased income through revenue sharing or other compensation models
                        </li>
                      </ul>
                    </div>


        <div>
                <br />
                <br />
                <br />
                <br />
                <br />

            <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:40%; "><strong>Users</strong></div>
            <br />

            </div>
   
        <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" Height="218px" style="margin-left: 17%; text-align:center" Width="815px" >
        <Columns>
        <asp:BoundField DataField="UserID" HeaderText="ID" />
        <asp:BoundField DataField="UserName" HeaderText="Name" />
        <asp:BoundField DataField="UserType" HeaderText="Type" />
        <asp:BoundField DataField="UserGender" HeaderText="Gender" />
        <asp:BoundField DataField="UserEmail" HeaderText="Email Address" />
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="X" CommandName="IssueID"  />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>        
        </asp:GridView>

        <br />
        <br />



        <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:40%; "><strong>Active Jobs</strong></div>
            <br />

        
   
        <asp:GridView ID="JobsGridView" runat="server" AutoGenerateColumns="False" Height="218px" style="margin-left: 17%; text-align:center" Width="815px" >
        <Columns>
        <asp:BoundField DataField="jobID" HeaderText="Job ID" />
        <asp:BoundField DataField="clientID" HeaderText="Client ID" />
        <asp:BoundField DataField="jobtitle" HeaderText="Name" />
        <asp:BoundField DataField="lancerID" HeaderText="Freelancer ID" />
        <asp:BoundField DataField="jobstatus" HeaderText="Status" />
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="X" CommandName="IssueID"  />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>        
        </asp:GridView>

        <br />
        <br />




     <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:40%; "><strong>Ongoing Issues</strong></div>
   <br />

       
        <asp:GridView ID="IssueGridView" runat="server" AutoGenerateColumns="False" Height="218px" style="margin-left: 17%; text-align:center" Width="815px" >
        <Columns>
        <asp:BoundField DataField="Type" HeaderText="Type" />
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Description" HeaderText="Detail" />
        <asp:BoundField DataField="Date" HeaderText="Request Date" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:TemplateField HeaderText="Resolve">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="↩" CommandName="IssueID"  />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>        
        </asp:GridView>

        <br />
        <br />
        <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:43% "><strong>Feedback</strong></div>
        <br />

        <asp:GridView ID="FeebackGridView" runat="server" AutoGenerateColumns="False" Height="218px" style="margin-left: 17%; text-align:center" Width="815px" >
        <Columns>
        <asp:BoundField DataField="Type" HeaderText="Type" />
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Description" HeaderText="Feedback" />
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:BoundField DataField="Rating" HeaderText="Rating" />
        
        </Columns>        
        </asp:GridView>

        <br />
        <br />



        <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:40%; "><strong>Transactions</strong></div>
            <br />

        
   
        <asp:GridView ID="TransGridView" runat="server" AutoGenerateColumns="False" Height="218px" style="margin-left: 17%; text-align:center" Width="815px" >
        <Columns>
        <asp:BoundField DataField="transferID" HeaderText="Transfer ID" />
        <asp:BoundField DataField="amount" HeaderText="Transaction Amount" />
        <asp:BoundField DataField="jobID" HeaderText="Job ID" />
        <asp:BoundField DataField="srcuser" HeaderText="From" />
        <asp:BoundField DataField="dstuser" HeaderText="To" />
        
        </Columns>        
        </asp:GridView>

        <br />
        <br />


 <%-------------------------------------------------------------------------------------------------%> 

 <div class="slide2show-container" style="margin-top:10%; margin-bottom:5%;"> 
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 1"/>
                <div class="slide2-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 2"/>
                <div class="slide2-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 3"/>
                <div class="slide2-text">
                  <h2>Grow Your Business</h2>
                  <p>Get the help you need to grow your business. Our freelancers offer a wide range of services, from web development and design to marketing and content creation, to help your business succeed.</p>
                </div>
              </div>
            </div>

<%-------------------------------------------------------------------------------------------------%> 

        <footer>
	             <div class="footer-container">
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
                       <a href="https://www.facebook.com/Fiverr/"><img src="https://img.icons8.com/ios-filled/30/null/facebook-new.png" style="margin-top:5px;" /></a>
					   <a href="https://twitter.com/fiverr"><img src="https://img.icons8.com/material-sharp/30/null/twitter.png" style="margin-top:5px;" /></a>
					   <a href="https://www.linkedin.com/company/fiverr-com"><img src="https://img.icons8.com/ios-glyphs/30/null/linkedin.png" style="margin-top:5px;" /></a>
					   <a href="https://www.instagram.com/fiverr/"><img src="https://img.icons8.com/ios-glyphs/30/null/instagram-new.png" style="margin-top:5px;" /></a>
                      </div>
                    </div>
                  </div>
                  <div class="footer-disclaimer">
                    <p>© 2023 JOBDELTA. All rights reserved.</p>
              </div>
</footer>      

 <%-------------------------------------------------------------------------------------------------%> 

        <script src="Resources/JavaScript/A_DashBoard.js"></script>

 <%-------------------------------------------------------------------------------------------------%> 

    </form>
</body>
</html>
