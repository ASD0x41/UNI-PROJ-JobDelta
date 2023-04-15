<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="JobDelta.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/ContactUs.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="C_body">
    <div class="Title_ContactUs">
         <h1>Contact with Us</h1>
         <p>We would love to respond to your queries and help you succeed.<br> Feel
         free to get in touch with us. </p>
    </div>

   <div class="container" style="width:90%; background-color:#fff; color:#000f; box-shadow:10px 10px 5px black;" >
    <div class="OurTeam" style="margin:20px 10px 20px 10px;">
        <h1 style="text-align:center; font-size:60px; text-shadow:10px 10px 5px black;">Connect With Our Team</h1>
        <br/>
        <br/>
        <div class="Team_sub-container">
            <div class="teams">
                <img src="Resources/Images/mehdy.jpeg"/>
                <div class="name">Mehdy</div>
                <div class="desig">Developer</div>
                <div class="email">l211784@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/me.jpg"/>
                <div class="name">Umair Bin Asim </div>
                <div class="desig">Web Developer</div>
                <div class="email">l211847@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/sultan.png"/>
                <div class="name">Sultan Ahmed </div>
                <div class="desig">Manager</div>
                <div class="email">l217560@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/mudesser.png" />
                <div class="name">Mudesser </div>
                <div class="desig">Designer</div>
                <div class="email">l215387@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/asad.png" />
                <div class="name">M. Asad Tariq</div>
                <div class="desig">Designer</div>
                 <div class="email">l215266@lhr.nu.edu.pk</div>
                </div>
            </div>
        </div>
    </div>


            <div class="location-container">
          <h2>Our Location</h2>
          <p>We are located at:</p>
          <address>
            123 Main Street<br>
            Suite 456<br>
            Anytown, USA 12345
          </address>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3073.1372234075667!2d-122.40529368521504!3d37.78202237975963!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808f7e3af3abf399%3A0x798d45c2e2eac057!2sGolden%20Gate%20Bridge!5e0!3m2!1sen!2sus!4v1613573832609!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>



    <div class="container" style="box-shadow: 10px 10px 5px #000000;">

         <div class="contact-box">
            <div class="contact-left">
                <h3>Send your request</h3>

                <form>

                    <div class="input-row">
                        <div class="input-group">
                            <label>Name</label>
                            <input type="text" placeholder="Sultan Ahmed">
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
</div>

</asp:Content>
