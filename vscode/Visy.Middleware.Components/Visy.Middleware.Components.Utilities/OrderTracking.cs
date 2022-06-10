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


namespace Visy.Middleware.Components.Utilities
{
    [Serializable()]
   
    public class OrderTracking
    {
       

        public static void InsertOrderTracking(string poNumber, string bitalkID, string customerCode, string customerName, string archiveFileName)
        {
            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("p_ordertracking_insert", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    if (!String.IsNullOrEmpty(poNumber)) comm.Parameters.AddWithValue("@po_number", poNumber);
                    comm.Parameters.AddWithValue("@biztalk_id", bitalkID);
                    if (!String.IsNullOrEmpty(customerCode)) comm.Parameters.AddWithValue("@customer_code", customerCode);
                    if (!String.IsNullOrEmpty(customerName)) comm.Parameters.AddWithValue("@customer_name", customerName);
                    if (!String.IsNullOrEmpty(customerName)) comm.Parameters.AddWithValue("@archive_file_name", archiveFileName);
                    comm.ExecuteNonQuery();                    
                }
            }
            
        }

        public static bool IsOrderExists(string bitalkID)
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
                using (SqlCommand comm = new SqlCommand("p_ordertracking_get", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    var param = comm.Parameters.AddWithValue("@biztalk_id", bitalkID);
                    //this is the most important part:
                    param.SqlDbType = SqlDbType.VarChar;
                    var reader = comm.ExecuteReader(); 
                    if (reader.HasRows)
                        return true;
                }
            }

          

            return false;
        }

       
    }
}
