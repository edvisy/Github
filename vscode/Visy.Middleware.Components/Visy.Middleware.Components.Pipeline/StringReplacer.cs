using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Streaming;

namespace Visy.Middleware.Components.Pipeline
{
    /// <summary>
    /// String Replacer pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3429c6")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class StringReplacer : 
        IBaseComponent, IComponentUI, IPersistPropertyBag, 
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields

        private const string DefaultReplacementString = "<Blank>";
        private const string DefaultStringToReplace = "<None>";

        private string _replacementString = DefaultReplacementString;
        private string _stringToReplace = DefaultStringToReplace;
        private string _targetMessageType = "SchemaNamespace#RootNodeName";
        private bool _promoteMessageType = false;
        
        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;

        #endregion

        #region Public Properties

        [DisplayName("Target Message Type")]
        [Description("The message type of the output message (Optional). If the \"Promote Message Type\" property " +
            "is set to True then this value will be promoted into BizTalk's MessageType system context property in " +
            "order to activate orchestration subscriptions based on fully qualified schema name.")]
        public string TargetMessageType
        {
            get { return _targetMessageType; }
            set { _targetMessageType = value; }
        }

        [DisplayName("Promote Message Type")]
        [Description("Specifies whether to promote the value configured for \"Target Message Type\" property " +
           "into the \"MessageType+http://schemas.microsoft.com/BizTalk/2003/system-properties\" BizTalk system " + 
            "context property.")]
        public bool PromoteMessageType
        {
            get { return _promoteMessageType; }
            set { _promoteMessageType = value; }
        }

        [DisplayName("String To Replace")]
        [Description("The string to replace within the message. If found within the message, this value will " + 
            "be replaced with a value configured in the \"Replacement String\" property. If configured to <None> " + 
            "or empty then no changes will be made to the message.")]
        public string StringToReplace
        {
            get { return _stringToReplace; }
            set { _stringToReplace = value; }
        }

        [DisplayName("Replacement String")]
        [Description("This value will be used to replace the \"String To Replace\" value found in the message. " + 
            "If set to <Blank> or empty then the found string will be removed from the message.")]
        public string ReplacementString
        {
            get { return _replacementString; }
            set { _replacementString = value; }
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
            get { return "String Replacer component"; }
        }

        public string Name
        {
            get { return "String Replacer"; }
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
            classID = new System.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3429c6");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = null;
            try
            {
                propertyBag.Read("TargetMessageType", out val, 0);
                if (val != null)
                    this.TargetMessageType = (string)val;

                propertyBag.Read("PromoteMessageType", out val, 0);
                if (val != null)
                    this.PromoteMessageType = Convert.ToBoolean(val);

                propertyBag.Read("StringToReplace", out val, 0);
                if (val != null)
                    this.StringToReplace = (string)val;

                propertyBag.Read("ReplacementString", out val, 0);
                if (val != null)
                    this.ReplacementString = (string)val;
            }
            catch (ArgumentException) 
            {}
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val = this.TargetMessageType;
            propertyBag.Write("TargetMessageType", ref val);
            
            val = this.PromoteMessageType;
            propertyBag.Write("PromoteMessageType", ref val);
            
            val = this.StringToReplace;
            propertyBag.Write("StringToReplace", ref val);

            val = this.ReplacementString;
            propertyBag.Write("ReplacementString", ref val);
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
            if (pContext == null)
                throw new ArgumentNullException("pContext");
            if (pInMsg == null)
                throw new ArgumentNullException("pInMsg");
            _pipelineContext = pContext;
            _inMessage = pInMsg;

            // Return the input message unchanged if the StringToReplace property is default or empty
            if(String.IsNullOrEmpty(StringToReplace) || StringToReplace.Equals(DefaultStringToReplace))
                return pInMsg;
            else
            {
                // Get input message body part streamm
                Stream messageStream = pInMsg.BodyPart.GetOriginalDataStream();
                // Get message data as string
                StreamReader streamReader = new StreamReader(messageStream);
                string messageString = streamReader.ReadToEnd();

                // Change ReplacementString to String.Empty if it has default value 
                if (ReplacementString.Equals(DefaultReplacementString))
                    ReplacementString = String.Empty;

                // Perform string replacement
                string modMessageString = messageString.Replace(StringToReplace, ReplacementString);

                // Get mod message bytes
                byte[] modMessageBytes = System.Text.Encoding.UTF8.GetBytes(modMessageString);
                // Write mod message bytes to modMessageStream
                Stream modMessageStream = new VirtualStream();
                modMessageStream.Write(modMessageBytes, 0, modMessageBytes.Length);

                // Add the modMessageStream (virtual stream) to resource tracker for cleanup
                pContext.ResourceTracker.AddResource(modMessageStream);
                // Create a new pipeline message
                IBaseMessage newMessage = GetNewMessage(pContext, modMessageStream);
                // Return modified message
                return newMessage;
            }
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

            // Promote MessageType only if PromoteMessageType is set to True
            if (this.PromoteMessageType)
            {
                // Validate value that will be promoted
                if (String.IsNullOrEmpty(this.TargetMessageType))
                    throw new ArgumentException("Unable to promote MessageType context property. " +
                        "The value within \"Target Message Type\" component property must not be empty.");

                // Promote MessageType system context property
                outMessage.Context.Promote("MessageType",
                    "http://schemas.microsoft.com/BizTalk/2003/system-properties",
                    this.TargetMessageType);
            }
            // Return new message
            return outMessage;
        }

        #endregion
    }
}
