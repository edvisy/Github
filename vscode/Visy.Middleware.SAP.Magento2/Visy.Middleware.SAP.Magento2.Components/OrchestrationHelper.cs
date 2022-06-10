using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.BizTalk.Streaming;
using Microsoft.XLANGs.Core;
using System.Xml;
using Microsoft.BizTalk.XLANGs.BTXEngine;
using System.IO;

namespace Visy.Middleware.SAP.Magento2.Components
{

   
    public class OrchestrationHelper
    {
        public static string GetSplittedStringVal(string strString, char delimiter, int pos) {  
                    
            return strString.Contains(delimiter) ? strString.Split(delimiter)[pos] : strString;
        }

        public static XLANGMessage CreateXLANGMessageFromString(string message, string messagePartName)
        {
            // The BTX message used to create the XLANGMessage later on 
            var customBTXMessage = CreateMessagePart(message, messagePartName, null, 0);

            // Return the XLANGMessage 
            return customBTXMessage.GetMessageWrapperForUserCode();
        }
        public static bool IsNumeric(string text)
        {
            double test;
            return double.TryParse(text, out test);
        }
        private static CustomBTXMessage CreateMessagePart(string message, string messagePartName, CustomBTXMessage customBTXMessage, int index)
        {
            // Create a VirtualStream for memory optimization 
            const int bufferSize = 640;
            const int thresholdSize = 1048576; // 1MB 
            var stream = new VirtualStream(bufferSize, thresholdSize);

            // Make sure booleans are in lowercasing, or we could get exceptions in BizTalk if this is a promoted property / distinguished field 
            message = message.Replace("True", "true").Replace("False", "false");

            // Create a reader which will be used to read through the message 
            using (var reader = new XmlTextReader(new StringReader(message)))
            {
                // Create a writer used to write the outgoing message 
                using (var writer = XmlWriter.Create(stream, new XmlWriterSettings { ConformanceLevel = ConformanceLevel.Auto, Encoding = Encoding.UTF8 }))
                {
                    // Read through the message 
                    while (reader.Read())
                    {
                        // Once we know the rootnode name, we can create the BTX message 
                        if (customBTXMessage == null && reader.NodeType == XmlNodeType.Element)
                        {
                            // Create a CustomBTXMessage, which will be used to create our XLANGMessage 
                            customBTXMessage = new CustomBTXMessage(reader.LocalName, Service.RootService.XlangStore.OwningContext);
                        }

                        // Write the current element 
                        writer.WriteNode(reader, true);
                    }
                }
            }

            // Reset the stream 
            stream.Seek(0, SeekOrigin.Begin);

            // Add message part 
            customBTXMessage.AddPart(string.Empty, messagePartName);

            // Load the message we just created 
            customBTXMessage[index].LoadFrom(stream);

            return customBTXMessage;
        }

        public static string CreateStringFromXLANGMessage(XLANGMessage message, int index)
        {
            string toReturn;

            try
            {

                using (var reader = new StreamReader(message[index].RetrieveAs(typeof(Stream)) as Stream))
                {
                    toReturn = reader.ReadToEnd();
                }
            }
            finally
            {
                // Clean memory 
                message.Dispose();
            }
            //
            return toReturn;
        }



    }

    [Serializable]
    internal sealed class CustomBTXMessage : BTXMessage
    {
        public CustomBTXMessage(string messageName, Context context)
            : base(messageName, context)
        {
            context.RefMessage(this);
        }
    }
}
