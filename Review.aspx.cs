using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class Review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int x = (int)Application["currentUser"];
            int jobID = 0;
            jobID = (int)Session["SelectedJobID"];

            string selectedRating = Request.Form["rating"];
            string uname = name.Text;
            string uemail = email.Text;
            string expectation = Expectations.InnerHtml;
            string satistactory = Satisfy.InnerHtml;
            string communicate = communication.InnerHtml;
            string workease = workwith.InnerHtml;
            string recomend = recommend.InnerHtml;
            string additional = Anythingelse.InnerHtml;

            DAL myDAL = new DAL();
            int retval = myDAL.Review_Input(x, jobID, uname, uemail, expectation, selectedRating, satistactory, communicate, workease, recomend, additional);

            switch (retval)
            {
                case 0:
                    Response.Redirect("Review.aspx");
                    break;
                    //case -1:
                    //    string script2 = "Feedbackfailure();";
                    //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Feedbackfailure", script2, true);
                    //    break;
            }
        }
    }
}