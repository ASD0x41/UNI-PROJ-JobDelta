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
              <div class="editable" id="Gender">
                <p><b>Gender:</b> Male</p>
              </div>
              <div class="editable" id="email">
                <p><b>Email:</b> john.doe@example.com</p>
              </div>
               <div class="editable" id="Phone_Number">
                <p><b>Phone_Number:</b> 0100-1234561 </p>
              </div>
                 <div class="editable" id="Adress">
                <p><b>Address:</b> 3b Street New York City </p>
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
            <br/>
              <a class="edit-button" id="summary-info-btn">Edit</a>
          </div>

           <hr style="height: 6px;" />


          <div class="editable" id="job">
            <h3  style="color: #f36c21;">Skill-Set & Work-Experience</h3>

              <h4 style="font-size:20px">Expertise</h4>
              <hr style="width:30%; margin:-5px 0 0 0"/>
              <div class="editable" id="Expertise">
              <ul>
                <li>Web development</li>
                <li>Graphic design</li>
              </ul>
                <button class="edit-button">Add More</button>
              </div>
              <br/>
              <br/>

             <div class="editable" id="skills">
              <h4 style="font-size:20px">Skills</h4>
                 <hr style="width:30%; margin:-5px 0 0 0"/>
              <ul>
                <li>HTML</li>
                <li>CSS</li>
                <li>JavaScript</li>
                <li>Responsive Design</li>
                <li>UI/UX Design</li>
              </ul>
                <button class="edit-button">Add Skill</button>
        
                 <hr/>
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


        </div>

<%-- -------------------------------------------------------------------------------------------------------------------- --%>

<div id="personal-info-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Edit Personal Information</h2>
    <form>
      <label for="name">Name:</label>
      <input type="text" style=" width: 40%;" id="Name_I" name="name" value="John Doe">
      <label for="email">Email:</label>
      <input type="text" id="Email_I" name="email" style=" width: 60%;" value="john.doe@example.com">
      <label for="phone">Phone Number</label>
      <input type="text" id="phone" style=" width: 50%;" name="phone" value="XXXX-XXXXXXX" required="required"/>
      <label for="address">Address</label>
      <input type="text" style=" width: 60%;" id="address" name="address" value="XX-XXXX street" required="required" />

      <button style="margin-top:55px;" type="submit">Save</button>
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

    </ div>

    <script src="Resources/JavaScript/MyProfile.js"></script>

</asp:Content>
