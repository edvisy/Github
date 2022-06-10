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

namespace Visy.Middleware.LGX.Kofax.Orders.ContextPromoter
{

    /// <summary>
    /// Context Promoter pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("1622990D-8710-438a-ACCD-1F717DD698D2")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class ContextPromoter : IBaseComponent, IComponentUI,
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

            string srcFileName = context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString();
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", srcFileName);
            IBaseMessage newMessage = GetNewMessage(pContext, pInMsg.BodyPart.GetOriginalDataStream(), srcFileName);
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
        private IBaseMessage GetNewMessage(IPipelineContext pContext, Stream stream, string filename)
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

            byte[] result;
            using (var streamReader = new MemoryStream())
            {
                stream.CopyTo(streamReader);
                result = streamReader.ToArray();
            }


            if (Visy.Middleware.LGX.Kofax.Orders.Component.OrchestrationHelper.GetCorrlationGuid(filename, true) == "") {
                throw new Exception("Missing GUID");
            }else { 
            // convert string to stream
                byte[] byteArray = Encoding.ASCII.GetBytes("<ns0:Envelop xmlns:ns0=\"http://Visy.Middleware.LGX.Kofax.Orders.Schemas.CorrelationWrapper\"> " +
                    "<ConvoyGuid>" + Visy.Middleware.LGX.Kofax.Orders.Component.OrchestrationHelper.GetCorrlationGuid(filename, true) + "</ConvoyGuid> " +
                    "<Contents>" + Convert.ToBase64String(result) + "</Contents> " +
                    "</ns0:Envelop>");
                MemoryStream ms = new MemoryStream(byteArray);

                //C;

                //outMessage.Context.Write("ConvoyGuid", "https://Visy.Middleware.LGX.Kofax.Orders.Schemas.PropertySchema"
                //  , Visy.Middleware.LGX.Kofax.Orders.Component.OrchestrationHelper.GetCorrlationGuid(filename, true));

                //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "Read: " + outMessage.Context.Read("convoyguid", "https://Visy.Middleware.LGX.Kofax.Orders.Schemas.PropertySchema1").ToString());

                bodyPart.Data = ms;

                outMessage.AddPart("body", bodyPart, true);
            }

            return outMessage;

        }

        #endregion
    }
}
