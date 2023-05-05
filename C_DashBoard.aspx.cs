using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace JobDelta
{
    public partial class C_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load job postings data and bind it to the GridView
                LoadJobPostingsData();
                //DataTable jobPostings = LoadJobPostingsData();
                //PostingGridView.DataSource = jobPostings;
                //PostingGridView.DataBind();
            }
        }

        private void LoadJobPostingsData()
        {
            int clientID = (int)Application["currentUser"];
            DAL myDAL = new DAL();

            PostingGridView.DataSource = myDAL.LoadClientJobTable(clientID);
            PostingGridView.DataBind();

            // Modify the job status string after databinding
            foreach (GridViewRow row in PostingGridView.Rows)
            {
                string status = row.Cells[5].Text;
                switch (status)
                {
                    case "N":
                        row.Cells[5].Text = "Not done";
                        break;
                    case "T":
                        row.Cells[5].Text = "To be assigned";
                        break;
                    case "O":
                        row.Cells[5].Text = "Ongoing";
                        break;
                    case "D":
                        row.Cells[5].Text = "Done";
                        break;
                    case "W":
                        row.Cells[5].Text = "Withdrawn";
                        break;
                    default:
                        break;
                }

            }

        }


        protected void PostingGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int postingId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("JobDetail.aspx?PostingID=" + postingId);
            }
        }

        protected void BtnJobPost_Click(object sender, EventArgs e)
        {
            int ClientID = (int)Application["currentUser"]; 
            string JobTitle = jobTitle.Text;
            string JobType = jobCategory.SelectedValue ;
            decimal JobValue = decimal.Parse(jobBudget.Text);
            string JobDetail = jobdesc.Text;
            string dueDate = jobDueDate.SelectedDate.ToShortDateString();
            


            DAL myDAL = new DAL();
            int retval = myDAL.RegisterNewJob(ClientID, JobTitle, JobType, JobValue, JobDetail,dueDate);
            Response.Redirect("C_DashBoard.aspx");

            //switch (retval)
            //{
            //    case 1:
            //        //Response.Redirect("C_DashBoard.aspx");
            //        break;
            //    case -1:
            //        //string script2 = "signupfailure();";
            //        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "jobpostfailure", script2, true);
            //        break;
            //}
        }
    }
}