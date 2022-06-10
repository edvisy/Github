using System;
using System.IO;
using System.Xml;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;

namespace Visy.BizTalk.Pipelines.BatchComponentFull
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]

    [System.Runtime.InteropServices.Guid("655B591F-8994-4e52-8ECD-2D7E8E78B25C")]

    public class Grouping : IBaseComponent, IComponentUI, IPersistPropertyBag, IDisassemblerComponent
    {

        System.Collections.Queue qOutputMsgs = new System.Collections.Queue();
        private string systemPropertiesNamespace = @"http://schemas.microsoft.com/BizTalk/2003/system-properties";

        #region IBaseComponent Members
        public string Description
        {
            get
            {
                return "Pipeline component used to group xml based on field.";
            }
        }
        public string Name
        {
            get
            {
                return "Group Full XMLs";
            }
        }
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }
        #endregion

        #region IComponentUI Members

        public IntPtr Icon
        {
            get
            {
                return new System.IntPtr();
            }
        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        #endregion

        #region IPersistPropertyBag Members

        private string _strNamespace;
        private string _strHeaderElement;
        private string _strRecordElement;
        private string _strKeyElement;

        public string strNamespace
        {
            get { return _strNamespace; }
            set { _strNamespace = value; }
        }
        public string strHeaderElement
        {
            get { return _strHeaderElement; }
            set { _strHeaderElement = value; }
        }
        public string strRecordElement
        {
            get { return _strRecordElement; }
            set { _strRecordElement = value; }
        }
        public string strKeyElement
        {
            get { return _strKeyElement; }
            set { _strKeyElement = value; }
        }
        public void GetClassID(out Guid classID)
        {
            classID = new Guid("655B591F-8994-4e52-8ECD-2D7E8E78B25C");
        }
        public void InitNew()
        {

        }
        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object _Namespace = null;
            object _HeaderName = null;
            object _RecordName = null;
            object _elementName = null;
            try
            {
                _Namespace = ReadPropertyBag(propertyBag, "Namespace");
                _HeaderName = ReadPropertyBag(propertyBag, "HeaderNode");
                _RecordName = ReadPropertyBag(propertyBag, "RecordNode");
                _elementName = ReadPropertyBag(propertyBag, "KeyElement");
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error reading propertybag: " + ex.Message);
            }

            if (_Namespace != null)
                _strNamespace = (string)_Namespace;
            if (_HeaderName != null)
                _strHeaderElement = (string)_HeaderName;
            if (_RecordName != null)
                _strRecordElement = (string)_RecordName;
            if (_elementName != null)
                _strKeyElement = (string)_elementName;
        }
        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val;

            val = (object)_strKeyElement;
            propertyBag.Write("Namespace", ref val);

            val = (object)_strHeaderElement;
            propertyBag.Write("HeaderNode", ref val);

            val = (object)_strRecordElement;
            propertyBag.Write("RecordNode", ref val);

            val = (object)_strKeyElement;
            propertyBag.Write("KeyElement", ref val);
        }
        #endregion

        #region IComponent Members
        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            StringBuilder sbMessage = new StringBuilder();

            string strOrderID = string.Empty;
            ArrayList alOrderID = new ArrayList();
            XmlDocument xDoc = new XmlDocument();
            XmlDocument xOutDoc = new XmlDocument();
            XmlNodeList XList;
            XmlNamespaceManager nsmgr;
            XmlNode xnHeader;

            try
            {
                #region Process XML
                xDoc.Load(pInMsg.BodyPart.GetOriginalDataStream());
                xOutDoc.LoadXml(xDoc.InnerXml);

                nsmgr = new XmlNamespaceManager(xDoc.NameTable);
                nsmgr.AddNamespace("ns0", strNamespace);

                xnHeader = !string.IsNullOrEmpty(strHeaderElement) ? xOutDoc.SelectSingleNode("//ns0:" + strHeaderElement, nsmgr) : null;
                XList = xOutDoc.SelectNodes("//ns0:" + strRecordElement, nsmgr);
                foreach (XmlNode xN in XList)
                {
                    xN.ParentNode.RemoveChild(xN);
                }
                XList = xDoc.SelectNodes("//ns0:" + strRecordElement, nsmgr);

                #region Extract Values
                foreach (XmlNode xn in XList)
                {
                    if (xn[strKeyElement] != null) { 
                        strOrderID = xn[strKeyElement].InnerText;
                        if (!alOrderID.Contains(strOrderID) && !string.IsNullOrEmpty(strOrderID.Trim()))
                        {
                            alOrderID.Add(strOrderID);
                        }
                    }
                }
                #endregion

                foreach (string strUOrderID in alOrderID)
                {
                    XList = xDoc.SelectNodes("//ns0:" + strRecordElement + "[ns0:" + strKeyElement + "='" + strUOrderID + "']", nsmgr);
                    foreach (XmlNode xNode in XList)
                    {
                        sbMessage.Append(xNode.OuterXml);
                    }
                    var strHeader = xnHeader == null ? string.Empty : xnHeader.OuterXml;
                    xOutDoc.DocumentElement.InnerXml = strHeader + sbMessage.ToString();
                    CreateOutgoingMessage(pContext, pInMsg.Context, pInMsg.BodyPart, xOutDoc.InnerXml, strNamespace, xOutDoc.DocumentElement.Name);
                    sbMessage.Clear();
                }

                if (alOrderID.Count == 0) {
                    throw new ApplicationException("Error in writing outgoing messages: Please check input file if Grouping ID is present");
                }
                #endregion
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in writing outgoing messages: " + ex.Message);
            }
        }
        #endregion

        #region Private Functions
        private object ReadPropertyBag(IPropertyBag propertyBag, string propName)
        {
            object val = null;
            try
            {
                propertyBag.Read(propName, out val, 0);
            }
            catch (ArgumentException)
            {
                return val;
            }
            catch (Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
            return val;
        }
        private void CreateOutgoingMessage(IPipelineContext pContext, IBaseMessageContext sourceContext, IBaseMessagePart part, String messageString, string namespaceURI, string rootElement)
        {
            IBaseMessage outMsg;
            try
            {
                //create outgoing message
                outMsg = pContext.GetMessageFactory().CreateMessage();
                outMsg.AddPart("Body", pContext.GetMessageFactory().CreateMessagePart(), true);
                byte[] bufferOoutgoingMessage = System.Text.ASCIIEncoding.ASCII.GetBytes(messageString);
                outMsg.BodyPart.Data = new MemoryStream(bufferOoutgoingMessage);
                outMsg.Context = sourceContext;
                outMsg.Context.Promote("MessageType", systemPropertiesNamespace, namespaceURI + "#" + rootElement.Replace("ns0:", ""));
                qOutputMsgs.Enqueue(outMsg);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in queueing outgoing messages: " + ex.Message);
            }
        }
        public IBaseMessage GetNext(IPipelineContext pContext)
        {
            if (qOutputMsgs.Count > 0)
                return (IBaseMessage)qOutputMsgs.Dequeue();
            else
                return null;
        }
        #endregion
    }
}
