using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;


namespace Visy.Middleware.Administration.Data
{
    [Serializable()]
   
    public class DataLookupHelper
    {
       


        public static DataTable GetPDFOrders()
        {

            #region call pbiz_lookup_data proc to determine routes

            var output = new DataTable();
            output.Columns.Add("ID", typeof(Int32));
            output.Columns.Add("From_Email");
            output.Columns.Add("Customer_Code");
            output.Columns.Add("Customer_Name");
            output.Columns.Add("Unit_Price_Factor");
            output.Columns.Add("Customer_EAN");
            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();                
            }
            catch (Exception ex_conn)
            {
                connectionString = "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true";
                throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("p_pdf_orders_get", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;                   
                    //this is the most important part:                   
                    var reader = comm.ExecuteReader(); //or NonQuery, etc.
                 
                    while (reader.Read())
                    {

                        output.Rows.Add(Convert.ToInt32(reader["pk"]), reader["from_email"].ToString()
                            , reader["customer_code"].ToString()
                            , reader["customer_name"].ToString()
                            , reader["unit_price_factor"].ToString()
                            , reader["customer_ean"].ToString());
                      
                    }                   
                }
            }

            #endregion

            return output;
        }

        public static void SavePDFOrders(string id, string from_email, string customer_code, string customer_name, string unit_price_factor, string customer_ean, string user)
        {

            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();
            }
            catch (Exception ex_conn)
            {
                connectionString = "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true";
                throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("p_pdf_orders_save", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.Parameters.AddWithValue("@id", id);
                    comm.Parameters.AddWithValue("@customer_email", from_email);
                    comm.Parameters.AddWithValue("@customer_code", customer_code);
                    comm.Parameters.AddWithValue("@customer_name", customer_name);
                    comm.Parameters.AddWithValue("@unit_price_factor", unit_price_factor);
                    comm.Parameters.AddWithValue("@customer_ean", customer_ean);
                    comm.Parameters.AddWithValue("@user_name", user);
                    //this is the most important part:                   
                    comm.ExecuteNonQuery();
                }
            }
        }


        public static void DeletePDFOrder(string from_email, string user)
        {


            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();
            }
            catch (Exception ex_conn)
            {
                connectionString = "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true";
                throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("p_pdf_orders_delete", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.Parameters.AddWithValue("@customer_email", from_email);                   
                    //this is the most important part:                   
                    comm.ExecuteNonQuery();
                }
            }
        }


        public static DataTable GetOrderTrackingList()
        {

            #region call pbiz_lookup_data proc to determine routes

            var output = new DataTable();
            output.Columns.Add("PO_Number");
            output.Columns.Add("BizTalk_id");
            output.Columns.Add("Customer_Code");
            output.Columns.Add("Created_Date");
            output.Columns.Add("Customer_Name");
            output.Columns.Add("Order_Status");
            output.Columns.Add("Archive_Path");
            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();
            }
            catch (Exception ex_conn)
            {
                connectionString = "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true";
                throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("p_ordertrackingstatus_get", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    //this is the most important part:                   
                    var reader = comm.ExecuteReader(); //or NonQuery, etc.

                    while (reader.Read())
                    {

                        output.Rows.Add(reader["po_number"].ToString()
                            , reader["biztalk_id"].ToString()
                            , reader["customer_code"].ToString()
                            , Convert.ToDateTime(reader["created_date"]).ToString("yyyy-MM-dd HH:mm:ss")
                            , reader["customer_name"].ToString()
                            , reader["order_status"].ToString()
                            , reader["archive_file_name"].ToString());

                    }
                }
            }

            #endregion

            return output;
        }
        private static DataTable ConvertToDataTable(Dictionary<string, string> dict)
        {
            var dt = new DataTable();
            dt.Columns.Add("Key", typeof(string));
            dt.Columns.Add("Value", typeof(string));
            foreach (var pair in dict)
            {
                var row = dt.NewRow();
                row["Key"] = pair.Key;
                row["Value"] = pair.Value;
                dt.Rows.Add(row);
            }
            return dt;
        }      

    }
}
