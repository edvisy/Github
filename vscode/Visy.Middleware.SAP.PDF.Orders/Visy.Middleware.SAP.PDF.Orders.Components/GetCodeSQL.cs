using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Visy.Middleware.SAP.PDF.Orders.Components
{
    [Serializable]
    public class GetCodeSQL
    {
        public static string getCustomerCode(string email_from)
        {
            try
            {

                string[] separateEmails = email_from.Split(',');

                string emailList1 = string.Empty;

                foreach (string separateEmail in separateEmails)
                {
                    if (separateEmail != string.Empty)
                    {
                        int startIndex = separateEmail.IndexOf("<") + 1;
                        int endIndex = separateEmail.LastIndexOf(">");
                        if (startIndex != 0 && endIndex != 0)
                        {
                            string emailList = separateEmail.Substring(startIndex, endIndex - startIndex);

                            emailList1 = emailList + "," + emailList1;
                        }
                    }

                }
                if (emailList1.EndsWith(","))
                    emailList1 = emailList1.Remove(emailList1.Length - 1, 1);
                //string strCode = string.Empty;
                //string sConn = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BizTalkDataConn");
                //string sConnection =
                //        string.IsNullOrEmpty(sConn) ?
                //        "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true" :
                //        sConn;
                //string sCommand = "p_pdf_orders_getCode_sap";

                //using (SqlConnection conn = new SqlConnection(sConnection))
                //{
                //    conn.Open();
                //    SqlCommand cmd = new SqlCommand(sCommand, conn);
                //    cmd.CommandType = CommandType.StoredProcedure;

                //    cmd.Parameters.Add("@CustomerEmail", SqlDbType.VarChar);
                //    cmd.Parameters["@CustomerEmail"].Value = emailList1;

                //    SqlDataReader reader = cmd.ExecuteReader();

                //    reader.Read();

                //    strCode = reader.GetString(0);

                //}

                if (emailList1 == string.Empty)
                {
                    throw new Exception("Customer code not found");

                }
                else return emailList1;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Error while fetching Customer Code: {0}", ex.Message), ex.InnerException);
            }
        }

        public double CustomerUOM(string cusEAN)
        {
            try
            {


                // string strCode = string.Empty;
                string sConn = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BizTalkDataConn");
                string sConnection =
                        string.IsNullOrEmpty(sConn) ?
                        "Data Source=wawsytbizd02;Initial Catalog=BizTalkData;Integrated Security=true" :
                        sConn; ;
                string sCommand = "p_pdf_orders_getUOM_sap";
                double UOM = 1;

                using (SqlConnection conn = new SqlConnection(sConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sCommand, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@CustomerEAN", SqlDbType.VarChar);
                    cmd.Parameters["@CustomerEAN"].Value = cusEAN;

                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    UOM = reader.GetDouble(0);
                }

                //if (strCode == string.Empty)
                //{
                //    throw new Exception("UOM not found");

                //}
                return UOM;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Error while fetching UOM: {0}", ex.Message), ex.InnerException);
            }
        }
    }
}

