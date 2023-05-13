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
    public partial class F_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] <= 0)
                Response.Redirect("Homepage.aspx");
            else if ((int)Application["curUserType"] == 2)
                Response.Redirect("C_DashBoard.aspx");

            int x = (int)Application["currentUser"];
            /*
            if (!IsPostBack)
            {
                DataTable JobPost = LoadJobPostData();
                PostGridView.DataSource = JobPost;
                PostGridView.DataBind();


                DataTable jobPostings = LoadJobPostingsData();
                PostingGridView.DataSource = jobPostings;
                PostingGridView.DataBind();
            }
            */
            DAL myDAL = new DAL();

             int userId = x;

            loadongoingjobs();
            loadavailJobs();

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
            if(e.CommandName == "Select1")
            {
                int jobID = Convert.ToInt32(PostingGridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                Session["SelectedJobID"] = jobID;
                Response.Redirect("JobDetail_F.aspx");
            }
        }
        protected void PostGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select" )
            {
                int jobID = Convert.ToInt32(PostGridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                Session["SelectedJobID"] = jobID;
                Response.Redirect("JobDetail_F.aspx");
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



        protected void loadavailJobs()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DAL myDAL = new DAL();
            PostGridView.DataSource = myDAL.LoadavailJobTable();
            PostGridView.DataBind();

        }
        protected void loadongoingjobs()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            int lancerID = (int)Application["currentUser"];

            DAL myDAL = new DAL();
            if (myDAL.existFreelancer(lancerID))
            {
                PostingGridView.DataSource = myDAL.LoadongoingJobTable(lancerID);
                PostingGridView.DataBind();
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

        }


        

        protected void BtnHidden_Click(object sender, EventArgs e)
        {

            string email = Request.Form["emailadd"];
            /*string uname = Request.Form["uname"];



            DAL myDAL = new DAL();
            string pword = myDAL.RecoverPword(uname, email);

            if (pword == "")
            {
                string script2 = "invalidforgotpword();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "invalidforgotpword", script2, true);

            }
            else
            {
                string script2 = "pwordrecovered();";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pwordrecovered", script2, true);

            }*/

        }

    }
}