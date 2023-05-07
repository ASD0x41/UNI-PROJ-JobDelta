using JobDelta.Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class Wallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] == 0)
                Response.Redirect("Homepage.aspx");

            int userId = (int)Application["currentUser"];
            DAL myDAL = new DAL();
            int Total_Withdraws = myDAL.GetTotalWithdraws(userId);
            int Total_Deposites = myDAL.GetTotalDeposits(userId);
            int balance = myDAL.GetUserWalletMoneyById(userId);

            TotalWithdrawals.Text = Total_Withdraws.ToString();
            TotalDeposits.Text = Total_Deposites.ToString();
            Balance.Text = balance.ToString();
            NameLabel.Text = myDAL.GetFullnameById(userId).ToString();
            BankAccLabel.Text = myDAL.GetUserBankAccountById(userId).ToString();

            DataTable dataTable = myDAL.GetTransactionsForUser(userId); 
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void WithdrawMoney(object sender, EventArgs e)
        {
            int amount = 0;
            if (amount_label.Text != "")
            {
                amount = Convert.ToInt32(amount_label.Text);
            }
            int userId = (int)Application["currentUser"];
            DAL myDAL = new DAL();
            int t_amount = myDAL.GetUserWalletMoneyById(userId);
            if (t_amount >= amount && amount > 0)
            {
                myDAL.Withdraw(userId, amount);
                Response.Redirect("Wallet.aspx");
            }
           else
           {
                if (amount > 0)
                {
                    string script2 = "insufficient_funds();";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), " insufficient_funds", script2, true);
                }
           }
        }

        protected void DepositMoney(object sender, EventArgs e)
        {
            int userId = (int)Application["currentUser"];
            DAL myDAL = new DAL();
            int amount = Convert.ToInt32(amount_label.Text);
            myDAL.Deposite(userId, amount);
            Response.Redirect("Wallet.aspx");
        }

        protected void ChangeBankAccount(object sender, EventArgs e)
        {
            int userId = (int)Application["currentUser"];
            DAL myDAL = new DAL();
            int a = Convert.ToInt32(C_BA.Text);
            myDAL.UpdateBankAccount(userId, a);
            Response.Redirect("Wallet.aspx");
        }


    }
}