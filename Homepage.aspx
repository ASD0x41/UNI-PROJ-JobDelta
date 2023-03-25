<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="JobDelta.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/LoginPage.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!------------------------------------------------------------------------------------------------------------------->
            <div class="Cover" style="background-image:url(https://images.pexels.com/photos/4069291/pexels-photo-4069291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2)">
			            <div class="container" id="container">
				            <div class="form-container sign-up-container">
					            <form action="#">
						            <h1>Create Account</h1>
						            <input type="text" placeholder="Name" />
						            <input type="email" placeholder="Email" />
						            <input type="password" placeholder="Password" />
						            <button>Sign Up</button>
					            </form>
				            </div>

				            <div class="form-container sign-in-container">
					            <form action="#">
						            <h1>Sign in</h1>
						            <input type="email" placeholder="Email" />
						            <input type="password" placeholder="Password" />
						            <a href="#">Forgot your password?</a>
						            <button>Sign In</button>
					            </form>
				            </div>
				            <div class="overlay-container">
					            <div class="overlay">
						            <div class="overlay-panel overlay-left">
							            <h1 style="margin-right:70px">Welcome Back!</h1>
							            <p style="margin-right:70px">To keep connected with us please login with your personal info</p>
							            <button class="ghost" style="margin-right:60px;" id="signIn">Sign In</button>
						            </div>
						            <div class="overlay-panel overlay-right">
							            <h1 style="margin-left:70px">Hello!</h1>
							            <p style="margin-left:70px">Enter your personal details and start journey with us</p>
							            <button class="ghost" style="margin-left:60px;" id="signUp">Sign Up</button>
						            </div>
					            </div>
				            </div>
			            </div>
            </div>

<!------------------------------------------------------------------------------------------------------------------->

                      <div class="slideshow">
                      <div class="slide">
                         <img src="https://images.unsplash.com/photo-1482398650355-d4c6462afa0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Random Image 1">
                         <div class="slide-text">Check out our latest jobs</div>
                      </div>
                      <div class="slide">
                        <img src="https://images.unsplash.com/photo-1496449903678-68ddcb189a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Random Image 2">
                        <div class="slide-text">Earn more money with us</div>
                      </div>
                      <div class="slide">
                        <img src="https://images.unsplash.com/photo-1613336026275-d6d473084e85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Random Image 3">
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
                    <a href="#">Learn More</a>
                  </div>
                </section>


<!------------------------------------------------------------------------------------------------------------------->

	           <section class="random-information-section">
                  <h2>Random Information and Stuff</h2>
                  <ul>
                    <li>
                      <h3>Featured Project</h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae purus velit. Donec vel semper nulla.</p>
                      <a href="#">Learn More</a>
                    </li>
                    <li>
                      <h3>Latest News</h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae purus velit. Donec vel semper nulla.</p>
                      <a href="#">Read More</a>
                    </li>
                    <li>
                      <h3>Freelancer Spotlight</h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae purus velit. Donec vel semper nulla.</p>
                      <a href="#">View Profile</a>
                    </li>
                    <li>
                      <h3>Testimonials</h3>
                      <p>Curabitur euismod tellus non tellus lobortis, at lobortis mauris congue. Vestibulum id lectus libero.</p>
                      <a href="#">View All</a>
                    </li>
                    <li>
                      <h3>FAQ</h3>
                      <p>Aliquam eget tincidunt quam. Praesent vitae lectus sapien. Quisque in tincidunt neque, ac interdum purus.</p>
                      <a href="#">Read More</a>
                    </li>
                     <li>
                      <h3>Upcoming Events</h3>
                      <p>Nullam lacinia nulla sit amet nisi tempor, vel pellentesque mi dictum. Proin sodales ultrices ex.</p>
                      <a href="#">View All</a>
                    </li>
                  </ul>
                </section>

<!------------------------------------------------------------------------------------------------------------------->

    <section class="newsfeed-section">
          <div class="container" style="margin-left:20px">
            <h2 style="margin-left:20px">Job Delta Newsfeed</h2>
            <ul>
              <li style="margin-left:20px">
                <h3>New Feature: Portfolio Showcase</h3>
                <p>Showcase your best work and attract more clients with our new Portfolio feature! It's now available on your Job Delta profile.</p>
                <a href="#">Learn More</a>
              </li>
              <li style="margin-left:20px">
                <h3>Announcement: Updated Payment System</h3>
                <p>We're excited to announce that we've updated our payment system to make it even more secure and reliable. Check out our blog for more details.</p>
                <a href="#">Read More</a>
              </li>
              <li style="margin-left:20px">
                <h3>Expert Tips: How to Win More Projects on Job Delta</h3>
                <p>Want to land more projects and earn more money on Job Delta? Check out our expert tips and tricks to improve your profile and stand out to clients.</p>
                <a href="#">Read More</a>
              </li>
              <li style="margin-left:20px">
                <h3>New Freelancers on Job Delta</h3>
                <p>Welcome to our newest freelancers on Job Delta! Check out their profiles and portfolios to see their skills and experience.</p>
                <a href="#">View Profiles</a>
              </li>
            </ul>
          </div>
        </section>


<!------------------------------------------------------------------------------------------------------------------->

    <script src="Resources/Myjs.js"></script>

<!------------------------------------------------------------------------------------------------------------------->

</asp:Content>
