
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using System;
using System.Collections;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Xml;

namespace Visy.Middleware.Pipelines.BatchComponent
{
    [ComponentCategory("9d0e4101-4cce-4536-83fa-4a5040674ad6")]
    [Guid("655B591F-8994-4e52-8ECD-2D7E8E78B25C")]
    [ComponentCategory("9d0e4100-4cce-4536-83fa-4a5040674ad6")]
    public class Grouping : IBaseComponent, IComponentUI, IPersistPropertyBag, IDisassemblerComponent
    {
        private Queue qOutputMsgs;
        private string systemPropertiesNamespace;
        private string _strNamespace;
        private string _strHeaderElement;
        private string _strRecordElement;
        private string _strKeyElement;

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
                return "Group XMLs";
            }
        }

        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }

        public IntPtr Icon
        {
            get
            {
                return new IntPtr();
            }
        }

        public string strNamespace
        {
            get
            {
                return this._strNamespace;
            }
            set
            {
                this._strNamespace = value;
            }
        }

        public string strHeaderElement
        {
            get
            {
                return this._strHeaderElement;
            }
            set
            {
                this._strHeaderElement = value;
            }
        }

        public string strRecordElement
        {
            get
            {
                return this._strRecordElement;
            }
            set
            {
                this._strRecordElement = value;
            }
        }

        public string strKeyElement
        {
            get
            {
                return this._strKeyElement;
            }
            set
            {
                this._strKeyElement = value;
            }
        }

        public Grouping()
        {
            this.qOutputMsgs = new Queue();
            this.systemPropertiesNamespace = "http://schemas.microsoft.com/BizTalk/2003/system-properties";         
        }

        public IEnumerator Validate(object projectSystem)
        {
            return (IEnumerator)null;
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
            object obj1;
            object obj2;
            object obj3;
            object obj4;
            try
            {
                obj1 = this.ReadPropertyBag(propertyBag, "Namespace");
                obj2 = this.ReadPropertyBag(propertyBag, "HeaderNode");
                obj3 = this.ReadPropertyBag(propertyBag, "RecordNode");
                obj4 = this.ReadPropertyBag(propertyBag, "KeyElement");
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error reading propertybag: " + ex.Message);
            }
            if (obj1 != null)
                this._strNamespace = (string)obj1;
            if (obj2 != null)
                this._strHeaderElement = (string)obj2;
            if (obj3 != null)
                this._strRecordElement = (string)obj3;
            if (obj4 == null)
                return;
            this._strKeyElement = (string)obj4;
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object strKeyElement1 = (object)this._strKeyElement;
            propertyBag.Write("Namespace", ref strKeyElement1);
            object strHeaderElement = (object)this._strHeaderElement;
            propertyBag.Write("HeaderNode", ref strHeaderElement);
            object strRecordElement = (object)this._strRecordElement;
            propertyBag.Write("RecordNode", ref strRecordElement);
            object strKeyElement2 = (object)this._strKeyElement;
            propertyBag.Write("KeyElement", ref strKeyElement2);
        }

        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            StringBuilder stringBuilder = new StringBuilder();
            string empty = string.Empty;
            ArrayList arrayList = new ArrayList();
            XmlDocument xmlDocument1 = new XmlDocument();
            XmlDocument xmlDocument2 = new XmlDocument();
            try
            {
                xmlDocument1.Load(pInMsg.BodyPart.GetOriginalDataStream());
                xmlDocument2.LoadXml(xmlDocument1.InnerXml);
                XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlDocument1.NameTable);
                nsmgr.AddNamespace("ns0", this.strNamespace);
                XmlNode xmlNode = xmlDocument2.SelectSingleNode("//ns0:" + this.strHeaderElement, nsmgr);
                foreach (XmlNode selectNode in xmlDocument2.SelectNodes("//ns0:" + this.strRecordElement, nsmgr))
                    selectNode.ParentNode.RemoveChild(selectNode);
                foreach (XmlNode selectNode in xmlDocument1.SelectNodes("//ns0:" + this.strRecordElement, nsmgr))
                {
                    string innerText = selectNode[this.strKeyElement].InnerText;
                    if (!arrayList.Contains((object)innerText))
                        arrayList.Add((object)innerText);
                }
                foreach (string str in arrayList)
                {
                    foreach (XmlNode selectNode in xmlDocument1.SelectNodes("//ns0:" + this.strRecordElement + "[ns0:" + this.strKeyElement + "='" + str + "']", nsmgr))
                        stringBuilder.Append(selectNode.OuterXml);
                    xmlDocument2.DocumentElement.FirstChild.InnerXml = xmlNode.OuterXml + stringBuilder.ToString();
                    this.CreateOutgoingMessage(pContext, pInMsg.Context, pInMsg.BodyPart, xmlDocument2.InnerXml, this.strNamespace, xmlDocument2.DocumentElement.Name);
                    stringBuilder.Clear();
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in writing outgoing messages: " + ex.Message);
            }
        }

        private object ReadPropertyBag(IPropertyBag propertyBag, string propName)
        {
            object ptrVar = (object)null;
            try
            {
                propertyBag.Read(propName, out ptrVar, 0);
            }
            catch (ArgumentException ex)
            {
                return ptrVar;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            return ptrVar;
        }

        private void CreateOutgoingMessage(IPipelineContext pContext, IBaseMessageContext sourceContext, IBaseMessagePart part, string messageString, string namespaceURI, string rootElement)
        {
            try
            {
                IBaseMessage message = pContext.GetMessageFactory().CreateMessage();
                message.AddPart("Body", pContext.GetMessageFactory().CreateMessagePart(), true);
                byte[] bytes = Encoding.ASCII.GetBytes(messageString);
                message.BodyPart.Data = (Stream)new MemoryStream(bytes);
                message.Context = sourceContext;
                message.Context.Promote("MessageType", this.systemPropertiesNamespace, (object)(namespaceURI + "#" + rootElement.Replace("ns0:", "")));
                this.qOutputMsgs.Enqueue((object)message);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in queueing outgoing messages: " + ex.Message);
            }
        }

        public IBaseMessage GetNext(IPipelineContext pContext)
        {
            if (this.qOutputMsgs.Count > 0)
                return (IBaseMessage)this.qOutputMsgs.Dequeue();
            return (IBaseMessage)null;
        }
    }
}
