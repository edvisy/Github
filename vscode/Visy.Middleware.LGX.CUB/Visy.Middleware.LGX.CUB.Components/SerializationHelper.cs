using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using Microsoft.XLANGs.BaseTypes;
using System.Text;

namespace Visy.Middleware.LGX.CUB.Components
{
    [Serializable]
    public static class SerializationHelper
    {
        /// <summary>
        /// Generic method to deserilize messages.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="inmsg"></param>
        /// <returns></returns>
        public static T Deserialize<T>(XLANGMessage inmsg) where T : class
        {
            try
            {
                XmlSerializer xmlSer = new XmlSerializer(typeof(T));
                Stream str = (Stream)inmsg[0].RetrieveAs(typeof(Stream));
                return (T)xmlSer.Deserialize(str);
            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function Deserialize() :" + Ex.Message, "Error");
                return null;
                throw Ex;
            }
        }

        /// <summary>
        /// Generic method to serialize objects.
        /// </summary>
        /// <param name="obj">The object to be serialized.</param>
        /// <returns>The serialized string.</returns>
        public static XmlDocument Serialize(object obj)
        {
            try
            {
                if (obj == null) throw new ArgumentNullException("obj cannot be null");

                XmlDocument response = new XmlDocument();
                XmlSerializer serializer = new XmlSerializer(obj.GetType());
                using (StringWriter sw = new StringWriter())
                {
                    serializer.Serialize(sw, obj);
                    response.LoadXml(sw.ToString());
                }

                return response;
            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function Serialize() :" + Ex.Message, "Error");
                return null;
                throw Ex;
            }
        }
    }
}
