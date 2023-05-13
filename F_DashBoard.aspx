<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="F_DashBoard.aspx.cs" Inherits="JobDelta.F_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/F_DashBoard.css" rel="stylesheet" />
<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
    
    <%--<script src="Resources/JavaScript/chatApp.js"></script>--%>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script type="text/javascript">

         function updateProgressBars(projectCompletionValue, clientSatisfactionValue, skillsValue, communicationValue, availabilityValue) {

             var projectCompletionBar = document.getElementById("projectCompletion");
             var clientSatisfactionBar = document.getElementById("clientSatisfaction");
             var skillsBar = document.getElementById("skills");
             var communicationBar = document.getElementById("communication");
             var availabilityBar = document.getElementById("availability");


             var projectCompletionPercentText = document.getElementById("projectCompletionPercent");
             var clientSatisfactionPercentText = document.getElementById("clientSatisfactionPercent");
             var skillsPercentText = document.getElementById("skillsPercent");
             var communicationPercentText = document.getElementById("communicationPercent");
             var availabilityPercentText = document.getElementById("availabilityPercent");

             projectCompletionBar.value = projectCompletionValue;
             clientSatisfactionBar.value = clientSatisfactionValue;
             skillsBar.value = skillsValue;
             communicationBar.value = communicationValue;
             availabilityBar.value = availabilityValue;

             projectCompletionPercentText.innerHTML = projectCompletionValue.toString();
             clientSatisfactionPercentText.innerHTML = clientSatisfactionValue.toString();
             skillsPercentText.innerHTML = skillsValue.toString();
             communicationPercentText.innerHTML = communicationValue.toString();
             availabilityPercentText.innerHTML = availabilityValue.toString();
         }

         

     </script>

      <form action="#" runat="server">
      
          <%--<asp:Button ID="BtnHidden" runat="server" Text="" OnClick="BtnHidden_Click" style="display:none"  />

          <script type="text/javascript">
              function redirect() {
                  document.getElementById('<% BtnHidden.ClientID %>').click();
                  return;
              }

          </script>--%>

	<div class="content-cover">
	
    <link href="Resources/CSS/F_DashBoard.css" rel="stylesheet" />

<%-------------------------------------------------------------------------------------------------%> 
     
              <div class="sidebar">
                      <div class="profile-wrapper">
                        <div class="profile-img-wrapper">
                           <p style="margin-left:45px;"><asp:Image ID="ImageControl"  runat="server" Height="175px" Width="180px" /></p>
                        </div>
                        <div class="user-details">
                         <h3 class="username"><asp:Label ID="lblUsername" runat="server"></asp:Label></h3>
                          <p class="job-title"><asp:Label ID="lb2Fullname" runat="server"></asp:Label></p>
                          <h3 class="job-title"><asp:Label  ID="lb3Email" runat="server" Text="example@example.com"></asp:Label></h3>
                          <div class="rating-section">
                             <h3 class="job-title" style="font-size:24px; color:orangered">Rating : <asp:Label ID="lblRating" runat="server"></asp:Label>/5</h3>
                          </div>
                        </div>
                      </div>
                      <br />

                      <div class="profile-progresses-wrapper">
                          <ul class="progresses-wrapper">
                            <li>
                              <h6>Project completion rate</h6>
                              <progress id="projectCompletion" value="0" max="100"></progress>
                              <div class="percent-text font-accent"><span id="projectCompletionPercent">0</span>%</div>
                            </li>
                            <li>
                              <h6>Client satisfaction rate</h6>
                              <progress id="clientSatisfaction" value="0" max="100"></progress>
                              <div class="percent-text font-accent"><span id="clientSatisfactionPercent">0</span>%</div>
                            </li>
                            <li>
                              <h6>Skills</h6>
                              <progress id="skills" value="0" max="100"></progress>
                              <div class="percent-text font-accent"><span id="skillsPercent">0</span>%</div>
                            </li>
                            <li>
                              <h6>Communication</h6>
                              <progress id="communication" value="0" max="100"></progress>
                              <div class="percent-text font-accent"><span id="communicationPercent">0</span>%</div>
                            </li>
                            <li>
                              <h6>Availability</h6>
                              <progress id="availability" value="0" max="100"></progress>
                              <div class="percent-text font-accent"><span id="availabilityPercent">0</span>%</div>
                            </li>
                          </ul>
                        </div>

                      <ul class="job-details">
                        <li>Total Jobs: <asp:Label ID="T_jobs" runat="server"></asp:Label></li>
                        <li>Active Jobs: <asp:Label ID="A_jobs" runat="server"></asp:Label></li>
                        <li>Completed Jobs: <asp:Label ID="C_jobs" runat="server"></asp:Label></li>
                      </ul>

                      <ul>
                        <li class="earnings">
                          <h6>Earnings</h6>
                          <p>$<asp:Label ID="T_Earning" runat="server"></asp:Label></p>
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
                <img src="Resources/Images/BG_Image/A-7.jpg" alt="Slide 1">
                <div class="slide-text">
                  <h2>Welcome to Job Delta</h2>
                  <p>We are a freelancing platform connecting businesses with top-rated freelancers from around the world. Our mission is to help businesses grow and succeed by providing them with the best freelance talent available.</p>
                </div>
              </div>
              <div class="slide">
                <img src="Resources/Images/BG_Image/A-8.jpg" alt="Slide 2">
                <div class="slide-text">
                  <h2>Hire Top Freelancers</h2>
                  <p>Find the perfect freelancer for your project. Our platform offers a wide range of freelancers with diverse skills and experience levels, so you can find the right fit for your project.</p>
                </div>
              </div>
              <div class="slide">
                <img src="Resources/Images/BG_Image/A-9.jpg" alt="Slide 3">
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
                        <asp:BoundField DataField="jobID" HeaderText="Posting ID" />
                        <asp:BoundField DataField="jobtitle" HeaderText="Title" />
                        <asp:BoundField DataField="jobdetail" HeaderText="Description" />
                        <asp:BoundField DataField="jobtype" HeaderText="Category" />
                        <asp:BoundField DataField="jobvalue" HeaderText="Budget" />
                        <asp:BoundField DataField="jobstatus" HeaderText="Job Status" />
                        <asp:BoundField DataField="duedate" HeaderText="Due Date" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton style="margin-left:20px" CssClass="sp_button" ID="lnkEdit" runat="server" Text="Select" CommandName="Select1" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' />
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

        </form>
<%-------------------------------------------------------------------------------------------------%> 
    <%--<script type="module" src="chat-api-project/frontend/src/chat_App.jsx"></script>--%>
    <script src="Resources/JavaScript/F_DashBoard.js"></script>
    <script src="Resources/JavaScript/chatApp.js"></script>
    
<%-------------------------------------------------------------------------------------------------%> 

</asp:Content>