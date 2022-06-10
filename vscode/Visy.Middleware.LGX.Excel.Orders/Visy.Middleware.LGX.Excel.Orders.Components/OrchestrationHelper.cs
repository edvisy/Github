using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Visy.Middleware.LGX.Excel.Orders.Components
{
    [Serializable]
    public class OrchestrationHelper
    {
        public static string GetEmailFrom(string email_from)
        {
            try
            {
                string emailFrom = string.Empty;

             
                int startIndex = email_from.IndexOf("<") + 1;
                int endIndex = email_from.LastIndexOf(">");
                if (startIndex != 0 && endIndex != 0)
                {
                    emailFrom = email_from.Substring(startIndex, endIndex - startIndex);
                }
                else {
                    emailFrom = email_from;
                }

                return emailFrom;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Error while fetching email from: {0}", ex.Message), ex.InnerException);
            }
        }

    }
}

