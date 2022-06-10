using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Xml;


namespace Visy.Middleware.SAP.Magento.Components
{

   
    public class OrchestrationHelper
    {

        public List<KeyValuePair<string, string>> CustomerCodeLookup;

        public static string[] BuildPriceTier(string str, int count) {
            string[] strNew = new string[count];

            str = str.Remove(str.LastIndexOf(','), 1);
            int i = 0;
            foreach (string s in str.Split(',')) {
                strNew[i] = s;
                i++;               
            }
            return strNew;
        }

        public static string BuildPriceTierField(string price, string qty)
        {
            return price + "-" + qty;
        }

        public static string GetNodeValue(string soapXml, string nodeName)
        {
            var xmlResp = new XmlDocument();
            xmlResp.LoadXml(soapXml);
            var customerId = xmlResp.SelectSingleNode("//*[local-name()='" + nodeName + "']/text()");
            return customerId == null ? "" : customerId.Value;

        }

        public static string XlangMessageToString(XLANGMessage requestMessge)
        {
            XmlDocument xmlDoc = (XmlDocument)requestMessge[0].RetrieveAs(typeof(XmlDocument));
            return xmlDoc.OuterXml;
        }

        public void PopulateCustomerCodeLookup(string json) {
            this.CustomerCodeLookup.Add(new KeyValuePair<string, string>("", ""));
            this.CustomerCodeLookup.Add(new KeyValuePair<string, string>("", ""));
            this.CustomerCodeLookup.Add(new KeyValuePair<string, string>("", ""));
        }
    }
}
