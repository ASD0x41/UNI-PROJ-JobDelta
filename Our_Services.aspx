<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="Our_Services.aspx.cs" Inherits="JobDelta.Our_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/About_Us.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

</asp:Content>
