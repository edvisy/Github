using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Microsoft.XLANGs.BaseTypes;
using System.Configuration;
using System.IO;

namespace Visy.Middleware.Components.Utilities
{
    public class HTMLHelper
    {
        public static string FromXML(XLANGPart part, string xsl_name)
        {
            //string html_out = "";
            //System.Xml.Xsl.XslTransform xslt = new System.Xml.Xsl.XslTransform();
            
            //xslt.Transform(xml_in, html_out);

            XslTransform transform = new XslTransform();
            System.Xml.XmlDocument xmld = new XmlDocument();
            StringBuilder sb = new StringBuilder();
            string xml_data = "";

            
            string base_dir = "";
            try
            {
                base_dir = ConfigurationSettings.AppSettings["BiztalkStyleSheetsBaseDir"].ToString();
                
            }
            catch (Exception ex_conn)
            {
                throw (new Exception("Missing entry in Machine.config/appsettings for BiztalkStyleSheetsBaseDir.", ex_conn));
            }

            //READ XML
            Stream s = (Stream)part.RetrieveAs(typeof(Stream));
            using ( StreamReader reader = new StreamReader(s) ) {
                xml_data =  reader.ReadToEnd();
            }
            //load xml data and create XPath to navigate
            xmld.LoadXml(xml_data);
            XPathNavigator xpath = xmld.CreateNavigator();           
            System.IO.StringWriter swr = new System.IO.StringWriter(sb);
            //load style sheet and transform
            string xsl_path = base_dir + xsl_name;
            transform.Load(xsl_path);
            transform.Transform(xpath,null,swr);
            
            
            return (sb.ToString());

            


        }
    }
}
