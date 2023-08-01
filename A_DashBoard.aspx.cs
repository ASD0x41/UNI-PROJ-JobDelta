using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobDelta.Data_Access_Layer;
using System.Net;
using System.Security.Policy;

namespace JobDelta
{
    public partial class A_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

			if ((int)Application["curUserType"] < 0)
                Response.Redirect("Homepage.aspx");
            else if ((int)Application["curUserType"] == 1)
                Response.Redirect("F_DashBoard.aspx");
			else if ((int)Application["curUserType"] == 2)
                Response.Redirect("C_DashBoard.aspx");


            DAL myDAL = new DAL();
            Commission.Text = myDAL.GetUserWalletMoneyById(1).ToString();
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

        protected void AcceptButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                int complaintID;
                if (int.TryParse(e.CommandArgument?.ToString(), out complaintID))
                {
                    DAL myDAL = new DAL();
                    myDAL.HandleComplaintAccept(complaintID);
                    Response.Redirect("A_DashBoard.aspx");
                }
                else
                {
                    // Invalid or null complaintID
                }
            }
        }

        protected void RejectButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Reject")
            {
                int complaintID;
                if (int.TryParse(e.CommandArgument?.ToString(), out complaintID))
                {
                    DAL myDAL = new DAL();
                    myDAL.HandleComplaintReject(complaintID);
                    Response.Redirect("A_DashBoard.aspx");
                }
                else
                {
                    // Invalid or null complaintID
                }
            }
        }


        protected bool IsStatusHidden(object status)
        {
            string complaintStatus = status.ToString();
            return complaintStatus.Equals("H", StringComparison.OrdinalIgnoreCase) ||
                   complaintStatus.Equals("R", StringComparison.OrdinalIgnoreCase);
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(U_Id.Text);
            DAL myDAL = new DAL();
            string cnic = CNIC.Text;
            string email = Email.Text;
            string userName = UserName.Text;

            if (myDAL.CheckUserIDExists(userID))
            {
                if (cnic != "")
                    myDAL.UpdateCNICById(userID, cnic);

                if (userName != "")
                    myDAL.UpdateUserNameById(userID, userName);

                if (email != "")
                    myDAL.UpdateUserEmailAddressById(userID, email);

            }

            else
            {

            }

            Response.Redirect("A_DashBoard.aspx");

        }

      

    }
}