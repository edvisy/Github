using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Linq;
using Microsoft.BizTalk.Streaming;

namespace Visy.Middleware.Pipelines.ReplaceNamespace
{
    /// <summary>
    /// String Replacer pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3429c6")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class DocyTypeAssembler : 
        IBaseComponent, IComponentUI, IPersistPropertyBag, 
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields

        private string _docType = "<Blank>";
        private string _xmlVersion = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
    
        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;

        #endregion

        #region Public Properties


        [DisplayName("DocType")]
        [Description("This value will be added to xml first 2nd line")]
        public string DocType
        {
            get { return _docType; }
            set { _docType = value; }
        }


        [DisplayName("XmlVersion")]
        [Description("This value will be added to xml first 1st line")]
        public string XmlVersion
        {
            get { return _xmlVersion; }
            set { _xmlVersion = value; }
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
            get { return "DocType Assembler Component"; }
        }

        public string Name
        {
            get { return "DocTypeAssembler"; }
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

        IntPtr IComponentUI.Icon
        {
            get
            {
                throw new NotImplementedException();
            }
        }


        #endregion

        #region IPersistPropertyBag Members

        public void GetClassID(out Guid classID)
        {
            classID = new System.Guid("35353bdc-fd2b-349c-ba9b-5a6faa3529c6");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = null;
            try
            {               

                propertyBag.Read("DocType", out val, 0);
                if (val != null)
                    this.DocType = (string)val;

                propertyBag.Read("XmlVersion", out val, 0);
                if (val != null)
                    this.XmlVersion = (string)val;

            }
            catch (ArgumentException) 
            {}
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {            
            object val = this.DocType;
            propertyBag.Write("DocType", ref val);

            val = this.XmlVersion;
            propertyBag.Write("XmlVersion", ref val);
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
            VirtualStream vStream = new VirtualStream();         
            StreamWriter sWriter = new StreamWriter(vStream);

            //Write message body to a virutal memory stream
            using (StreamReader sReader = new StreamReader(pInMsg.BodyPart.Data)) { 
                sWriter.WriteLine(this.XmlVersion);
                sWriter.WriteLine(this.DocType);
                while (!sReader.EndOfStream)
                    sWriter.WriteLine(sReader.ReadLine());
            }

            sWriter.Flush();            
            vStream.Seek(0, SeekOrigin.Begin);         
            vStream.Position = 0;

            //Put the stream back
            pInMsg.BodyPart.Data = vStream;

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

        IEnumerator IComponentUI.Validate(object projectSystem)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
