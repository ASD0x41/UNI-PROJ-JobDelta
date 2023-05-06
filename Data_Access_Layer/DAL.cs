﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Namespaces for Data Access:
using System.Data;
using System.Data.SqlClient;
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

        public int RegisterNewJob(int ClientID,string JobTitle,string JobType,decimal JobValue,string JobDetail ,string dueDate)
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