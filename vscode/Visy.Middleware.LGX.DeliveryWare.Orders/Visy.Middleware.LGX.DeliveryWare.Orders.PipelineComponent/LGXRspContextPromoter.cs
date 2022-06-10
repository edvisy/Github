using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Streaming;
using System.Text;
using System.Text.RegularExpressions;

namespace Visy.Middleware.LGX.DeliveryWare.Orders.LGXRspContextPromoter
{

    /// <summary>
    /// Context Promoter pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("1622990D-8730-438a-BCCD-1F717DD645D2")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class LGXRspContextPromoter : IBaseComponent, IComponentUI,
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields       


        private IBaseMessage _inMessage;
        #endregion
        private IBaseMessage InMessage
        {
            get
            {
                if (_inMessage == null)
                    throw new ArgumentNullException("_inMessage");
                return _inMessage;
            }
        }

        #region IBaseComponent Members

        public string Description
        {
            get { return "LGX Rsp Context Promoter component"; }
        }

        public string Name
        {
            get { return "LGX Rsp Context Promoter"; }
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
            classID = new System.Guid("76437DAC-F1ED-4343-B0CA-B39F157DC137");
        }

        public void InitNew()
        { }

        #endregion

        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            if (pContext == null)
                throw new ArgumentNullException("pContext");
            if (pInMsg == null)
                throw new ArgumentNullException("pInMsg");
            _inMessage = pInMsg;
            IBaseMessageContext context = pInMsg.Context;
          
            Stream messageStream = pInMsg.BodyPart.GetOriginalDataStream();
           
            StreamReader streamReader = new StreamReader(messageStream);
            string messageString = streamReader.ReadToEnd();

            Regex rx = new Regex("biztalk_id=\"([^\"]*)\"");

            var newstr = rx.Match(messageString).Groups[1].Value;

           
            string modMessageString = messageString.Replace(newstr, newstr.Split('_')[0]);

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

                     
            // Return new message
            return outMessage;
        }

        #endregion
    }
}
