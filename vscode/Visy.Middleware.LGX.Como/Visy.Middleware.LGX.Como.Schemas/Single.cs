namespace Visy.Middleware.LGX.Como.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"http://Visy.Middleware.LGX.Como.Schemas.ASN_Single",@"ASN_Single")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"ASN_Single"})]
    public sealed class ASN_Single : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns=""http://Visy.Middleware.LGX.Como.Schemas.ASN_Single"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" targetNamespace=""http://Visy.Middleware.LGX.Como.Schemas.ASN_Single"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""ASN_Single"">
    <xs:complexType>
      <xs:sequence>
        <xs:element name=""PONumber"" type=""xs:string"" />
        <xs:element name=""PODate"" type=""xs:string"" />
        <xs:element maxOccurs=""unbounded"" name=""Details"">
          <xs:complexType>
            <xs:sequence>
              <xs:element name=""DeliveryDate"" type=""xs:string"" />
              <xs:element name=""ContainerNumber"" type=""xs:string"" />
              <xs:element name=""InvoiceNumber"" type=""xs:string"" />
              <xs:element name=""LineNo"" type=""xs:string"" />
              <xs:element name=""SGVisyPONumber"" type=""xs:string"" />
              <xs:element name=""VisyPONumber"" type=""xs:string"" />
              <xs:element name=""MaterialNumber"" type=""xs:string"" />
              <xs:element name=""LotNumber"" type=""xs:string"" />
              <xs:element name=""PalletNumber"" type=""xs:string"" />
              <xs:element name=""Quantity"" type=""xs:string"" />
              <xs:element name=""UOM"" type=""xs:string"" />
              <xs:element name=""DeliveryNumber"" type=""xs:string"" />
              <xs:element name=""ItemName"" type=""xs:string"" />
              <xs:element name=""MRN"" type=""xs:string"" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public ASN_Single() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "ASN_Single";
                return _RootElements;
            }
        }
        
        protected override object RawSchema {
            get {
                return _rawSchema;
            }
            set {
                _rawSchema = value;
            }
        }
    }
}
