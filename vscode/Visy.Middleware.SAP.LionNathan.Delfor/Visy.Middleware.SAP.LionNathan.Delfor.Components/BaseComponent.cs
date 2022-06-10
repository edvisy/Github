using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using Microsoft.XLANGs.BaseTypes;
using System.Text;

namespace Visy.Middleware.SAP.LionNathan.Delfor.Components
{

    /// <summary>
    /// The base class for processors.
    /// </summary>
    [Serializable]
    public class BaseComponent
    {
        /// <summary>
        /// Generic method to deserilize messages.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="inmsg"></param>
        /// <returns></returns>
        public T Deserialize<T>(XLANGMessage inmsg) where T : class 
        {
            XmlSerializer xmlSer = new XmlSerializer(typeof(T));
            Stream str = (Stream)inmsg[0].RetrieveAs(typeof(Stream));
            return (T)xmlSer.Deserialize(str);
        }

        /// <summary>
        /// Generic method to serialize objects.
        /// </summary>
        /// <param name="obj">The object to be serialized.</param>
        /// <returns>The serialized string.</returns>
        public XmlDocument Serialize(object obj)
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
    }
}
