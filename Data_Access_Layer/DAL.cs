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
    }
}