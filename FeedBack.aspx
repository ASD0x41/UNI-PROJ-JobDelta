<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="JobDelta.FeedBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/FeedBack.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              <section class="Title">
          <h2>Share Your Feedback</h2>
          <p>Welcome to the feedback page of our freelancing site! We value your opinion and would love to hear your thoughts on your experience using our platform. Whether you're a freelancer or an employer, your feedback is essential to help us improve our services and make our platform better suited to your needs. We are constantly striving to provide the best possible experience for our users and your input can help us achieve that goal. So please, take a few moments to share your feedback with us and let us know how we can make your freelancing experience even better.</p>
        </section>

        <section class="form">
          <h3>Feedback Form</h3>
          <form action="submit_feedback.php" method="post">
            <div class="form-group">
              <label for="name">Name:</label>
              <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
              <label for="email">Email:</label>
              <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
              <label for="feedback">Feedback:</label>
              <textarea id="feedback" name="feedback" required></textarea>
            </div>

         <div class="form-group">
          <label for="rating">Rate your experience:</label>
          <fieldset class="rating">
            <input type="radio" id="star5" name="rating" value="5" />
            <label for="star5" title="5 stars"></label>
            <input type="radio" id="star4" name="rating" value="4" />
            <label for="star4" title="4 stars"></label>
            <input type="radio" id="star3" name="rating" value="3" />
            <label for="star3" title="3 stars"></label>
            <input type="radio" id="star2" name="rating" value="2" />
            <label for="star2" title="2 stars"></label>
            <input type="radio" id="star1" name="rating" value="1" />
            <label for="star1" title="1 star"></label>
          </fieldset>
        </div>


            <div class="form-group">
              <label for="improvements">How can we improve?</label>
              <textarea id="improvements" name="improvements"></textarea>
            </div>

            <div class="form-group">
              <label for="issue">Did you encounter any issues? If yes, please describe:</label>
              <textarea id="issue" name="issue"></textarea>
            </div>

            <div class="form-group">
              <label for="suggestion">Do you have any suggestions or feature requests?</label>
              <textarea id="suggestion" name="suggestion"></textarea>
            </div>

            <button class="ss_button" type="submit">Submit Feedback</button>
          </form>
        </section>

</asp:Content>
