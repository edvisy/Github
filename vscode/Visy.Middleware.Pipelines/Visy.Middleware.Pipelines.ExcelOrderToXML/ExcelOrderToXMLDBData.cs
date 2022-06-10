using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Visy.Middleware.Pipelines.ExcelOrderToXML
{
    public class ExcelOrderToXMLDBData
    {

        public ExcelOrderToXMLDBData()
        {
        }

        public static DataSet getDataSet(string mailbox)
        {

            string sql_conn;

            try
            {
                sql_conn = System.Configuration.ConfigurationManager.AppSettings["BizTalkDataConn"].ToString();

            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in machine.config/appsettings for BiztalkCustomerActivityListID.", ex_conn));
            }
            using (SqlConnection sqlCon = new SqlConnection(sql_conn))
            {
                try
                {

                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();

                    System.Data.DataSet ds = Visy.Middleware.Components.Utilities.SqlHelper.ExecuteDataset(sqlCon, "p_excelorders_settings", mailbox);

                    return ds;

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}

