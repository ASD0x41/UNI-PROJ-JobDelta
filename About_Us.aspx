<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="JobDelta.About_Us" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/About_Us.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Cover">
<%-------------------------------------------------------------------------------------------------%> 

        <div class="heading">
        <h1> About Us </h1>
        <p>One of the largest and most popular freelancing sites, with a wide range of jobs available in various fields.</p>
    </div>

<%-------------------------------------------------------------------------------------------------%> 

            <div class="container">
                <section class="about">
                    <div class="about-image">
                        <img src="Resources/Images/office2.jpg" />
                    </div>
                    <div class="about-content">
                        <h2>Job Delta</h2>
                        <p>
                            Job Delta is an online platform that connects freelancers with clients who are looking for their services. With a wide range of job categories, Job Delta offers opportunities for freelancers to find work that fits their skills and interests. Clients can easily post their projects and receive proposals from qualified professionals. Job Delta offers tools to help freelancers manage their work, communicate with clients, and get paid for their services. The platform also provides protection and security for both parties by managing payments and providing dispute resolution services if necessary. Job Delta is a great option for freelancers looking for work and clients looking for quality professionals for their projects.
                        </p>
                    </div>
                </section>
            </div>

<%-------------------------------------------------------------------------------------------------%> 

        <div class="container" style="margin-top:50px;">
         <section class="philosophy">
                <div class="philosophy-image">
                    <img src="Resources/Images/office.jpg" />
                </div>
                <div class="philosophy-content">
                <h2>Our Philosophy</h2>
                <p>Job Delta's philosophy is centered around empowering freelancers to work on projects they are passionate about while providing clients with access to top-quality professionals worldwide. Their platform facilitates transparent, secure, and easy-to-use connections between freelancers and clients, offering communication tools, milestone-based payment structures, and dispute resolution processes to ensure trust and satisfaction throughout the project lifecycle. Ultimately, their approach seeks to create a more fulfilling and productive work environment for all.</p>
                </div>
            </section>
         </div>

<%-------------------------------------------------------------------------------------------------%> 

            <div class="container" style="margin-top:30px">
               <section class="how-it-works">
                    <h2>How it Works</h2>
                   <br />
                    <div>
                      <div class="step">
                        <img src="https://cdn.dribbble.com/users/1632728/screenshots/4693038/profilepic_dribbble.gif">
                        <h3>Create your profile (it's free)</h3>
                        <p>An eye-catching title and client-focused overview help us match you to the work you want. Include your work history, your skills, and your photo. Add more, like an introduction video, to create a profile that really stands out.</p>
                      </div>
                      <div class="step">
                        <img src="https://cdn.dribbble.com/users/533117/screenshots/3490598/dribbble.gif">
                        <h3>Explore ways to earn</h3>
                        <p>Work and earn in different ways. Bid for jobs. Pitch your projects. Discuss your in-demand skills with our recruiters so they can find opportunities aligned with your passions and career goals. Do all three. Create a predictable pipeline and build your network.</p>
                      </div>
                      <div class="step">
                        <img src="https://i.pinimg.com/originals/f8/c4/22/f8c422a0a0e6793b3f9113d419c5143a.gif">
                        <h3>Get paid securely</h3>
                        <p>Choose how you get paid. Our fixed-price protection releases client payments at project milestones. Hourly protection bills clients every week. However you work, our service fees are the same. Spend less time chasing, more earning.</p>
                      </div>
                    </div>
                       <br />
                       <br />
                       <a href="HomePage.aspx" class="S_button">Create Your Account Now !!!</a>
                  </section>
            </div>

<%-------------------------------------------------------------------------------------------------%> 

         <div class="container">
          <section class="mission">
            <div class="sub_container">
              <h2 class="heading-2">Our Mission</h2>
              <div class="row">
                <div>
                  <h3>For Freelancers</h3>
                  <p>We believe that freelancers should have the opportunity to showcase their skills and find meaningful work. Our platform provides a space for freelancers to create a professional profile, showcase their portfolio, and connect with clients who value their skills.</p>
                  <p>We also believe in empowering freelancers to set their own rates and choose projects that align with their interests and goals. Our platform provides the tools and resources freelancers need to manage their businesses and thrive in the gig economy.</p>
                </div>
                <div>
                  <h3>For Clients</h3>
                  <p>We believe that clients should have access to a pool of skilled freelancers who can bring their projects to life. Our platform provides a streamlined process for finding and hiring freelancers who match your project needs and budget.</p>
                  <p>We also believe in transparency and collaboration between clients and freelancers. Our platform provides tools for communication, project management, and payment processing, so that clients and freelancers can work together effectively and efficiently.</p>
                </div>
              </div>
            </div>
          </section>
        </div>


<%-------------------------------------------------------------------------------------------------%> 

<div class="container">
  <section class="what-we-provide">
    <h2 class="heading-2">What We Provide</h2>
    <div class="services-container">
      <div class="service">
        <img src="https://media1.giphy.com/media/U8Y2KNDcCSyk6ILB8b/giphy.gif" alt="Freelancer">
        <h3 class="heading-3">For Freelancers</h3>
        <p class="service-description">Showcase your skills and find work that fits your interests and expertise on our platform. Our tools help you manage your projects, communicate with clients, and get paid for your work.</p>
      </div>
      <div class="service" >
        <img src="https://www.bing.com/th/id/OGC.6cafeb1941de2b4e1089f67b7b139458?pid=1.7&rurl=https%3a%2f%2fcdn.myportfolio.com%2fec4657434c011e1a856a01752ef5f2f5%2fdf4cced1864491068565a9ef_rw_1200.gif%3fh%3df6d0aee62a35c711106f89f861dfb19a&ehk=nMksmcup9bG8J7L4fUijAQB64gUkQBfRuMC3zVgfVmk%3d" alt="Client">
        <h3 class="heading-3">For Clients</h3>
        <p class="service-description">Find and hire top-quality professionals from around the world on our platform. Our tools help you manage your projects, communicate with freelancers, and pay for their services.</p>
      </div>
    </div>
  </section>

<section class="our-services" style="margin-right:40px;">
  <ul>
    <li>
      <div class="service">
        <div class="service-title">
          <h3>Job Posting and Proposal Submission</h3>
        </div>
        <div class="service-description">
          <p>Our platform allows businesses to post job openings and receive proposals from talented professionals. This streamlined process helps you find the right candidate for your project.</p>
        </div>
      </div>
    </li>
    <li>
      <div class="service">
        <div class="service-title">
          <h3>Project Management and Communication Tools</h3>
        </div>
        <div class="service-description">
          <p>We provide powerful tools to help you manage your projects and communicate with your team members. Our platform includes features like task tracking, file sharing, and real-time messaging.</p>
        </div>
      </div>
    </li>
    <li>
      <div class="service">
        <div class="service-title">
          <h3>Secure Payments and Dispute Resolution</h3>
        </div>
        <div class="service-description">
          <p>Our platform uses secure payment methods to ensure that both clients and professionals are protected. We also offer a dispute resolution process in case of any issues.</p>
        </div>
      </div>
    </li>
    <li>
      <div class="service">
        <div class="service-title">
          <h3>Talent Search and Matching Algorithms</h3>
        </div>
        <div class="service-description">
          <p>Our platform uses advanced algorithms to match businesses with the most qualified professionals. This saves time and ensures that you find the right candidate for your project.</p>
        </div>
      </div>
    </li>
    <li>
      <div class="service">
        <div class="service-title">
          <h3>24/7 Customer Support</h3>
        </div>
        <div class="service-description">
          <p>We offer round-the-clock customer support to assist you with any questions or concerns. Our team is dedicated to ensuring that you have the best experience possible.</p>
        </div>
      </div>
    </li>
  </ul>
</section>

</div>

<%-------------------------------------------------------------------------------------------------%> 
        
<div class="container">

    <div class="OurTeam">
        <h1 class="heading-2">Our Team</h1>
        <p>Our team is comprised of highly skilled and enthusiastic web developers who are passionate about creating exceptional digital experiences. With a strong focus on user-centric design and development, we have the expertise to deliver high-quality websites that exceed our clients' expectations. Our team members bring a range of technical skills and experience, including proficiency in HTML, CSS, JavaScript, and various web development frameworks. We work collaboratively to bring our clients' visions to life and are committed to delivering innovative and effective solutions that drive results.</p>
       </div>

        <div class="Team_sub-container">
            <div class="teams">
                <img src="Resources/Images/mehdy.jpeg" />
                <div class="name">Mehdy</div>
                <div class="desig">Developer</div>
                <div class="T_about">Experienced developer with a track record of delivering innovative solutions. Proficient in programming languages, frameworks, and tools. Strong analytical and problem-solving skills. Passionate about staying updated with latest technologies.</div>

                <div class="sLinks">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>

            <div class="teams">
                <img src="Resources/Images/me.jpg" />
                <div class="name">Umair Bin Asim </div>
                <div class="desig">Web Developer</div>
                <div class="T_about">A highly skilled web developer with a passion for creating beautiful and functional websites. With several years of experience in HTML, CSS, JavaScript, and various web development frameworks, I have developed expertise in creating responsive and user-friendly websites. </div>

                <div class="sLinks">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>

            <div class="teams">
                <img src="Resources/Images/sultan.png" />
                <div class="name">Sultan Ahmed </div>
                <div class="desig">Manager</div>
                <div class="T_about">Experienced manager with a proven track record of success in leading teams and achieving organizational goals. Strategic mindset, strong leadership skills, and effective implementation of processes. Excellent communication and collaboration abilities, coupled with keen business acumen.</div>

                <div class="sLinks">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>

            <div class="teams">
                <img src="Resources/Images/mudesser.png" />
                <div class="name">Mudesser </div>
                <div class="desig">Designer</div>
                <div class="T_about">Experienced designer with expertise in graphic design, UX/UI design, and branding. Keen eye for aesthetics and strong ability to create visually stunning designs. Creative approach, attention to detail, and proficiency in design software. Committed to staying updated with design trends and continuously refining skills for exceptional results.</div>

                <div class="sLinks">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>

            <div class="teams">
                <img src="Resources/Images/asad.png" />
                <div class="name">M. Asad Tariq</div>
                <div class="desig">Programmer</div>
                <div class="T_about">Programmer with extensive experience in designing, developing, testing, and debugging software applications using various programming languages and frameworks. Proficient in coding concepts and possesses strong analytical skills. Skilled in resolving complex issues efficiently and meeting project requirements and deadlines. Detail-oriented, collaborative team player with a keen problem-solving mindset</div>

                <div class="sLinks">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </div>

<%-------------------------------------------------------------------------------------------------%> 

<%-------------------------------------------------------------------------------------------------%> 

</div>

</asp:Content>
