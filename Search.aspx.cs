using JobDelta.Data_Access_Layer;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Web.Services;
using System.Web.Script.Services;

namespace JobDelta
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] < 0)
                Response.Redirect("Homepage.aspx");
            ImageControl.ImageUrl = "Resources/Images/Profile.png\" alt=\"Profile Picture";

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string uname = searchname.Text;



            DAL myDAL = new DAL();
            var profile = myDAL.SearchUser(uname);

            if (profile.Item10 == 0 && profile.Item8 != 0)
            {
                fullNameLabel.Text = myDAL.GetFullnameById(profile.Item9);
                emailLabel.Text = myDAL.GetEmailById(profile.Item9);
                phoneNumberLabel.Text = myDAL.GetPhoneNumber(profile.Item9);
                WorkaddressLabel.Text = myDAL.GetUserWorkAddressById(profile.Item9);
                genderLabel.Text = myDAL.GetUserGenderById(profile.Item9);
                aboutUs.Text = myDAL.GetUserAboutById(profile.Item9);

                switch (profile.Item8 )
                {
                    case 1:
                        usrtype.Text = "Freelancer";
                        break;

                    case 2:
                        usrtype.Text = "Client";
                        break;
                }
                idusr.Text = profile.Item9.ToString();

                byte[] imageData = profile.Item3;
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
            else
            {
                ImageControl.ImageUrl = "Resources/Images/Profile.png\" alt=\"Profile Picture";
                fullNameLabel.Visible = false;
                emailLabel.Visible = false;
                phoneNumberLabel.Visible = false;
                genderLabel.Visible = false;
                usrtype.Visible= false;
                WorkaddressLabel.Visible = false;
                aboutUs.Visible = false;
                idusr.Visible= false;
            }
            
        }
    }
}