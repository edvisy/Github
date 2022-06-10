using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.RuleEngine;

namespace Visy.Middleware.SLX.Nestle.Invoice.Components
{
    [Serializable]
    public class LookupHelper
    {

        private const string POLICY_NAME = "SLX.Nestle.Invoice.Policies";
        public static string GetVendorCodeFromSAP(string plantCode, string customerCode)
        {
            Policy policy = new Policy(POLICY_NAME);
            VendorCodeLookup lookup = new VendorCodeLookup();
            
            lookup.PlantCode = plantCode;
            lookup.CustomerCode = customerCode;

            policy.Execute(lookup);

            if (string.IsNullOrEmpty(lookup.VendorCode))
                return string.Empty;

            return lookup.VendorCode;
        }

        public static string GetABNFromSAP(string plantCode, string customerCode)
        {
            Policy policy = new Policy(POLICY_NAME);
            VendorCodeLookup lookup = new VendorCodeLookup();

            lookup.PlantCode = plantCode;
            lookup.CustomerCode = customerCode;

            policy.Execute(lookup);
            if (string.IsNullOrEmpty(lookup.ABN))
                return string.Empty;

            return lookup.ABN;
        }

        public static string GetCustomerNameFromSAP(string plantCode, string customerCode)
        {
            Policy policy = new Policy(POLICY_NAME);
            VendorCodeLookup lookup = new VendorCodeLookup();

            lookup.PlantCode = plantCode;
            lookup.CustomerCode = customerCode;

            policy.Execute(lookup);
            if (string.IsNullOrEmpty(lookup.CustomerName))
                return string.Empty;
            return lookup.CustomerName;
        }


        public static string GetVendorCodeFromLGX(string customerCode)
        {
            Policy policy = new Policy(POLICY_NAME);
            VendorCodeLookup lookup = new VendorCodeLookup();
            lookup.CustomerCode = customerCode;
            policy.Execute(lookup);
            if (string.IsNullOrEmpty(lookup.VendorCode)) { 
                throw new Exception("No valid mapping for given customer code: " + customerCode);
            }
            return lookup.VendorCode;
        }

    }
}
