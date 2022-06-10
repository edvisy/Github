namespace Visy.Middleware.SAP.ServiceMax.PipelineComponents
{
    using System;
    using System.IO;
    using System.Text;
    using System.Drawing;
    using System.Resources;
    using System.Reflection;
    using System.Diagnostics;
    using System.Collections;
    using System.ComponentModel;
    using Microsoft.BizTalk.Message.Interop;
    using Microsoft.BizTalk.Component.Interop;
    using Microsoft.BizTalk.Component;
    using Microsoft.BizTalk.Messaging;
    
    
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [System.Runtime.InteropServices.Guid("e40acde1-bb86-44dd-a07b-cae4f49cc04d")]
    [ComponentCategory(CategoryTypes.CATID_Decoder)]
    public class PropertyPromoter : Microsoft.BizTalk.Component.Interop.IComponent, IBaseComponent, IPersistPropertyBag, IComponentUI
    {
          
        private string _PropertySchemaNamespace;
        
        public string PropertySchemaNamespace
        {
            get
            {
                return _PropertySchemaNamespace;
            }
            set
            {
                _PropertySchemaNamespace = value;
            }
        }
               
        private string _XpathOfTheFieldsToBePromoted;
        
        public string XpathOfTheFieldsToBePromoted
        {
            get
            {
                return _XpathOfTheFieldsToBePromoted;
            }
            set
            {
                _XpathOfTheFieldsToBePromoted = value;
            }
        }
              
        private string _PropertySchemaFields;
        
        public string PropertySchemaFields
        {
            get
            {
                return _PropertySchemaFields;
            }
            set
            {
                _PropertySchemaFields = value;
            }
        }

                
        #region IBaseComponent members
        /// <summary>
        /// Name of the component
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get
            {
                return "ServiceMax_Property";
            }
        }
        
        /// <summary>
        /// Version of the component
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }
        
        /// <summary>
        /// Description of the component
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get
            {
                return "Service Max Property Promoter";
            }
        }
        #endregion
        
        #region IPersistPropertyBag members
        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">
        /// Class ID of the component
        /// </param>
        public void GetClassID(out System.Guid classid)
        {
            classid = new System.Guid("e40acde1-bb86-44dd-a07b-cae4f49cc04d");
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
        public virtual void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, int errlog)
        {
            object val = null;
           
            val = this.ReadPropertyBag(pb, "PropertySchemaNamespace");
            if ((val != null))
            {
                this._PropertySchemaNamespace = ((string)(val));
            }           
            val = this.ReadPropertyBag(pb, "XpathOfTheFieldsToBePromoted");
            if ((val != null))
            {
                this._XpathOfTheFieldsToBePromoted = ((string)(val));
            }
            val = this.ReadPropertyBag(pb, "PropertySchemaFields");
            if ((val != null))
            {
                this._PropertySchemaFields = ((string)(val));
            }            
        }
        
        /// <summary>
        /// Saves the current component configuration into the property bag
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="fClearDirty">not used</param>
        /// <param name="fSaveAllProperties">not used</param>
        public virtual void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
            this.WritePropertyBag(pb, "PropertySchemaNamespace", this.PropertySchemaNamespace);           
            this.WritePropertyBag(pb, "XpathOfTheFieldsToBePromoted", this.XpathOfTheFieldsToBePromoted);
            this.WritePropertyBag(pb, "PropertySchemaFields", this.PropertySchemaFields);
        }
        
        #region utility functionality
        /// <summary>
        /// Reads property value from property bag
        /// </summary>
        /// <param name="pb">Property bag</param>
        /// <param name="propName">Name of property</param>
        /// <returns>Value of the property</returns>
        private object ReadPropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName, out val, 0);
            }
            catch (System.ArgumentException )
            {
                return val;
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
            return val;
        }
        
        /// <summary>
        /// Writes property values into a property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <param name="val">Value of property.</param>
        private void WritePropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
        }
        #endregion
        #endregion
        
        #region IComponentUI members
        /// <summary>
        /// Component icon to use in BizTalk Editor
        /// </summary>
        [Browsable(false)]
        public IntPtr Icon
        {
            get
            {
                return new System.IntPtr();
            }
        }
        
        /// <summary>
        /// The Validate method is called by the BizTalk Editor during the build 
        /// of a BizTalk project.
        /// </summary>
        /// <param name="obj">An Object containing the configuration properties.</param>
        /// <returns>The IEnumerator enables the caller to enumerate through a collection of strings containing error messages. These error messages appear as compiler error messages. To report successful property validation, the method should return an empty enumerator.</returns>
        public System.Collections.IEnumerator Validate(object obj)
        {
            // example implementation:
            // ArrayList errorList = new ArrayList();
            // errorList.Add("This is a compiler error");
            // return errorList.GetEnumerator();
            return null;
        }
        #endregion
        
        #region IComponent members
        /// <summary>
        /// Implements IComponent.Execute method.
        /// </summary>
        /// <param name="pc">Pipeline context</param>
        /// <param name="inmsg">Input message</param>
        /// <returns>Original input message</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in this pipeline component.
        /// </remarks>
        public Microsoft.BizTalk.Message.Interop.IBaseMessage Execute(Microsoft.BizTalk.Component.Interop.IPipelineContext pc, Microsoft.BizTalk.Message.Interop.IBaseMessage inmsg)
        {
            if (inmsg == null)
            {
                return inmsg;
            }

            string strXpath = string.Empty;
            string strField = string.Empty;
            string strPropSchemaField = string.Empty;
            string strPropSchemaNameSpace = string.Empty;
            string[] PropertySchemaNamespaceAr = this.PropertySchemaNamespace.Split('|');
            string[] PropertySchemaFieldsAr = this.PropertySchemaFields.Split('|');            
            string[] XpathOfTheFieldsToBePromotedAr = this.XpathOfTheFieldsToBePromoted.Split('|');

            if ((PropertySchemaNamespaceAr.Length != PropertySchemaFieldsAr.Length) && (PropertySchemaFieldsAr.Length != XpathOfTheFieldsToBePromotedAr.Length))
            {
                throw new System.Exception("Not all required properties are specified. Please check if all the properties are specified for the fields to be populated (xpath, property name and property schema namespace) and the delimiter used is '|' if more than one field needs to be promoted.");
            }

            int len = PropertySchemaFieldsAr.Length;
           
            inmsg.BodyPart.Data = Utilities.ReadStreamToEndAndSeekToBeginning(inmsg.BodyPart.GetOriginalDataStream(), true, 1048576);
            for(int i = 0; i < len; i++)
            {
                strXpath = XpathOfTheFieldsToBePromotedAr[i];
                strPropSchemaField = PropertySchemaFieldsAr[i];
                strPropSchemaNameSpace = PropertySchemaNamespaceAr[i];
                strField = Utilities.ExtractDataValueXPath(inmsg.BodyPart.Data, strXpath);
                if (!string.IsNullOrEmpty(strField))
                {
                    inmsg.Context.Promote(strPropSchemaField, strPropSchemaNameSpace, strField);
                }
            }            
           
            return inmsg;  
           
        }
        #endregion
    }
}
