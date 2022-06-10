using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Microsoft.RuleEngine;

namespace Visy.Middleware.SAP.PDF.Orders.Components
{
    [Serializable]
    public class BREHelper
    {
        private const string POLICY_NAME = "SAP.PDF.Orders.Policies";
        public static string UseVisyMaterialId(string customerNumber) {
            Policy policy = new Policy(POLICY_NAME);
            PDFOrdersCode po = new PDFOrdersCode();
            po.CustomerNumber = customerNumber;
            policy.Execute(po);
            
            return po.UseVisyMaterialId ? "true" : "false";
        }
    }
}
