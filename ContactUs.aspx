<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="JobDelta.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/ContactUs.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <h1>Connect With Us</h1>
         <p>We would love to respond to your queries and help you succeed.<br> Feel
         free to get in touch with us. </p>
         <div class="contact-box">
            <div class="contact-left">
                <h3>Send your request</h3>

                <form>

                    <div class="input-row">
                        <div class="input-group">
                            <label>Name</label>
                            <input type="text" placeholder="Sultan Boi">
                        </div>

                        <div class="input-group">
                            <label>Phone No.</label>
                            <input type="text" placeholder="+92 300 1234 567">
                        </div>
                    </div>


                    <div class="input-row">
                        <div class="input-group">
                            <label>Email</label>
                            <input type="email" placeholder="Sultan567@example.com">
                        </div>
                        <div class="input-group">
                            <label>Subject</label>
                            <input type="text" placeholder="Demo">
                        </div>
                    </div>


                    <label>Messages</label>
                    <textarea rows="5" placeholder="Your Message"></textarea>
                    <button type="submit"> SEND</button>
                </form>
            </div>


            <div class="contact-right">
                <h3>Reach Us</h3>
                <table>
                    <tr>
                        <td>Email</td>
                           <td>contactus@example.com</td>
                    </tr>
                    <tr>
                            <td>Phone</td>
                            <td>+92 302 345 6789</td>
                    </tr>
                    <tr>
                            <td>Address</td>
                            <td>852-B Milaad St,<br>
                            Block B Faisal Town,<br>
                            Lahore, Punjab 54770
                            </td>
                    </tr>
                </table>
            </div>
         </div>
     </div>


</asp:Content>
