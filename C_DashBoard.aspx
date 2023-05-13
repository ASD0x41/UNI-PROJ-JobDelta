<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="C_DashBoard.aspx.cs" Inherits="JobDelta.C_DashBoard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/C_DashBoard.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<form action="#" runat="server">
    <br />
    
              <div class="wrapper"> 
    
                        <div class="sidebar"  style="border-radius:10px;">

                      <div class="container"> 
                        <h2>Profile Information</h2>
                        <div class="profile-box">
                             <asp:Image ID="ImageControl" runat="server" />
                             <h3>Name</h3>
                             <asp:Label ID="name" runat="server"></asp:Label>
                             <h3>Email</h3>
                             <asp:Label ID="email" runat="server"></asp:Label>
                             <h3>Phone</h3>
                             <asp:Label ID="phone" runat="server"></asp:Label>
                             </div>
                      </div>

                      <div class="container"> 
                        <h2>Statistics</h2>
                        <div class="stat-box">
                         <h3>Total Projects</h3>
                            <asp:Label ID="totalProjects" runat="server" ></asp:Label>
                            <h3>Active Projects</h3>
                            <asp:Label ID="activeProjects" runat="server" ></asp:Label>
                            <h3>Completed Projects</h3>
                            <asp:Label ID="completedProjects" runat="server" ></asp:Label>
                            <h3>Total Spendings</h3>
                            $<asp:Label ID="totalSpendings" runat="server" ></asp:Label>
                        </div>
                      </div>

                      <div class="container"> 
                        <h2>Extra Information</h2>
                        <div class="extra_stat-box">
                          <h3>Active Project Posts</h3>
                            <asp:Label ID="activeProjectPosts" runat="server"></asp:Label>
                            <h3>Rating Received</h3>
                            <asp:Label ID="feedbackReceived" runat="server"></asp:Label> out of 5
                        </div>
                      </div>
                        <div style="display: flex; justify-content: center; align-items: center;"><button onclick="redirect()" class="sp_button">Chat</button></div>


                    </div>


            <section class="content" style="margin-left:20px;">
               <br />
                 <div style="-webkit-font-smoothing:antialiased; font-size:30px; margin-left:20px "><strong>My Postings</strong></div>
               <br />
                <br />
                        
                      

               <asp:GridView ID="PostingGridView"  runat="server" AutoGenerateColumns="False" OnRowCommand="PostingGridView_RowCommand" CssClass="J_Grid">
                <Columns>
                    <asp:BoundField DataField="jobID" HeaderText="Posting ID" />
                    <asp:BoundField DataField="jobtitle" HeaderText="Title" />
                    <asp:BoundField DataField="jobdetail" HeaderText="Description" />
                    <asp:BoundField DataField="jobtype" HeaderText="Category" />
                    <asp:BoundField DataField="jobvalue" HeaderText="Budget" />
                    <asp:BoundField DataField="JobStatus" HeaderText="Job Status" />
                    <asp:BoundField DataField="postdate" HeaderText="Post Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="duedate" HeaderText="Due Date" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:LinkButton CssClass="sp_button" ID="lnkEdit" runat="server" Text="View" CommandName="Select" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>        
            </asp:GridView>
                            <br />
                            <br />
                            
                            
                            
                            <br />

                        <h2>Post a New Job</h2>
        
                        <asp:Label CssClass="popup-label" runat="server" Text="Job Title:"></asp:Label>
                        <asp:TextBox CssClass="popup-input" runat="server" ID="jobTitle"  required="true"></asp:TextBox>
                        <br />
                       
                        <asp:Label CssClass="popup-label" runat="server" Text="Job Description:"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:TextBox CssClass="popup-input" runat="server" ID="jobdesc" TextMode="MultiLine" Rows="4" Style="width: 450px;" required="true"></asp:TextBox>
                      
                      <br />
        
                        <asp:Label CssClass="popup-label" runat="server" Text="Job Category:"></asp:Label>
                        <asp:DropDownList CssClass="popup-input" runat="server" ID="jobCategory" required="true">
                            <asp:ListItem Value="">Select a category</asp:ListItem>
                            <asp:ListItem Value="web-design">Web Design</asp:ListItem>
                            <asp:ListItem Value="graphic-design">Graphic Design</asp:ListItem>
                            <asp:ListItem Value="software-development">Software Development</asp:ListItem>
                            
                        </asp:DropDownList>
                        <br />
        
                        <asp:Label CssClass="popup-label" runat="server"  Text="Budget:"></asp:Label>
                        <asp:TextBox CssClass="popup-input" runat="server" ID="jobBudget" type="number" required="true"></asp:TextBox>
                        <br />
        
                       
                        <br />
                    
                        <asp:Label   runat="server"  Text="Due Date:"></asp:Label>
                        <asp:Calendar  runat="server" ID="jobDueDate"></asp:Calendar>

                        <br />
        
                        <asp:Button CssClass="sp_button" runat="server" ID="BtnPostJob" OnClick="BtnJobPost_Click" Text="Post Job"  />
        
                        
                        <button class="close-button">&times;</button>
               
               



                  <section class="Banner">
                  <h2>Unlock Your Potential on Job Delta</h2>
                  <p>Are you ready to take your career to the next level? Follow these three steps to become a top performer on Job Delta:</p>
                  <ul>
                    <li class="B_container">
                      <h3>Find Your Dream Job</h3>
                      <p>Our platform has a vast selection of job opportunities across various industries. Don't settle for a job you don't love. Explore our job listings and find your perfect match.</p>
                    </li>
                    <li class="B_container">
                      <h3>Sharpen Your Skills</h3>
                      <p>Stay competitive and up-to-date with the latest industry trends by taking advantage of our training resources. Our expert-led courses and webinars cover everything from technical skills to soft skills.</p>
                    </li>
                    <li class="B_container">
                      <h3>Become a Standout Candidate</h3>
                      <p>Make a lasting impression on potential employers by making a standout profile on Job Delta. Showcase your skills, accomplishments, and personality to make a great first impression.</p>
                      <a href="MyProfile.aspx">Edit Profile Now</a>
                    </li>
                  </ul>
                </section>
     </section>

</div>

    <%-------------------------------------------------------------------------------------------------%> 
 
         <div class="slide2show-container"> 
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-7.jpg" alt="Slide 1">
                <div class="slide2-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-8.jpg" alt="Slide 2">
                <div class="slide2-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="Resources/Images/BG_Image/A-9.jpg" alt="Slide 3">
                <div class="slide2-text">
                  <h2>Grow Your Business</h2>
                  <p>Get the help you need to grow your business. Our freelancers offer a wide range of services, from web development and design to marketing and content creation, to help your business succeed.</p>
                </div>
              </div>
            </div>

<%-------------------------------------------------------------------------------------------------%> 
    </form>
    <script src="Resources/JavaScript/C_Dashboard.js"></script>
    <script src="Resources/JavaScript/chatApp.js"></script>
</asp:Content>


