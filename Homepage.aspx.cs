using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using System.Net;
using System.Net.Mail;

using System.Web.Services;
using System.Web.Script.Services;

namespace JobDelta
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["currentUser"] = -1;
            Application["curUserType"] = -1;
        }

        [System.Web.Services.WebMethod]
        public static string SendPword(string uname, string email)//make bool
        {
            return "Success!";


            /*DAL myDAL = new DAL();
            Tuple<int, int, int> logindetails = myDAL.LoginUser(uname, pword);

            int retval = logindetails.Item1;

            if (retval == 0)
            {
                Application["currentUser"] = logindetails.Item2;
                Application["curUserType"] = logindetails.Item3;

                //int x = (int)Application["currentUser"];
                //int y = (int)Application["curUserType"];
            }

            switch (retval)
            {
                case -1:
                    string script2 = "signinfailure1();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signinfailure1", script2, true);
                    break;
                case -2:
                    string script3 = "signinfailure2();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signinfailure2", script3, true);
                    break;

                case 0:
                    if (logindetails.Item3 == 1)
                        Response.Redirect("F_DashBoard.aspx");
                    else if (logindetails.Item3 == 2)
                        Response.Redirect("C_DashBoard.aspx");
                    else if (logindetails.Item3 == 0)
                        Response.Redirect("A_DashBoard.aspx");
                    break;


            }*/



            /*MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            mail.To.Add(email);
            mail.Subject = "Forgotten Password";
            mail.Body = ("Dear " + uname + ",\n\nThank you for signing up on JobDelta!\n\nRegards,\nThe JobDelta Team");

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);*/


        }

        //[System.Web.Services.WebMethod]
        protected void BtnHidden_Click(object sender, EventArgs e)
        {
            /*
            string[] args = Request.Form["__EVENTARGUMENT"].Split('|');
            string arg1 = args[0];
            string arg2 = args[1];*/

            //string uname = dummyuname.Text;
            //string email = dummyemail.Text;

            string email = Request.Form["emailadd"];
            string uname = Request.Form["uname"];


            //string script2 = "pwordrecovered();";
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pwordrecovered", script2, true);


            DAL myDAL = new DAL();
            string pword = myDAL.RecoverPword(uname, email);

            if (pword == "")
            {
                string script2 = "invalidforgotpword();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "invalidforgotpword", script2, true);

            }
            else
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("jobdelta2023@gmail.com");
                mail.To.Add(email);
                mail.Subject = "Password Recovery!";
                mail.Body = ("Dear " + uname + ",\n\nThe password for your JobDelta account is:\t" + pword + "\n\nRegards,\nThe JobDelta Team");

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);

                string script2 = "pwordrecovered();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pwordrecovered", script2, true);

            }

        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            string uname = txtName.Text;
            string email = txtEmail.Text;
            string pword = txtPassword.Text;
            string utype = ddlAccountType.SelectedValue;

            DAL myDAL = new DAL();
            int retval = myDAL.RegisterNewUser(uname, email, pword, utype);

            switch(retval)
            {
                case -1:
                    string script2 = "signupfailure();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signupfailure", script2, true);
                    break;

                case 0:
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                    mail.From = new MailAddress("jobdelta2023@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Welcome to JobDelta!";
                    mail.Body = ("Dear " + uname + ",\n\nThank you for signing up on JobDelta!\n\nRegards,\nThe JobDelta Team");

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);
					
					
					Tuple<int, int, int> logindetails = myDAL.LoginUser(uname, pword);
                    Application["currentUser"] = logindetails.Item2;
                    Application["curUserType"] = logindetails.Item3;
                    Response.Redirect("Complete_Profile.aspx");
                    break;

                
            }
        }

        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            /*string pweda = "MASUMCorp.2023"; //(ConfigurationManager.AppSettings["password"]);
            string from = "jobdelta2023@gmail.com"; //Replace this with your own correct Gmail Address
            string to = "l215266@lhr.nu.edu.pk"; //Replace this with the Email Address to whom you want to send the mail
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress(from);
            mail.Subject = "This is a test mail";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Test Mail.";

            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();

            //Add the Creddentials- use your own email id and password
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(from, pweda);
            client.Port = 587; // Gmail works on this port
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer

            try
            {
                client.Send(mail);
                Response.Write("Message Sent...");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                HttpContext.Current.Response.Write(errorMessage);
            } // end try*/











            /*MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("jobdelta2023@gmail.com");
            mail.To.Add("l215266@lhr.nu.edu.pk");
            mail.Subject = "Test Mail";
            mail.Body = "This is for testing SMTP mail from GMAIL";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("jobdelta2023@gmail.com", "qovhuuguobtnqfij");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);*/








            string uname = txtSignInUserName.Text;
            string pword = txtSignInPassword.Text;

            DAL myDAL = new DAL();
            Tuple<int, int, int> logindetails = myDAL.LoginUser(uname, pword);

            int retval = logindetails.Item1;

            if (retval == 0)
            {
                Application["currentUser"] = logindetails.Item2;
                Application["curUserType"] = logindetails.Item3;

                //int x = (int)Application["currentUser"];
                //int y = (int)Application["curUserType"];
            }

            switch (retval)
            {
                case -1:
                    string script2 = "signinfailure1();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signinfailure1", script2, true);
                    break;
                case -2:
                    string script3 = "signinfailure2();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signinfailure2", script3, true);
                    break;

                case 0:
                    if (logindetails.Item3 == 1)
                        Response.Redirect("F_DashBoard.aspx");
                    else if (logindetails.Item3 == 2)
                    {
                        Response.Redirect("C_DashBoard.aspx");
                    }
                    else if (logindetails.Item3 == 0)
                        Response.Redirect("A_DashBoard.aspx");
                    break;

                
            }

            /*try
            {
                MailMessage message = new MailMessage(to.Text, from.Text, subject.Text, body.Text);
                SmtpClient client = newSmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = newSystem.Net.NetworkCredential("abc@gmail.com", "12345");
                client.Send(message);
                status.Text = "message was sent successfully";
            }
            catch (Exception ex)
            {
                status.Text = ex.StackTrace;
            }*/



        }

        


        protected void Button1_Click(object sender, EventArgs e)
        {
            /*MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("your_email_address@gmail.com");
            mail.To.Add("to_address");
            mail.Subject = "Test Mail";
            mail.Body = "This is for testing SMTP mail from GMAIL";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("username", "password");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);*/
        }
    }
}