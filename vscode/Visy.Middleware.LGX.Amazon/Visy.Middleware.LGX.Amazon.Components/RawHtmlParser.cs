using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.XPath;
using System.Configuration;
using Microsoft.XLANGs.BaseTypes;
using System.IO;
using HtmlAgilityPack;

namespace Visy.Middleware.LGX.Amazon.Components
{

    [Serializable()]
    public class RawHtmlParser
    {
        public static string GetNodeValueByxPath(string xpath, string xml) {
            try
            {
                var htmlDocument = new HtmlAgilityPack.HtmlDocument();
                htmlDocument.LoadHtml(xml);

                HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode(xpath);             
                return node.InnerText;
            }
            catch (Exception e) {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", e.InnerException.Message.ToString(), System.Diagnostics.EventLogEntryType.Error);
                return null;
            }
        }

        public static string GetNodeValueByxPath(string xpath, string xml, int index)
        {           
            try
            {
                var htmlDocument = new HtmlAgilityPack.HtmlDocument();
                htmlDocument.LoadHtml(xml);

                HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode(string.Format(xpath, index));
               
                return node.InnerText;
            }
            catch (Exception e)
            {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", e.InnerException.Message.ToString(), System.Diagnostics.EventLogEntryType.Error);
                return null;
            }
        }

        public static string CleanHtml(string xml) {           
            var htmlDocument = new HtmlAgilityPack.HtmlDocument();
            htmlDocument.LoadHtml(xml); 
            xml = htmlDocument.DocumentNode.OuterHtml;
            var sanitizer = new HtmlSanitizer();
            xml = sanitizer.Sanitize(xml);
            return xml;        
        }
     
        public static double EvaluateXPathExression(string xpath, string raw) {

            var htmlDocument = new HtmlAgilityPack.HtmlDocument();
            htmlDocument.LoadHtml(raw);
            XPathNavigator navigator = htmlDocument.CreateNavigator();
            
            return (double)navigator.Evaluate(xpath);
        }
    }
}