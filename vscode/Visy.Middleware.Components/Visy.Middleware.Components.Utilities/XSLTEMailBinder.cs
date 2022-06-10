using System;
using System.Collections.Generic;
using System.Xml;
using System.Text;
using System.Xml.XPath;
using System.Xml.Xsl;
using System.IO;

using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.Components.Utilities
{
    public class XSLTEMailBinder
    {
        public static string XSLTEmailBind(string path, XLANGPart msg_part)
        {
            #region  Create HTML ( XML + XSLT )

            XslTransform transform = new XslTransform();
            System.Xml.XmlDocument xmld = new XmlDocument();
            StringBuilder sb = new StringBuilder();
            string xml_data = "";


            

            //READ XML
            Stream s = (Stream)msg_part.RetrieveAs(typeof(Stream));
            using (StreamReader reader = new StreamReader(s))
            {
                xml_data = reader.ReadToEnd();
            }
            //load xml data and create XPath to navigate
            xmld.LoadXml(xml_data);
            XPathNavigator xpath = xmld.CreateNavigator();
            System.IO.StringWriter swr = new System.IO.StringWriter(sb);
            //load style sheet and transform
            transform.Load(path);
            transform.Transform(xpath, null, swr);

            return sb.ToString();
            #endregion
        }
        
    }
}
