using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
//using Microsoft.BizTalk.ParsingEngine;
using Microsoft.BizTalk.Component;
using System.IO;
using System.Xml;

namespace Visy.Middleware.SAP.Novelis.PipelineComponents
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [System.Runtime.InteropServices.Guid("803BCF73-F0D4-4D9E-B61C-2368A25187F7")]

    public class SAPXMLGrouper : IBaseComponent, IComponentUI, IComponent
    {
        #region Private members

        System.Collections.Queue qOutputMsgs = new System.Collections.Queue();
        IBaseMessagePart msgPart;
        private string _strKeyNamespace = string.Empty;

        #endregion

        #region IBaseComponent Members

        public string Description
        {
            get { return "SAPXMLGrouper"; }
        }

        public string Name
        {
            get { return "SAPXMLGrouper"; }
        }

        public string Version
        {
            get { return "1.0.0.0"; }
        }

        #endregion

        #region IPersistPropertyBag Members

        public string KeyNamespace
        {
            get { return _strKeyNamespace; }
            set { _strKeyNamespace = value; }
        }

        public void GetClassID(out Guid classID)
        {
            classID = new Guid("803BCF73-F0D4-4D9E-B61C-2368A25187F7");
        }

        public void InitNew()
        {
        }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = ReadPropertyBag(propertyBag, "KeyNamespace");
            if (val != null)
                _strKeyNamespace = (string)val;
        }
        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val = _strKeyNamespace;
            propertyBag.Write("KeyNamespace", ref val);
        }

        #endregion

        #region IComponentUI Members

        public IntPtr Icon
        {
            get { return System.IntPtr.Zero; }
        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        #endregion

        #region Execute Members
        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage pInMsg)
        {

            #region Variable Declarations

            //XML Declarations
            XmlNodeList xmlNodeLists;
            XmlNamespaceManager xmlNSManager;
            XmlDocument xmlDocSource = new XmlDocument();
            XmlDocument xmlDocDestination = new XmlDocument();

            //Integer Value Declarations
            int intPOSEXCount = 0;
            int intNodeCount = 0;
            int intLoopCount = 0;


            //Conditional Variable Declarations
            bool boolXMLReady = false;
            bool boolHasLFIMG = false;
            bool boolHasCHARG = false;
            bool boolHasHSDAT = false;

            //String Variables
            string strTemp = string.Empty;
            string strTempXml = string.Empty;
            string strFinalXml = string.Empty;
            string strXmlString = string.Empty;
            string strConstructedXml = string.Empty;
            StringBuilder sbXMLStr = new StringBuilder("");


            //Stream Variables
            Stream originalStream, finalStream;

            #endregion

            msgPart = pInMsg.BodyPart;
            originalStream = pInMsg.BodyPart.GetOriginalDataStream();

            try
            {
                if (msgPart != null)
                {

                    if (originalStream != null)
                    {

                        #region XDOC Processing

                        xmlDocSource.Load(pInMsg.BodyPart.GetOriginalDataStream());
                        xmlNSManager = new XmlNamespaceManager(xmlDocSource.NameTable);
                        xmlNSManager.AddNamespace("xsi", KeyNamespace);

                        xmlNodeLists = xmlDocSource.SelectNodes("//xsi:E2EDP07GRP", xmlNSManager);
                        intNodeCount = xmlNodeLists.Count;
                        XmlNode xnode;
                        xnode = xmlDocSource.SelectSingleNode("//xsi:E2EDP07GRP", xmlNSManager);
                        #endregion

                        bool isFirstNode = false;

                        #region Loop Processing
                        foreach (XmlNode xn in xmlNodeLists)
                        {
                            strTempXml = xn.InnerXml.ToString();
                            if (strTempXml.Contains("POSEX") && intPOSEXCount < 2)
                            {
                                if (intPOSEXCount == 0)
                                {
                                    intPOSEXCount++;
                                    if (!isFirstNode)
                                    {
                                        strXmlString = strTempXml + strXmlString;
                                        isFirstNode = true;
                                    }
                                    else
                                        strXmlString = strTempXml + strXmlString;

                                    xn.ParentNode.RemoveChild(xn);
                                }
                                else
                                {
                                    boolXMLReady = true;
                                    strConstructedXml = strXmlString;
                                    strXmlString = strTempXml;
                                    intPOSEXCount = 1;
                                    isFirstNode = false;
                                }
                            }
                            else
                            {
                                strXmlString = strXmlString + strTempXml;
                                strConstructedXml = strXmlString;
                                if (intLoopCount != (intNodeCount - 1))
                                    xn.ParentNode.RemoveChild(xn);
                            }

                            if (boolXMLReady || intLoopCount == (intNodeCount - 1))
                            {
                                xn.InnerXml = strConstructedXml;
                            }

                            intLoopCount++;
                        }
                        #endregion

                        intLoopCount = 1;

                        xmlNodeLists = xmlDocSource.SelectNodes("//xsi:E2EDP07", xmlNSManager);
                        foreach (XmlNode xLoopNode in xmlNodeLists)
                        {
                            if (xLoopNode.ChildNodes.Count == 1)
                                xLoopNode.ParentNode.RemoveChild(xLoopNode);
                        }

                        // Changed the logic as per new segment
                        #region Logic Changed here

                        //LFIMG & CHARG  segment Validation
                        XmlNode xNode;
                        xmlNodeLists = xmlDocSource.SelectNodes("//xsi:E2EDP09001GRP", xmlNSManager);
                        foreach (XmlNode tempXmlNode in xmlNodeLists)
                        {
                            if (tempXmlNode["E2EDP09001", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                            {
                                #region CHARG, LFIMG & HSDAT
                                xNode = tempXmlNode["E2EDP09001", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"];

                                #region CHARG Validation
                                if (xNode["CHARG", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                                {
                                    strTemp = xNode["CHARG", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"].InnerText;
                                    if (!System.String.IsNullOrEmpty(strTemp))
                                    {
                                        boolHasCHARG = true;
                                    }
                                    else
                                    {
                                        boolHasCHARG = false;
                                    }
                                }
                                else
                                {
                                    boolHasCHARG = false;
                                }

                                #endregion
                                #region LFIMG Validations
                                if (xNode["LFIMG", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                                {
                                    strTemp = xNode["LFIMG", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"].InnerText;
                                    if (!System.String.IsNullOrEmpty(strTemp))
                                    {
                                        boolHasLFIMG = true;
                                    }
                                    else
                                    {
                                        boolHasLFIMG = false;
                                    }
                                }
                                else
                                {
                                    boolHasLFIMG = false;
                                }
                                #endregion

                                if (!boolHasCHARG || !boolHasLFIMG)
                                    xNode.ParentNode.RemoveChild(xNode);

                                if (tempXmlNode["Z2EDP09_1000", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                                {
                                    xNode = tempXmlNode["Z2EDP09_1000", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"];
                                    #region HSDAT Validation
                                    if (xNode["HSDAT", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                                    {
                                        strTemp = xNode["HSDAT", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"].InnerText;
                                        if (!System.String.IsNullOrEmpty(strTemp))
                                        {
                                            boolHasHSDAT = true;
                                        }
                                        else
                                        {
                                            boolHasHSDAT = false;
                                        }
                                    }
                                    else
                                    {
                                        boolHasHSDAT = false;
                                    }

                                    #endregion
                                    if (!boolHasHSDAT)
                                        xNode.ParentNode.RemoveChild(xNode);
                                }
                                #endregion
                            }
                            else if (tempXmlNode["Z2EDP09_1000", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                            {
                                #region HSDAT Validation
                                xNode = tempXmlNode["Z2EDP09_1000", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"];
                                if (xNode["HSDAT", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"] != null)
                                {
                                    strTemp = xNode["HSDAT", "http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"].InnerText;
                                    if (!System.String.IsNullOrEmpty(strTemp))
                                    {
                                        boolHasHSDAT = true;
                                    }
                                    else
                                    {
                                        boolHasHSDAT = false;
                                    }
                                }
                                else
                                {
                                    boolHasHSDAT = false;
                                }

                                if (!boolHasHSDAT)
                                    xNode.ParentNode.RemoveChild(xNode);
                                #endregion
                            }
                        }

                        xmlNodeLists = xmlDocSource.SelectNodes("//xsi:E2EDP09001GRP", xmlNSManager);
                        foreach (XmlNode xLoopNode in xmlNodeLists)
                        {
                            if (xLoopNode.ChildNodes.Count == 0)
                                xLoopNode.ParentNode.RemoveChild(xLoopNode);
                        }
                        #endregion

                        #region XML Preparation to send
                        byte[] byteArray = Encoding.ASCII.GetBytes(xmlDocSource.InnerXml.ToString());
                        finalStream = new MemoryStream(byteArray);
                        pInMsg.BodyPart.Data = finalStream;
                        pInMsg.Context.Promote("MessageType", "http://schemas.microsoft.com/BizTalk/2003/system-properties", "http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DESADV01/Z2DESADV/620/Send#Send");
                        pInMsg.Context.Promote("SchemaStrongName", "http://schemas.microsoft.com/BizTalk/2003/system-properties", "Visy.Middleware.Common.Schemas.SAP.Z2DESADV, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7e7bc6e5fd308d12");
                        #endregion
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return pInMsg;
        }
        #endregion

        #region Private functions

        private byte[] ConvertToByteArray(string strInput)
        {
            return Encoding.ASCII.GetBytes(strInput);
        }

        private object ReadPropertyBag(IPropertyBag propertyBag, string propName)
        {
            object val = null;
            try
            {
                propertyBag.Read(propName, out val, 0);
            }
            catch (ArgumentException)
            {
                return val;
            }
            catch (Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
            return val;
        }
        #endregion
    }
}