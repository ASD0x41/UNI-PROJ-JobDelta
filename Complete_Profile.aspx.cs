using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class Complete_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] == 0)
                Response.Redirect("Homepage.aspx");
        }

        protected void UpdateUserInfo_Click(object sender, EventArgs e)
        {

            int userId = (int)Application["currentUser"];
            string f_name = fullname.Text;
            DateTime b_date = DateTime.Parse(birthdate.Text);
            string Gender = gender.SelectedValue;
            string Cnic = CNIC.Text;
            string aboutuser = bio.Text;
            string phonenumber = phone.Text;
            string emailaddress = email.Text;
            string w_address = workaddress.Text;
            string bankaccount = TextBox1.Text;
            char G = 'O';
            if(Gender == "male")
            {
                G = 'M';
            }
            else if(Gender == "female")
            {
                G = 'F';
            }

            DAL myDAL = new DAL();
            myDAL.CompleteProfile(userId, f_name, b_date, G, Cnic, aboutuser, phonenumber, emailaddress, w_address, bankaccount);

            int userType = (int)Application["curUserType"];

            if (userType == 1)
                Response.Redirect("F_DashBoard.aspx");
            else if (userType == 2)
                Response.Redirect("C_DashBoard.aspx");
            else if (userType == 0)
                Response.Redirect("A_DashBoard.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                int userId = (int)Application["currentUser"];
                byte[] imageData = fileUpload.FileBytes;
                DAL myDAL = new DAL();
                myDAL.AddImage(userId, imageData);
            }
        }




    }
}