using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Microsoft.XLANGs.BaseTypes;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Visy.Middleware.Components.Utilities
{
    public class SenderController
    {

        public static SenderData WorkRequired(string system_code, string app_name, string customer_code, string context_id, XLANGPart msg_part)
        {

            SenderData data = new SenderData();


            #region validate values passed in
            //if customer_code, system_code or app_name are blank
                //raise alert to event log

            //
            #endregion

            #region 2. call pbiz_transaction_config proc to determine if work is needed

            string wss_list_db;
            string wss_list_transactions;
            string wss_list_solutions;
            string wss_list_protocols;
            string wss_list_doctypes;
            string wss_list_formats;
            string wss_list_context;


            try
            {
                wss_list_db = ConfigurationSettings.AppSettings["WSSList_DB"].ToString();
                wss_list_transactions = ConfigurationSettings.AppSettings["WSSList_Transactions"].ToString();
                wss_list_solutions = ConfigurationSettings.AppSettings["WSSList_Solutions"].ToString();
                wss_list_protocols = ConfigurationSettings.AppSettings["WSSList_Protocols"].ToString();
                wss_list_doctypes = ConfigurationSettings.AppSettings["WSSList_DocTypes"].ToString();
                wss_list_formats = ConfigurationSettings.AppSettings["WSSList_Formats"].ToString();
                wss_list_context = ConfigurationSettings.AppSettings["WSSList_Context"].ToString();
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
                                            "pbiz_transaction_config", 
                                            wss_list_transactions,
                                            wss_list_protocols,
                                            wss_list_solutions,
                                            wss_list_formats,
                                            wss_list_doctypes,
                                            customer_code,                                             
                                            system_code, 
                                            app_name);

                if (dr.Read())
                {
                    data.WorkNeeded = true;
                    data.Protocol = dr["protocol"].ToString();
                    data.Server = dr["ServerName"].ToString();
                    data.Direction = dr["Direction"].ToString();
                    data.System = dr["SystemCode"].ToString();
                    data.Direction = dr["Direction"].ToString();
                    data.Folder = dr["Folder"].ToString();
                    data.FileName = dr["FileName"].ToString();
                    data.SolutionName = dr["SolutionName"].ToString();
                    data.DocType = dr["doctype"].ToString();
                    data.Format = dr["formats"].ToString();
                    data.ConfigType = dr["ConfigType"].ToString();
                    data.xslt_template = dr["XSLTTemplate"].ToString();
                    data.CustomerCode = dr["CustomerCode"].ToString();
                    data.Username = dr["UserName"].ToString();
                    data.Password = dr["Password"].ToString();               

                    if (data.Protocol == "SMTP")
                    {
                        //apply xslt to xml_message passed in if xslt_template configured

                        if (data.xslt_template.Length != 0)
                        {
                            #region 3. Create HTML ( XML + XSLT )

                            XslTransform transform = new XslTransform();
                            System.Xml.XmlDocument xmld = new XmlDocument();
                            StringBuilder sb = new StringBuilder();
                            string xml_data = "";


                            string base_dir = "";
                            try
                            {
                                base_dir = ConfigurationSettings.AppSettings["BiztalkStyleSheetsBaseDir"].ToString();

                            }
                            catch (Exception ex_conn)
                            {
                                throw (new Exception("Missing entry in Machine.config/appsettings for BiztalkStyleSheetsBaseDir.", ex_conn));
                            }

                            //READ XML
                            Stream s = (Stream)msg_part.RetrieveAs(typeof(Stream));
                            using (StreamReader reader = new StreamReader(s))
                            {
                                xml_data = reader.ReadToEnd();
                            }
                            //load xml data and create XPath to navigate
                            xmld.LoadXml(xml_data);
                            XPathNavigator xpath = xmld.CreateNavigator();
                            System.IO.StringWriter swr = new System.IO.StringWriter(sb);
                            //load style sheet and transform
                            string xsl_path = base_dir + data.xslt_template;
                            transform.Load(xsl_path);
                            transform.Transform(xpath, null, swr);

                            data.Message = sb.ToString();
                            #endregion
                        }
                    }
                    
                    //ConfigType
                    string config_type = data.ConfigType;

                    if (config_type == "DYNAMIC")
                    {
                        //read config based on CONTEXT_ID passed in
                        #region GET CONTEXT CONFIG
                        using (SqlConnection sqlCon2 = new SqlConnection(wss_list_db))
                        {

                            ///TODO: Need to see if I need to handle Headers spanning more than one column
                            sqlCon2.Open();
                            SqlDataReader drContext = SqlHelper.ExecuteReader(sqlCon2, "pbiz_get_context", wss_list_context, context_id);

                            if (drContext.Read()) //context insert failed   
                            {
                                data.Username = drContext["email_from"].ToString();
                                data.WorkNeeded = true;
                            }
                            else
                            {
                                //raise alert, return no work to do because unable to determine config based on CONTEXT_ID
                                data.WorkNeeded = false;
                            }
                            
                        }
                        #endregion
                    }
                    else
                        if (config_type == "STATIC")
                        {
                            //read from data return in pbiz_transaction_config CALL

                        }
                        else
                        {
                            // raise alert, no work to do as unable to determine config
                        } 
                }
                else
                {
                    data.WorkNeeded = false;
                }                
            }            

            #endregion

            return data;
        }
        

    }
    public class SenderData
    {
        public bool WorkNeeded;
        public string Protocol;
        public string Message;  //if HTML via SMTP this contains the HTML applied using XML + XSLT
        public string Subject;  // not sure what to put here
        public string Username;  // this either contains an e-mail address in case of SMTP or username to be used on FTP transfer
        public string Password;  // passowrd if required by protocol
        public string System;
        public string SolutionName;
        public string DocType;
        public string Direction;
        public string Format;
        public string Server;
        public string Folder;
        public string FileName;
        public string Translations;
        public string ConfigType;
        public string xslt_template;
        public string CustomerCode;

    }
}
