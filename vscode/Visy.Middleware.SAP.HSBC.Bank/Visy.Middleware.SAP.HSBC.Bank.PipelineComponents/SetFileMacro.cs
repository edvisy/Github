using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
//using Microsoft.BizTalk.ParsingEngine;
using Microsoft.BizTalk.Component;

namespace Visy.Middleware.SAP.HSBC.Bank.PipelineComponents
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [System.Runtime.InteropServices.Guid("9d0e4103-4cce-4536-83fa-4a5040674ad6")]

    public class SetFileMacro : IBaseComponent, IComponentUI, IPersistPropertyBag, IComponent
    {
        #region IBaseComponent Members
        public string Description
        {
            get
            {
                return "Pipeline component used to set the file name.";
            }
        }
        public string Name
        {
            get
            {
                return "Set FileMacro";
            }
        }
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }
        #endregion

        #region IComponentUI Members

        public IntPtr Icon
        {
            get
            {
                return new System.IntPtr();
            }
        }

        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            return null;
        }

        #endregion

        #region IPersistPropertyBag Members

        private string _strDateFormat;
        private string _strFileMask;

        public string strDateFormat
        {
            get { return _strDateFormat; }
            set { _strDateFormat = value; }
        }
        public string strFileMask
        {
            get { return _strFileMask; }
            set { _strFileMask = value; }
        }

        public void GetClassID(out Guid classID)
        {
            classID = new Guid("655B591F-8994-4e52-8ECD-2D7E8E78B25C");
        }
        public void InitNew()
        {

        }
        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object _dateFormat = null;
            object _fileMask = null;
            try
            {
                _dateFormat = ReadPropertyBag(propertyBag, "DateFormat");
                _fileMask = ReadPropertyBag(propertyBag, "FileMask");
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error reading propertybag: " + ex.Message);
            }

            if (_dateFormat != null)
                _strDateFormat = (string)_dateFormat;

            if (_fileMask != null)
                _strFileMask = (string)_fileMask;

        }
        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val;

            val = (object)_strDateFormat;
            propertyBag.Write("DateFormat", ref val);

            val = (object)_strFileMask;
            propertyBag.Write("FileMask", ref val);
        }

        #endregion

        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            IBaseMessageContext context = pInMsg.Context;
            string srcFileName = context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString();
            string stringVar = System.IO.Path.GetFileNameWithoutExtension(srcFileName) +"_" + System.DateTime.Now.ToString(this.strDateFormat) + this.strFileMask;
            pInMsg.Context.Write("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", stringVar);
            return pInMsg;
        }


        #endregion

        #region Private Functions
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
