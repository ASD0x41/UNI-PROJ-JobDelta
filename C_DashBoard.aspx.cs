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
                DataTable jobPostings = LoadJobPostingsData();
                PostingGridView.DataSource = jobPostings;
                PostingGridView.DataBind();
            }
        }

        private DataTable LoadJobPostingsData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable jobPostings = new DataTable();
            jobPostings.Columns.Add("PostingID", typeof(int));
            jobPostings.Columns.Add("Title", typeof(string));
            jobPostings.Columns.Add("Description", typeof(string));
            jobPostings.Columns.Add("Category", typeof(string));
            jobPostings.Columns.Add("Budget", typeof(string));
            jobPostings.Columns.Add("JobStatus", typeof(string));

            jobPostings.Rows.Add(1, "Build a Website", "Need a website for my business", "Web Development", "$1000", "Pending");
            jobPostings.Rows.Add(2, "Design a Logo", "Looking for a logo for my startup", "Graphic Design", "$200", "Completed");
            jobPostings.Rows.Add(3, "Write an Article", "Need a 500-word article on a specific topic", "Writing & Translation", "$50", "Ongoing");

            return jobPostings;
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