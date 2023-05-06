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
    public partial class JobDetail_F : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
    }
}