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
    public partial class C_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] == 0)
                Response.Redirect("Homepage.aspx");
            else if ((int)Application["curUserType"] == 1)
                Response.Redirect("F_DashBoard.aspx.aspx");


            int x = (int)Application["currentUser"];

            if (!IsPostBack)
            {
                // Load job postings data and bind it to the GridView
                DataTable jobPostings = LoadJobPostingsData();
                PostingGridView.DataSource = jobPostings;
                PostingGridView.DataBind();
            }

            DAL myDAL = new DAL();

            int userId = x;

            string username = myDAL.GetUserById(userId);
            name.Text = username;

            string Email = myDAL.GetEmailById(userId);
            email.Text = Email;

            string pnumber = myDAL.GetPhoneNumber(userId).ToString();
            phone.Text = pnumber;

            string t_projects = (myDAL.GetTotalJobsByUserID(userId) + myDAL.GetNonActiveJobsByUserID(userId)).ToString();
            totalProjects.Text = t_projects;

            string c_projects = myDAL.GetJobsDoneByUserID(userId).ToString();
            completedProjects.Text = c_projects;
            
            string T_spends = myDAL.GetTotalSpendings(userId).ToString();
            totalSpendings.Text = T_spends;

            string A_projects = myDAL.GetActiveJobsByUserID(userId).ToString();
            activeProjects.Text = A_projects;

            string Rating = myDAL.GetUserRating(userId).ToString();
            feedbackReceived.Text = Rating;

            string Non_A_jobs = myDAL.GetNonActiveJobsByUserID(userId).ToString();
            activeProjectPosts.Text = Non_A_jobs;

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
    }
}