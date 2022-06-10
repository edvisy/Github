
using System;
using System.Resources;
using System.Drawing;
using System.Collections;
using System.Reflection;
using System.ComponentModel;
using System.Text;
using System.IO;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Diagnostics;
using System.Configuration;

using Newtonsoft;
using System.Xml;
using System.Xml.Linq;

namespace Visy.Middleware.SLX.Salesforce.PipelineComponents
{
    
    /// <summary>
    /// Implements custom pipeline component to append and/or prepend data to a stream.
    /// </summary>
    /// <remarks>
    /// FixMag class implements pipeline component that can be used in receive and
    /// send BizTalk pipelines. The pipeline component gets a data stream, appends
    /// and/or prepends user specified data to it and outputs modified stream.
    ///</remarks>
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]   
    [System.Runtime.InteropServices.Guid("318af758-4eaf-40af-94d5-55d395a6a09d")]
    public class JSONToXML :	
        IBaseComponent, 
        Microsoft.BizTalk.Component.Interop.IComponent     
    {
        /// Converts a string to its byte representation.
        /// </summary>
        /// <param name="str">String to be converted to byte representation.</param>
        /// <returns>Array of bytes that represents the string.</returns>
        private byte[] ConvertToBytes(string str)
        {
            byte[] data = null;

            if (str != null)
                data = UTF8Encoding.UTF8.GetBytes(str);

            return data;
        }

        #region IBaseComponent
        
        /// <summary>
        /// Name of the component.
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get {   return "JSONToXMLConverter";  }
        }
        
        /// <summary>
        /// Version of the component.
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get {   return "1.0";   }
        }
        
        /// <summary>
        /// Description of the component.
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get {   return "JSON To XML Converter Component"; }
        }
    
        #endregion
        
        #region IComponent

        /// <summary>
        /// Implements IComponent.Execute method.
        /// </summary>
        /// <param name="pc">Pipeline context</param>
        /// <param name="inmsg">Input message.</param>
        /// <returns>Processed input message with appended or prepended data.</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in pipeline component.
        /// </remarks>
        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            XNamespace newNs = "http://Visy.Middleware.SLX.Salesforce.Schemas.GetLgxCustomerCode";

            Stream s = inmsg.BodyPart.GetOriginalDataStream();

            string content = string.Empty;

            using (StreamReader sr = new StreamReader(s)) {
                    content = sr.ReadToEnd();
            }
            XmlDocument doc = Newtonsoft.Json.JsonConvert.DeserializeXmlNode("{\"result\":" + content + "}", "Response");

            XDocument xdoc = XDocument.Parse(doc.OuterXml);           

            xdoc.Root.Add(new XAttribute(XNamespace.Xmlns + "ns0", newNs));
            xdoc.Root.Name = newNs + "Response";
           
            byte[] bytes = Encoding.ASCII.GetBytes(xdoc.ToString());
            MemoryStream ms = new MemoryStream();
            ms.Write(bytes, 0, bytes.Length);
            ms.Position = 0;

            inmsg.BodyPart.Data = ms;

            return inmsg;
        }

        

        #endregion


    }
}
