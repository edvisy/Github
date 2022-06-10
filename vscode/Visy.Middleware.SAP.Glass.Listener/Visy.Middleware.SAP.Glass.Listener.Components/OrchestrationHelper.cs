using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.Glass.Listener.Components
{
    public class OrchestrationHelper
    {
        public static string CreateStringFromXLANGMessage(XLANGMessage message, int index)
        {
            // The string to be returned
            var toReturn = String.Empty;

            try
            {
                // Get the message part as a Stream and create a reader which will read in the stream
                using (StreamReader reader = new StreamReader(message[index].RetrieveAs(typeof(Stream)) as Stream))
                {
                    // Read in the message
                    toReturn = reader.ReadToEnd();
                }
            }
            finally
            {
                // Clean memory
                message.Dispose();
            }

            // Return the result
            return toReturn;
        }

        public static string GetMessageType(XLANGMessage message, int index)
        {

            return CreateStringFromXLANGMessage(message, index).Substring(39, 15).Trim();
        }
    }

 
}
