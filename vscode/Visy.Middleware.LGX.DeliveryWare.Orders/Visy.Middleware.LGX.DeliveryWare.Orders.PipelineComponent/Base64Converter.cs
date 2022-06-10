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

namespace Visy.Middleware.LGX.DeliveryWare.Orders.PipelineComponents
{

    /// <summary>
    /// Context Promoter pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("1622990D-8710-438a-ACCD-1F717DD6DDD2")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class Base64Converter : IBaseComponent, IComponentUI,
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
            get { return "Base64 To PDF Converter"; }
        }

        public string Name
        {
            get { return "Base 64 To PDF converter"; }
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
            classID = new System.Guid("76437DAC-F1ED-D343-B0CA-B39F157DC137");
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

            Regex strRegs = new Regex(@"<Contents>(.*?)</Contents>");
            StreamReader reader = new StreamReader(stream);
            string text = reader.ReadToEnd();
            var base64Str = strRegs.Match(text).Value.Replace("<Contents>", "").Replace("</Contents>", "");

            byte[] bytes = Convert.FromBase64String(base64Str);
            
            MemoryStream ms = new MemoryStream(bytes);
          
            bodyPart.Data = ms;

            outMessage.AddPart("body", bodyPart, true);

            return outMessage;
        }

        #endregion
    }
}
