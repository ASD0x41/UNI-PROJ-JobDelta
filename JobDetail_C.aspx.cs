using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace JobDelta
{
    public partial class JobDetail_C : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] <= 0)
                Response.Redirect("Homepage.aspx");


            int jobID = (int)Session["SelectedJobID"];

            propl.Visible = false;
            btnDownloadDeliverable.Visible = false;
            DAL myDAL = new DAL();
            var jobDetail = myDAL.LoadJobDetailFreelancer(jobID);
            int lancerID = myDAL.getFreelancer(jobID);
            int prop = myDAL.ifProposal(jobID);

            jobIDT.Text = jobDetail.Item1.ToString();
            jobTitle.Text = jobDetail.Item2;
            jobType.Text = jobDetail.Item3;
            jobValue.Text = jobDetail.Item4.ToString();
            jobdesc.Text = jobDetail.Item5;
            postdate.Text = jobDetail.Item6;
            duedate.Text = jobDetail.Item7;
            if (lancerID != 0)
            {
                propl.Visible = false;
                ProposalGridView.Visible = false;
                lancerWorking.Visible = true;
                lancerWorkingl.Visible = true;
                btnDownloadDeliverable.Visible = false;
                lancerWorking.Text = lancerID.ToString();
            }
            else if(prop > 0)
            {
                lancerWorking.Visible = false;
                lancerWorkingl.Visible = false;
                propl.Visible = true;
                ProposalGridView.Visible = true;
                btnDownloadDeliverable.Visible = false;
                ProposalGridView.DataSource = myDAL.LoadProposal(jobID);
                ProposalGridView.DataBind();
            }
            else
            {
                btnDownloadDeliverable.Visible = false;
                propl.Visible = false;
                ProposalGridView.Visible= false;
                lancerWorking.Visible = false;
                lancerWorkingl.Visible = false;
            }

            string getStatus = myDAL.getStatus(jobID);
            if (getStatus == "D")
            {
                propl.Visible = false;
                ProposalGridView.Visible = false;
                lancerWorking.Visible = true;
                lancerWorkingl.Visible = true;
                btnDownloadDeliverable.Visible = true;
            }
            else
            {
                btnDownloadDeliverable.Visible = false;
            }
        }
        protected void ProposalGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                int proposalID = Convert.ToInt32(ProposalGridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                Session["SelectedproposalID"] = proposalID;
                DAL myDAL = new DAL();
                myDAL.markProposal(proposalID, (int)Session["SelectedJobID"]);
                Response.Redirect("C_DashBoard.aspx");
            }
        }
        protected void btnDownloadDeliverable_Click(object sender, EventArgs e)
        {
            int jobID = (int)Session["SelectedJobID"];
            DAL myDAL = new DAL();
            byte[] fileBytes = myDAL.GetDeliverable(jobID);

            if (fileBytes != null && fileBytes.Length > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=deliverable.zip");
                Response.BinaryWrite(fileBytes);
                Response.End();
            }
        }


    }
}