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
    public class Session
    {
        public static string GetLoginResponse(string soapXml)
        {

            var xmlResp = new XmlDocument();
            xmlResp.LoadXml(soapXml);

            var loginResp =  xmlResp.SelectSingleNode("//*[local-name()='loginReturn']/text()");
            return loginResp == null ? "" : loginResp.Value;
        }

       
    }
  
}
