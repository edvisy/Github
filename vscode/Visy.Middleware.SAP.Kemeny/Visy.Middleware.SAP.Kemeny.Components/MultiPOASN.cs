﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
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
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace= "http://Visy.Middleware.SAP.Kemeny.Schemas.MultiPOASN")]
[System.Xml.Serialization.XmlRootAttribute(Namespace= "http://Visy.Middleware.SAP.Kemeny.Schemas.MultiPOASN", IsNullable=false)]
public partial class MultiPOASN {
    
    private string headerField;
    
    private MultiPOASNDetail[] detailField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Header {
        get {
            return this.headerField;
        }
        set {
            this.headerField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute("Detail", Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public MultiPOASNDetail[] Detail {
        get {
            return this.detailField;
        }
        set {
            this.detailField = value;
        }
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="http://Visy.ECommerce.SAP.KEMENY.MultiPOASN")]
public partial class MultiPOASNDetail {
    
    private string destinationPortField;
    
    private string kOPCNoField;
    
    private string kOPCInvoiceNoField;
    
    private string visyPOField;
    
    private string visyPOEntNoField;
    
    private string productCodeField;
    
    private string heatNoField;
    
    private string rollNoField;
    
    private string specField;
    
    private string sizeField;
    
    private string netWeightField;
    
    private string uOMField;
    
    private string shippingDateField;
    
    private string eTAField;
    
    private string vesselVoyageField;
    
    private string coatingField;
    
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
    public string KOPCNo {
        get {
            return this.kOPCNoField;
        }
        set {
            this.kOPCNoField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string KOPCInvoiceNo {
        get {
            return this.kOPCInvoiceNoField;
        }
        set {
            this.kOPCInvoiceNoField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string VisyPO {
        get {
            return this.visyPOField;
        }
        set {
            this.visyPOField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string VisyPOEntNo {
        get {
            return this.visyPOEntNoField;
        }
        set {
            this.visyPOEntNoField = value;
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
    public string HeatNo {
        get {
            return this.heatNoField;
        }
        set {
            this.heatNoField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string RollNo {
        get {
            return this.rollNoField;
        }
        set {
            this.rollNoField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string Spec {
        get {
            return this.specField;
        }
        set {
            this.specField = value;
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
    public string ShippingDate {
        get {
            return this.shippingDateField;
        }
        set {
            this.shippingDateField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string ETA {
        get {
            return this.eTAField;
        }
        set {
            this.eTAField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
    public string VesselVoyage {
        get {
            return this.vesselVoyageField;
        }
        set {
            this.vesselVoyageField = value;
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
}
