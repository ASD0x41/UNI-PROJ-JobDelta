using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Namespaces for Data Access:
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

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



    }
}
