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
   
    public class DataLookupHelper
    {
        public const string LOOKUP_KEY = "LookUpKey";
        public const string INTERFACE_NAME = "InterfaceName";

        public static string GetInterfaceLookupData(string key, string InterfaceName)
        {
            var dict = new Dictionary<string, string>();
            dict.Add(DataLookupHelper.INTERFACE_NAME, InterfaceName);
            dict.Add(LOOKUP_KEY, key);
            var bindingInfo = GetLookupData(dict).FirstOrDefault(p => p.Key == key).Value;
            return string.IsNullOrEmpty(bindingInfo) ? key : bindingInfo;
        }

        public static Dictionary<string, string> GetLookupData(Dictionary<string, string> keyValuePair)
        {

            #region call pbiz_lookup_data proc to determine routes
            var dt = ConvertToDataTable(keyValuePair);

            var connectionString = string.Empty;
            try
            {
                connectionString = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();                
            }
            catch (Exception ex_conn)
            {
                connectionString = "Data Source=wawsydbizd01;Initial Catalog=BizTalkData;Integrated Security=true";
                //throw (new Exception("Missing entry in btnstsvc64.exe.config", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                using (SqlCommand comm = new SqlCommand("pbiz_lookup_data", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    var param = comm.Parameters.AddWithValue("@keyvaluepair", dt);
                    //this is the most important part:
                    param.SqlDbType = SqlDbType.Structured;
                    var reader = comm.ExecuteReader(); //or NonQuery, etc.
                    var outdt = new Dictionary<string, string>();
                    while (reader.Read())
                    {
                        outdt.Add(reader["Key"].ToString(), reader["Value"].ToString());
                    }
                    return outdt;
                }
            }

            #endregion

            return null;
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


        public static string GetBusinessUnit(int companyid)
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
                using (SqlCommand comm = new SqlCommand("pbiz_businessunit_data", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    var param = comm.Parameters.AddWithValue("@sysbu", companyid);
                    //this is the most important part:
                    param.SqlDbType = SqlDbType.Int;
                    var reader = comm.ExecuteReader(); //or NonQuery, etc.

                    return reader["TMSBU"].ToString();
                }
            }
            

            return string.Empty;
        }

        public static string PostCodeExists(int postcode)
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
                using (SqlCommand comm = new SqlCommand("pbiz_postcode_data", sqlCon))
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    var param = comm.Parameters.AddWithValue("@postcode", postcode);
                    //this is the most important part:
                    param.SqlDbType = SqlDbType.Int;
                    var reader = comm.ExecuteReader(); //or NonQuery, etc.

                    return reader["PostCode"].ToString();
                }
            }


            return string.Empty;
        }
    }
}
