//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.832
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=2.0.50727.42.
// 
namespace Visy.Middleware.Pipelines.ExcelOrderToXML
{
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.Middleware.Common.Schemas.ExcelOrder")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace= "http://Visy.Middleware.Common.Schemas.ExcelOrder", IsNullable=false)]
    public partial class ExcelOrder {
        
        private string customerEANField;
        
        private string customerNumberField;
        
        private string customerNameField;
        
        private string deliveryAddressCodeField;
        
        private string deliveryAddressField;
        
        private string suburbField;
        
        private string postcodeField;
        
        private string contactField;
        
        private string phoneField;
        
        private string emailAddressField;
        
        private string purchaseOrderNumberField;
        
        private string purchaseOrderDateField;
        
        private string pickupMethodField;
        
        private ExcelOrderProduct[] productField;
        
        /// <remarks/>
        public string CustomerEAN {
            get {
                return this.customerEANField;
            }
            set {
                this.customerEANField = value;
            }
        }
        
        /// <remarks/>
        public string CustomerNumber {
            get {
                return this.customerNumberField;
            }
            set {
                this.customerNumberField = value;
            }
        }
        
        /// <remarks/>
        public string CustomerName {
            get {
                return this.customerNameField;
            }
            set {
                this.customerNameField = value;
            }
        }
        
        /// <remarks/>
        public string DeliveryAddressCode {
            get {
                return this.deliveryAddressCodeField;
            }
            set {
                this.deliveryAddressCodeField = value;
            }
        }
        
        /// <remarks/>
        public string DeliveryAddress {
            get {
                return this.deliveryAddressField;
            }
            set {
                this.deliveryAddressField = value;
            }
        }
        
        /// <remarks/>
        public string Suburb {
            get {
                return this.suburbField;
            }
            set {
                this.suburbField = value;
            }
        }
        
        /// <remarks/>
        public string Postcode {
            get {
                return this.postcodeField;
            }
            set {
                this.postcodeField = value;
            }
        }
        
        /// <remarks/>
        public string Contact {
            get {
                return this.contactField;
            }
            set {
                this.contactField = value;
            }
        }
        
        /// <remarks/>
        public string Phone {
            get {
                return this.phoneField;
            }
            set {
                this.phoneField = value;
            }
        }
        
        /// <remarks/>
        public string EmailAddress {
            get {
                return this.emailAddressField;
            }
            set {
                this.emailAddressField = value;
            }
        }
        
        /// <remarks/>
        public string PurchaseOrderNumber {
            get {
                return this.purchaseOrderNumberField;
            }
            set {
                this.purchaseOrderNumberField = value;
            }
        }
        
        /// <remarks/>
        public string PurchaseOrderDate {
            get {
                return this.purchaseOrderDateField;
            }
            set {
                this.purchaseOrderDateField = value;
            }
        }
        
        /// <remarks/>
        public string PickupMethod {
            get {
                return this.pickupMethodField;
            }
            set {
                this.pickupMethodField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("Product")]
        public ExcelOrderProduct[] Product {
            get {
                return this.productField;
            }
            set {
                this.productField = value;
            }
        }

        #region METHODS
        public void CreateProducts(int NoOfProducts)
        {
            this.productField = new ExcelOrderProduct[NoOfProducts];
        }

        #endregion
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace= "http://Visy.Middleware.Common.Schemas.ExcelOrder")]
    public partial class ExcelOrderProduct
    {

        #region FIELDS
        private string descriptionField;
        
        private string materialIDField;
        
        private string quantityField;
        
        private string deliveryDateField;

        private string wareHouseCodeField;

        #endregion

        #region PROPERTIES
        /// <remarks/>
        public string Description {
            get {
                return this.descriptionField;
            }
            set {
                this.descriptionField = value;
            }
        }
        
        /// <remarks/>
        public string MaterialID {
            get {
                return this.materialIDField;
            }
            set {
                this.materialIDField = value;
            }
        }
        
        /// <remarks/>
        public string Quantity {
            get {
                return this.quantityField;
            }
            set {
                this.quantityField = value;
            }
        }
        
        /// <remarks/>
        public string DeliveryDate {
            get {
                return this.deliveryDateField;
            }
            set {
                this.deliveryDateField = value;
            }
        }
        /// <remarks/>
        public string WareHouseCode
        {
            get
            {
                return this.wareHouseCodeField;
            }
            set
            {
                this.wareHouseCodeField = value;
            }
        }

        #endregion
    }
}
