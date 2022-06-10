using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Visy.Middleware.Components.Utilities
{
    public class MailHelper
    {
        public enum ContextFields { TO = 1, FROM, SUBJECT };
            
        /// <summary>
        /// Adds Context for Electronic documents received through MAILPOLLER
        /// </summary>
        /// <param name="context_id"></param>
        /// <param name="email_from"></param>
        /// <param name="email_to"></param>
        public static void AddMAILPOLLERContext(string context_id, string email_from, string email_to, string email_subject)
        {
            /*
             *  CALLS
             * exec pbiz_add_context      
      @wss_listID = '505AE0F6-C0B0-4703-93FA-B960B263492F',           
      @context_id = 'guid id here',
      @email_from = 'webitadmin@visy.com.au',
      @email_to = 'miguel@visy.com.au'
             * 
             * 
             * 
             */
            string sql_conn;           
            string wss_listid;

            try
            {
                sql_conn = AppSettingsReader.retrieveValue("BiztalkContextDB");             
                wss_listid = AppSettingsReader.retrieveValue("BiztalkContextListID");
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in machine.config/appsettings for BiztalkContextListID.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(sql_conn))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = SqlHelper.ExecuteReader(sqlCon, "pbiz_add_context", wss_listid, context_id, email_from, email_to, email_subject);

                    if (!dr.HasRows) //context insert failed   
                    {
                        //need to fail here because if not context is registered than LGXCommon will not have sufficient information
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            


        }
        public static string GetMAILPOLLERContext(string context_id,ContextFields field_name)
        {

            //pbiz_get_context
            //ContextType ct = new ContextType();
            string s_value = "";
            string s_field_name = "";

           
            switch (field_name)
            {
                case ContextFields.FROM: 
                    s_field_name = "email_from";
                    break;
                case ContextFields.SUBJECT:
                    s_field_name = "email_subject";
                    break;
                case ContextFields.TO:
                    s_field_name = "email_to";
                    break;
                default:
                    s_field_name = "email_from";
                    break;
            }

            

            string sql_conn;      
            string wss_listid;

            try
            {
                sql_conn = AppSettingsReader.retrieveValue("BiztalkContextDB");
                wss_listid = AppSettingsReader.retrieveValue("BiztalkContextListID");
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in Machine.config/appsettings for BiztalkContextDB or BiztalkContextListID.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(sql_conn))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = SqlHelper.ExecuteReader(sqlCon, "pbiz_get_context", wss_listid, context_id);

                    if (dr.Read()) //context insert failed   
                    {
                        s_value = dr[s_field_name].ToString();
                        //ct.from = dr["email_from"].ToString();
                        //ct.subject = dr["email_subject"].ToString();
                       
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return (s_value);
        }
        public static bool ChkRequiresContext(string customer_code, string rsp_status)
        {
            //pbiz_get_context
            //ContextType ct = new ContextType();
            string s_value = "";
            string s_field_name = "";

            bool b_enabled = false;


            


            string sql_conn;
            string wss_listid;

            try
            {
                sql_conn = AppSettingsReader.retrieveValue("BiztalkContextDB");
                wss_listid = AppSettingsReader.retrieveValue("BiztalkContextControllerListID");
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in Machine.config/appsettings for BiztalkContextDB or BiztalkContextControllerListID.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(sql_conn))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = SqlHelper.ExecuteReader(sqlCon, "pbiz_chk_context_controller", wss_listid, customer_code,rsp_status);

                    if (dr.Read())  
                    {
                        b_enabled = true;                        

                    }
                    

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return (b_enabled);
        }
    }
}
