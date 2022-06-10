namespace Visy.Middleware.SAP.Glass.ThingWorx.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"BAPIRET2", @"ArrayOfBAPIRET2", @"ZITF_E07003_HUNUM", @"ArrayOfZITF_E07003_HUNUM"})]
    public sealed class Types : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns:ns3=""http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" elementFormDefault=""qualified"" targetNamespace=""http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/"" version=""1.0"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:annotation>
    <xs:appinfo>
      <fileNameHint xmlns=""http://schemas.microsoft.com/servicemodel/adapters/metadata/xsd"">Types</fileNameHint>
    </xs:appinfo>
  </xs:annotation>
  <xs:complexType name=""BAPIRET2"">
    <xs:sequence>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""TYPE"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""1"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""ID"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""20"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""NUMBER"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:int"">
            <xs:totalDigits value=""3"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""MESSAGE"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""220"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""LOG_NO"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""20"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""LOG_MSG_NO"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:int"">
            <xs:totalDigits value=""6"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""MESSAGE_V1"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""50"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""MESSAGE_V2"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""50"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""MESSAGE_V3"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""50"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""MESSAGE_V4"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""50"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""PARAMETER"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""32"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""ROW"" nillable=""true"" type=""xs:int"" />
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""FIELD"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""30"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""SYSTEM"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""10"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:element name=""BAPIRET2"" nillable=""true"" type=""ns3:BAPIRET2"" />
  <xs:complexType name=""ArrayOfBAPIRET2"">
    <xs:sequence>
      <xs:element minOccurs=""0"" maxOccurs=""unbounded"" name=""BAPIRET2"" type=""ns3:BAPIRET2"" />
    </xs:sequence>
  </xs:complexType>
  <xs:element name=""ArrayOfBAPIRET2"" nillable=""true"" type=""ns3:ArrayOfBAPIRET2"" />
  <xs:complexType name=""ZITF_E07003_HUNUM"">
    <xs:sequence>
      <xs:element minOccurs=""0"" maxOccurs=""1"" name=""HU_NUM"" nillable=""true"">
        <xs:simpleType>
          <xs:restriction base=""xs:string"">
            <xs:maxLength value=""20"" />
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:element name=""ZITF_E07003_HUNUM"" nillable=""true"" type=""ns3:ZITF_E07003_HUNUM"" />
  <xs:complexType name=""ArrayOfZITF_E07003_HUNUM"">
    <xs:sequence>
      <xs:element minOccurs=""0"" maxOccurs=""unbounded"" name=""ZITF_E07003_HUNUM"" type=""ns3:ZITF_E07003_HUNUM"" />
    </xs:sequence>
  </xs:complexType>
  <xs:element name=""ArrayOfZITF_E07003_HUNUM"" nillable=""true"" type=""ns3:ArrayOfZITF_E07003_HUNUM"" />
</xs:schema>";
        
        public Types() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [4];
                _RootElements[0] = "BAPIRET2";
                _RootElements[1] = "ArrayOfBAPIRET2";
                _RootElements[2] = "ZITF_E07003_HUNUM";
                _RootElements[3] = "ArrayOfZITF_E07003_HUNUM";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/",@"BAPIRET2")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"BAPIRET2"})]
        public sealed class BAPIRET2 : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public BAPIRET2() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "BAPIRET2";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/",@"ArrayOfBAPIRET2")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"ArrayOfBAPIRET2"})]
        public sealed class ArrayOfBAPIRET2 : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public ArrayOfBAPIRET2() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "ArrayOfBAPIRET2";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/",@"ZITF_E07003_HUNUM")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"ZITF_E07003_HUNUM"})]
        public sealed class ZITF_E07003_HUNUM : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public ZITF_E07003_HUNUM() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "ZITF_E07003_HUNUM";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/",@"ArrayOfZITF_E07003_HUNUM")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"ArrayOfZITF_E07003_HUNUM"})]
        public sealed class ArrayOfZITF_E07003_HUNUM : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public ArrayOfZITF_E07003_HUNUM() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "ArrayOfZITF_E07003_HUNUM";
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
}
