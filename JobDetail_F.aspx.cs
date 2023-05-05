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
    public partial class JobDetail_F : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
            }
        }

    }
}