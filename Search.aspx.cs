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
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string uname = searchname.Text;



            DAL myDAL = new DAL();
            var profile = myDAL.SearchUser(uname);

            if (profile.Item10 == 0 && profile.Item8 != 0)
            {
                fullNameLabel.Text = profile.Item1;
                emailLabel.Text = profile.Item7;
                phoneNumberLabel.Text = profile.Item6;
                WorkaddressLabel.Text = profile.Item5;
                genderLabel.Text = profile.Item2.ToString();
                aboutUs.Text = profile.Item4;

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

                string script2 = "displayprofile();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "displayprofile", script2, true);

            }
            else
            {
                string script2 = "hideprofile();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "hideprofile", script2, true);
                
            }
            
        }
    }
}