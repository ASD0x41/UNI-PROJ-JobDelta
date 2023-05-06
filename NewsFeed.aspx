<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="NewsFeed.aspx.cs" Inherits="JobDelta.NewsFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/NewsFeed.css" rel="stylesheet" />

	<style type="text/css">
				.popup {
			display: none;
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			z-index: 9999;
			width: 350px;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
			text-align: center;
		}

		/* Styles for the popup heading */
		.popup h2 {
			margin-top: 0;
			font-size: 24px;
			font-weight: bold;
		}

		/* Styles for the popup message */
		.popup p {
			margin-bottom: 0;
			font-size: 16px;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Job Delta Newsfeed</h1>

	<form runat="server">

		<section class="news-item-special" style="text-align:center">
			<asp:Label runat="server" style="color:#FF4500;">Subscribe to our Newsletter: </asp:Label>
			<asp:TextBox ID="txtEmailNews" style="width:200px; text-align:center;padding: 10px;border-radius: 5px;border: none;flex: 1;margin-right: 10px;border-color:#FF4500;" runat="server" placeholder="Enter your email address..."></asp:TextBox>
            <asp:Button ID="BtnSignUpNews" runat="server" Text="Subscribe" style="padding: 10px 20px;border-radius: 5px; border: none;background-color: #FF4500;color: #fff;font-size: 14px;cursor: pointer;transition: all 0.3s ease;" OnClick="BtnSignUpNews_Click"/>
		</section>

		<br />
		<br />

			<div class="popup-container">
				<div id="thanksub" class="popup">
					<h2>Newsletter Subscription!</h2>
					<p>Thank you for subscribing!</p>
				</div>
			</div>

		<script type="text/javascript">
            function subbed() {
                
                const popup = document.querySelector("#thanksub");
                popup.style.display = "flex";
                setTimeout(function () { popup.style.display = "none"; }, 3000);
                return;
            }
        </script>


             
			<%--<input id="newsemail" type="email" placeholder="Enter your email address">
            <button id="BtnSubmit" type="submit" onclick ="window.location.href='NewsFeed.aspx';">Subscribe to our Newsletter</button>--%>
    </form>

    <section class="news-item">
			<h2>Introducing Job Delta : Our New Platform for Freelancers!</h2>
			<p>We're thrilled to announce the launch of Job Delta - our new and improved platform for freelancers! Our team has been working tirelessly to build a platform that is more user-friendly, secure, and customizable. With Job Delta, freelancers will have access to a wider range of job opportunities, advanced search filters, and personalized job recommendations based on their skills and experience. We have also added new features such as real-time messaging, invoicing, and project management tools to help freelancers streamline their work and deliver high-quality projects to clients. Try it out today and let us know what you think!</p>
			<p class="date">April 14, 2023</p>
		</section>

		<section class="news-item">
			<h2>New Opportunities for Freelancers in the Tech Industry</h2>
			<p>The tech industry is one of the fastest-growing industries in the world, and there is a huge demand for skilled freelancers who can work on projects ranging from web development to data analysis. At Job Delta, we are constantly adding new job opportunities in the tech industry to our platform, and we are committed to helping freelancers find high-paying jobs that match their skills and interests. Whether you are a beginner or an experienced tech freelancer, Job Delta has something for everyone. Keep an eye on our job board for new opportunities and apply today!</p>
			<p class="date">April 12, 2023</p>
		</section>

		<section class="news-item">
			<h2>How to Build a Successful Freelancing Career</h2>
			<p>Building a successful freelancing career takes time, effort, and dedication. At Job Delta, we are passionate about helping freelancers achieve their goals and reach their full potential. That's why we have created a comprehensive guide on how to build a successful freelancing career, which covers topics such as creating a strong portfolio, networking with clients and other freelancers, setting realistic rates, and managing your time effectively. We also offer a range of online courses and workshops to help you enhance your skills and stay up-to-date with the latest trends in your industry. Check out our blog for more information on how to build a successful freelancing career!</p>
			<p class="date">April 10, 2023</p>
		</section>
	   
	    <section class="news-item">
			<h2>Upcoming Event: Job Delta Freelancer Summit</h2>
			<p>Mark your calendars for the upcoming Job Delta Freelancer Summit! The summit will bring together freelancers from around the world to share their experiences, learn from experts in the industry, and connect with potential clients. The summit will feature keynote speeches, panel discussions, and networking events. Stay tuned for more details on the date and location!</p>
			<p class="date">April 25, 2023</p>
		</section>

		<section class="news-item">
			<h2>Future Plans: Job Delta Academy</h2>
			<p>We are excited to announce that we will be launching Job Delta Academy - a platform for freelancers to learn new skills, improve their existing skills, and stay up-to-date with the latest trends in the industry. The academy will offer online courses, webinars, and workshops taught by experts in their respective fields. Our goal is to help freelancers succeed in their careers and grow their businesses. Stay tuned for more details on the launch date and course offerings!</p>
			<p class="date">May 1, 2023</p>
		</section>



</asp:Content>
