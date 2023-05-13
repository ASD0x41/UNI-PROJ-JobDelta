using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobDelta.Data_Access_Layer;

namespace JobDelta
{
    public partial class A_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL myDAL = new DAL();
            DataTable dataTable = myDAL.DisplayUsersInfo();
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
            dataTable = myDAL.DisplayJobInfo();
            GridView2.DataSource = dataTable;
            GridView2.DataBind();
            dataTable = myDAL.DisplayRequestInfo();
            GridView3.DataSource = dataTable;
            GridView3.DataBind();
            dataTable = myDAL.DisplayProposalInfo();
            GridView4.DataSource = dataTable;
            GridView4.DataBind(); 
            dataTable = myDAL.DisplayMoneyTransfersInfo();
            GridView5.DataSource = dataTable;
            GridView5.DataBind();
            dataTable = myDAL.DisplayComplains();
            GridView6.DataSource = dataTable;
            GridView6.DataBind();
        }

    }
}