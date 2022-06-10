using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.IO;
using Microsoft.BizTalk.Component;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.PipelineOM;
using System.Configuration;
namespace Visy.Middleware.CNET.Common.PipelineComponents
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [System.Runtime.InteropServices.Guid("325CB263-CA7E-433B-BA4A-B44EE6128202")]
   public class RetrieveUNBSegment:IComponent,IComponentUI,IBaseComponent,IPersistPropertyBag
    {
        # region IComponent
        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            string originalEDI = string.Empty;
            string outboundEDI = string.Empty;
            int numberBytesToRead = 0;
            int numberBytesRead = 0;
            byte[] outBytes = null;
            byte[] ediBytes = null;
            MemoryStream memStream = null;
            string value=string.Empty;
            //string key = string.Empty;



            IBaseMessagePart bodyPart = pInMsg.BodyPart;

            try
            {

                Stream originalStream = bodyPart.GetOriginalDataStream();

                numberBytesToRead = (int)originalStream.Length;
                numberBytesRead = 0;

                while (numberBytesToRead > 0)
                {
                    outBytes = new byte[numberBytesToRead];

                    // Read may return anything from 0 to numBytesToRead.
                    int bytes = originalStream.Read(outBytes, numberBytesRead, numberBytesToRead);

                    // The end of the file is reached.
                    if (bytes == 0)
                        break;
                    else
                    {
                        outboundEDI += System.Text.Encoding.Default.GetString(outBytes);
                    }

                    numberBytesRead += bytes;
                    numberBytesToRead -= bytes;


                }

                // get the UNB segment in a string
                int UNBindex = outboundEDI.IndexOf("UNB");
                if (UNBindex == -1)
                    value = "X12";
                else
                {
                int UNGindex = outboundEDI.IndexOf("UNG");
                int endstring;
                if (UNGindex == -1)
                {
                    int UNHindex = outboundEDI.IndexOf("UNH");
                    endstring = UNHindex;

                }
                else
                    endstring = UNGindex;
                string UNBsegment = outboundEDI.Substring(UNBindex, (endstring - UNBindex));
                //Replace the ISA12.  '*' is a segment separator
                string[] splitEDI = UNBsegment.Split(new Char[] { '+' });
                if (splitEDI.Length > 0)
                {
                    string sender = splitEDI[2];
                    string receiver = splitEDI[3];
                    value = sender + "+" + receiver;

                }
                  
                }


               // value = GetAppSettings(key);
                memStream = new MemoryStream();


                //Get the Bytes for the new EDI.
                ediBytes = System.Text.Encoding.Default.GetBytes(outboundEDI);


                memStream.Write(ediBytes, 0, ediBytes.Length);


                memStream.Seek(0, SeekOrigin.Begin);
                bodyPart.Data = memStream;
                

                pContext.ResourceTracker.AddResource(memStream);
                pInMsg.Context.Write("OutboundTransportType", "http://schemas.microsoft.com/BizTalk/2003/system-properties", value);
                pInMsg.Context.Promote("OutboundTransportType", "http://schemas.microsoft.com/BizTalk/2003/system-properties", value);

            }
            catch (Exception exception)
            {
                throw exception;
            }
            finally
            {
                outboundEDI = null;
                outBytes = null;
                ediBytes = null;
            }

            return pInMsg;


        }
     /*   public static string GetAppSettings(string key)
        {
            try
            {
                string sValue = string.Empty;

                sValue = ConfigurationManager.AppSettings[key].ToString();

                System.Diagnostics.Trace.WriteLine(String.Format("GetAppSettings Key: {0} Value: {1}", key, sValue));

                return sValue;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform GetAppSettings because - {0}", ex.Message), ex.InnerException);
            }
        } */
        # endregion

        # region IComponentUI

        public IntPtr Icon
        {
            get
            {
                   return System.IntPtr.Zero; 

            }

        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        # endregion

        # region IBaseComponent

        public string Description
        {
            get {
                return "Pipeline component to read sender and receiver values from EDIFACT ";
            }
        }

        public string Name
        {
            get { return "RetrieveUNBSegment"; }
        }

        public string Version
        {
            get { return "1.0.0.0"; }
        }

        # endregion

        # region IPersistPropertyBag

        public void GetClassID(out Guid classID)
        {
            classID = new Guid("325CB263-CA7E-433B-BA4A-B44EE6128202");
        }

        public void InitNew()
        {
          
        }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
           
        }

        # endregion
    }
}
