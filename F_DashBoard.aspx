<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="F_DashBoard.aspx.cs" Inherits="JobDelta.F_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/FreelancerDashboard.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                              <br /></li>
                           </ul>
                      </div>
                             

<%-------------------------------------------------------------------------------------------------%> 
      <div class="Main_Content">
          <br />
           <button class="sp_button" onclick="openPostJob()">Post New Job</button>
          <br />
          <br />
      <asp:GridView ID="GridView1" runat="server"></asp:GridView>

<%-------------------------------------------------------------------------------------------------%> 

                 <section class="Banner">
                  <h2>Unlock Your Potential on Job Delta</h2>
                  <p>Are you ready to take your career to the next level? Follow these three steps to become a top performer on Job Delta:</p>
                  <ul>
                    <li class="B_container">
                      <h3>Find Your Dream Job</h3>
                      <p>Our platform has a vast selection of job opportunities across various industries. Don't settle for a job you don't love. Explore our job listings and find your perfect match.</p>
                      <a>Search Jobs Now</a>
                    </li>
                    <li class="B_container">
                      <h3>Sharpen Your Skills</h3>
                      <p>Stay competitive and up-to-date with the latest industry trends by taking advantage of our training resources. Our expert-led courses and webinars cover everything from technical skills to soft skills.</p>
                      <a>Explore Our Training Resources</a>
                    </li>
                    <li class="B_container">
                      <h3>Become a Standout Candidate</h3>
                      <p>Make a lasting impression on potential employers by making a standout profile on Job Delta. Showcase your skills, accomplishments, and personality to make a great first impression.</p>
                      <a>Edit Profile Now</a>
                    </li>
                  </ul>
                </section>

<%-------------------------------------------------------------------------------------------------%> 
      </div>
 </div>
<%-------------------------------------------------------------------------------------------------%> 

    <!-- The popup container -->
            <div class="popup-container">
              <!-- The popup content -->
              <div class="popup-content">
                <h2>Post a New Job</h2>

                <label class="popup-label" for="job-title">Job Title:</label>
                <input class="popup-input" type="text" id="job-title" name="job-title" required>
                <br>

                <label class="popup-label" for="job-description">Job Description:</label>
                <textarea class="popup-input" id="job-description" name="job-description" rows="4" required></textarea>
                <br>

                <label class="popup-label" for="job-category">Job Category:</label>
                <select class="popup-input" id="job-category" name="job-category" required>
                  <option value="">Select a category</option>
                  <option value="web-design">Web Design</option>
                  <option value="graphic-design">Graphic Design</option>
                  <option value="software-development">Software Development</option>
                  <!-- Add more options here -->
                </select>
                <br>

                <label class="popup-label" for="job-budget">Budget:</label>
                <input class="popup-input" type="number" id="job-budget" name="job-budget" required>
                <br>

                <label class="popup-label" for="job-duration">Duration:</label>
                <select class="popup-input" id="job-duration" name="job-duration" required>
                  <option value="">Select a duration</option>
                  <option value="1-week">1 week</option>
                  <option value="2-weeks">2 weeks</option>
                  <option value="1-month">1 month</option>
                  <!-- Add more options here -->
                </select>
                <br>

                <label class="popup-label" for="job-skills">Skills Required:</label>
                <input class="popup-input" type="text" id="job-skills" name="job-skills">
                <br>

                <label class="popup-label" for="job-location">Location:</label>
                <input class="popup-input" type="text" id="job-location" name="job-location">
                <br>

                <label class="popup-label" for="job-contact">Contact Email:</label>
                <input class="popup-input" type="email" id="job-contact" name="job-contact" required>
                <br>

                <button class="popup-button" type="submit">Post Job</button>

                <!-- Close button for the popup -->
                <button class="close-button">&times;</button>
              </div>
            </div>

<%-------------------------------------------------------------------------------------------------%> 
    <script src="Resources/Myjs2.js"></script>
<%-------------------------------------------------------------------------------------------------%> 

</asp:Content>