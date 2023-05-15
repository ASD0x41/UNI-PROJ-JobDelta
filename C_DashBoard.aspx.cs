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
            if ((int)Application["curUserType"] <= 0)
                Response.Redirect("Homepage.aspx");
            else if ((int)Application["curUserType"] == 1)
                Response.Redirect("F_DashBoard.aspx");


            int x = (int)Application["currentUser"];

            if (!IsPostBack)
            {
                // Load job postings data and bind it to the GridView
                LoadJobPostingsData();
                //DataTable jobPostings = LoadJobPostingsData();
                //PostingGridView.DataSource = jobPostings;
                //PostingGridView.DataBind();
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
            
            if (e.CommandName=="Select")
            {
                int jobID = Convert.ToInt32(PostingGridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                Session["SelectedJobID"] = jobID;
                Response.Redirect("JobDetail_C.aspx");
            }
        }

        protected void BtnJobPost_Click(object sender, EventArgs e)
        {
            DAL myDAL = new DAL();
            int check = 0;
            int ClientID = (int)Application["currentUser"]; 
            string JobTitle = jobTitle.Text;
            string JobType = jobCategory.SelectedValue ;
            decimal JobValue = decimal.Parse(jobBudget.Text);
            string JobDetail = jobdesc.Text;
            DateTime dueDate = (DateTime.Parse(jobDueDate.Text));

            if(myDAL.GetUserWalletMoneyById(ClientID) < JobValue)
            {
                ERROR.Text = "insufficient funds for this Job";
                check = 1;
            }

            if (check == 0)
            {      
                int retval = myDAL.RegisterNewJob(ClientID, JobTitle, JobType, JobValue, JobDetail, dueDate);
                Response.Redirect("C_DashBoard.aspx");
            }

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