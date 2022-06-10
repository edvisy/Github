﻿//------------------------------------------------------------------------------
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
namespace Visy.Middleware.Pipelines.ExcelOrderExtendedToXML
{
    using System.Xml.Serialization;


    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true, Namespace = "http://Visy.Middleware.Common.Schemas.ExcelOrderExtended")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "http://Visy.Middleware.Common.Schemas.ExcelOrderExtended", IsNullable = false)]
    public partial class ExcelOrderExtended
    {
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
        private ExcelOrderExtendedProduct[] productField;

        public string CustomerEAN
        {
            get
            {
                return this.customerEANField;
            }
            set
            {
                this.customerEANField = value;
            }
        }

        public string CustomerNumber
        {
            get
            {
                return this.customerNumberField;
            }
            set
            {
                this.customerNumberField = value;
            }
        }

        public string CustomerName
        {
            get
            {
                return this.customerNameField;
            }
            set
            {
                this.customerNameField = value;
            }
        }

        public string DeliveryAddressCode
        {
            get
            {
                return this.deliveryAddressCodeField;
            }
            set
            {
                this.deliveryAddressCodeField = value;
            }
        }

        public string DeliveryAddress
        {
            get
            {
                return this.deliveryAddressField;
            }
            set
            {
                this.deliveryAddressField = value;
            }
        }

        public string Suburb
        {
            get
            {
                return this.suburbField;
            }
            set
            {
                this.suburbField = value;
            }
        }

        public string Postcode
        {
            get
            {
                return this.postcodeField;
            }
            set
            {
                this.postcodeField = value;
            }
        }

        public string Contact
        {
            get
            {
                return this.contactField;
            }
            set
            {
                this.contactField = value;
            }
        }

        public string Phone
        {
            get
            {
                return this.phoneField;
            }
            set
            {
                this.phoneField = value;
            }
        }

        public string EmailAddress
        {
            get
            {
                return this.emailAddressField;
            }
            set
            {
                this.emailAddressField = value;
            }
        }

        public string PurchaseOrderNumber
        {
            get
            {
                return this.purchaseOrderNumberField;
            }
            set
            {
                this.purchaseOrderNumberField = value;
            }
        }

        public string PurchaseOrderDate
        {
            get
            {
                return this.purchaseOrderDateField;
            }
            set
            {
                this.purchaseOrderDateField = value;
            }
        }

        public string PickupMethod
        {
            get
            {
                return this.pickupMethodField;
            }
            set
            {
                this.pickupMethodField = value;
            }
        }

        [XmlElement("Product")]
        public ExcelOrderExtendedProduct[] Product
        {
            get
            {
                return this.productField;
            }
            set
            {
                this.productField = value;
            }
        }

        public ExcelOrderExtended()
        {
           
        }

        public void CreateProducts(int NoOfProducts)
        {
            this.productField = new ExcelOrderExtendedProduct[NoOfProducts];
        }
    }
    public class ExcelOrderExtendedProduct
    {
        private string descriptionField;
        private string materialIDField;
        private string quantityField;
        private string deliveryDateField;
        private string commentsField;

        public string Description
        {
            get
            {
                return this.descriptionField;
            }
            set
            {
                this.descriptionField = value;
            }
        }

        public string MaterialID
        {
            get
            {
                return this.materialIDField;
            }
            set
            {
                this.materialIDField = value;
            }
        }

        public string Quantity
        {
            get
            {
                return this.quantityField;
            }
            set
            {
                this.quantityField = value;
            }
        }

        public string DeliveryDate
        {
            get
            {
                return this.deliveryDateField;
            }
            set
            {
                this.deliveryDateField = value;
            }
        }

        public string Comments
        {
            get
            {
                return this.commentsField;
            }
            set
            {
                this.commentsField = value;
            }
        }

        public ExcelOrderExtendedProduct()
        {
            
        }
    }

}