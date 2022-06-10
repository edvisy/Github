using System;
using System.Xml;
using System.IO;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Text;

namespace Visy.Middleware.SAP.PDF.Orders.PipelineComponent
{


    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Decoder)]
    [System.Runtime.InteropServices.Guid("9d0e4103-4cce-4536-83fa-4a5040574ad6")]
    public class MIMELineValidator :
                                        IBaseComponent,
                                        IComponentUI,
                                        IComponent                                        
    {


        #region IComponent

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            System.IO.Stream st = pInMsg.BodyPart.GetOriginalDataStream();
            System.IO.StreamReader reader = new System.IO.StreamReader(st);
            var strBuilder = new StringBuilder();
            string str = string.Empty;
            while (reader.Peek() >= 0)
            {
                str  = reader.ReadLine();
                if (str.Length >= 998)                            
                   str = str.Replace(str.ToString(), System.Text.RegularExpressions.Regex.Replace(str.ToString(), "(.{" + 998 + "})", "$1" + Environment.NewLine));

                strBuilder.AppendLine(str);
            }
          

            System.IO.MemoryStream m = new System.IO.MemoryStream();
            System.IO.StreamWriter writer = new System.IO.StreamWriter(m);
            writer.AutoFlush = true;
            writer.Write(strBuilder.ToString());
            m.Position = 0;
            pInMsg.BodyPart.Data = m;

            pInMsg.Context.Write("CopyMailHeadersToContext","http://schemas.microsoft.com/BizTalk/2003/pop3-properties", 3);
            
            reader.Close();
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
            get { return "SAP MIME Line Validator Component"; }
        }
        public string Name
        {
            get { return "SAPMIMELineValidator"; }
        }
        public string Version
        {
            get { return "1.0.0.0"; }
        }

        #endregion       

    }
}
