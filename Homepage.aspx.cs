using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["currentUser"] = -1;
            Application["currentUser"] = -1;
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
                case 0:
                    Response.Redirect("MyProfile.aspx");
                    break;
                case -1:
                    string script2 = "signupfailure();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signupfailure", script2, true);
                    break;
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
                case 0:
                    if (logindetails.Item3 == 1)
                        Response.Redirect("F_DashBoard.aspx");
                    else if (logindetails.Item3 == 2)
                        Response.Redirect("C_DashBoard.aspx");
                    else if (logindetails.Item3 == 0)
                        Response.Redirect("A_DashBoard.aspx");
                    break;
                case -1:
                    string script2 = "signinfailure1();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signupfailure", script2, true);
                    break;
                case -2:
                    string script3 = "signinfailure2();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "signupfailure", script3, true);
                    break;
            }
        }
    }
}