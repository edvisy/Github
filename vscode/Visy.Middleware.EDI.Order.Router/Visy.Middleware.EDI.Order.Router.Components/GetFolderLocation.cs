using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.RuleEngine;

namespace Visy.Middleware.EDI.Order.Router.Components
{

    [Serializable]
    public class GetFolderLocation
    {

        private const string INTERFACE_NAME = "EDI.Order.Router.Customers";
        private const string LOOKUP_KEY = "LookUpKey";

        public static string GetCustomerCode(string var_code) {

            return var_code.Contains("_v") ? var_code.Replace("_v", "") : var_code; 
        }

        public static string GetInterfaceFolderPath(string emailAddresses)
        {
            //Policy policy = new Policy(POLICY_NAME);
           // EDIOrderFactObject lookup = new EDIOrderFactObject();
            
            
            string[] separateEmails = emailAddresses.Split(',');
           
            foreach (string separateEmail in separateEmails)
            {
                if (separateEmail != string.Empty)
                {

                    int startIndex = separateEmail.IndexOf("<") + 1;
                    int endIndex = separateEmail.LastIndexOf(">");
                    if (startIndex != 0 && endIndex != 0)
                    {
                        string email = separateEmail.Substring(startIndex, endIndex - startIndex);
                        //lookup.EmailAddress = email;
                        email = email.Replace("'", "");
                        if (!string.IsNullOrEmpty(email))
                        {
                            //policy.Execute(lookup);
                            var dict = new Dictionary<string, string>();
                            dict.Add(Visy.Middleware.Components.Utilities.DataLookupHelper.INTERFACE_NAME, INTERFACE_NAME);
                            dict.Add(LOOKUP_KEY, email);
                            var inboundFolder = Visy.Middleware.Components.Utilities.DataLookupHelper.GetLookupData(dict).FirstOrDefault(p => p.Key.ToLower() == email.ToLower()).Value;

                            //string inboundFolder = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(email, INTERFACE_NAME);
                            if (!string.IsNullOrEmpty(inboundFolder))
                                return inboundFolder + "\\" + email;
                            //else throw new Exception("Policy not deployed");
                        }
                    }
                }
            }
            return string.Empty;

        }
    }
}
