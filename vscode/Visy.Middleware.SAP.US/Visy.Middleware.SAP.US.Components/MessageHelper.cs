using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Visy.Middleware.SAP.US.Components
{
    public class MessageHelper
    {
        /// <summary>
        /// Adds/updates a MessageStatus node to the end of a document
        /// </summary>
        /// <param name="message"></param>
        /// <param name="messageStatus"></param>
        /// <param name="errorType"></param>
        /// <param name="errorText"></param>
        /// <returns></returns>
        public static XmlDocument AddMessageStatus(XmlDocument message, string messageStatus, string errorType, string errorText)
        {
            XmlNode messageStatusNode = message.SelectSingleNode("//*[local-name()='MessageStatus']");

            if (messageStatusNode != null)
            {
                XmlElement statusNode = (XmlElement)messageStatusNode.SelectSingleNode("*[local-name()='StatusCode']");

                if (statusNode == null)
                {
                    statusNode = (XmlElement)messageStatusNode.AppendChild(message.CreateElement("StatusCode", String.Empty));
                }
                statusNode.InnerText = messageStatus;

                // Check if this is a "SUCCESS" status or not
                if (String.Compare(messageStatus, "Success", true) != 0)
                {
                    // We need to create the Errors/Error nodes
                    XmlElement errorsNode = (XmlElement)messageStatusNode.SelectSingleNode("*[local-name()='Errors']");

                    if (errorsNode == null)
                    {
                        errorsNode = (XmlElement)messageStatusNode.AppendChild(message.CreateElement("Errors", String.Empty));
                    }

                    XmlElement errorNode = (XmlElement)errorsNode.AppendChild(message.CreateElement("Error", String.Empty));

                    errorNode.InnerText = errorText;

                    XmlAttribute errorTypeAttr = (XmlAttribute)errorNode.Attributes.Append(message.CreateAttribute("errorType"));

                    errorTypeAttr.Value = errorType;

                }
            }

            return message;

        }

        // Helper method for adding an Exception to a Response message
        public static XmlDocument AddMessageStatus(XmlDocument message, Exception exception)
        {
            return AddMessageStatus(message, "FAILED", exception.GetType().Name, exception.Message);
        }

    }
}
