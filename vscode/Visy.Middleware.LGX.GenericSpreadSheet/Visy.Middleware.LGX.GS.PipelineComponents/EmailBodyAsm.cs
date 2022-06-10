using System;
using System.Xml;
using System.IO;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Text;
using System.Xml.Linq;
using System.Collections.Generic;

namespace Visy.Middleware.LGX.GenericSpreadSheet.PipelineComponents
{


    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Encoder)]
    [System.Runtime.InteropServices.Guid("9e0e4103-4cce-3536-83fa-4a5040574ad6")]
    public class EmailBodyAsm :
                                        IBaseComponent,
                                        IComponentUI,
                                        IComponent
    {


        #region IComponent

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            IBaseMessagePart bodyPart = pInMsg.BodyPart;
           
            if (bodyPart != null)
            {

                string poNumber = (string)pInMsg.Context.Read("purchase_order_number", "http://Visy.Middleware.Common.Schemas.PropertySchemas.ORDERToORDRSP");
                string deliveryAddress = (string)pInMsg.Context.Read("customer_address", "http://Visy.Middleware.Common.Schemas.PropertySchemas.ORDERToORDRSP");
                             
                StringBuilder sb = new StringBuilder();
               
                sb.AppendLine("Visy: BizTalk Production\r\n");
                sb.AppendLine("Generic SpreadSheet Order Error Occurred\r\n");               
                sb.AppendLine("Please check the Purchase Order (" + poNumber + ").");
                sb.AppendLine("Delivery Address (" + deliveryAddress + ").");
            
                bodyPart.ContentType = "text/html";
                pInMsg.Context.Write("EmailBodyText", "http://schemas.microsoft.com/BizTalk/2003/smtp-properties", sb.ToString());
                pInMsg.Context.Write("MessagePartsAttachments","http://schemas.microsoft.com/BizTalk/2003/smtp-properties", (UInt32)1);                
               
            }

            return pInMsg;

        }

        #endregion

        #region IBaseComponent
        public System.IntPtr Icon
        {
            get { throw new System.NotImplementedException(); }
        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            throw new System.NotImplementedException();
        }
        #endregion

        #region IComponentUI
        public string Description
        {
            get { return "Email Body Composer"; }
        }
        public string Name
        {
            get { return "Email Body Composer"; }
        }
        public string Version
        {
            get { return "1.0.0.0"; }
        }

       
      

        public void GetClassID(out Guid classID)
        {
            classID = new Guid("d5984614-BCFD-4c47-82FC-4A2300B76438");
        }

        public void InitNew()
        {
        }

        #endregion
    }
}
