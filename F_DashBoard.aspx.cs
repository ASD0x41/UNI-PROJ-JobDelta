using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class F_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int x = (int)Application["currentUser"];

            if (!IsPostBack)
            {
                DataTable JobPost = LoadJobPostData();
                PostGridView.DataSource = JobPost;
                PostGridView.DataBind();


                DataTable jobPostings = LoadJobPostingsData();
                PostingGridView.DataSource = jobPostings;
                PostingGridView.DataBind();
            }

            DAL myDAL = new DAL();

             int userId = x; 

             string username = myDAL.GetUserById(userId);
             lblUsername.Text = username;

             string Fullname = myDAL.GetFullnameById(userId);
             lb2Fullname.Text = Fullname;

             string Email = myDAL.GetEmailById(userId);
             lb3Email.Text = Email;

             int Rating = myDAL.GetUserRating(userId);
             lblRating.Text = Rating.ToString();

             int totalJobs = myDAL.GetTotalJobsByUserID(userId);
             T_jobs.Text = totalJobs.ToString();

             int JobsActive = myDAL.GetActiveJobsByUserID(userId);
             A_jobs.Text = JobsActive.ToString();

            int JobsDone = myDAL.GetJobsDoneByUserID(userId);
             C_jobs.Text = JobsDone.ToString();

            int projectCompletionValue = (int)(((double) JobsDone/ totalJobs) * 100) % 100;
            int clientSatisfactionValue = (int)(((double)Rating / 5) * 100) % 100;
            int skillsValue = (int)(((double)Rating / 5) * 100) % 100;
            int communicationValue = (int)(((double)Rating / 5) * 135) % 100;
            int availabilityValue = (int)(((double) JobsActive / totalJobs) * 100) % 100;

            string script = "updateProgressBars(" + projectCompletionValue + "," + clientSatisfactionValue + "," + skillsValue + "," + communicationValue + "," + availabilityValue + ");";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "updateProgressBars", script, true);

            int Earnings = myDAL.GetTotalEarnings(userId);
            T_Earning.Text = Earnings.ToString();

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

            jobPostings.Rows.Add(1, "Build a Website", "Need a website for my business", "Web Development", "$500 - $1000", "Active");
            jobPostings.Rows.Add(2, "Design a Logo", "Looking for a logo for my startup", "Graphic Design", "$100 - $200", "Completed");
            jobPostings.Rows.Add(3, "Write an Article", "Need a 500-word article on a specific topic", "Writing & Translation", "$20 - $50", "Cancelled");

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

        private DataTable LoadJobPostData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable jobPost = new DataTable();
            jobPost.Columns.Add("Job_ID", typeof(int));
            jobPost.Columns.Add("Title", typeof(string));
            jobPost.Columns.Add("Description", typeof(string));
            jobPost.Columns.Add("Category", typeof(string));
            jobPost.Columns.Add("Budget", typeof(string));

            jobPost.Rows.Add(1, "Build a Website", "Need a website for my business", "Web Development", "$500 - $1000");
            jobPost.Rows.Add(2, "Design a Logo", "Looking for a logo for my startup", "Graphic Design", "$100 - $200");
            jobPost.Rows.Add(3, "Write an Article", "Need a 500-word article on a specific topic", "Writing & Translation", "$20 - $50");

            return jobPost;
        }

    }
}