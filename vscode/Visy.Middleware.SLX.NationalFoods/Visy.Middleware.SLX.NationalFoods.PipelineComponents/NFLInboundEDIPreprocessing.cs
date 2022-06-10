/****************************************************************************************
 *
 * Description : Preprocessing of National Food/Lion nathan's Inbound EDI Documents primarily
 *               
 * 
 *
 * Change Record
 *
 * Version     Author                                            Date                
 * 1.0         YongJin Sim                                       11/01/2011
 * 1.1         Sandeep Nayak                                     04/02/2014
 * 
 ****************************************************************************************
 *
 * History
 *
 * Version   Description
 * 1.0       Original
 * 1.1       Spliting of Order message based upon NAD segment element (Either for VISYBOARD or SAP Cartons)
 * 
 ***************************************************************************************/

using System;
using System.IO;
using System.Text;
using System.Collections;
using System.ComponentModel;
using System.Globalization;
using System.Reflection;
using System.Resources;
using System.Runtime.InteropServices;
using Microsoft.BizTalk.Streaming;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using IComponent = Microsoft.BizTalk.Component.Interop.IComponent;

namespace Visy.Middleware.SLX.NationalFoods.PipelineComponents
{
    /// <summary>
    /// Class responsible to archive incoming files.
    /// </summary>
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Decoder)]
    [Guid("E6AB3EB4-480E-4e2f-8139-A58B5784F1DC")]
    public class NFLInboundEDIPreprocessing : IBaseComponent, IComponentUI, IComponent, IPersistPropertyBag
    {
        public const string NFLORDER = "ORDERS:D:01B:UN:EAN010'";
        public const string ORDER = "ORDERS:D:96A:UN:EAN008'";
        public const string DELFOR = "DELFOR:D:01B:UN:EAN004'";
        public const string CONTRL = "CONTRL";
        public const string NADELMENT = "NAD+SU+";
        string strMessage = string.Empty;
        string strInterfaceName = string.Empty;
        string strPartyIdentifier = string.Empty;
               

        #region IBaseComponent Members

        /// <summary>
        /// Name of the component
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get { return "NFL Message Type Router"; }
        }

        /// <summary>
        /// Version of the component
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get { return "1.0.0.0"; }
        }

        /// <summary>
        /// Description of the component
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get { return "NFL Message Type Router"; }
        }

        #endregion

        #region IComponentUI Members

        public IntPtr Icon
        {
            get
            { return new System.IntPtr(); }
        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        #endregion
        #region IPersistPropertyBag members

        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">
        /// Class ID of the component
        /// </param>
        public void GetClassID(out Guid classid)
        {
            classid = new Guid("CC74CFCC-4EC1-4c2e-A570-F172A77CBF05");
        }

        /// <summary>
        /// not implemented
        /// </summary>
        public void InitNew()
        {
        }

        /// <summary>
        /// Loads configuration properties for the component
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="errlog">Error status</param>
        public virtual void Load(IPropertyBag pb, int errlog)
        {
        }

        /// <summary>
        /// Saves the current component configuration into the property bag
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="fClearDirty">not used</param>
        /// <param name="fSaveAllProperties">not used</param>
        public virtual void Save(IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
        }
        #endregion

        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            System.IO.Stream st = inmsg.BodyPart.GetOriginalDataStream();
            System.IO.StreamReader reader = new System.IO.StreamReader(st);
            try
            {

                string body = reader.ReadToEnd();
                string msgType;
                //string firstHalves = body;
                //string secondHalves = "";
                //string temp = "";
                //string type = "";
                string filePreFix = string.Empty;
                string fileName = string.Empty;
                body = body.Replace("~", "_");
                StringBuilder incommingMsgBody = new StringBuilder(body);
                msgType = SearchMsgType(incommingMsgBody);



                switch (msgType)
                {
                    case ORDER:
                        filePreFix = "ORDER";
                        break;

                    case DELFOR:
                        filePreFix = "DELFOR";
                        break;

                    case NFLORDER:
                        filePreFix = SearchNADElement(incommingMsgBody) + "~NFLORDER" ;
                        break;

                    case CONTRL:
                        filePreFix = "CTRL";
                        break;
                    
                }

                IBaseMessageContext context = inmsg.Context;

                string srcFileName = context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString();


                //fileName = filePreFix + "." + srcFileName;


                fileName = filePreFix + "." + System.Guid.NewGuid().ToString("N") + ".edi";

                context.Write("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", fileName);

                System.IO.MemoryStream m = new System.IO.MemoryStream();
                System.IO.StreamWriter writer = new System.IO.StreamWriter(m);
                writer.AutoFlush = true;
                writer.Write(body);
                m.Position = 0;
                inmsg.BodyPart.Data = m;
            }
            catch
            {
                throw new Exception("Error Preprocessing NFL EDI Inbound Document.");
            }
            finally
            {
                reader.Close();
            }
            return inmsg;

        }

        public string SearchMsgType(StringBuilder msg)
        {
            string msgType;
            if (msg.ToString().IndexOf(ORDER) != -1)
            {
                msgType = ORDER;
            }
            else if (msg.ToString().IndexOf(DELFOR) != -1)
            {
                msgType = DELFOR;
            }
            else if (msg.ToString().IndexOf(NFLORDER) != -1)
            {
                msgType = NFLORDER;
            }
            else if (msg.ToString().IndexOf(CONTRL) != -1)
            {
                msgType = CONTRL;
            }
            else
            {
                throw new Exception("NFL incoming message Error : NFL pipeline couldn't determine message type");
            }

            return msgType;
        }

        public string SearchNADElement(StringBuilder msg)
        {
            //string msgNAD = string.Empty;


            if (msg.ToString().IndexOf(ORDER) != -1 || msg.ToString().IndexOf(NFLORDER) != -1)
            {
                strMessage = msg.ToString();
                int first = strMessage.IndexOf(NADELMENT) + NADELMENT.Length; ;

                int last = strMessage.IndexOf("::", first);

                strPartyIdentifier = strMessage.Substring(first, last - first);
                strInterfaceName = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strPartyIdentifier, "SLX.NationalFoods");//Database.getScalarData(strPartyIdentifier);
            }
            else
            {
                throw new Exception("NFL incoming message Error : NFL pipeline couldn't determine message type");
            }

            return strInterfaceName;
        }
        

        #endregion

    }
}
