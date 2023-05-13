using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace JobDelta
{
    public partial class MyMaster2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = (int)Application["currentUser"];
            DAL myDAL = new DAL();
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
    }
}