namespace Visy.Middleware.LGX.Nestle.Excel.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"http://Visy.Middleware.LGX.Nestle.Excel.Schemas",@"ASNDetails")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"ASNDetails"})]
    public sealed class CustomerASN : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" attributeFormDefault=""unqualified"" elementFormDefault=""qualified"" targetNamespace=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""ASNDetails"">
    <xs:complexType>
      <xs:sequence>
        <xs:element name=""Header"">
          <xs:complexType>
            <xs:sequence>
              <xs:element name=""FieldA"" type=""xs:string"" />
			  <xs:element name=""FieldK"" type=""xs:string"" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
        <xs:element maxOccurs=""unbounded"" name=""Details"">
          <xs:complexType>
            <xs:sequence>
              <xs:element name=""FieldA"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldB"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldC"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldD"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldE"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldF"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldG"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldH"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldI"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldJ"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldK"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldL"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldM"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldN"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldO"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldP"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldQ"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldR"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldS"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldT"" type=""xs:string"" />
              <xs:element minOccurs=""0"" name=""FieldU"" type=""xs:string"" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public CustomerASN() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "ASNDetails";
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
