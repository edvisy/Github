﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3603
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Xml.Serialization;

// 
// This source code was auto-generated by xsd, Version=2.0.50727.42.
// 


/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace= "http://Visy.Middleware.SAP.JFE.Schemas.JFE_FlatFile")]
[System.Xml.Serialization.XmlRootAttribute(Namespace= "http://Visy.Middleware.SAP.JFE.Schemas.JFE_FlatFile", IsNullable=false)]
public partial class Order {
    
    private OrderHeader headerField;
    
    private OrderOrderLine[] orderLineField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public OrderHeader Header {
        get {
            return this.headerField;
        }
        set {
            this.headerField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute("OrderLine", Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public OrderOrderLine[] OrderLine {
        get {
            return this.orderLineField;
        }
        set {
            this.orderLineField = value;
        }
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="http://Visy.ECommerce.SAP.JFE.SCHEMAS.JFE_FlatFile")]
public partial class OrderHeader {
    
    private string fieldField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Field {
        get {
            return this.fieldField;
        }
        set {
            this.fieldField = value;
        }
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="http://Visy.ECommerce.SAP.JFE.SCHEMAS.JFE_FlatFile")]
public partial class OrderOrderLine {
    
    private string destinationPortField;
    
    private string jFENumberField;
    
    private string tTCNumberField;
    
    private string visyPONumberField;
    
    private string itemNumberField;
    
    private string productCodeField;
    
    private string heatNumberField;
    
    private string rollNumberField;
    
    private string sPECField;
    
    private string sizeField;
    
    private string netWeightField;
    
    private string uOMField;
    
    private string shippingDateFromWorksField;
    
    private string voyageNumberField;
    
    private string coatingField;
    
    private string invoiceField;
    
    private string billOfLadingField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string DestinationPort {
        get {
            return this.destinationPortField;
        }
        set {
            this.destinationPortField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string JFENumber {
        get {
            return this.jFENumberField;
        }
        set {
            this.jFENumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string TTCNumber {
        get {
            return this.tTCNumberField;
        }
        set {
            this.tTCNumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string VisyPONumber {
        get {
            return this.visyPONumberField;
        }
        set {
            this.visyPONumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string ItemNumber {
        get {
            return this.itemNumberField;
        }
        set {
            this.itemNumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string ProductCode {
        get {
            return this.productCodeField;
        }
        set {
            this.productCodeField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string HeatNumber {
        get {
            return this.heatNumberField;
        }
        set {
            this.heatNumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string RollNumber {
        get {
            return this.rollNumberField;
        }
        set {
            this.rollNumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string SPEC {
        get {
            return this.sPECField;
        }
        set {
            this.sPECField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Size {
        get {
            return this.sizeField;
        }
        set {
            this.sizeField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string NetWeight {
        get {
            return this.netWeightField;
        }
        set {
            this.netWeightField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string UOM {
        get {
            return this.uOMField;
        }
        set {
            this.uOMField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string ShippingDateFromWorks {
        get {
            return this.shippingDateFromWorksField;
        }
        set {
            this.shippingDateFromWorksField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string VoyageNumber {
        get {
            return this.voyageNumberField;
        }
        set {
            this.voyageNumberField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Coating {
        get {
            return this.coatingField;
        }
        set {
            this.coatingField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Invoice {
        get {
            return this.invoiceField;
        }
        set {
            this.invoiceField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string BillOfLading {
        get {
            return this.billOfLadingField;
        }
        set {
            this.billOfLadingField = value;
        }
    }
}