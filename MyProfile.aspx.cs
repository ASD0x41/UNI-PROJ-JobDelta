using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace JobDelta
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] == 0)
                Response.Redirect("Homepage.aspx");

            int x = (int)Application["currentUser"];

            DAL myDAL = new DAL();

            int userId = x;

            string username = myDAL.GetFullnameById(userId);
            fullNameLabel.Text = username;

            string Email = myDAL.GetEmailById(userId);
            emailLabel.Text = Email;

            string pnumber = myDAL.GetPhoneNumber(userId).ToString();
            phoneNumberLabel.Text = pnumber;

            string w_address = myDAL.GetUserWorkAddressById(userId).ToString();
            WorkaddressLabel.Text = w_address;

            string Cnic = myDAL.GetUserCNICById(userId).ToString();
            CNICLabel.Text = Cnic;

            string gender = myDAL.GetUserGenderById(userId).ToString();
            genderLabel.Text = gender;

            string DOB = myDAL.GetUserBirthdateById(userId).ToString();
            DOBLabel.Text = DOB;

            string AU = myDAL.GetUserAboutById(userId).ToString();
            aboutUs.Text = AU;

            string B_account = myDAL.GetUserBankAccountById(userId).ToString();
            BankAccountLable.Text = B_account;

            string Money = myDAL.GetUserWalletMoneyById(userId).ToString();
            MoneyLabel.Text = Money;

            byte[] imageData = myDAL.GetImageData(userId);
            if (imageData != null)
            {
                string base64String = Convert.ToBase64String(imageData);
                ImageControl.ImageUrl = "data:image/png;base64," + base64String;
            }
            else
            {
                ImageControl.ImageUrl = "Resources/Images/Profile.png\" alt=\"Profile Picture";
            }
        }

        protected void btnUpdateAbout_Click(object sender, EventArgs e)
        {
            int userID = (int)Application["currentUser"];
            string aboutUser = summary_I.Text;
            DAL myDAL = new DAL();
            myDAL.UpdateUserAboutById(userID, aboutUser);
            Response.Redirect("MyProfile.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int userID = (int)Application["currentUser"];
            string p_number = phone.Text;
            string add = address.Text;
            string email = Email_I.Text;
            string fullname = Name_I.Text;
            DAL myDAL = new DAL();

            if(add != "")
                myDAL.UpdateUserAddressById(userID,add);

            if (p_number != "")
                myDAL.UpdateUserPhoneNumberById(userID, p_number);

            if (email != "")
                myDAL.UpdateUserEmailAddressById(userID, email);

            if (fullname != "")
                myDAL.UpdateUserFullNameById(userID, fullname);

            Response.Redirect("MyProfile.aspx");

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                int userId = (int)Application["currentUser"];
                byte[] imageData = fileUpload.FileBytes;
                DAL myDAL = new DAL();
                myDAL.AddImage(userId, imageData);
                Response.Redirect("MyProfile.aspx");
            }
        }

    }
}