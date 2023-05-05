<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="F_DashBoard.aspx.cs" Inherits="JobDelta.F_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/FreelancerDashboard.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Resources/CSS/F_DashBoard.css" rel="stylesheet" />
 
    <form action="#" runat="server">
    
    
    
    
    
    <div class="content-cover">

<%-------------------------------------------------------------------------------------------------%> 

              <div class="sidebar">
                      <div class="profile-wrapper">
                        <div class="profile-img-wrapper">
                          <img src="image.jpg" class="profile-img" alt="Profile image">
                        </div>
                        <div class="user-details">
                          <h3 class="username">John Doe</h3>
                          <p class="job-title">Freelance Writer</p>
                          <p class="location"><i class="fa fa-map-marker"></i> New York City</p>
                          <div class="rating-section">
                            <p class="rating-label">Rating:</p>
                            <div class="stars">
                              <span class='fa fa-star checked' style='color: white'></span>
                              <span class='fa fa-star checked' style='color: white'></span>
                              <span class='fa fa-star checked' style='color: white'></span>
                              <span class='fa fa-star' style='color: white'></span>
                              <span class='fa fa-star' style='color: white'></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="profile-progresses-wrapper">
                        <ul class="progresses-wrapper">
                          <li>
                            <h6>Project completion rate</h6>
                            <progress value="90" max="100"></progress>
                            <div class="percent-text font-accent">90%</div>
                          </li>
                          <li>
                            <h6>Client satisfaction rate</h6>
                            <progress value="95" max="100"></progress>
                            <div class="percent-text font-accent">95%</div>
                          </li>

                          <li>
                            <h6>Skills</h6>
                            <progress value="80" max="100"></progress>
                            <div class="percent-text font-accent">80%</div>
                          </li>
                          <li>
                            <h6>Communication</h6>
                            <progress value="90" max="100"></progress>
                            <div class="percent-text font-accent">90%</div>
                          </li>
                          <li>
                            <h6>Availability</h6>
                            <progress value="70" max="100"></progress>
                            <div class="percent-text font-accent">70%</div>
                          </li>
                        </ul>                             
                      </div>
                      <ul class="job-details">
                        <li>Total Jobs: 10</li>
                        <li>Active Jobs: 3</li>
                        <li>Completed Jobs: 5</li>
                      </ul>

                      <ul>
                        <li class="earnings">
                          <h6>Earnings</h6>
                          <p>$50,000</p>
                          <br />

                        </li>
                      </ul>
                           <div style="display: flex; justify-content: center; align-items: center;"> <button class ="Chat_Button" onclick="redirect()">Chat</button></div>
                    </div>

                    

                             

<%-------------------------------------------------------------------------------------------------%> 

<%-------------------------------------------------------------------------------------------------%> 

      <div class="Main_Content">

<%-------------------------------------------------------------------------------------------------%> 

            <div class="slideshow-container">
              <div class="slide">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 1">
                <div class="slide-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 2">
                <div class="slide-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 3">
                <div class="slide-text">
                  <h2>Grow Your Business</h2>
                  <p>Get the help you need to grow your business. Our freelancers offer a wide range of services, from web development and design to marketing and content creation, to help your business succeed.</p>
                </div>
              </div>
            </div>

<%-------------------------------------------------------------------------------------------------%>         

      <br />
      <br />
                <h2>Ongoing Jobs</h2>
                <asp:GridView CssClass="J_Grid" style="margin-left:20px" ID="PostingGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="PostingGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="PostingID" HeaderText="Posting ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="Budget" HeaderText="Budget" />
                        <asp:BoundField DataField="JobStatus" HeaderText="Job Status" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton style="margin-left:20px" CssClass="sp_button" ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("PostingID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>        
                </asp:GridView>         
          
      <br />  
      <br />  

                      <div style="display: flex; justify-content: center; align-items: center;">
                         <asp:Button CssClass="Find_Button" ID="findJobButton" runat="server" Text="Find A New Job" />
                        </div>
                        <!-- The popup container -->
                        <div class="popup-container">
                            <!-- The popup content -->
                            <div class="popup-content">
                                <h2>Find Job</h2>
                                <asp:GridView CssClass="J_Grid" ID="PostGridView"  OnRowCommand="PostGridView_RowCommand" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="jobID" HeaderText="Post ID" />
                                        <asp:BoundField DataField="clientID" HeaderText="Client ID" />
                                        <asp:BoundField DataField="jobtitle" HeaderText="Title" />
                                        <asp:BoundField DataField="jobdetail" HeaderText="Description" />
                                        <asp:BoundField DataField="jobtype" HeaderText="Category" />
                                        <asp:BoundField DataField="jobvalue" HeaderText="Budget" />
                                        <asp:TemplateField HeaderText="Apply">
                                            <ItemTemplate>
                                               <asp:LinkButton CssClass="sp_button" ID="Select" runat="server" Text="Select" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>"/>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>        
                                </asp:GridView>
                                <!-- Close button for the popup -->
                                <button class="close-button">&times;</button>
                            </div>
                        </div>
<%-------------------------------------------------------------------------------------------------%> 

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

<%-------------------------------------------------------------------------------------------------%> 
      </div>
 </div>
<%-------------------------------------------------------------------------------------------------%> 

               

<%-------------------------------------------------------------------------------------------------%> 
 
         <div class="slide2show-container"> 
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 1">
                <div class="slide2-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 2">
                <div class="slide2-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide2">
                <img src="https://source.unsplash.com/random/800x400" alt="Slide 3">
                <div class="slide2-text">
                  <h2>Grow Your Business</h2>
                  <p>Get the help you need to grow your business. Our freelancers offer a wide range of services, from web development and design to marketing and content creation, to help your business succeed.</p>
                </div>
              </div>
            </div>
        </form>
<%-------------------------------------------------------------------------------------------------%> 
    <script src="Resources/JavaScript/F_DashBoard.js"></script>
    <script src="Resources/JavaScript/chatApp.js"></script>
<%-------------------------------------------------------------------------------------------------%> 

</asp:Content>