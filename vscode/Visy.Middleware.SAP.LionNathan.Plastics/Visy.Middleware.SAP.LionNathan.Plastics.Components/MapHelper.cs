using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Visy.Middleware.SAP.LionNathan.Plastics.Components
{
    public class MapHelper
    {
        public static string GetAppSettings(string key)
        {
            try
            {
                string sValue = string.Empty;

                sValue = System.Configuration.ConfigurationManager.AppSettings[key].ToString();

                System.Diagnostics.Trace.WriteLine(String.Format("GetAppSettings Key: {0} Value: {1}", key, sValue));

                return sValue;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform GeneralHelper.GetAppSettings because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetEnvironmentString()
        {
            string sConnection = string.Empty;

            try
            {
                sConnection = GetAppSettings("ENVIRONMENT");
                return sConnection;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetEnvironmentString failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetSharePointDBConnectionString()
        {
            string sConnection = string.Empty;

            try
            {
                sConnection = GeneralHelper.GetAppSettings("BizTalkDataConn");
                return sConnection;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetSharePointDBConnectionString failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetValueFromDelimeteredList(string inputValue, string delimeter, string index)
        {
            try
            {
                string[] splitResult = inputValue.Split(delimeter.ToCharArray());

                return splitResult[int.Parse(index)];
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetValueFromDelimeteredList failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetLionathanSupplierDetailsWithPipes(string CustSoldTo, string CustShipTo, string PlantNo)
        {
            try
            {
                string lookupResult;
                string sConnection = GetSharePointDBConnectionString();
                string sCommand = "p_lionnathan_supplierdetailswithpipes";

                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@CustSoldTo", SqlDbType.VarChar);
                    cmd.Parameters["@CustSoldTo"].Value = CustSoldTo;

                    cmd.Parameters.Add("@CustShipTo", SqlDbType.VarChar);
                    cmd.Parameters["@CustShipTo"].Value = CustShipTo;

                    cmd.Parameters.Add("@PlantNo", SqlDbType.VarChar);
                    cmd.Parameters["@PlantNo"].Value = PlantNo;

                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    lookupResult = reader.GetString(0);

                }

                return lookupResult;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetLionathanSupplierDetailsWithPipes failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetLionPlasticsDairyOrdersWithPipes(string Lionsitecodes, string LionVendorcodes)
        {
            try
            {
                string lookupResult;
                string sConnection = GetSharePointDBConnectionString();
                string sCommand = "p_lionnathan_plasticsdairy_orders";

                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Lionsitecodes", SqlDbType.VarChar);
                    cmd.Parameters["@Lionsitecodes"].Value = Lionsitecodes;

                    cmd.Parameters.Add("@LionVendorcodes", SqlDbType.VarChar);
                    cmd.Parameters["@LionVendorcodes"].Value = LionVendorcodes;

                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    lookupResult = reader.GetString(0);

                }

                return lookupResult;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetLionPlasticsDairyOrdersWithPipes failed because {0}", ex.Message), ex.InnerException);
            }
        }
    }
}
