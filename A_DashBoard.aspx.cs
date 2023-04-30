using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class A_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable userData = LoadUserData();
                UserGridView.DataSource = userData;
                UserGridView.DataBind();

                DataTable jobData = LoadJobData();
                JobsGridView.DataSource = jobData;
                JobsGridView.DataBind();

                // Load job postings data and bind it to the GridView
                DataTable jobPostings = LoadIssueData();
                IssueGridView.DataSource = jobPostings;
                IssueGridView.DataBind();

                DataTable jobPostings2 = LoadFeedbackData();
                FeebackGridView.DataSource = jobPostings2;
                FeebackGridView.DataBind();

                DataTable transferData = LoadTransferData();
                TransGridView.DataSource = transferData;
                TransGridView.DataBind();
            }
        }

        private DataTable LoadJobData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable userData = new DataTable();
            userData.Columns.Add("jobID", typeof(int));
            userData.Columns.Add("clientID", typeof(int));
            userData.Columns.Add("jobtitle", typeof(string));
            userData.Columns.Add("lancerID", typeof(int));
            userData.Columns.Add("jobstatus", typeof(string));



            userData.Rows.Add(1,5, "AI Api Develop",1, "Complete");
            userData.Rows.Add(2,5, "Mathematical Expert Needed",2, "Complete");
            userData.Rows.Add(3,9, "Need Mukbang expert",4, "Ongoing");
          

            return userData;
        }
        private DataTable LoadUserData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable userData = new DataTable();
            userData.Columns.Add("UserID", typeof(int));
            userData.Columns.Add("UserName", typeof(string));
            userData.Columns.Add("UserType", typeof(string));
            userData.Columns.Add("UserGender", typeof(string));
            userData.Columns.Add("UserEmail", typeof(string));



            userData.Rows.Add(1,"Mehdy", "Freelancer", "Male" , "mehdy922@gmail.com");
            userData.Rows.Add(2, "Asad", "Freelancer", "Male", "asd@gmail.com");
            userData.Rows.Add(3, "Sultan", "Freelancer", "Male", "sultan@gmail.com");
            userData.Rows.Add(4, "Umair", "Freelancer", "Male", "umair@gmail.com");

            return userData;
        }
        private DataTable LoadIssueData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable jobPostings = new DataTable();
            jobPostings.Columns.Add("Type", typeof(string));
            jobPostings.Columns.Add("ID", typeof(int));
            jobPostings.Columns.Add("Description", typeof(string));
            jobPostings.Columns.Add("Date", typeof(SqlDateTime));
            jobPostings.Columns.Add("Status", typeof(string));

            DateTime requestDate = new DateTime(2022, 4, 1);

            jobPostings.Rows.Add("Client", 1, "Job was not done properly", requestDate, "Pending");
            jobPostings.Rows.Add("Freelancer", 2, "Money transfer issues", requestDate, "Handeled");
            jobPostings.Rows.Add("Freelancer", 3, "Money not received", requestDate, "Refused");

            return jobPostings;
        }
        private DataTable LoadFeedbackData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable jobPostings = new DataTable();
            jobPostings.Columns.Add("Type", typeof(string));
            jobPostings.Columns.Add("ID", typeof(int));
            jobPostings.Columns.Add("Description", typeof(string));
            jobPostings.Columns.Add("Date", typeof(SqlDateTime));
            jobPostings.Columns.Add("Rating", typeof(int));

            DateTime requestDate = new DateTime(2022, 4, 1);

            jobPostings.Rows.Add("Client", 1, "Cool app", requestDate, 10);
            jobPostings.Rows.Add("Freelancer", 2, "Got my first work", requestDate, 10);
            jobPostings.Rows.Add("Freelancer", 3, "Really good work guys", requestDate, 8);

            return jobPostings;
        }

        private DataTable LoadTransferData()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DataTable userData = new DataTable();
            userData.Columns.Add("transferID", typeof(int));
            userData.Columns.Add("amount", typeof(SqlMoney));
            userData.Columns.Add("jobID", typeof(int));
            userData.Columns.Add("srcuser", typeof(int));
            userData.Columns.Add("dstuser", typeof(int));

            SqlMoney amount = new SqlMoney(10.5);

            userData.Rows.Add(1,amount , 1, 5 , 1);
            userData.Rows.Add(2,amount , 2, 5 , 2);
           

            return userData;
        }
    }
}