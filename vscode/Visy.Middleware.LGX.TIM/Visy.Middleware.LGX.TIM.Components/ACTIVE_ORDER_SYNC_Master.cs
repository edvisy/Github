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
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Split")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Split", IsNullable = false)]
    public partial class vendor_orders
    {

        private vendor_ordersVendor_order[] vendor_orderField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("vendor_order", Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public vendor_ordersVendor_order[] vendor_order
        {
            get
            {
                return this.vendor_orderField;
            }
            set
            {
                this.vendor_orderField = value;
            }
        }
    }

    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Split")]
    public partial class vendor_ordersVendor_order
    {

        //private int tim_vendor_order_idField;
        private string tim_vendor_order_idField;

        private string actual_due_dateField;

        //private System.DateTime actual_due_dateField;

        private string requested_due_dateField;

        //private System.DateTime requested_due_dateField;

        private string order_statusField;

        //private int is_date_change_acceptedField;
        private string is_date_change_acceptedField;

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
        public string actual_due_date
        {
            get
            {
                return this.actual_due_dateField;
            }
            set
            {
                this.actual_due_dateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string requested_due_date
        {
            get
            {
                return this.requested_due_dateField;
            }
            set
            {
                this.requested_due_dateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string order_status
        {
            get
            {
                return this.order_statusField;
            }
            set
            {
                this.order_statusField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string is_date_change_accepted
        {
            get
            {
                return this.is_date_change_acceptedField;
            }
            set
            {
                this.is_date_change_acceptedField = value;
            }
        }
    }

    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Master")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Master", IsNullable = false)]
    public partial class ACTIVE_ORDER_SYNC
    {

        private vendor_ordersVendor_order[] vendor_ordersField;

        private string scopeField;

        private string tim_vendor_codeField;

        /// <remarks/>
        [System.Xml.Serialization.XmlArrayAttribute(Namespace = "http://Visy.ECommerce.TIM.Schemas/Active_Order_Sync_Split")]
        [System.Xml.Serialization.XmlArrayItemAttribute("vendor_order", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable = false)]
        public vendor_ordersVendor_order[] vendor_orders
        {
            get
            {
                return this.vendor_ordersField;
            }
            set
            {
                this.vendor_ordersField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string scope
        {
            get
            {
                return this.scopeField;
            }
            set
            {
                this.scopeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string tim_vendor_code
        {
            get
            {
                return this.tim_vendor_codeField;
            }
            set
            {
                this.tim_vendor_codeField = value;
            }
        }
    }
}