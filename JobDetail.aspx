<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="JobDetail.aspx.cs" Inherits="JobDelta.JobDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/JobDetail.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
	<div class="job-container">
		<h1>Job Details</h1>
		<br>
		<div class="job-details">
			<div class="row">
				<div class="column"><strong>Job ID:</strong></div>
				<div class="column2">JOB1</div>
			</div>
			<div class="row">
				<div class="column"><strong>Job Type:</strong></div>
				<div class="column2">Free lancing</div>
			</div>
			<div class="row">
				<div class="column"><strong>Money:</strong></div>
				<div class="column2">$69.69</div>
			</div>
			<div class="row">
				<div class="column"><strong>Job Detail:</strong></div>
				<div class="column2">Detail regarding the job</div>
			</div>
			<div class="row">
				<div class="column"><strong>Post Date:</strong></div>
				<div class="column2">2/4/2023</div>
			</div>
			<div class="row">
				<div class="column"><strong>Due Date:</strong></div>
				<div class="column2">22/4/2023</div>
			</div>
			<div class="row">
				<div class="column"><strong>Job Status:</strong></div>
				<div class="column2">T</div>
			</div>
			<div class="row">
				<div class="column"><strong>Lance ID:</strong></div>
				<div class="column2">User69</div>
			</div>
			<div class="row">
				<div class="column"><strong>Check:</strong></div>
				<div class="column2">O</div>
			</div>
		</div>
	</div>
	</div>

</asp:Content>
