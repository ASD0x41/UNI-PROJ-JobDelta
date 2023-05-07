using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

namespace JobDelta
{
    public partial class MyMaster1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    string eventTarget = Request.Form["__EVENTTARGET"];
            //    if (eventTarget == hdnField.UniqueID)
            //    {
            //        MailMessage mail = new MailMessage();
            //        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            //        mail.From = new MailAddress("jobdelta2023@gmail.com");
            //        string inputValue = Request.Form["newsemail"];
            //        mail.To.Add(inputValue);
            //        //mail.To.Add(txtEmailNews.Text);
            //        mail.Subject = "JobDelta Newsletter Subscription";
            //        mail.Body = "Thank you for subscribing to our newsletter!";

            //        SmtpServer.Port = 587;
            //        SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            //        SmtpServer.EnableSsl = true;

            //        SmtpServer.Send(mail);
            //    }
            //}

            /*
            ScriptManager scriptManager = new ScriptManager();
            this.Page.Form.Controls.AddAt(0, scriptManager);


            Page.ClientScript.GetPostBackEventReference(this, string.Empty);*/
        }

        /*public static HttpRequest GetRequest()
        {
            return Request;
        }*/

        //[WebMethod]
        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static void PopUpClick(object sender, EventArgs e, HttpRequest request)
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            string inputValue = request.Form["newsemail"];
            mail.To.Add(inputValue);
            mail.Subject = "JobDelta Newsletter Subscription";
            mail.Body = "Thank you for subscribing to our newsletter!";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            string inputValue = Request.Form["newsemail"];
            mail.To.Add(inputValue);
            //mail.To.Add(txtEmailNews.Text);
            mail.Subject = "JobDelta Newsletter Subscription";
            mail.Body = "Thank you for subscribing to our newsletter!";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
        }
    }
}