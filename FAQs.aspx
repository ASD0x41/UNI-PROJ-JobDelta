<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="JobDelta.FAQs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/FAQs.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style=" width: 90%;">
        <h2 class="title">FAQs</h2>
        <%-----------------------------------------------------------------------------------------------%>
        <div class="faq">
            <div class="question">
                <h3>Is my personal information safe?</h3>
                
            </div>
            <div class="answer">
                <p>
               JobDelta takes the security and privacy of its users very seriously. The website employs a range of measures to protect your personal information, including encryption and secure servers. Additionally, JobDelta does not share your personal information with third parties without your consent. You can also control the information that is displayed on your profile and choose what you want to share with potential clients. However, it's always a good idea to exercise caution when sharing personal information online and to be mindful of who you are communicating with on the platform.  
                </p>
            </div>
        </div>
        <%-----------------------------------------------------------------------------------------------%>
        <div class="faq">
            <div class="question">
                <h3>What kind of services can I find on JobDelta?</h3>
            </div>
            <div class="answer">
                <p>
                On JobDelta, you can find a wide variety of freelance services offered by talented professionals from all around the world. These services include graphic design, web development, writing and translation, social media management, virtual assistance, marketing and advertising, and many more. You can browse through the available services and filter them based on your specific needs and preferences. Additionally, freelancers can offer custom services based on your unique requirements, so there are endless possibilities for the kind of services you can find on JobDelta.

                </p>
            </div>
        </div>
        <%-----------------------------------------------------------------------------------------------%>
        <div class="faq">
            <div class="question">
                <h3>How do I know if a freelancer on JobDelta is reliable?</h3>
            </div>
            <div class="answer">
                <p>
                JobDelta offers a number of features to help ensure the reliability of its freelancers. Freelancers are required to complete their profiles, which include their skills and experience, as well as reviews and ratings from previous clients. Employers can also communicate with freelancers before hiring them to discuss their project and ensure they are the right fit.  
                </p>
            </div>
        </div>
        <%-----------------------------------------------------------------------------------------------%>
        <div class="faq">
            <div class="question">
                <h3>How does JobDelta ensure quality work from its freelancers?</h3>
            </div>
            <div class="answer">
                <p>
                JobDelta takes quality control seriously and provides several features to ensure that employers receive high-quality work from its freelancers. Freelancers are required to complete their profiles, which include their skills and experience, as well as reviews and ratings from previous clients. Employers can also communicate with freelancers before hiring them to discuss their project and ensure they are the right fit. Additionally, JobDelta provides an optional arbitration service that can be used in case of disputes between employers and freelancers. Finally, employers can leave feedback and ratings for the freelancers they work with, which can help maintain accountability and encourage high-quality work.
                </p>
            </div>
        </div>
        <br />
        <br />

        <%-----------------------------------------------------------------------------------------------%>

    </section>

                <div class="side-section-container" style="margin-top:10%">
              <h2 >INFROMATION BOX</h2>
              <div class="faq-item">
                <img src="Resources/Images/BG_Image/faq-1.png"/>
                <p>Types of jobs available</p>
              </div>
              <div class="faq-item">
                <img src="Resources/Images/BG_Image/faq-2.png"/>
                <p>Payment and commission structure</p>
              </div>
              <div class="faq-item">
                <img src="Resources/Images/BG_Image/faq-3.png"/>
                <p>Client feedback and ratings</p>
              </div>

                
               <div class="help-center">
                  <p class="help-center-title">Still need help?</p>
                  <p class="help-center-body">We’re here for you.</p>
                  <a href="ContactUs.aspx" class="fit-button">
                      Contact Support
                  </a>
                </div>

            </div>

      
            <%-----------------------------------------------------------------------------------------------%>

    <div class="container" style="margin-top:5%">
     <h2 class="Qs">What is freelancing?</h2>
      <p>Freelancing is a way of working independently, outside of traditional employment arrangements. Freelancers offer their services to clients on a project-by-project basis, and may work remotely or on-site.</p>
    
      <h2 class="Qs">What kind of work can be done as a freelancer?</h2>
      <p>There are many types of work that can be done as a freelancer, including writing, web development, graphic design, video production, and consulting.</p>

      <h2 class="Qs">How do I get started as a freelancer?</h2>
      <p>To get started as a freelancer, you'll need to identify your skills and find clients who are in need of those skills. You can do this by networking, building a portfolio, and using online platforms like Upwork, Freelancer, or Fiverr.</p>

      <h2 class="Qs">What should I include in my freelancing portfolio?</h2>
      <p>Your freelancing portfolio should include samples of your work, client testimonials, and any relevant certifications or degrees. It should also showcase your skills and expertise in your chosen field.</p>

      <h2 class="Qs">How much can I earn as a freelancer?</h2>
      <p>The amount you can earn as a freelancer varies depending on your skills, experience, and the demand for your services. It's not uncommon for freelancers to earn upwards of $50 per hour, but rates can be higher or lower depending on the project.</p>

      <h2 class="Qs">How do I set my freelancing rates?</h2>
      <p>You should set your freelancing rates based on your skills, experience, and the demand for your services. It's also important to factor in any overhead costs, such as taxes, insurance, and software or equipment expenses. You can research market rates on freelance job boards or speak with other freelancers in your field for guidance.</p>
    </div>

    <section>
        </section>

    <script src="Resources/JavaScript/FAQs.js"></script>
</asp:Content>
