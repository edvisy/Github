//=============================================================================
// This file is part of the Microsoft BizTalk Accelerator for RosettaNet 3.0
//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
// PURPOSE.
//=============================================================================

using System;
using System.Resources;
using System.Collections;
using System.Reflection;
using System.Text;
using System.IO;
using System.ComponentModel;
using System.Management;
using System.Xml;

using Microsoft.BizTalk.Internal;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component;
using Microsoft.BizTalk.Component.Interop;


namespace Visy.Middleware.AS2.Common.PipelineComponents
{
    /// <summary>
    /// Summary description for MessageEditor.
    /// This Class helps to modify the Value of a particular node in a Part Message. The user needs to provide the correct XPath Query and the Value.
    /// Using this XPath Query, the part will be scanned through and the node value is modified.
    /// </summary>
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_Validate)]
    [System.Runtime.InteropServices.Guid("86481497-0D29-4855-BF2E-303D04B9A55E")]
    public class AS2HttpCondextPromoter :        
        IBaseComponent,
        Microsoft.BizTalk.Component.Interop.IComponent,
        IComponentUI,
        Microsoft.BizTalk.Component.Interop.IPersistPropertyBag
    {
        #region IComponent Members

        public AS2HttpCondextPromoter()
            : base()
        {
        }

        /// <summary>
        /// This method Executes the pipeline component
        /// </summary>
        /// <param name="pContext">pipelinecontext Interface</param>
        /// <param name="pInMsg">the incoming XLang Message on which we have to operate</param>
        /// <returns></returns>
        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            IPipelineContext pipelineContext = pContext;
            IBaseMessage baseMessage = pInMsg;

            //Prepend Headers  
            MemoryStream ms = new MemoryStream();
            string strName = "UserHttpHeaders";
            string strValue = (string)baseMessage.Context.Read(strName,
              "http://schemas.microsoft.com/BizTalk/2003/http-properties");  

            //Leave an empty line between the headers and the body  
            strValue += "\r\n";
            ms.Write(Encoding.ASCII.GetBytes(strValue), 0,
               Encoding.ASCII.GetByteCount(strValue));

            //Append Body  
            Stream sr = baseMessage.BodyPart.Data;

            //Read the body of the message and append it to the memory   
           
            int size = 1024;
            byte[] buffer = new byte[size];
            while (0 != (size = sr.Read(buffer, 0, buffer.Length)))
            {
                ms.Write(buffer, 0, size);
            }

            //Set the body of the message to the new memory stream  
            baseMessage.BodyPart.Data = ms;

            //Rewind the stream  
            ms.Seek(0, SeekOrigin.Begin);

            return baseMessage;
        }

        #endregion

        #region IComponentUI Members

        public IEnumerator Validate(object projectSystem)
        {
            // TODO:  Add MessageEditor.Validate implementation
            return null;
        }

        [Browsable(false)]
        public System.IntPtr Icon
        {
            get
            {
                return IntPtr.Zero;
            }
        }

        #endregion

        #region IBaseComponent Members

        /// <summary>
        /// Name of the component.
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get { return "AS2 Http Context Promoter"; }
        }

        /// <summary>
        /// Version of the component.
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get { return "1.0"; }
        }

        /// <summary>
        /// Description of the component.
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get { return "AS2 Http Context Promoter"; }
        }

        #endregion

        #region IPersistPropertyBag Members

        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">Class ID of the component.</param>
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("86481497-0D29-4855-BF2E-303D04B9B55E}");
        }

        public void InitNew()
        {
        }

        public void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Int32 errlog)
        { }

        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        { }
        #endregion
    }
}
