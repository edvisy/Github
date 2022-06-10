using System;
using System.Xml;
using System.IO;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Text;
using System.Xml.Linq;
using System.Collections.Generic;

namespace Visy.Middleware.Pipelines.PromoteMimeAttachmentFileName
{


    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [System.Runtime.InteropServices.Guid("9d0e4103-4cce-3536-83fa-4a5040574ad6")]
    public class PromoteMIMEAttachment :
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
                string fileName = (string)pInMsg.Context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties");
                fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
                pInMsg.BodyPart.PartProperties.Write("FileName", "http://schemas.microsoft.com/BizTalk/2003/mime-properties", fileName);                
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
            get { return "MIME Attachment Component"; }
        }
        public string Name
        {
            get { return "PromoteMIMEAttachment"; }
        }
        public string Version
        {
            get { return "1.0.0.0"; }
        }

        #endregion       

    }
}
