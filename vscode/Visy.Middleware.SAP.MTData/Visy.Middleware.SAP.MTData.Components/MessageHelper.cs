using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using System.IO;
using System.Xml.Schema;
using System.Text.RegularExpressions;

namespace Visy.Middleware.SAP.MTData.Components
{
    public class MessageHelper
    {
        public static XmlDocument CreateCheckLoginMessage(string username, string encryptedPassword)
        {
            XmlDocument xmlDocument = new XmlDocument();

            CheckLogin instance = new CheckLogin();

            instance.appCredentials = new AppCredentials();

            instance.appCredentials.UserID = 0;
            instance.appCredentials.Username = username;
            instance.appCredentials.Password = encryptedPassword;

            XmlSerializer serialiser = new XmlSerializer(typeof(CheckLogin));

            using (MemoryStream stream = new MemoryStream())
            {
                serialiser.Serialize(stream, instance);
                stream.Flush();
                stream.Seek(0, SeekOrigin.Begin);

                xmlDocument.Load(stream);
            }

            return xmlDocument;
        }

        public static XmlDocument CreateMessageHeader(string messageType, string messageVersion, string interchangeId, string sender, string recipient)
        {
            XmlDocument xmlDocument = new XmlDocument();

            MessageHeader instance = new MessageHeader();

            instance.MessageType = messageType;
            instance.MessageVersion = messageVersion;
            instance.InterchangeID = interchangeId;
            instance.Sender = sender;
            instance.Recipient = recipient;
            instance.CreatedDateTime = DateTime.Now;

            XmlSerializer serialiser = new XmlSerializer(typeof(MessageHeader));

            using (MemoryStream stream = new MemoryStream())
            {
                serialiser.Serialize(stream, instance);
                stream.Flush();
                stream.Seek(0, SeekOrigin.Begin);

                xmlDocument.Load(stream);
            }

            return xmlDocument;
        }


        /// <summary>
        /// Convert an XLANG/s message to its Xml string representation
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public static string MessageToXml(XmlDocument message)
        {
            return message.OuterXml;
        }

        /// <summary>
        /// Convert an Xml string to an XLANG/s message
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static XmlDocument XmlToMessage(string xml, string rootNode, string targetNamespace)
        {
            const string prepend = "<![CDATA[";
            const string append = "]]>";

            // Log arguments to Trace
            System.Diagnostics.Trace.WriteLine(String.Format("XmlToMessage: xml=\"{0}\", targetNamespace=\"{1}\"",
                xml,
                targetNamespace)
            );

   //         xml = System.Security.SecurityElement.Escape(xml);

            xml = xml.Replace(prepend, String.Empty)
                    .Replace(append, String.Empty)
                    .Replace("&gt;", ">")
                    .Replace("&lt;", "<").Replace("&","&amp;");

            
            // We need to specify the namespace and alias on the root node
            //xml = xml.Replace(
            //    String.Format("<{0}", rootNode),
            //    String.Format("<ns0:{0} xmlns:ns0='{1}'", rootNode, targetNamespace))
            //    .Replace(
            //        String.Format("</{0}>", rootNode),
            //        String.Format("</ns0:{0}>", rootNode));

            xml = Regex.Replace(xml,
                String.Format("^<{0}\\b", rootNode),
                String.Format("<ns0:{0} xmlns:ns0='{1}'", rootNode, targetNamespace));
            xml = Regex.Replace(xml,
                String.Format("</{0}>$", rootNode),
                String.Format("</ns0:{0}>", rootNode));

            //XmlReaderSettings settings = new XmlReaderSettings();
            //settings.ConformanceLevel = ConformanceLevel.Fragment;
            //settings.ValidationFlags = XmlSchemaValidationFlags.None;

            //XmlReader reader = XmlReader.Create(new StringReader(xml), settings);

            //reader.ReadStartElement()
            //reader.

            XmlDocument message = new XmlDocument();
 
            message.LoadXml(xml);

            if (!String.IsNullOrEmpty(targetNamespace))
                message.DocumentElement.SetAttribute("xmlns", targetNamespace);

            return message;

            //XmlDocument outputDoc = new XmlDocument();

            //outputDoc.LoadXml(message.OuterXml);

            //return outputDoc;
        }



        public static XmlDocument CreateSettingsMessage()
        {
            XmlDocument xmlDocument = new XmlDocument();

            // Template for the Settings message
            string xml = String.Format(
                @"<ns0:KeyValueSet xmlns:ns0='http://ecommerce.visy.com.au/integration/services/logisticswebservice/keyvalueset/1.0.0'>
                      <KeyValue>
                        <Key>Username</Key>
                        <Value></Value>
                      </KeyValue>
                      <KeyValue>
                        <Key>Password</Key>
                        <Value></Value>
                      </KeyValue>
                      <KeyValue>
                        <Key>Environment</Key>
                        <Value>{0}</Value>
                      </KeyValue>
                      <KeyValue>
                        <Key>Sender</Key>
                        <Value></Value>
                      </KeyValue>
                      <KeyValue>
                        <Key>Recipient</Key>
                        <Value></Value>
                      </KeyValue>
                    </ns0:KeyValueSet>",
                Environment.MachineName);

            xmlDocument.LoadXml(xml);

            return xmlDocument;
        }

        public static string ExtractReturnValue(string xml, string xpath, string webResponseType)
        {
            string returnValue = null;
            XmlDocument xmlDocument = new XmlDocument();

            // Log arguments to Trace
            System.Diagnostics.Trace.WriteLine(String.Format("ExtractReturnValue: xml=\"{0}\", xpath=\"{1}\", webResponseType=\"{2}\"",
                xml,
                xpath,
                webResponseType)
            );

            xmlDocument.LoadXml(xml);

            // Check if the document contains an "Error" node
            if (String.Compare(xmlDocument.FirstChild.LocalName, "Error", true) == 0)
            {
                string errorMessage = "Unexpected message returned from MTData.";

                XmlNode errorMessageNode = xmlDocument.SelectSingleNode("//*[local-name()='Error']/*[local-name()='ErrorMessage']");

                if (errorMessageNode != null)
                    errorMessage = errorMessageNode.InnerText;

                // Log arguments to Trace
                System.Diagnostics.Trace.WriteLine(String.Format("ExtractReturnValue: Throwing exception. Message=\"{0}\"",
                    errorMessage));

                // Throw the exception
                throw new MTDataException(errorMessage, webResponseType, xml);
            }

            XmlNode queryNode = xmlDocument.SelectSingleNode(xpath);

            if (queryNode != null)
            {
                returnValue = queryNode.InnerText;
            }
            
            // Log arguments to Trace
            System.Diagnostics.Trace.WriteLine(String.Format("ExtractReturnValue: returnValue=\"{0}\"",
                returnValue));

                // Return the value
            return returnValue;
        }
    }
}
