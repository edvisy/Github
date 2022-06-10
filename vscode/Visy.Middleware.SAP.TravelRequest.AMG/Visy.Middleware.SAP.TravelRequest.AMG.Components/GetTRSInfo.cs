using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Visy.Middleware.SAP.TravelRequest.AMG.Component
{
    [Serializable]
    public class GetTRSInfo
    {
        public static string GetTRSValue(string requestid)
        {
            try
            {

                var strReturn = string.Empty;
                string sConn = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("IntranetAppDb");
                string sConnection =
                        string.IsNullOrEmpty(sConn) ?
                        "Data Source=mssql-intranetapp;Initial Catalog=BizTalkData;UserName=trsuser;Password=usertrs;" :
                        sConn;
                string sCommand = "p_concord_byrequestid";
                
                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@requestid", SqlDbType.Int);
                    cmd.Parameters["@requestid"].Value = Convert.ToInt32(requestid);
                    
                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    strReturn = reader["GLAccountID"].ToString() + "|" + reader["CostCentreCode"].ToString() 
                            + "|" + reader["ProjectCode"].ToString() + "|" + reader["InternalOrderCode"].ToString()
                            + "|" + reader["CompanyCode"].ToString() + "|" + reader["BusinessArea"].ToString()
                            + "|" + reader["TRSUserID"].ToString() + "|" + reader["Currency"].ToString();

                }

                return strReturn;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Error while fetching Value From  p_concord_requestid: {0}", ex.Message), ex.InnerException);
            }
        }


        public static string GetTRSUser(string trsUserId)
        {
            try
            {

                var strReturn = string.Empty;
                string sConn = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("IntranetAppDb");
                string sConnection =
                        string.IsNullOrEmpty(sConn) ?
                        "Data Source=mssql-intranetapp;Initial Catalog=BizTalkData;UserName=trsuser;Password=usertrs;" :
                        sConn;
                string sCommand = "p_TRSUser";

                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@TRSUserID", SqlDbType.Int);
                    cmd.Parameters["@TRSUserID"].Value = Convert.ToInt32(trsUserId);

                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    strReturn = reader["EmployeeNo"].ToString();

                }

                return strReturn;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Error while fetching Value From  p_TRSUser: {0}", ex.Message), ex.InnerException);
            }
        }

        public string GetSplittedValue(string value, int index) {
            return value.Split('|')[index];
        }
    }
}

