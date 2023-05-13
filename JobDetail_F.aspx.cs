using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace JobDelta
{
    public partial class JobDetail_F : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] <= 0)
                Response.Redirect("Homepage.aspx");

            int jobID = (int)Session["SelectedJobID"];

            DAL myDAL = new DAL();
            var jobDetail = myDAL.LoadJobDetailFreelancer(jobID);


            jobIDT.Text = jobDetail.Item1.ToString();
            jobTitle.Text = jobDetail.Item2;
            jobType.Text = jobDetail.Item3;
            jobValue.Text = jobDetail.Item4.ToString();
            jobdesc.Text = jobDetail.Item5;
            postdate.Text = jobDetail.Item6;
            duedate.Text = jobDetail.Item7;

            /////////////////////////////////////////////////////////////

            int currentUserID = (int)Application["currentUser"];

            bool hasApplied = CheckIfUserHasApplied(jobID, currentUserID);

            if (hasApplied)
            {
                proposal.Enabled = false;
                proposal.Visible = false;
                spropose.Enabled = false;
                spropose.Visible = false;
                wproposal.Enabled = false;
                wproposal.Visible = false;
                btnDownloadDeliverable.Visible = false;

                PID.Visible = true;
                lPID.Visible = true;
                lpdesc.Visible = true;
                pdesc.Visible = true;
                status.Visible = true;
                lstatus.Visible = true;
                date.Visible = true;
                ldate.Visible = true;

                var proposalDetails = myDAL.LoadProposalsFreelancer(jobID, currentUserID);
                PID.Text = proposalDetails.Item1.ToString();
                pdesc.Text = proposalDetails.Item2;

                date.Text = proposalDetails.Item4;
                string statusText = "";
                switch (proposalDetails.Item3)
                {
                    case "A":
                        statusText = "Approved";
                        break;
                    case "R":
                        statusText = "Rejected";
                        break;
                    case "P":
                        statusText = "Pending";
                        break;
                    case "W":
                        statusText = "Withdrawn";
                        break;
                    default:
                        statusText = "Unknown";
                        break;
                }
                status.Text = statusText;

            }
            else
            {
                proposal.Enabled = true;
                proposal.Visible = true;
                spropose.Enabled = true;
                spropose.Visible = true;
                wproposal.Enabled = true;
                wproposal.Visible = true;

                PID.Visible = false;
                lPID.Visible = false;
                lpdesc.Visible = false;
                pdesc.Visible = false;
                status.Visible = false;
                lstatus.Visible = false;
                date.Visible = false;
                ldate.Visible = false;
                btnDownloadDeliverable.Visible = false;
            }


            string getStatus = myDAL.getStatus(jobID);
            if (getStatus == "O")
            {
                deliverablel.Visible = true;
                deliverableFileUpload.Visible = true;
                deliverableFileUpload.Enabled = true;
                markCompletedButton.Visible = true;
                markCompletedButton.Enabled = true;
                btnDownloadDeliverable.Visible = false;


            }
            if (getStatus == "D")
            {
                deliverablel.Visible = false;
                deliverableFileUpload.Visible = false;
                markCompletedButton.Visible = false;
                markCompletedButton.Enabled = false;
                deliverableFileUpload.Enabled = false;
                btnDownloadDeliverable.Visible = true;








            }
            // disable form if user has already applied



        }
        protected bool CheckIfUserHasApplied(int jobID, int freelancerID)
        {
            DAL dAL = new DAL();
            return dAL.checkProposal(jobID, freelancerID);
        }
        protected void SubmitProposal(object sender, EventArgs e)
        {
            int lancerID = (int)Application["currentUser"];
            int jobID = (int)Session["SelectedJobID"];
            string JobDetail = proposal.Text;

            DAL myDAL = new DAL();
            int retval = myDAL.RegisterNewProposal(lancerID, jobID, JobDetail);
            Response.Redirect("F_DashBoard.aspx");

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


        protected void markCompletedButton_Click(object sender, EventArgs e)
        {
            // Get the job ID from the query string or session variable

            int jobID = (int)Session["SelectedJobID"];

            string fileExtension = Path.GetExtension(deliverableFileUpload.FileName);

            // Save the file extension to the database
            DAL myDAL = new DAL();
            myDAL.SaveDeliverableExt(jobID, fileExtension);

            // Check if the file was uploaded

            // Save the file to a byte array
            byte[] fileBytes = new byte[deliverableFileUpload.PostedFile.ContentLength];
            deliverableFileUpload.PostedFile.InputStream.Read(fileBytes, 0, deliverableFileUpload.PostedFile.ContentLength);

            // Save the file to the database as a binary data (varbinary(max) type)
            
            myDAL.SaveDeliverable(jobID, fileBytes);

            // Update the job status to "Done"


            // Redirect to the job details page
            Response.Redirect("F_DashBoard.aspx");

            // Show an error message if no file was uploaded


        }

        protected void btnDownloadDeliverable_Click(object sender, EventArgs e)
        {
            int jobID = (int)Session["SelectedJobID"];
            DAL myDAL = new DAL();
            byte[] fileBytes = myDAL.GetDeliverable(jobID);
            string fileExtension = myDAL.GetDeliverableExt(jobID);
            if (fileBytes != null && fileBytes.Length > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=deliverable"+ fileExtension);
                Response.BinaryWrite(fileBytes);
                Response.End();
            }
        }

        protected void PostComplaint(object sender, EventArgs e)
        {
            int jobID = (int)Session["SelectedJobID"];
            int sentBy = (int)Application["currentUser"];
            string details = txtDetails.Text;
            DAL myDAL = new DAL();
            myDAL.PostComplaint(jobID, sentBy, details);
            txtDetails.Text = "";
        }
    }
}