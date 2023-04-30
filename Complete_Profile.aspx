<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Complete_Profile.aspx.cs" Inherits="JobDelta.Complete_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head runat="server">
    <link href="Resources/CSS/Complete_Profile.css" rel="stylesheet" />
    <script src="https://www.google.com/recaptcha/api.js" async="async" defer="defer"></script>
    <title></title>
</head>


<body>
    <form id="form1" runat="server">

        <div class="header">
          <h1>Complete Your Profile</h1>
        </div>

    <form>

        <div class="profile-picture" style="margin-top:10%;">
            <div class="profile-image-container">
                <img id="profile-image" src="Resources/Images/Profile.png" alt="Profile Picture"/>
            </div>

            <div class="upload-button-container">
                <label for="profile-upload" class="sp_button">Upload Picture</label>
                <input type="file" id="profile-upload" name="profile-upload" accept="image/*" onchange="previewProfileImage(event)"/>
            </div>
        </div>

        <br />
        <h2>Personal Information</h2>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />

      <label for="fullname">Full Name</label>
      <input type="text" style=" width: 40%;" id="fullname" name="fullname" placeholder="Enter your full name" required="required" />
       
       <label for="gender">Gender:</label>
			<select id="gender" style=" width: 20%;" name="gender" required="required">
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="other">Other</option>
			</select>

      <label for="birthdate">Birthdate</label>
      <input type="date" style=" width: 20%;" id="birthdate" name="birthdate" required="required" />

      <label for="email">Email Address</label>
      <input type="email" style=" width: 60%;" id="email" name="email" placeholder="Enter your email address" required="required" />

      <label for="CNIC">CNIC</label>
      <input type="text" id="CNIC" style=" width: 60%;" name="CNIC" placeholder="Enter your CNIC" required="required" />


      <label for="phone">Phone Number</label>
      <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required="required"/>

      <label for="address">Address</label>
      <input type="text" style=" width: 60%;" id="address" name="address" placeholder="Enter your address" required="required" />

      <label for="workaddress">Work Address</label>
      <input type="text" id="workaddress" style=" width: 60%;" name="workaddress" placeholder="Enter your work address" />


        <label for="bio">Bio:</label>
			<textarea id="bio" placeholder="Something About Yourself" name="bio"></textarea>

        <h2>Skill-Set & Expericence</h2>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />

      <label for="skills">Skills</label>
      <select id="skills" style=" width: 30%;" name="skills" required="required" >
        <option value="">Select your skills</option>
        <option value="Web development">Web development</option>
        <option value="Graphic design">Graphic design</option>
        <option value="Content writing">Content writing</option>
        <option value="Digital marketing">Digital marketing</option>
        <option value="Video editing">Video editing</option>
      </select>

      <label for="experience">Experience</label>
      <textarea id="experience" name="experience" placeholder="Tell us about your experience" required="required"></textarea>


        <h2>Banking Information</h2>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />

            <label for="accountnumber">Account Number</label>
            <input type="text" id="accountnumber" name="accountnumber"  style="width:50%;" placeholder="Enter your account number" required="required" />

            <label for="accounttype">Account Type</label>
               <select id="accounttype" style=" width:40%;" name="accounttype" required="required" >
                <option value="">Select your account type</option>
                <option value="checking">Checking</option>
                <option value="savings">Savings</option>
            </select>            

                      <label for="card_number">Card Number:</label>
                      <input type="text" style="width:50%;" id="card_number" name="card_number" pattern="[0-9]{13}" title = "Please enter a valid card number"   placeholder = "Please enter a your card number" required="required" maxlength = "13" />

                      <label for="expiry_date">Expiry Date:</label>
                      <input type="text" id="expiry_date" style="width:15%;" name="expiry_date" pattern="^(0[1-9]|1[0-2])\/(2[2-9]|[3-9][0-9])$" title = "Please enter a valid expiry date in the format MM/YY" placeholder= "mm/yy" required="required" />

                      <label for="cvv">CVV:</label>
                      <input type="text" id="cvv" name="cvv" style="width:60px;" pattern="[0-9]{3}" placeholder="CVV" title="Please enter a valid CVV (3 digits)" required="required" maxlength = "3" />

        <br/><br/>
        <hr style="color: black; margin-top:-10px; background-color: black; height: 3px;" /><br />
   
        <button class="sp_button" style="margin-bottom:10%;">submit</button><br/>

        <a href="Homepage.aspx"  class="sp_button" style="margin-left:30%; margin-right:10px; text-decoration:none;" >Homepage</a> <a href="F_DashBoard.aspx"  class="sp_button" style="text-decoration:none;">DashBoard</a>


    </form>


    </form>
    <script src="Resources/JavaScript/Complete%20profile.js"></script>

</body>
</html>
