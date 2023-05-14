<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="JobDelta.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/feedBck.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="Title">
          <h2>Give Review</h2>
          <p>Welcome to the JobDelta's review page. Here, as a freelancer, you can leave a review for your client based on your experience working with them. And as a client, you can provide a review for the job done by your freelancer. Your honest feedback can help build a better community of freelancers and clients, and improve the overall quality of the work done on our platform. Thank you for taking the time to share your thoughts!</p>
        </section>

        <section class="form">
          <h3>Review</h3>
          <form action="#"  runat="server">
            <div class="form-group">
              <label for="name">Name:</label>
              <asp:TextBox ID="name" runat="server"></asp:TextBox> 
            </div>

            <div class="form-group">
              <label for="email">Email:</label>
              <asp:TextBox ID="email" type="email" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
              <label for="Expectations">Did the freelancer/client meet your expectations</label>
               <textarea id="Expectations" name="Expectations" runat="server"></textarea>
            </div>

         <div class="form-group">
          <label for="rating">Rate your freelancer/client</label>
          <fieldset class="rating">
            <input type="radio" id="star1" name="rating" value="1" />
            <label for="star1" title="1 stars"></label>
            <input type="radio" id="star2" name="rating" value="2" />
            <label for="star2" title="2 stars"></label>
            <input type="radio" id="star3" name="rating" value="3" />
            <label for="star3" title="3 stars"></label>
            <input type="radio" id="star4" name="rating" value="4" />
            <label for="star4" title="4 stars"></label>
            <input type="radio" id="star5" name="rating" value="5" />
            <label for="star5" title="5 star"></label>
          </fieldset>
        </div>
              <div class="form-group">
              <label for="satisfy">How satisfied were you with the job done by the freelancer/client?</label>
              <textarea id="Satisfy" name="satisfy" runat="server"></textarea>
            </div>

            <div class="form-group">
              <label for="workwith">How easy was it to work with the freelancer/client?</label>
              <textarea id="workwith" name="workwith" runat="server"></textarea>
            </div>

            <div class="form-group">
              <label for="communication">Were there any communication issues during the project?</label>
              <textarea id="communication" name="communication" runat="server"></textarea>
            </div>

            <div class="form-group">
              <label for="recommend">Would you recommend this freelancer/client to others?</label>
              <textarea id="recommend" name="recommend" runat="server"></textarea>
            </div>

              <div class="form-group">
              <label for="Anythingelse">Anything else you would like to share.</label>
              <textarea id="Anythingelse" name="Anythingelse" runat="server"></textarea>
            </div>

         <asp:Button Class="ss_button" ID="Button1" runat="server"  type="submit" Text="Submit Review" onclick="BtnSubmit_Click"/>
         
          </form>
        </section>




</asp:Content>
