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
           
                loadongoingjobs();
                loadavailJobs();
            
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


        

    }
}