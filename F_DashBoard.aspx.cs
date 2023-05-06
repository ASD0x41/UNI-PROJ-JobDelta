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
            if (!IsPostBack)
            {

                loadavailJobs();
            }
        }

        protected void PostGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int jobID = Convert.ToInt32(PostGridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                Session["SelectedJobID"] = jobID;
                Response.Redirect("JobDetail_F.aspx");
            }
        }


        protected void loadavailJobs()
        {
            // You can load data from a database or other data source here
            // For example, you can create a DataTable and add rows to it
            DAL myDAL = new DAL();
            PostGridView.DataSource = myDAL.LoadavailJobTable();
            PostGridView.DataBind();

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