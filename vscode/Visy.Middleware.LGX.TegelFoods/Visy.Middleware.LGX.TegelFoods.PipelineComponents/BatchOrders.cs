using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml.Linq;
using System.Xml;
using System.Linq;
using System.ComponentModel;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using System.Collections;

namespace Visy.Middleware.LGX.TegelFoods.PipelineComponents
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_DisassemblingParser)]
    [System.Runtime.InteropServices.Guid("6118B8F0-8684-4ba2-87B4-8336D70BD4F7")]
    public class BatchOrders : IBaseComponent, IDisassemblerComponent, IComponentUI
    {

        //Used to hold disassembled messages
        private System.Collections.Queue qOutputMsgs = new System.Collections.Queue();
        private string systemPropertiesNamespace = @"http://schemas.microsoft.com/BizTalk/2003/system-properties";

        #region Initialization
        /// Default constructor
        public BatchOrders()
        {
        }

        /// Description of pipeline
        public string Description
        {
            get
            {
                return "Component to batch messages based on the Field value";
            }
        }

        /// Name of pipeline
        public string Name
        {
            get
            {
                return "BatchMsgBy";
            }
        }

        /// Pipeline version
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }

        /// Returns collecton of errors
        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        /// Returns icon of pipeline
        public System.IntPtr Icon
        {
            get
            {
                return new System.IntPtr();
            }
        }

        /// Class GUID
        public void GetClassID(out Guid classID)
        {
            classID = new Guid("ACC3F15A-C389-4a5d-8F8E-2A951CDC4C19");
        }

        /// InitNew
        public void InitNew()
        {
        }

        #endregion

        /// Disassembles (breaks) message into small messages as per batch size
        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            string originalDataString = string.Empty;
            string strOrderID = string.Empty;
            string[] stringSeparators = new string[] { "\r\n" };
            string[] strArrRows;
            string[] strRows;

            ArrayList alOrderID = new ArrayList();
            StringBuilder sbXmlString = new StringBuilder();
            StringBuilder sbOrdersXmlString = new StringBuilder();
            XmlDocument xDoc = new XmlDocument();

            try
            {
                //fetch original message
                Stream originalMessageStream = pInMsg.BodyPart.GetOriginalDataStream();
                byte[] bufferOriginalMessage = new byte[originalMessageStream.Length];
                originalMessageStream.Read(bufferOriginalMessage, 0, Convert.ToInt32(originalMessageStream.Length));
                originalDataString = System.Text.ASCIIEncoding.ASCII.GetString(bufferOriginalMessage);

                foreach (Match match in Regex.Matches(originalDataString, "\"([^\"]*)\""))
                {
                    string strTemp = match.ToString();
                    strTemp = strTemp.Replace("\"", "");
                    strTemp = strTemp.Replace(",", "^");
                    originalDataString = originalDataString.Replace(match.ToString(), strTemp);
                }
                originalDataString = originalDataString.Replace(",", "|");
                originalDataString = originalDataString.Replace("^", ",");

                strArrRows = originalDataString.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);

                #region CSV to XML
                XNamespace xnNamespace = "http://Visy.Middleware.LGX.TegelFoods.Schemas.OrderEnvelope";
                XElement xmlOrders = new XElement(xnNamespace + "Orders",
                    from str in strArrRows
                    let columns = str.Split('|')
                    select new XElement("Order",
                        new XElement("PONr", columns[0]),
                        new XElement("OrderDate", columns[1]),
                        new XElement("DelDate", columns[2]),
                        new XElement("Address1", columns[3]),
                        new XElement("Address2", columns[4]),
                        new XElement("Address3", columns[5]),
                        new XElement("Address4", columns[6]),
                        new XElement("OdLn", columns[7]),
                        new XElement("ItemNr", columns[8]),
                        new XElement("ItemName", columns[9]),
                        new XElement("LineAmount", columns[10]),
                        new XElement("OrderQty", columns[11])));
                #endregion
                sbOrdersXmlString.Append(xmlOrders.ToString());
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in reading original message: " + ex.Message);
            }

            try
            {
                //load original message
                xDoc.LoadXml(sbOrdersXmlString.ToString());
                #region Process XML
                XmlNodeList XList = xDoc.SelectNodes("//Order");
                foreach (XmlNode xn in XList)
                {
                    strOrderID = xn["PONr"].InnerText;
                    if (strOrderID != "P/O Nr")
                    {
                        if (!alOrderID.Contains(strOrderID))
                        {
                            alOrderID.Add(strOrderID);
                        }
                    }
                }

                foreach (string str in alOrderID)
                {
                    sbXmlString = null;
                    sbXmlString = new StringBuilder();
                    XmlNodeList xnlOrders = xDoc.SelectNodes("//Order[PONr = '" + str + "']");
                    sbXmlString.Append("<Orders xmlns=\"http://Visy.Middleware.LGX.TegelFoods.Schemas.OrderEnvelope\"><Order xmlns=\"\"><PONr>P/O Nr</PONr><OrderDate>Order date</OrderDate><DelDate>Del date</DelDate><Address1>Address1</Address1><Address2>Address2</Address2><Address3>Address3</Address3><Address4>Address4</Address4><OdLn>Od Ln</OdLn><ItemNr>Item Nr</ItemNr><ItemName>Item Name</ItemName><LineAmount>Line amount</LineAmount><OrderQty>Order qty</OrderQty></Order>");
                    foreach (XmlNode xNode in xnlOrders)
                    {
                        sbXmlString.Append("<Order xmlns=\"\">" + xNode.InnerXml.ToString() + "</Order>");
                    }
                    sbXmlString.Append("</Orders>");
                    IBaseMessageContext sourceContext = pInMsg.Context;
                    IBaseMessagePart part = pInMsg.BodyPart;

                    CreateOutgoingMessage(pContext, sourceContext, part, sbXmlString.ToString(), "http://Visy.Middleware.LGX.TegelFoods.Schemas.OrderEnvelope", "Orders");
                }
                #endregion
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in writing outgoing messages: " + ex.Message);
            }

            finally
            {
                sbXmlString = null;
                xDoc = null;
            }
        }

        /// <summary>
        /// Used to pass output messages`to next stage


        public IBaseMessage GetNext(IPipelineContext pContext)
        {
            if (qOutputMsgs.Count > 0)
                return (IBaseMessage)qOutputMsgs.Dequeue();
            else
                return null;
        }

        /// <summary>
        /// Queue outgoing messages

        private void CreateOutgoingMessage(IPipelineContext pContext, IBaseMessageContext sourceContext, IBaseMessagePart part, String messageString, string namespaceURI, string rootElement)
        {
            IBaseMessage outMsg;
            try
            {
                //create outgoing message
                outMsg = pContext.GetMessageFactory().CreateMessage();
                outMsg.AddPart("Body", pContext.GetMessageFactory().CreateMessagePart(), true);
                byte[] bufferOoutgoingMessage = System.Text.ASCIIEncoding.ASCII.GetBytes(messageString);
                outMsg.BodyPart.Data = new MemoryStream(bufferOoutgoingMessage);
                outMsg.Context = sourceContext;
                outMsg.Context.Promote("MessageType", systemPropertiesNamespace, namespaceURI + "#" + rootElement.Replace("ns0:", ""));
                qOutputMsgs.Enqueue(outMsg);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error in queueing outgoing messages: " + ex.Message);
            }
        }
    }
}
