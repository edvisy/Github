using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Streaming;

namespace Visy.Middleware.Pipelines.ContextPromoter
{

    /// <summary>
    /// Context Promoter pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("1622990D-8710-438a-ACCD-1F717ED698D2")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class ContextPromoter : IBaseComponent, IComponentUI, IPersistPropertyBag,
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields

        private string _newContextProperty = "New_Context_Property";
        private string _newContextPropertyValue = "Value";
        private bool _promoteContextProperty = true;

        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;

        #endregion

        #region Public Properties

        [DisplayName("New Context Property")]
        [Description("Provide a new context property")]
        public string NewContextProperty
        {
            get { return _newContextProperty; }
            set { _newContextProperty = value; }
        }

        [DisplayName("New Context Property Value")]
        [Description("Provide the value of the new context property")]
        public string NewContextPropertyValue
        {
            get { return _newContextPropertyValue; }
            set { _newContextPropertyValue = value; }
        }

        [DisplayName("Promote Context Property")]
        [Description("Configuration to promote this context property")]
        public bool PromoteContextProperty
        {
            get { return _promoteContextProperty; }
            set { _promoteContextProperty = value; }
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
            get { return "Context Promoter component"; }
        }

        public string Name
        {
            get { return "Context Promoter"; }
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
            classID = new System.Guid("76437DAC-F1ED-4343-B0CA-B39F157DC136");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = null;
            try
            {
                propertyBag.Read("NewContextProperty", out val, 0);
                if (val != null)
                    this.NewContextProperty = (string)val;

                propertyBag.Read("NewContextPropertyValue", out val, 0);
                if (val != null)
                    this.NewContextPropertyValue = (string)val;

                propertyBag.Read("PromoteContextProperty", out val, 0);
                if (val != null)
                    this.PromoteContextProperty = Convert.ToBoolean(val);

            }
            catch (ArgumentException)
            { }
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val = this.NewContextProperty;
            propertyBag.Write("NewContextProperty", ref val);

            val = this.NewContextPropertyValue;
            propertyBag.Write("NewContextPropertyValue", ref val);

            val = this.PromoteContextProperty;
            propertyBag.Write("PromoteContextProperty", ref val);

        }

        #endregion

        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            if (pContext == null)
                throw new ArgumentNullException("pContext");
            if (pInMsg == null)
                throw new ArgumentNullException("pInMsg");
            _pipelineContext = pContext;
            _inMessage = pInMsg;

            pContext.ResourceTracker.AddResource(pInMsg.BodyPart.GetOriginalDataStream());
            // Create a new pipeline message
            IBaseMessage newMessage = GetNewMessage(pContext, pInMsg.BodyPart.GetOriginalDataStream());
            // Return modified message
            return newMessage;

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
            if (this.PromoteContextProperty)
            {
                // Validate value that will be promoted
                if (String.IsNullOrEmpty(this.NewContextProperty))
                    throw new ArgumentException("Unable to promote new context property. " +
                        "The value within \"New Context Property\" component property must not be empty.");

                // Validate value that will be promoted
                if (String.IsNullOrEmpty(this.NewContextPropertyValue))
                    throw new ArgumentException("Unable to promote new context property value. " +
                        "The value within \"New Context Property value\" component property must not be empty.");

                // Promote MessageType system context property
                outMessage.Context.Promote(this.NewContextProperty,
                    "http://schemas.microsoft.com/BizTalk/2003/system-properties",
                    this.NewContextPropertyValue);
            }
            // Return new message
            return outMessage;
        }

        #endregion
    }
}
