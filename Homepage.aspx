<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="JobDelta.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/HomePage.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<script src="Resources/Scripts/WebForms/Focus.js" type="text/javascript"></script>--%>
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <%--<asp:ScriptManager ID="scriptManager" runat="server" EnablePageMethods="true">
    <Scripts>--%>
        


       <%-- <script src="Resources/JavaScript/HomePage.js"></script>--%>
    

    








    <%--</Scripts>
    </asp:ScriptManager>--%>

    


    


    <form action="#" runat="server">

<%--        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

        <%--<asp:ScriptManager EnablePageMethods="true" ID="MainSM" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>--%>


        <%--<asp:TextBox ID="hiddenTextBox" runat="server" />
        <asp:Button ID="button" runat="server" Text="Click me" OnClick="Button_Click" />--%>


        


        



       <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>--%>
        <%--<asp:TextBox ID="dummyuname" runat="server" style="display:none;"></asp:TextBox>
        <asp:TextBox ID="dummyemail" runat="server" style="display:none;"></asp:TextBox>--%>
        <asp:Button ID="BtnHidden" runat="server" Text="" OnClick="BtnHidden_Click" style="display:none"  />
    <%--</ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="dummyemail" />
    </Triggers>
        </asp:UpdatePanel>--%>



        









        <div class="popup-container">
            <div id="incorrect-login-popup-pword" class="popup-if">
            <h2>Incorrect Password!</h2>
            <p>Please re-enter your password and try again.</p>
        </div>
        <div id="incorrect-login-popup-uname" class="popup-if">
            <h2>Incorrect Username!</h2>
            <p>Please re-enter your username and try again.</p>
        </div>
         <div id="incorrect-signup-popup-uname" class="popup-if">
            <h2>Invalid Username!</h2>
            <p>Please choose another username and try again.</p>
        </div>

        <div id="nomatch-uname-email" class="popup-if">
            <h2>Incorrect Username or Email!</h2>
            <p>Your username and email address do not match.</p>
        </div>

        <div id="pword-sent" class="popup-if">
            <h2>Password Recovery</h2>
            <p>Your password has been sent to your registered email.</p>
        </div>

        <div id="pword-nomatch" class="popup-if">
            <h2>Passwords Must Match!</h2>
            <p>Your password and confirm password do not match.</p>
        </div>
            


        </div>

        <div id="forgot_password_popup" class="popup_ci" style="display:none;">
                  <div id="pwordpopup" class="popup_ci-content">
                    <span class="popup_ci-close"><button id="clsbtn" onclick="clsbtnclick()">&times;</button></span>
                    <h2>Forgot Your Password</h2>
                     
                    <br/>
                    <br/>

                    <label for="uname">Your Username:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                    <input type="text" style="width:200px; text-align:center" id="uname" name="uname" placeholder="Enter your username" <%--required="required"--%> /><br /><br />
                    <label for="email">E-mail Address:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                     <input type="text" style="width:200px; text-align:center" id="emailadd" name="emailadd" placeholder="Enter your email address" <%--required="required"--%> /><br /><br />
                    <br/>
                    <br/>
                    <%--<div style="margin-left:37%;"><input type="submit" class="sp_button" value="Submit"/></div>--%>
                      <div style="margin-left:37%;"><button id="subbtn" class="sp_button" onclick="sendpassword()">Submit</button></div>
                  </div>
         </div>













        <script type="text/javascript">
            //$(document).ready(function () {
            //function signupsuccess() {
            //    alert("Signed up successfully!");
            //}

            function signupfailure() {
                /*openPopup();*/
                //alert("Unable to Sign Up Successfully: Username already exists!");

                const popup = document.querySelector("#incorrect-signup-popup-uname");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);

                return;
            }

            function pwordrecovered() {
                /*openPopup();*/
                //alert("Unable to Sign Up Successfully: Username already exists!");

                const popup = document.querySelector("#pword-sent");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);
                //nomatch - uname - email
                return;
            }

            function invalidforgotpword() {
                /*openPopup();*/
                //alert("Unable to Sign Up Successfully: Username already exists!");

                const popup = document.querySelector("#nomatch-uname-email");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);

                return;
            }

            function notmatchpword() {
                /*openPopup();*/
                //alert("Unable to Sign Up Successfully: Username already exists!");

                const popup = document.querySelector("#pword-nomatch");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);

                return;
            }

            //function signinsuccess() {
            //    alert("Logged In Successfully!");
            //}

            function signinfailure1() {
                //alert("Unable to log in successfully: Invalid password!");
                const popup = document.querySelector("#incorrect-login-popup-pword");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; },3000);

                return;
                /*openPopup();*/
                //alert("Unable to log in successfully: Invalid password!");
            }

            function signinfailure2() {
                /*openPopup();*/
                /*document.getElementById("txtSignInUserName").value = "Invalid Username!";*/
                //alert("Unable to log in successfully: Invalid username!");
                //alert("Unable to log in successfully: Invalid password!");
                const popup = document.querySelector("#incorrect-login-popup-uname");
                //document.getElementById("incorrect-login-popup").style.display = "flex";
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);
                //document.getElementById("txtSignInUserName").value = "";
                return;
            }




            //var forgotPasswordButton = document.getElementById("forgot_password_button");
            //var closeButton = document.getElementsByClassName("#popup_ci-close")[0];

            //forgotPasswordButton.onclick = function () {

            function forgotpword() {
                var forgotPasswordPopup = document.querySelector("#forgot_password_popup");
                forgotPasswordPopup.style.display = "block";
                var forgotpwordPopup = forgotPasswordPopup.querySelector("#pwordpopup");
                forgotpwordPopup.style.display = "block";
                //closeButton = document.getElementsByClassName("#popup_ci-close")[0];
            }

            /*closeButton.onclick = function () {
                forgotPasswordPopup.style.display = "none";
            }*/

            function clsbtnclick() {
                var forgotPasswordPopup = document.querySelector("#forgot_password_popup");
                var forgotpwordPopup = forgotPasswordPopup.querySelector("#pwordpopup");
                forgotpwordPopup.style.display = "none";

                forgotPasswordPopup.style.display = "none";


            }

            /*window.onclick = function (event) {
                if (event.target == forgotPasswordPopup) {
                    forgotPasswordPopup.style.display = "none";
                }
            }*/

            function sendpassword() {
                /*var un = document.getElementById("uname").value;
                var em = document.getElementById("email").value;*/


                

                alert("Hello!" + document.getElementById("uname").value + document.getElementById("emailadd").value);
                /*PageMethods.SendPword(document.getElementById("uname").value, document.getElementById("email").value, pwordrecovered, invalidforgotpword);
                var arg1 = "argument1";
                var arg2 = "argument2";
                __doPostBack('BtnHidden', arg1 + '|' + arg2);*/

                

                btnclickhdn();

                var forgotPasswordPopup = document.querySelector("#forgot_password_popup");
                var forgotpwordPopup = forgotPasswordPopup.querySelector("#pwordpopup");
                forgotpwordPopup.style.display = "none";
                forgotPasswordPopup.style.display = "none";
                return;

            }

            function btnclickhdn() {
                document.getElementById('<%= BtnHidden.ClientID %>').click();
                return;
            }

            /*function callCSharpFunction() {
                var arg1 = "argument1";
                var arg2 = "argument2";
                __doPostBack('btnHidden', arg1 + '|' + arg2);
            }*/

        //});
        </script>

        <%--<script>
            Type.registerNamespace('Sys.WebForms');
            Sys.WebForms.Res = {
                "PRM_UnknownToken": "Unknown token: \u0027{0}\u0027.",
                "PRM_MissingPanel": "Could not find UpdatePanel with ID \u0027{0}\u0027. If it is being updated dynamically then it must be inside another UpdatePanel.",
                "PRM_ServerError": "An unknown error occurred while processing the request on the server. The status code returned from the server was: {0}",
                "PRM_ParserError": "The message received from the server could not be parsed.",
                "PRM_TimeoutError": "The server request timed out.",
                "PRM_ParserErrorDetails": "Error parsing near \u0027{0}\u0027.",
                "PRM_CannotRegisterTwice": "The PageRequestManager cannot be initialized more than once."
            };
        </script>--%>



















        



        <asp:Panel ID="Panel1" runat="server" DefaultButton="BtnSignIn">

    <div class="Cover" style="background-image:url(Resources/Images/office3.jpg); background-size:cover;">
        
                <div class="wrapper">
                    
                        <div class="signin_container" id="signin-container">
                          <h2>Sign In</h2>
                            
                            <asp:TextBox ID="txtSignInUserName" runat="server" placeholder="UserName"></asp:TextBox>
                            <asp:TextBox ID="txtSignInPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            <a href="javascript:forgotpword()">Forgot your password?</a>
                            <br />
                            <asp:Button CssClass="sp_button" ID="BtnSignIn" runat="server" Text="Sign In" onclick="BtnSignIn_Click"/>
                                
                        </div>
                    
                    <asp:Panel ID="Panel2" runat="server" DefaultButton="BtnSignUp">
                        <div class="signup_container" id="signup-container">

                          <h2>Sign Up</h2>
                            
                                <asp:TextBox ID="txtName" runat="server" placeholder="Username"></asp:TextBox>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <asp:TextBox ID="cnfrmpsword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                <br />
                                <label for="account-type" style="color:azure">Account Type:</label>
                                <br />
                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                    <asp:ListItem Value="freelancer">Freelancer</asp:ListItem>
                                    <asp:ListItem Value="client">Client</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="sp_button" ID="BtnSignUp" runat="server" Text="Sign Up" OnClick="BtnSignUp_Click"/>
                           
                         </div>
                                   </asp:Panel>
                     </div>
 
                </div>
            </asp:Panel>

<!------------------------------------------------------------------------------------------------------------------->

                      <div class="slideshow">
                      <div class="slide">
                         <img src="Resources/Images/BG_Image/home-1.jpeg" alt="Random Image 1">
                         <div class="slide-text">Check out our latest jobs</div>
                      </div>
                      <div class="slide">
                        <img src="Resources/Images/BG_Image/home-2.jpeg" alt="Random Image 2">
                        <div class="slide-text">Earn more money with us</div>
                      </div>
                      <div class="slide">
                        <img src="Resources/Images/BG_Image/home-3.jpeg" alt="Random Image 3">
                        <div class="slide-text">Get hired for your dream job</div>
                      </div>
                    </div>

<!------------------------------------------------------------------------------------------------------------------->

                <section class="i-section">
                  <div class="i-container">
                    <h2>Discover Your Next Freelancing Opportunity</h2>
                    <p>With Job Delta, you can find the best freelancing jobs from top companies around the world. Join our community and start earning today!</p>
                    <div class="features-container">
                      <div class="feature-box">
                        <h3>Find Your Perfect Job</h3>
                        <p>Search our database of jobs to find the one that's right for you. Filter by skill, experience, and location to get the best results.</p>
                      </div>
                      <div class="feature-box">
                        <h3>Connect with Clients</h3>
                        <p>Build relationships with clients and increase your chances of being hired. Chat with clients, ask questions, and learn more about their needs.</p>
                      </div>
                      <div class="feature-box">
                        <h3>Secure Payments</h3>
                        <p>Get paid for your work with ease. Our secure payment system ensures that you get paid on time, every time.</p>
                      </div>
                    </div>
                    <p>Join our community of freelancers and start discovering new opportunities today!</p>
                    <a href="About_Us.aspx">Learn More</a>
                  </div>
                </section>


<!------------------------------------------------------------------------------------------------------------------->

	           <section class="random-information-section">
                  <h2>Explore</h2>
                  <ul>
                    <li>
                      <h3>Featured Project</h3>
                      <p>Handpicked high-quality projects for freelancers to bid on, providing them with premium opportunities to find work. It offers a curated selection of projects that align with freelancers' skills and interests, helping them increase their chances of landing lucrative gigs.</p>
                      <a href="https://www.fiverr.com/gigs/projects">Learn More</a>
                    </li>
                    <li>
                      <h3>Latest News</h3>
                      <p>Keep users updated on platform happenings, announcements, and updates. Provides timely news about new features, improvements, and promotions, helping users stay informed about important updates that may impact their freelancing experience.</p>
                      <a href="NewsFeed.aspx">Read More</a>
                    </li>
                    <li>
                      <h3>Freelancer Spotlight</h3>
                      <p>Highlights outstanding freelancers who excel on the platform, giving them increased visibility and recognition. It showcases their skills, experience, and performance, allowing clients to discover talented freelancers and helping freelancers build their professional brand.</p>
                      <a href="https://freeup.net/blog/category/freelance-tips/freelancer-spotlights/">View Profile</a>
                    </li>
                    <li>
                      <h3>Testimonials</h3>
                      <p>Feedback from clients and freelancers, sharing positive experiences and expressing satisfaction with services. Valuable insights for potential clients and help freelancers build their reputation. Maintains a dedicated section for testimonials, enhancing trust and transparency within the freelancing community.</p>
                      <a href="https://www.upwork.com/hire/testimonial-freelancers/">View All</a>
                    </li>
                    <li>
                      <h3>FAQ</h3>
                      <p>Helpful resource for users to quickly access information about the platform's features, policies, and procedures. It saves users time by providing clear and concise answers to common questions, helping them navigate the site effectively, and make informed decisions about hiring freelancers or finding freelance gigs.</p>
                      <a href="FAQs.aspx">Read More</a>
                    </li>
                     <li>
                      <h3>Upcoming Events</h3>
                      <p>Be informed about relevant events related to freelancing and professional development. Information on upcoming events, such as dates, times, topics, and registration details, allows users to easily browse and register for events that align with their interests. Opportunities for users to learn, connect with fellow freelancers, and stay updated on industry trends and best practices.</p>
                      <a href="https://events.fiverr.com/">View All</a>
                    </li>
                  </ul>
                </section>
       
<!------------------------------------------------------------------------------------------------------------------->

        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%;">
          <img src="Resources/Images/BG_Image/home-4.gif" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" alt="Freelancing GIF">
          <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
            <h2 style="color: azure; text-shadow:10px 10px 5px black; font-size: 3rem; font-weight: bold; margin: 0;">Welcome to Job Delta!</h2>
            <p style="color: azure; text-shadow:10px 10px 5px black; font-size: 1.6rem; margin: 1rem 0 0 0;">"Empowering freelancers, connecting businesses: Job Delta, where opportunity meets talent."</p>
          </div>
        </div>


<!------------------------------------------------------------------------------------------------------------------->

    <section class="newsfeed-section">
          <div class="container" style="margin-left:20px">
            <h2 style="margin-left:20px">Job Delta Newsfeed</h2>
            <ul>
              <li style="margin-left:20px">
                <h3>New Feature: Portfolio Showcase</h3>
                <p>Showcase your best work and attract more clients with our new Portfolio feature! It's now available on your Job Delta profile.</p>
                <a href="https://www.fiverr.com/support/articles/4413134063633-Using-My-Portfolio?segment=seller">Learn More</a>
              </li>
              <li style="margin-left:20px">
                <h3>Announcement: Updated Payment System</h3>
                <p>We're excited to announce that we've updated our payment system to make it even more secure and reliable. Check out our blog for more details.</p>
                <a href="https://www.fiverr.com/content/payments-terms-and-conditions">Read More</a>
              </li>
              <li style="margin-left:20px">
                <h3>Expert Tips: How to Win More Projects on Job Delta</h3>
                <p>Want to land more projects and earn more money on Job Delta? Check out our expert tips and tricks to improve your profile and stand out to clients.</p>
                <a href="https://www.fiverr.com/support/articles/360010708757-Best-practices-for-new-Fiverr-sellers-Tips?segment=seller">Read More</a>
              </li>
              <li style="margin-left:20px">
                <h3>New Freelancers on Job Delta</h3>
                <p>Welcome to our newest freelancers on Job Delta! Check out their profiles and portfolios to see their skills and experience.</p>
                <a href="https://freeup.net/blog/category/freelance-tips/freelancer-spotlights/">View Profiles</a>
              </li>
            </ul>
          </div>
        </section>

<!------------------------------------------------------------------------------------------------------------------->

        
        



        </form>

        

</asp:Content>
