using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;


namespace Visy.Middleware.Components.Utilities
{
    [Serializable()]
    public class RouteData : ISerializable
    {
        public bool ConfigFound = false;
        public string Folder;
        public string DocType;

        public RouteData()
        {
            ConfigFound = false;
            Folder = String.Empty;
            DocType = String.Empty;
        }

        public RouteData(SerializationInfo info, StreamingContext ctxt)
        {
            ConfigFound = (bool)info.GetValue("ConfigFound", typeof(bool));
            Folder = (string)info.GetValue("Folder", typeof(string));
            DocType = (string)info.GetValue("DocType", typeof(string));
        }
        public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
        {
            info.AddValue("ConfigFound", ConfigFound);
            info.AddValue("Folder", Folder);
            info.AddValue("DocType", DocType);
        }
    }
    public class ListenerController
    {
        
        public static RouteData GetRouteConfig(string system_code, string app_name, string customer_code)
        {

            RouteData data = new RouteData();


            
            #region call pbiz_trans_listener_config proc to determine routes

            string wss_list_db;
            string wss_list_transactions;
            string wss_list_formats;
            
            try
            {
                wss_list_db = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();
                wss_list_transactions = string.Empty;// ConfigurationSettings.AppSettings["WSSList_Transactions"].ToString();
                wss_list_formats = string.Empty;// ConfigurationSettings.AppSettings["WSSList_Formats"].ToString();                
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in Machine.config/appsettings for either of WSSList_* entries.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(wss_list_db))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                SqlDataReader dr = SqlHelper.ExecuteReader(
                                            sqlCon,
                                            "pbiz_trans_listener_config",
                                            wss_list_transactions,
                                            wss_list_formats,
                                            customer_code,
                                            system_code,
                                            app_name);

                if (dr.Read())
                {
                    data.ConfigFound = true;
                    data.Folder = dr["folder"].ToString();
                    data.DocType = dr["DocType"].ToString();
                }
            }

            #endregion

            return data;
        }


        

    }
}
