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
                // Load job postings data and bind it to the GridView
                DataTable jobPostings = LoadIssueData();
                IssueGridView.DataSource = jobPostings;
                IssueGridView.DataBind();

                DataTable jobPostings2 = LoadFeedbackData();
                FeebackGridView.DataSource = jobPostings2;
                FeebackGridView.DataBind();
            }
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
    }
}