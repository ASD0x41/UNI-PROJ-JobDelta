using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Namespaces for Data Access:
using System.Data;
using System.Data.SqlClient;

using System.Xml.Linq;
using Newtonsoft.Json.Linq;
using static System.Net.Mime.MediaTypeNames;
using System.Globalization;
using WebGrease.Css.Ast.Selectors;
using System.Security.Cryptography;

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



        public string RecoverPword(string uname, string email)
        {
            int retval = -1;
            string pword = "";
			
			SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {
				cmd = new SqlCommand("RecoverPassword ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@_username", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@_emailadd", SqlDbType.VarChar, 50);

                cmd.Parameters.Add("@_ret_val_", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@_password", SqlDbType.VarChar, 16).Direction = ParameterDirection.Output;


                cmd.Parameters["@_username"].Value = uname;
                cmd.Parameters["@_emailadd"].Value = email;

                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@_ret_val_"].Value);
                if (retval == 0)
                {
                    pword = Convert.ToString(cmd.Parameters["@_password"].Value);
                }
				
				
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
			
			            return pword;
        }




        public int RegisterNewJob(int ClientID,string JobTitle,string JobType,decimal JobValue,string JobDetail ,DateTime dueDate)
        {
            

            int retval = -1;

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {


 
                cmd = new SqlCommand("PostJob", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@clientID", SqlDbType.Int);
                cmd.Parameters.Add("@jobtitle", SqlDbType.VarChar, 32);
                cmd.Parameters.Add("@jobtype", SqlDbType.VarChar, 32);
                cmd.Parameters.Add("@jobvalue", SqlDbType.Int);
                cmd.Parameters.Add("@jobdetail", SqlDbType.Text);
                cmd.Parameters.Add("@duedate", SqlDbType.Date);

                cmd.Parameters.Add("@_ret_val_", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@clientID"].Value = ClientID;
                cmd.Parameters["@jobtitle"].Value = JobTitle;
                cmd.Parameters["@jobtype"].Value = JobType;
                cmd.Parameters["@jobvalue"].Value = JobValue;
                cmd.Parameters["@jobdetail"].Value = JobDetail;
                cmd.Parameters["@duedate"].Value = dueDate;

                cmd.ExecuteNonQuery();

                //retval = Convert.ToInt32(cmd.Parameters["@_ret_val_"].Value);

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

        public DataSet LoadavailJobTable() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(conString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SearchAvailJobs", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public (int, string, string, decimal, string, string, string) LoadJobDetailFreelancer(int jobID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            
            try
            {
                con.Open();
                cmd = new SqlCommand("ViewPostedJobs_F", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@jobID", jobID);

                // Define output parameters
                cmd.Parameters.Add("@jobTitle", SqlDbType.VarChar, 32).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@jobType", SqlDbType.VarChar, 32).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@jobValue", SqlDbType.Money).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@jobDetail", SqlDbType.NVarChar,1000).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@postDate", SqlDbType.Date).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@dueDate", SqlDbType.Date).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                // Retrieve output parameter values
                string jobTitle = cmd.Parameters["@jobTitle"].Value.ToString();
                string jobType = cmd.Parameters["@jobType"].Value.ToString();
                decimal jobValue = Convert.ToDecimal(cmd.Parameters["@jobValue"].Value);
                string jobDetail = cmd.Parameters["@jobDetail"].Value.ToString();
                string postDate = cmd.Parameters["@postDate"].Value.ToString();
                string dueDate = cmd.Parameters["@dueDate"].Value.ToString();

                // Convert date strings to DateTime objects
                
                postDate = ((DateTime)cmd.Parameters["@postDate"].Value).ToString("yyyy-MM-dd");
                dueDate = ((DateTime)cmd.Parameters["@dueDate"].Value).ToString("yyyy-MM-dd");

                // Return tuple with output parameter values
                return (jobID, jobTitle, jobType, jobValue, jobDetail, postDate, dueDate);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return (-1, "", "", -1, "", "", "");
            }
            finally
            {
                con.Close();
            }
        }
        public bool checkProposal(int jobID,int UID)
        {
            bool hasApplied = false;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;

            try
            {
                con.Open();
                cmd = new SqlCommand("CheckIfUserHasApplied", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@lancerID", SqlDbType.Int);
                cmd.Parameters.Add("@jobID", SqlDbType.Int);
                cmd.Parameters.Add("@return_val", SqlDbType.Int).Direction = ParameterDirection.Output;



                cmd.Parameters["@lancerID"].Value = UID;
                cmd.Parameters["@jobID"].Value = jobID;
           
                cmd.ExecuteScalar();
                int count = Convert.ToInt32(cmd.Parameters["@return_val"].Value);


                if (count > 0)
                {
                    hasApplied = true;
                }

               
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return hasApplied;
        }
        public int RegisterNewProposal(int lancerID,int jobID, string jobDetail)
        {


            int retval = -1;

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {

                cmd = new SqlCommand("submitProposal", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@lancerID", SqlDbType.Int);
                cmd.Parameters.Add("@jobID", SqlDbType.Int);
                cmd.Parameters.Add("@proposalDetail", SqlDbType.Text);
               

                cmd.Parameters["@lancerID"].Value = lancerID;
                cmd.Parameters["@jobID"].Value = jobID;
                cmd.Parameters["@proposalDetail"].Value = jobDetail;
                

                cmd.ExecuteNonQuery();

                //retval = Convert.ToInt32(cmd.Parameters["@_ret_val_"].Value);

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
        public (int,string,string,string) LoadProposalsFreelancer(int jobID, int lancerID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;

            try
            {
                con.Open();
                cmd = new SqlCommand("getProposal", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@jobID", jobID);
                cmd.Parameters.AddWithValue("@lancerID", lancerID);

                // Define output parameters
                cmd.Parameters.Add("@proposalID", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@proposaldetail", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@approvalstatus", SqlDbType.VarChar, 32).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@applydate", SqlDbType.Date).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                // Retrieve output parameter values
                int proposalID = Convert.ToInt32(cmd.Parameters["@proposalID"].Value);
                string proposalDetail = cmd.Parameters["@proposaldetail"].Value.ToString();
                string approvalStatus = cmd.Parameters["@approvalstatus"].Value.ToString();
                string applydate = cmd.Parameters["@applydate"].Value.ToString();

                applydate = ((DateTime)cmd.Parameters["@applydate"].Value).ToString("yyyy-MM-dd");

                // Return tuple with output parameter values
                return (proposalID, proposalDetail, approvalStatus,applydate);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return (-1, "", "", "");
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet LoadProposal(int jobID)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(conString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("getProposals", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@jobID", SqlDbType.Int);
                cmd.Parameters["@jobID"].Value = jobID;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }
        public int getFreelancer(int jobID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("getlancerID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;
            cmd.Parameters.Add("@lancerID", SqlDbType.Int).Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            int lancerID = 0;
            if (!Convert.IsDBNull(cmd.Parameters["@lancerID"].Value))
            {
                lancerID = Convert.ToInt32(cmd.Parameters["@lancerID"].Value);
            }


            return lancerID;
        }
        public int ifProposal(int jobID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("ifproposal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;
            cmd.Parameters.Add("@ret_val", SqlDbType.Int).Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            int ret_val = 0;
            if (!Convert.IsDBNull(cmd.Parameters["@ret_val"].Value))
            {
                ret_val = Convert.ToInt32(cmd.Parameters["@ret_val"].Value);
            }


            return ret_val;
        }

        public void SaveDeliverableExt(int jobID, string fileExtension)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("createExt", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@JobID", jobID);
                cmd.Parameters.AddWithValue("@extension", fileExtension);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public string GetDeliverableExt(int jobID)
        {
            string x = "";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("GetExtension", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@JobID", jobID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    if (reader["Ext"] != DBNull.Value)
                        x = (string)reader["Ext"];
                }
            }
            return x;
        }

        public void markProposal(int proposalID, int jobID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("markproposal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@proposalID", SqlDbType.Int);
            cmd.Parameters["@proposalID"].Value = proposalID;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;

            cmd.ExecuteNonQuery();

        }
        public DataSet LoadClientJobTable(int ClientID) //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(conString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("ViewPostedJobs", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@clientID", SqlDbType.Int);
                cmd.Parameters["@clientID"].Value = ClientID;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }
        
        public void SaveDeliverable(int jobID, byte[] filedata)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("UploadDeliverable", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@deliverable", SqlDbType.VarBinary,-1);
            cmd.Parameters["@deliverable"].Value = filedata;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;

            cmd.ExecuteNonQuery();
        }

        public byte[] GetDeliverable(int jobID)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("getDeliverable", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;
            cmd.Parameters.Add("@ret_val", SqlDbType.VarBinary, -1).Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            byte[] ret_val = (byte[])cmd.Parameters["@ret_val"].Value;

            return ret_val;
        }
        public string getStatus(int jobID)
        {

            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            con.Open();
            cmd = new SqlCommand("getstatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@jobID", SqlDbType.Int);
            cmd.Parameters["@jobID"].Value = jobID;
            cmd.Parameters.Add("@ret_val", SqlDbType.Char,1).Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            string ret_val = Convert.ToString(cmd.Parameters["@ret_val"].Value);


            return ret_val;
        }
        public bool existFreelancer(int lancerID)
        {
            bool hasApplied = false;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;

            try
            {
                con.Open();
                cmd = new SqlCommand("checklancer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@lancerID", SqlDbType.Int);
            
                cmd.Parameters.Add("@ret_val", SqlDbType.Int).Direction = ParameterDirection.Output;



                cmd.Parameters["@lancerID"].Value = lancerID;
                

                cmd.ExecuteScalar();
                int count = Convert.ToInt32(cmd.Parameters["@ret_val"].Value);


                if (count > 0)
                {
                    hasApplied = true;
                }


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return hasApplied;
        }
        public DataSet LoadongoingJobTable(int lancerID)
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(conString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("ViewOngoingJobs", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                cmd.Parameters.Add("@lancerID", SqlDbType.Int);
                cmd.Parameters["@lancerID"].Value = lancerID;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
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
        public Tuple<int, int, int> LoginUser(string uname, string pword)
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

        public string GetUserById(int userId)
        {
            string username = "";

            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    username = reader["username"].ToString();
                }

                reader.Close();
            }

            return username;
        }


        public string GetFullnameById(int userId)
        {
            string F_name = "";

            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserFullName", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    F_name = reader["fullname"].ToString();
                }

                reader.Close();
            }

            return F_name;
        }

        public string GetEmailById(int userId)
        {
            string emailAddress = "";

            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetEmail_ID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    emailAddress = reader["emailaddress"].ToString();
                }

                reader.Close();
            }

            return emailAddress;
        }

        public int GetUserRating(int userID)
        {
            int rating = 0;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("GetUserRating", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userID", userID);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        rating = Convert.ToInt32(reader["rating"]);
                    }
                    reader.Close();
                }
            }
            return rating;
        }

        public int GetTotalJobsByUserID(int userID)
        {
            int totalJobs = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetTotalJobsByUserID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        totalJobs = Convert.ToInt32(reader["totaljobs"]);
                    }
                }
                reader.Close();
            }
            return totalJobs;
        }

        public int GetJobsDoneByUserID(int userID)
        {
            int JobsDone = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetJobsDoneByUserID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        JobsDone = Convert.ToInt32(reader["jobsdone"]);
                    }
                }
                reader.Close();
            }
            return JobsDone;
        }

        public int GetActiveJobsByUserID(int userID)
        {
            int JobsActive = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetJobsOnGoingByUserID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        JobsActive = Convert.ToInt32(reader["jobsongoing"]);
                    }
                }
                reader.Close();
            }
            return JobsActive;
        }

        public int GetNonActiveJobsByUserID(int userID)
        {
            int JobsNotActive = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetJobsNotDoneByUserID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        JobsNotActive = Convert.ToInt32(reader["jobsnotdone"]);
                    }
                }
                reader.Close();
            }
            return JobsNotActive;
        }
        public int GetTotalEarnings(int userID)
        {
            int T_Earnings = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetTotalEarnings", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        T_Earnings = Convert.ToInt32(reader["TotalAmountReceived"]);
                    }
                }
                reader.Close();
            }
            return T_Earnings;
        }

        public string GetPhoneNumber(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetPhoneNumber ", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["phonenumber"].ToString();
                    }
                }
                reader.Close();
            }
            return x;  
        }

        public int GetTotalSpendings(int userID)
        {
            int T_Spendings = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetTotalSpendings", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        T_Spendings = Convert.ToInt32(reader["TotalAmountReceived"]);
                    }
                }
                reader.Close();
            }
            return T_Spendings;
        }

        public string GetUserBirthdateById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserBirthdateById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["birthdate"].ToString();
                    }
                }
                reader.Close();
            }
            return x;
        }

        public string GetUserGenderById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserGenderById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["gender"].ToString();
                        if(x == "M")
                        {
                            x = "Male";
                        }
                        else if (x == "F")
                        {
                            x = "Female";
                        }
                        else
                        {
                            x = "Others";
                        }
                    }
                }
                reader.Close();
            }
            return x;
        }

        public string GetUserWorkAddressById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserWorkAddressById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["workaddress"].ToString();
                    }
                }
                reader.Close();
            }
            return x;
        }

        public string GetUserCNICById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserCNICById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["CNIC"].ToString();
                    }
                }
                reader.Close();
            }
            return x;
        }

        public string GetUserAboutById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserAboutById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["aboutuser"].ToString();
                    }
                }
                reader.Close();
            }
            return x;
        }

        public string GetUserBankAccountById(int userID)
        {
            string x = "";
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserBankAccountById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = reader["bankaccount"].ToString();
                    }
                }
                reader.Close();
            }
            return x;
        }

        public int GetUserWalletMoneyById(int userID)
        {
            int x = 0;
            using (SqlConnection connection = new SqlConnection(conString))
            {
                SqlCommand command = new SqlCommand("GetUserWalletMoneyById", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = Convert.ToInt32(reader["walletmoney"]);
                    }
                }
                reader.Close();
            }
            return x;
        }

        public void UpdateUserFullNameById(int userID, string fullname)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserFullNameById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@fullname", fullname);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateCNICById(int userID, string fullname)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateCNICById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@CNIC", fullname);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateUserNameById(int userID, string fullname)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserNameById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@Uname", fullname);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateUserPhoneNumberById(int userID, string phoneNo)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserPhoneNumberById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@phonenumber", phoneNo);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateUserEmailAddressById(int userID, string email)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserEmailAddressById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@emailaddress", email);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateUserAddressById(int userID, string address)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserWorkAddressById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    
                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@workaddress", address);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateUserAboutById(int userID, string aboutUser)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserAboutById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@aboutuser", aboutUser);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateBankAccount(int userID, int B_account)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateUserBankAccountById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@userID", userID);
                    cmd.Parameters.AddWithValue("@bankaccount", B_account);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void CompleteProfile(int userId, string fullname, DateTime birthdate, char gender, string cnic, string aboutuser, string phoneNumber, string emailAddress, string workAddress, string bankAccount)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("UpdateUserInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@userId", userId);
                    command.Parameters.AddWithValue("@fullname", fullname);
                    command.Parameters.AddWithValue("@birthdate", birthdate);
                    command.Parameters.AddWithValue("@gender", gender);
                    command.Parameters.AddWithValue("@CNIC", cnic);
                    command.Parameters.AddWithValue("@aboutuser", aboutuser);
                    command.Parameters.AddWithValue("@phonenumber", phoneNumber);
                    command.Parameters.AddWithValue("@emailaddress", emailAddress);
                    command.Parameters.AddWithValue("@workaddress", workAddress);
                    command.Parameters.AddWithValue("@bankaccount", bankAccount);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }
        }

        public void Withdraw(int userId, int amount)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("Withdraw", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@userId", userId);
                    command.Parameters.AddWithValue("@amount", amount);

                        connection.Open();
                        command.ExecuteNonQuery();
                }
            }
        }

        public void Deposite(int userId, int amount)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("Deposite", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@userId", userId);
                    command.Parameters.AddWithValue("@amount", amount);

                        connection.Open();
                        command.ExecuteNonQuery();
             
                }
            }
        }

        public int GetTotalWithdraws(int userId)
        {
            int totalWithdraws = 0;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("GetTotalWithdraws", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", userId);
                    conn.Open();
                    totalWithdraws = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return totalWithdraws;
        }

        public int GetTotalDeposits(int userId)
        {
            int totalDeposits = 0;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("GetTotalDeposites", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", userId);
                    conn.Open();
                    totalDeposits = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return totalDeposits;
        }

        public DataTable GetTransactionsForUser(int userId)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayTransactionInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", userId);
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public void AddImage(int userId, byte[] imageData)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("AddImage", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userID", userId);
                cmd.Parameters.AddWithValue("@ImageData", imageData);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public byte[] GetImageData(int userId)
        {
            byte[] imageData = null;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("GetImageData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", userId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    if (reader["picture"] != DBNull.Value)
                    imageData = (byte[])reader["picture"];
                }
            }
            return imageData;
        }

        public DataTable DisplayUsersInfo()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayUsersInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public DataTable DisplayJobInfo()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayJobInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public DataTable DisplayMoneyTransfersInfo()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayMoneyTransfersInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public DataTable DisplayProposalInfo()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayProposalInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public DataTable DisplayRequestInfo()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayRequestInfo", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public DataTable DisplayComplains()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("DisplayComplains", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }
            return dataTable;
        }

        public void PostComplaint(int jobID, int sentBy, string details)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "PostComplaint";

                    command.Parameters.AddWithValue("@jobID", jobID);
                    command.Parameters.AddWithValue("@sentby", sentBy);
                    command.Parameters.AddWithValue("@details", details);

                    command.ExecuteNonQuery();
                }
            }
        }


        public void HandleComplaintAccept(int complaintID)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("HandleComplaint_Accept", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@complaintid", complaintID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public void HandleComplaintReject(int complaintID)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("HandleComplaint_Reject", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@complaintid", complaintID);
                    command.ExecuteNonQuery();
                }
            }
        }


        public void ChangePassword(int UserID,string newpassword)
        {
            using (SqlConnection connection = new SqlConnection(conString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("ChangePassword", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@userID", UserID);
                    command.Parameters.AddWithValue("@newpassword", newpassword);
                    command.ExecuteNonQuery();
                }
            }
        }

        public string getPassword(int userId)
        {
           string pass = "";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("getPassword", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userID", userId);
                    conn.Open();
                    pass = (cmd.ExecuteScalar()).ToString();
                }
            }
            return pass;
        }

        public bool CheckUserIDExists(int userID)
        {
            bool exists = false;

            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand("CheckUserIDExists", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
                    command.Parameters.Add("@exists", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    connection.Open();
                    command.ExecuteNonQuery();

                    exists = Convert.ToBoolean(command.Parameters["@exists"].Value);
                }
            }

            return exists;
        }


    ///////////////////////////////////////////////////////////////////
    //Feedback_Input
    public int Feedback_Input(int sent, string uname, string uemail, string details, string rate, string uimprove, string ucomplain, string usuggestion)
        {

            int retval = -1;

            SqlConnection con = new SqlConnection(conString);
            con.Open();

            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Feedback_store", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@sentID", SqlDbType.Int);
                cmd.Parameters.Add("@Username", SqlDbType.VarChar, 25);
                cmd.Parameters.Add("@usemail", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@feedbck", SqlDbType.VarChar, 250);
                cmd.Parameters.Add("@urating", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@improvement", SqlDbType.VarChar, 250);
                cmd.Parameters.Add("@comp", SqlDbType.VarChar, 250);
                cmd.Parameters.Add("@sugges", SqlDbType.VarChar, 250);

                cmd.Parameters.Add("@_ret_val_", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@sentID"].Value = sent;
                cmd.Parameters["@Username"].Value = uname;
                cmd.Parameters["@usemail"].Value = uemail;
                cmd.Parameters["@feedbck"].Value = details;
                cmd.Parameters["@urating"].Value = rate;
                cmd.Parameters["@improvement"].Value = uimprove;
                cmd.Parameters["@comp"].Value = ucomplain;
                cmd.Parameters["@sugges"].Value = usuggestion;


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
    }
}
