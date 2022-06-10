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
using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.Components.Utilities
{
    
    [Serializable()]
    public class TransactionConfig : ISerializable
    {
        #region FIELDS
        public bool ConfigFound;
        public string Protocol;
        public string Server;
        public string Direction;
        public string System;
        public string Folder;
        public string FileName;
        public string SolutionName;
        public string DocType;
        public string Format;
        public string ConfigType;
        public string xsltTemplate;
        public string CustomerCode;
        public string Username;
        public string Password;
        public string Message; //this will contain HTML or text that is created with XML + XSLT
        public string FromEmail;
        #endregion
        public TransactionConfig()
        {
            ConfigFound = false;
            Protocol = string.Empty;
            Server = string.Empty;
            Direction = string.Empty;
            System = string.Empty;
            Folder = string.Empty;
            FileName = string.Empty;
            SolutionName = string.Empty;
            DocType = string.Empty;
            Format = string.Empty;
            ConfigType = string.Empty;
            xsltTemplate = string.Empty;
            CustomerCode = string.Empty;
            Username = string.Empty;
            Password = string.Empty;
            Message = string.Empty;
            FromEmail = string.Empty;
            
        }

        public TransactionConfig(SerializationInfo info, StreamingContext ctxt)
        {

            ConfigFound = (bool)info.GetValue("ConfigFound", typeof(bool));
            Protocol = (string)info.GetValue("Protocol", typeof(string));
            Server = (string)info.GetValue("Server", typeof(string));
            Direction = (string)info.GetValue("Direction", typeof(string));
            System = (string)info.GetValue("System", typeof(string));
            Folder = (string)info.GetValue("Folder", typeof(string));
            FileName = (string)info.GetValue("FileName", typeof(string));
            SolutionName = (string)info.GetValue("SolutionName", typeof(string));
            DocType = (string)info.GetValue("DocType", typeof(string));
            Format = (string)info.GetValue("Format", typeof(string));
            ConfigType = (string)info.GetValue("ConfigType", typeof(string));
            xsltTemplate = (string)info.GetValue("xsltTemplate", typeof(string));
            CustomerCode = (string)info.GetValue("CustomerCode", typeof(string));
            Username = (string)info.GetValue("Username", typeof(string));
            Password = (string)info.GetValue("Password", typeof(string));
            Message = (string)info.GetValue("Message", typeof(string));
            FromEmail = (string)info.GetValue("FromEmail", typeof(string));
          
        }
        public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
        {
            info.AddValue("ConfigFound", ConfigFound);
            info.AddValue("Protocol", Protocol);
            info.AddValue("Server", Server);
            info.AddValue("Direction", Direction);
            info.AddValue("System", System);
            info.AddValue("Folder", Folder);
            info.AddValue("FileName", FileName);
            info.AddValue("SolutionName", SolutionName);
            info.AddValue("DocType", DocType);
            info.AddValue("Format", Format);
            info.AddValue("ConfigType", ConfigType);
            info.AddValue("xsltTemplate", xsltTemplate);
            info.AddValue("CustomerCode", CustomerCode);
            info.AddValue("Username", Username);
            info.AddValue("Password", Password);
            info.AddValue("Message", Message);
            info.AddValue("FromEmail", Message); 

        }
        public override string ToString()
        {
            string s_details = string.Empty;

            s_details = "ConfigFound = " + ConfigFound.ToString() + Environment.NewLine;
            s_details += "Protocol = " + Protocol.ToString() + Environment.NewLine;
            s_details += "Server = " + Server.ToString() + Environment.NewLine;
            s_details += "Direction = " + Direction.ToString() + Environment.NewLine;
            s_details += "System = " + System.ToString() + Environment.NewLine;
            s_details += "Folder = " + Folder.ToString() + Environment.NewLine;
            s_details += "FileName = " + FileName.ToString() + Environment.NewLine;
            s_details += "SolutionName = " + SolutionName.ToString() + Environment.NewLine;
            s_details += "DocType = " + DocType.ToString() + Environment.NewLine;
            s_details += "Format = " + Format.ToString() + Environment.NewLine;
            s_details += "ConfigType = " + ConfigType.ToString() + Environment.NewLine;
            s_details += "xsltTemplate = " + xsltTemplate.ToString() + Environment.NewLine;
            s_details += "CustomerCode = " + CustomerCode.ToString() + Environment.NewLine;
            s_details += "Username = " + Username.ToString() + Environment.NewLine;
            s_details += "Password = " + Password.ToString() + Environment.NewLine;
            //s_details += "Message = " + Message.ToString() + Environment.NewLine;
            s_details += "FromEmail = " + FromEmail.ToString() + Environment.NewLine;  

            return s_details;
        }
    }
    
    public class Transaction
    {

        public static TransactionConfig GetConfig(string system_code, string app_name, string customer_code, string transaction_type, string context_id, XLANGPart msg_part)
        {

            TransactionConfig data = new TransactionConfig();

            #region call p_com_transaction_config

            string wss_list_db;
            string wss_list_transactions;
            string wss_list_solutions;
            string wss_list_protocols;
            string wss_list_doctypes;
            string wss_list_formats;
            string wss_list_context;
            string smtp_from_email;
            string smtp_server;


            try
            {
                wss_list_db =  ConfigurationSettings.AppSettings["WSSList_DB"].ToString();
                wss_list_transactions = ConfigurationSettings.AppSettings["WSSList_Transactions"].ToString();
                wss_list_solutions = ConfigurationSettings.AppSettings["WSSList_Solutions"].ToString();
                wss_list_protocols = ConfigurationSettings.AppSettings["WSSList_Protocols"].ToString();
                wss_list_doctypes = ConfigurationSettings.AppSettings["WSSList_DocTypes"].ToString();
                wss_list_formats = ConfigurationSettings.AppSettings["WSSList_Formats"].ToString();
                wss_list_context = ConfigurationSettings.AppSettings["WSSList_Context"].ToString();
                smtp_from_email = ConfigurationSettings.AppSettings["SMTPFromEmail"].ToString();
                smtp_server = ConfigurationSettings.AppSettings["SMTPServer"].ToString();
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in Machine.config/appsettings for either of WSSList_* entries.  Also SMTPServer and SMTPFromEmail settings are required.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(wss_list_db))
            {
                ///TODO: Need to see if I need to handle Headers spanning more than one column
                sqlCon.Open();
                SqlDataReader dr = SqlHelper.ExecuteReader(
                                            sqlCon,
                                            "p_com_transaction_config",
                                            wss_list_transactions,
                                            wss_list_protocols,
                                            wss_list_solutions,
                                            wss_list_formats,
                                            wss_list_doctypes,
                                            system_code,
                                            app_name,
                                            customer_code,
                                            transaction_type);

                if (dr.Read())
                {
                    #region SET Config Structure
                    data.ConfigFound = true;
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
                    data.xsltTemplate = dr["XSLTTemplate"].ToString();
                    data.CustomerCode = dr["CustomerCode"].ToString();
                    data.Username = dr["UserName"].ToString();
                    data.Password = dr["Password"].ToString();
                    data.FromEmail = dr["FromEMail"].ToString();

                    if (data.FromEmail.Trim().Length == 0)
                    {
                        data.FromEmail = smtp_from_email;
                    }

                    if (data.Server.Trim().Length == 0)
                    {
                        data.Server = smtp_server;
                    }

                    #endregion

                    if (data.Protocol == "SMTP")
                    {
                        //apply xslt to xml_message passed in if xslt_template configured

                        if (data.xsltTemplate.Length != 0)
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
                            string xsl_path = base_dir + data.xsltTemplate;
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
                                data.ConfigFound = true;
                            }
                            else
                            {
                                //raise alert, return no work to do because unable to determine config based on CONTEXT_ID
                                data.ConfigFound = false;
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
                    data.ConfigFound = false;
                }          
            }

            #endregion

            return data;
        }

        /*
                pbiz_transaction_by_id
        @wss_transactions_listID = 'eee4b8dc-c0c5-4b11-8996-cec96fd865be'
        ,		@transaction_id = 'LGX.COMMON.LISTENER.ALERT'
                */


    }
}
