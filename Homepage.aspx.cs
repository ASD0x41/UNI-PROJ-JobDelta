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


        protected void BtnHidden_Click(object sender, EventArgs e)
        {
           

            string email = Request.Form["emailadd"];
            string uname = Request.Form["uname"];



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
            string cpwrd = cnfrmpsword.Text;
            string utype = ddlAccountType.SelectedValue;

            if (pword == cpwrd)
            {
                DAL myDAL = new DAL();
                int retval = myDAL.RegisterNewUser(uname, email, pword, utype);

                switch (retval)
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
            else
            {
                string script2 = "nomatchpword();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "nomatchpword", script2, true);
                

            }
        }

        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            

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


        }

        


    }
}