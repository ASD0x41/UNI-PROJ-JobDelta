<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="JobDelta.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/MyProfile.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="header">
          <h1>Freelancer Profile</h1>
        </div>

        <div class="container">

         <div class="personal-info">
              <div class="editable" id="profile-picture">
                <img src="https://via.placeholder.com/150" alt="Profile Picture">
              </div>
             <div class="content">
              <div class="editable" id="name">
                <h2>John Doe</h2>
              </div>
              <div class="editable" id="occupation">
                <h3>Web Developer</h3>
              </div>
              <div class="editable" id="email">
                <p>Email: john.doe@example.com</p>
              </div>
                 <br />
              <a class="edit-button" id="personal-info-btn">Edit</a>
             </div>
         </div>

           <br/>
           <br/>
           <br/>


          <div class="editable" id="summary">
            <p>I'm a skilled web developer with experience in HTML, CSS, and JavaScript. I'm passionate about creating beautiful and responsive websites that provide a great user experience. I'm always learning and trying to improve my skills, and I love working with clients to bring their ideas to life.</p>
            <a class="edit-button" id="summary-info-btn">Edit</a>
          </div>

          <hr>

            <div class="editable" id="skills">
              <h3 style="color: #f36c21;">Skills</h3>
              <ul>
                <li>HTML</li>
                <li>CSS</li>
                <li>JavaScript</li>
                <li>Responsive Design</li>
                <li>UI/UX Design</li>
              </ul>
              <div class="Skill_dropdown">
                <button class="add-skill-button">Add Skill</button>
                <div class="Skill_dropdown-content">
                  <a href="#">PHP</a>
                  <a href="#">Python</a>
                  <a href="#">Ruby</a>
                  <a href="#">Java</a>
                  <a href="#">Swift</a>
                </div>
              </div>
            </div>


          <hr>

          <div class="editable" id="job">
            <h3  style="color: #f36c21;">Work Experience</h3>
            <div class="job">
              <h4 id="job-title">Web Developer - XYZ Company</h4>
              <h5 id="job-duration">January 2020 - Present</h5>
                <p id="job-responsibilities">Develop and maintain company website<br/>
                 Create responsive designs for mobile and desktop<br/>
                 Collaborate with design team to create UI/UX mockups<br/>
                 Write clean and efficient code using HTML, CSS, and JavaScript</p>

                <br/>
              <a class="edit-button" id="Job-info-btn">Edit</a>
            </div>
          </div>

          <hr>

          <div class="editable" id="education">
            <h3  style="color: #f36c21;">Education</h3>
            <div class="education">
              <h4>Bachelor of Science in Computer Science - University of XYZ</h4>
              <h5>September 2014 - June 2018</h5>
              <p>GPA: 3.9</p>
                <br/>
              <a class="edit-button" id="education-info-btn">Edit</a>
            </div>
          </div>

        </div>

<%-- -------------------------------------------------------------------------------------------------------------------- --%>

<div id="personal-info-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Personal Information</h2>
    <form>
      <label for="name">Name:</label>
      <input type="text" id="Name_I" name="name" value="John Doe">
      <label for="occupation">Occupation:</label>
      <input type="text" id="Occupation_I" name="occupation" value="Web Developer">
      <label for="email">Email:</label>
      <input type="email" id="Email_I" name="email" value="john.doe@example.com">
      <button style="margin-top:20px;" type="submit">Save</button>
    </form>
  </div>
</div>

<%-- -------------------------------------------------------------------------------------------------------------------- --%>

<div id="summary-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Summary</h2>
    <form>
      <label for="summary">Summary:</label>
      <textarea id="summary_I" name="summary">I'm a skilled web developer with experience in HTML, CSS, and JavaScript. I'm passionate about creating beautiful and responsive websites that provide a great user experience. I'm always learning and trying to improve my skills, and I love working with clients to bring their ideas to life.</textarea>
      <button type="submit">Save</button>
    </form>
  </div>
</div>

<%------------------------------------------------------------------------------------------------------------------------%>

<div id="job-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Job Information </h2>
    <form>
      <label for="job-title">Job Title:</label>
      <input type="text" id="job-title_I" name="job-title" value="Web Developer - XYZ Company">
      <label for="job-duration">Duration:</label>
      <input type="text" id="job-duration_I" name="job-duration_I" value="January 2020 - Present">
      <label for="job-responsibilities">Responsibilities:</label>
      <textarea id="job-responsibilities_I" name="job-responsibilities_I">Develop and maintain company website
                    Create responsive designs for mobile and desktop
                    Collaborate with design team to create UI/UX mockups
                    Write clean and efficient code using HTML, CSS, and JavaScript</textarea>
      <button type="submit">Save</button>
    </form>
  </div>
</div>

<%-- -------------------------------------------------------------------------------------------------------------------- --%>

<div id="education-editor" class="modal">
  <div class="modal-content">
    <span class="close" >&times;</span>
    <h2>Edit Education info</h2>
    <form>
      <label for="degree">Degree:</label>
      <input type="text" id="degree" name="degree" value="Bachelor of Science in Computer Science">

      <label for="university">University:</label>
      <input type="text" id="university" name="university" value="University of XYZ">

      <label for="date">Date:</label>
      <input type="text" id="date" name="date" value="September 2014 - June 2018">

      <label for="gpa">GPA:</label>
      <input type="text" id="gpa" name="gpa" value="3.9">

      <button style="margin-top:55px;" type="submit">Save</button>
    </form>
  </div>
</div>

    
    <script src="Resources/JavaScript/MyProfile.js"></script>

</asp:Content>
