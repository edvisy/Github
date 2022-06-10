using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Bega.Components
{
    public class OrchestrationHelper
    {
        public static string GetDivisionCode(string subject) {
            
            string pattern = @"(?<=Code :)(.*)(?=, Batch)";

            var customerCode = System.Text.RegularExpressions.Regex.Match(subject, pattern, System.Text.RegularExpressions.RegexOptions.IgnoreCase).Value.Trim();

            var divCode = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(customerCode, "LGX.Bega.Outbound.Division")  ;
            var vendorCode = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(customerCode, "LGX.Bega.Outbound.VendorCode");

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "LGX.Bega.Outbound: " + divCode+"."+ vendorCode);

            return divCode + "." + vendorCode;            
        }


        public static string GetInvoiceNumber(XLANGPart message)
        {
            //string pattern = @"(?<=Invoicenumber/s:)(.*)(?=&lt;/span&gt;)";

            string emailBody = CreateStringFromXLANGMessage(message);
            emailBody = System.Text.RegularExpressions.Regex.Replace(emailBody, @"\s+", "");
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "LGX.Bega.Outbound EmailBody: " + emailBody);

            emailBody = System.Text.RegularExpressions.Regex.Replace(emailBody, @"[^a-zA-Z0-9]", "");

            string invoiceNumber = emailBody.Substring(emailBody.LastIndexOf("Invoicenumber") + 13, 12);
            invoiceNumber = System.Text.RegularExpressions.Regex.Replace(invoiceNumber, @"[^0-9]", "");           

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "LGX.Bega.Outbound InvoiceNumber: " + invoiceNumber);
            return invoiceNumber;
        }

        private static string CreateStringFromXLANGMessage(XLANGPart message)
        {

            string toReturn;

            try
            {

                using (var reader = new StreamReader(message.RetrieveAs(typeof(Stream)) as Stream))
                {
                    toReturn = reader.ReadToEnd();
                }
            }
            finally
            {
                // Clean memory 
                message.Dispose();
            }
            //
            return toReturn;
        }



    }
}
