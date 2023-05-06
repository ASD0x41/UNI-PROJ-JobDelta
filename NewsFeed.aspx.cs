using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

namespace JobDelta
{
    public partial class NewsFeed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignUpNews_Click(object sender, EventArgs e)
        {
            string email = txtEmailNews.Text;



            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            mail.To.Add(email);
            mail.Subject = "JobDelta Newsletter Subscription";
            mail.Body = "Thank you for subscribing to the JobDelta Newsletter!\n\nRegards,\nThe JobDelta Team";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);


            string script2 = "subbed();";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "subbed", script2, true);


        }
    }
}