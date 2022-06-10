using System;
using System.Globalization;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Visy.Middleware.LGX.Orders.DelimitedFF.PipelineComponents
{
    public class Helper
    {
        public static string FormatDateTime(string inputDateTime, string outputFormat)
        {
            try
            {
                string retVal = string.Empty;
                DateTime parsedDateTime = DateTime.MinValue;

                bool success = DateTime.TryParse(inputDateTime, out parsedDateTime);

                if (success)
                {
                    retVal = FormatDateTime(parsedDateTime, outputFormat);
                }

                return retVal;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform Helper.FormatDateTime because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static string FormatDateTime(DateTime inputDateTime, string outputFormat)
        {
            try
            {
                return inputDateTime.ToString(outputFormat);
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform Helper.FormatDateTime because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static DateTime? ParseDateTimeString(string inputDateTimeString, string inputFormat)
        {
            try
            {
                DateTime? retVal = null;
                DateTime temp = DateTime.MinValue;
                bool success = DateTime.TryParseExact(inputDateTimeString, inputFormat, null, DateTimeStyles.None, out temp);

                if (success)
                {
                    retVal = temp;
                }

                return retVal;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform Helper.ParseDateTimeString because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static string ConvertDateTime(string inputDateTime, string inputFormat, string outputFormat)
        {
            try
            {
                string retVal = string.Empty;
                DateTime? parsedDate = ParseDateTimeString(inputDateTime, inputFormat);

                if (parsedDate != null)
                {
                    retVal = FormatDateTime(parsedDate.Value, outputFormat);
                }

                return retVal;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform Helper.ConvertDateTime because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetSharePointDBConnectionString()
        {
            string sConnection = string.Empty;

            try
            {
                sConnection = GetAppSettings("SharePointDB");
                return sConnection;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetSharePointDBConnectionString failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetAppSettings(string key)
        {
            try
            {
                string sValue = string.Empty;

                sValue = ConfigurationManager.AppSettings[key].ToString();

                System.Diagnostics.Trace.WriteLine(String.Format("GetAppSettings Key: {0} Value: {1}", key, sValue));

                return sValue;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform GeneralHelper.GetAppSettings because - {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetLGXOrdersFFValues(string definitionName)
        {
            try
            {
                string lookupResult;
                string sConnection = GetSharePointDBConnectionString();
                string sCommand = "usp_Converter_GetLGXOrdersFFValues";

                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Definition_Name", SqlDbType.VarChar);
                    cmd.Parameters["@Definition_Name"].Value = definitionName;

                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    lookupResult = reader.GetString(0);

                }

                return lookupResult;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Helper.GetLGXOrdersFFValues failed because {0}", ex.Message), ex.InnerException);
            }
        }

    }
}
