using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Xml.XPath;
using Microsoft.BizTalk.Streaming;
using System.Text.RegularExpressions;

namespace Visy.Middleware.LGX.Woolworths.PipelineComponents
{
    /// <summary>
    /// String Replacer pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3429c6")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class GetNodeValue : 
        IBaseComponent, IComponentUI, IPersistPropertyBag, 
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields

        private string _xpath = "";

        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;

        #endregion

        #region Public Properties


        [DisplayName("Xpath")]      
        public string Xpath
        {
            get { return _xpath; }
            set { _xpath = value; }
        }



        #endregion

        #region Private Properties

        private IPipelineContext PipelineContext
        {
            get
            {
                if (_pipelineContext == null)
                    throw new ArgumentNullException("_pipelineContext");
                return _pipelineContext;
            }
        }

        private IBaseMessage InMessage
        {
            get
            {
                if (_inMessage == null)
                    throw new ArgumentNullException("_inMessage");
                return _inMessage;
            }
        }

        #endregion

        #region IBaseComponent Members

        public string Description
        {
            get { return "Ariba.Common. Component"; }
        }

        public string Name
        {
            get { return "Ariba.Common.NodeDasm"; }
        }

        public string Version
        {
            get { return "1.0"; }
        }

        #endregion

        #region IComponentUI Members

        [Browsable(false)]
        public IntPtr Icon
        {
            get { return System.IntPtr.Zero; }
        }

        [Browsable(false)]
        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            System.Collections.IEnumerator enumerator = null;
            return enumerator;
        }

        #endregion

        #region IPersistPropertyBag Members

        public void GetClassID(out Guid classID)
        {
            classID = new System.Guid("35353bdc-fd2b-449c-bf9b-5a6faa3529c6");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = null;
            try
            {               

                propertyBag.Read("Xpath", out val, 0);
                if (val != null)
                    this.Xpath = (string)val;             

            }
            catch (ArgumentException) 
            {}
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {            
            object val = this.Xpath;
            propertyBag.Write("Xpath", ref val);         
        }

        #endregion

        #region IComponent Members

        /// <summary>
        /// Performs string removal on the input message data.
        /// </summary>
        /// <param name="pContext">The BizTalk's pipeline contenxt.</param>
        /// <param name="pInMsg">The original message.</param>
        /// <returns>The modified message.</returns>
        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            //To get Incoming message
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "Ariba.Common.PipelineComponents: " + Xpath);
            string docTypePattern = "<!DOCTYPE[^>[]*(\\[[^]]*\\])?>";

            using (StreamReader sReader = new StreamReader(pInMsg.BodyPart.Data)){
                var xmlString = sReader.ReadToEnd();
                xmlString = Regex.Replace(xmlString, docTypePattern, "");

                using (TextReader rdr = new StringReader(xmlString)) {
                   
                    XmlReader reader = XmlReader.Create(rdr);

                    XPathNavigator nav;
                    XPathDocument docNav;

                    docNav = new XPathDocument(reader);
                    nav = docNav.CreateNavigator();

                    string value = nav.SelectSingleNode(Xpath).Value;

                    pInMsg.Context.Promote("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", value + "~" + System.Guid.NewGuid());
                }                    
            }

            return pInMsg;            
        }
        #endregion

        #region Private Methods

        /// <summary>
        /// Creates new IBaseMessage with single message part (Body part).
        /// </summary>
        /// <param name="pContext">The pipeline context instance.</param>
        /// <param name="stream">The Body part data stream.</param>
        /// <returns>A new IBaseMessage instance.</returns>
        private IBaseMessage GetNewMessage(IPipelineContext pContext, Stream stream)
        {
            // Create new message
            IBaseMessage outMessage = pContext.GetMessageFactory().CreateMessage();
            // Create new message part part
            IBaseMessagePart bodyPart = pContext.GetMessageFactory().CreateMessagePart();

            // Copy context
            outMessage.Context = InMessage.Context;

            // Seek to the start of the stream
            if (stream.CanSeek)
                stream.Seek(0, SeekOrigin.Begin);
            // Set body part stream
            bodyPart.Data = stream;

            outMessage.AddPart("body", bodyPart, true);

            // Track the outbound stream
            pContext.ResourceTracker.AddResource(outMessage.BodyPart.Data);

           
            return outMessage;
        }

        #endregion
    }
}
