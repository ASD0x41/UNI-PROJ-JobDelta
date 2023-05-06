using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

namespace JobDelta
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendMsg_Click(object sender, EventArgs e)
        {
            string name = Request.Form["contactname"];
            string phone = Request.Form["contactphone"];
            string email = Request.Form["contactemail"];
            string subject = Request.Form["contactsubject"];
            string msg = Request.Form["contactmsg"];


            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            mail.To.Add(email);
            mail.Subject = "Greetings from JobDelta!";
            mail.Body = ("Dear " + name + ",\n\nWe have received the following message from you regarding the subject \'" + subject + "\':\n\n\"" + msg + "\"\n\nWe thank you for contacting us. A representative will soon reach out to you on your phone number: " + phone + "\n\nRegards,\nThe JobDelta Team");

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);

            string script2 = "subbed();";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "subbed", script2, true);

        }
    }
}