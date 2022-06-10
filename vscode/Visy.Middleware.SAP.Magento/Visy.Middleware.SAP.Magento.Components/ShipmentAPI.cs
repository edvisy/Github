using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RestSharp;
using System.Xml;

namespace Visy.Middleware.SAP.Magento.Components
{

    [Serializable]
    public class ShipmentAPI
    {

        private const string MagentoAPIDateFormat = "yyyy-MM-dd HH:mm:ss";
        public static string GetSessionId(string url, string username, string apiKey)        {
            url = "http://dev-bam-app01.pratt.visy.com/index.php/api/v2_soap";
            username = "biztalk";
            apiKey = "UbV7CaRn7qXwhhG7c6zKyeL4";
            var client = new RestClient(url);
            var request = new RestRequest(Method.POST);            
            request.AddHeader("Content-Type", "text/xml");
            request.AddParameter("undefined", "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:hs=\"http://www.example.com/api/soap_v2//\">\n <soapenv:Body>\n  <login>\n   <username>"+username+"</username>\n   <apiKey>"+apiKey+"</apiKey>\n  </login>\n </soapenv:Body>\n</soapenv:Envelope>", ParameterType.RequestBody);
            var response = client.Execute(request);

            var xmlResp = new XmlDocument();
            xmlResp.LoadXml(response.Content);
                    
            return xmlResp.SelectSingleNode("//*[local-name()='loginReturn']/text()").Value;
        }

    }
  
}
