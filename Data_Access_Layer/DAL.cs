using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Namespaces for Data Access:
using System.Data;
using System.Data.SqlClient;

namespace JobDelta.Data_Access_Layer
{
    public class DAL
    {
        // Connection String for Use in Functions:
        private static readonly string conString = System.Configuration.ConfigurationManager.ConnectionStrings["JobDeltaDB"].ConnectionString;

        // Test Function:
        public DataSet TestFunction()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SELECT * FROM TestTable1", con);
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error: " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }

        public int RegisterNewUser(string uname, string email, string pword, string utype)
        {
            int atype = -1;
            if (utype == "client")
                atype = 2;
            else if (utype == "freelancer")
                atype = 1;

            int retval = -1;

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignUp ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@_username", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@_password", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@_emailadd", SqlDbType.VarChar, 32);
                cmd.Parameters.Add("@_usertype", SqlDbType.Int);

                cmd.Parameters.Add("@_ret_val_", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@_username"].Value = uname;
                cmd.Parameters["@_password"].Value = pword;
                cmd.Parameters["@_emailadd"].Value = email;
                cmd.Parameters["@_usertype"].Value = atype;

                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@_ret_val_"].Value);

                con.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return retval;
        }
        public Tuple<int,int,int> LoginUser(string uname, string pword)
        {
            int retval = -1, userID = -1, utype = -1;
            Tuple<int, int, int> logindetails;

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignIn ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@_username", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@_password", SqlDbType.VarChar, 16);

                cmd.Parameters.Add("@_ret_val_", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@_user_ID_", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@_usertype", SqlDbType.Int).Direction = ParameterDirection.Output;


                cmd.Parameters["@_username"].Value = uname;
                cmd.Parameters["@_password"].Value = pword;

                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@_ret_val_"].Value);
                if (retval == 0)
                {
                    userID = Convert.ToInt32(cmd.Parameters["@_user_ID_"].Value);
                    utype = Convert.ToInt32(cmd.Parameters["@_usertype"].Value);
                }

                logindetails = new Tuple<int, int, int>(retval, userID, utype);

                con.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                logindetails = new Tuple<int, int, int>(retval, userID, utype);
            }
            finally
            {
                con.Close();
            }

            return logindetails;
        }
    }
}