//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1008
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Xml.Serialization;

// 
// This source code was auto-generated by xsd, Version=4.0.30319.1.
// 
namespace Visy.Middleware.LGX.TIM.Components
{

    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.ECommerce.TIM.Schemas.InboundResponse")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "http://Visy.ECommerce.TIM.Schemas.InboundResponse", IsNullable = false)]
    public partial class InboundResponse
    {

        private string tim_vendor_order_idField;

        private string inboundTypeField;

        private System.DateTime responseDateField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string tim_vendor_order_id
        {
            get
            {
                return this.tim_vendor_order_idField;
            }
            set
            {
                this.tim_vendor_order_idField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string InboundType
        {
            get
            {
                return this.inboundTypeField;
            }
            set
            {
                this.inboundTypeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public System.DateTime ResponseDate
        {
            get
            {
                return this.responseDateField;
            }
            set
            {
                this.responseDateField = value;
            }
        }
    }
}