//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1008
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=4.0.30319.1.
// 
namespace Visy.Middleware.LGX.CUB.Components
{
    using System.Xml.Serialization;


    /// <remarks/>
    //[System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    //[System.SerializableAttribute()]
    //[System.Diagnostics.DebuggerStepThroughAttribute()]
    //[System.ComponentModel.DesignerCategoryAttribute("code")]
    //[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="http://Visy.Middleware.LGX.CUB.Schemas.CUBDelForTrailerSchema")]
    //[System.Xml.Serialization.XmlRootAttribute(Namespace="http://Visy.Middleware.LGX.CUB.Schemas.CUBDelForTrailerSchema", IsNullable=false)]
    public partial class CUBDELFOR {
        
        private CUBDELFORSummary summaryField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public CUBDELFORSummary Summary {
            get {
                return this.summaryField;
            }
            set {
                this.summaryField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace= "http://Visy.Middleware.LGX.CUB.Schemas.CUBDelForTrailerSchema")]
    public partial class CUBDELFORSummary {
        
        private string record_typeField;
        
        private string trading_partner_codeField;
        
        private string customer_eanField;
        
        private string schedule_numberField;
        
        private string schedule_versionField;
        
        private string schedule_dateField;
        
        private string schedule_timeField;
        
        private string schedule_typeField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string record_type {
            get {
                return this.record_typeField;
            }
            set {
                this.record_typeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string trading_partner_code {
            get {
                return this.trading_partner_codeField;
            }
            set {
                this.trading_partner_codeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string customer_ean {
            get {
                return this.customer_eanField;
            }
            set {
                this.customer_eanField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string schedule_number {
            get {
                return this.schedule_numberField;
            }
            set {
                this.schedule_numberField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string schedule_version {
            get {
                return this.schedule_versionField;
            }
            set {
                this.schedule_versionField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string schedule_date {
            get {
                return this.schedule_dateField;
            }
            set {
                this.schedule_dateField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string schedule_time {
            get {
                return this.schedule_timeField;
            }
            set {
                this.schedule_timeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string schedule_type {
            get {
                return this.schedule_typeField;
            }
            set {
                this.schedule_typeField = value;
            }
        }
    }
}
