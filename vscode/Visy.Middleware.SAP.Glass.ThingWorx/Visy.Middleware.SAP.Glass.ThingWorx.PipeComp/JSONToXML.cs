
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
using System.Collections.Generic;

namespace Visy.Middleware.SAP.BO.MeterDynamics.PipelineComponents
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
    [System.Runtime.InteropServices.Guid("318af758-4eaf-40af-94d5-55d395a6a09c")]
    public class JSONToXML : IBaseComponent, IComponentUI, IPersistPropertyBag, IDisassemblerComponent 
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
        #region Public Properties
        // Properties declarations.
        private string _nameSpace;
        public string NameSpace
        {
            get { return string.IsNullOrEmpty(_nameSpace) ? "http://Visy.Middleware" : _nameSpace; }
            set { _nameSpace = value; }
        }

        private string _rootNode;
        public string RootNode
        {
            get { return string.IsNullOrEmpty(_rootNode) ? "rootnode" : _rootNode; }
            set { _rootNode = value; }
        }

        #endregion

        #region IBaseComponent

        /// <summary>
        /// Name of the component.
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get {   return "GenericJSONToXMLConverter";  }
        }
        
        /// <summary>
        /// Version of the component.
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get {   return "1.0.0.1";   }
        }
        
        /// <summary>
        /// Description of the component.
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get {   return "Generic JSON To XML Converter Component"; }
        }

        public IntPtr Icon
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        #endregion
        #region IPersistPropertyBag members
        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">
        /// Class ID of the component
        /// </param>
        public void GetClassID(out System.Guid classid)
        {
            classid = new System.Guid("0022db2c-1599-3108-9312-ec4f9bddff356");
        }
        /// <summary>
        /// not implemented
        /// </summary>
        public void InitNew()
        {
        }
        /// <summary>
        /// Loads configuration properties for the component
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="errlog">Error status</param>
        public virtual void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, int errlog)
        {
            object val;
            val = this.ReadPropertyBag(pb, "NameSpace");
            if (val != null)
            {
                this.NameSpace = ((string)(val));
            }
            val = this.ReadPropertyBag(pb, "RootNode");
            if (val != null)
            {
                this.RootNode = ((string)(val));
            }            
        }
        /// <summary>
        /// Saves the current component configuration into the property bag
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="fClearDirty">not used</param>
        /// <param name="fSaveAllProperties">not used</param>
        public virtual void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
            this.WritePropertyBag(pb, "NameSpace", this.NameSpace);
            this.WritePropertyBag(pb, "RootNode", this.RootNode);                   
        }

        private object ReadPropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName, out val, 0);
            }
            catch (System.ArgumentException)
            {
                return val;
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
            return val;
        }
        /// <summary>
        /// Writes property values into a property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <param name="val">Value of property.</param>
        private void WritePropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
        }
        #endregion

        #region IComponent
        

        public IEnumerator Validate(object projectSystem)
        {
            return null;
        }
        private Queue<IBaseMessage> qOutputMsgs = new Queue<IBaseMessage>();
        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            XNamespace newNs = this.NameSpace;

            Stream s = pInMsg.BodyPart.GetOriginalDataStream();

            string content = string.Empty;

            using (StreamReader sr = new StreamReader(s))
            {
                content = sr.ReadToEnd();
            }
            XmlDocument doc = Newtonsoft.Json.JsonConvert.DeserializeXmlNode(content, this.RootNode);

            XDocument xdoc = XDocument.Parse(doc.OuterXml);

            xdoc.Root.Add(new XAttribute(XNamespace.Xmlns + "ns0", newNs));
            xdoc.Root.Name = newNs + RootNode;

            byte[] bytes = Encoding.ASCII.GetBytes(xdoc.ToString());
            MemoryStream ms = new MemoryStream();
            ms.Write(bytes, 0, bytes.Length);
            ms.Position = 0;

            //pInMsg.BodyPart.Data = ms;
            IBaseMessage outMsg = pContext.GetMessageFactory().CreateMessage();
            outMsg.AddPart("Body", pContext.GetMessageFactory().CreateMessagePart(), true);
            outMsg.Context = pInMsg.Context;
            outMsg.GetPart("Body").Data = ms;

            outMsg.BodyPart.Data.Seek(0, SeekOrigin.Begin);

            qOutputMsgs.Enqueue(outMsg);
            //return pInMsg;
        }

        public IBaseMessage GetNext(IPipelineContext pContext)
        {

            if (qOutputMsgs.Count > 0)
            {
                return (IBaseMessage)qOutputMsgs.Dequeue();
            }
            else
                return null;
        }



        #endregion


    }
}
