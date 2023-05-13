using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace JobDelta
{
    public partial class FeedBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int x = (int)Application["currentUser"];

            string selectedRating = Request.Form["rating"];
            string uname = name.Text;
            string uemail = email.Text;
            string details = feedback.InnerHtml;
            string uimprove = improvements.InnerHtml;
            string ucomplain = issue.InnerHtml;
            string usuggestion = suggestion.InnerHtml;

            DAL myDAL = new DAL();
            int retval = myDAL.Feedback_Input(x, uname, uemail, details, selectedRating, uimprove, ucomplain, usuggestion);

            switch (retval)
            {
                case 0:
                    Response.Redirect("FeedBack.aspx");
                    break;
                //case -1:
                //    string script2 = "Feedbackfailure();";
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Feedbackfailure", script2, true);
                //    break;
            }
        }
    }
}

