using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Amazon.Components
{
    [Serializable()]
    public static class XlangMessageHelper
    {

        public static string XlangMessageToString(XLANGMessage requestMessge)
        {
            var toReturn = String.Empty;

            try
            {
                using (StreamReader reader = new StreamReader(requestMessge[0].RetrieveAs(typeof(Stream)) as Stream))
                {                  
                    toReturn = reader.ReadToEnd();
                }
            }
            finally
            {   
                requestMessge.Dispose();
            }
        
            return toReturn;
        }

        public static string BuildXmlString(string raw)
        {
            var strXml = "<ns0:xmlstring xmlns:ns0=\"http://Visy.Middleware.LGX.Amazon.Schemas.xmlstring\">" +
                    " <id>0</id>" +
                    " <xmlstring>" + System.Net.WebUtility.HtmlEncode(raw) + "</xmlstring>" +
                    " {0}" +
                    " </ns0:xmlstring>";

            var xpath = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("unitcount", "LGX.Amazon.XPath");

            var strDetails = "";
            for (int x = 1; x <= Convert.ToInt32(RawHtmlParser.EvaluateXPathExression(xpath, raw)); x++)
            {
                strDetails += string.Format("<details><lineno>{0}</lineno></details>", x.ToString());
            }
            strXml = string.Format(strXml, strDetails);

            return strXml;
        }

    }
}
