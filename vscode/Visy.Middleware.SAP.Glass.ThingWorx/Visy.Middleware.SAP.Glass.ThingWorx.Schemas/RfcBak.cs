namespace Visy.Middleware.SAP.Glass.ThingWorx.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"ZITF_E07003_GRB2B", @"ZITF_E07003_GRB2BResponse"})]
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"Visy.Middleware.SAP.Glass.ThingWorx.Schemas.Types", typeof(global::Visy.Middleware.SAP.Glass.ThingWorx.Schemas.Types))]
    public sealed class Rfc : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns:ns3=""http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" elementFormDefault=""qualified"" targetNamespace=""http://Microsoft.LobServices.Sap/2007/03/Rfc/"" version=""1.0"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:import schemaLocation=""Visy.Middleware.SAP.Glass.ThingWorx.Schemas.Types"" namespace=""http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/"" />
  <xs:annotation>
    <xs:appinfo>
      <fileNameHint xmlns=""http://schemas.microsoft.com/servicemodel/adapters/metadata/xsd"">Rfc</fileNameHint>
      <references xmlns=""http://schemas.microsoft.com/BizTalk/2003"">
        <reference targetNamespace=""http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/"" />
      </references>
    </xs:appinfo>
  </xs:annotation>
  <xs:element name=""ZITF_E07003_GRB2B"">
    <xs:annotation>
      <xs:documentation>
        <doc:action xmlns:doc=""http://schemas.microsoft.com/servicemodel/adapters/metadata/documentation"">http://Microsoft.LobServices.Sap/2007/03/Rfc/ZITF_E07003_GRB2B</doc:action>
        <doc:description xmlns:doc=""http://schemas.microsoft.com/servicemodel/adapters/metadata/documentation"">The Metadata for this RFC was generated using the .Net Connector.</doc:description>
      </xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element minOccurs=""0"" maxOccurs=""1"" name=""RETURN"" nillable=""true"" type=""ns3:ArrayOfBAPIRET2"">
          <xs:annotation>
            <xs:documentation>Return Parameter</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element minOccurs=""0"" maxOccurs=""1"" name=""T_HUNUM"" nillable=""true"" type=""ns3:ArrayOfZITF_E07003_HUNUM"">
          <xs:annotation>
            <xs:documentation>HU Numbers</xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name=""ZITF_E07003_GRB2BResponse"">
    <xs:annotation>
      <xs:documentation>
        <doc:action xmlns:doc=""http://schemas.microsoft.com/servicemodel/adapters/metadata/documentation"">http://Microsoft.LobServices.Sap/2007/03/Rfc/ZITF_E07003_GRB2B/response</doc:action>
        <doc:description xmlns:doc=""http://schemas.microsoft.com/servicemodel/adapters/metadata/documentation"">The Metadata for this RFC was generated using the .Net Connector.</doc:description>
      </xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element minOccurs=""0"" maxOccurs=""1"" name=""RETURN"" nillable=""true"" type=""ns3:ArrayOfBAPIRET2"">
          <xs:annotation>
            <xs:documentation>Return Parameter</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element minOccurs=""0"" maxOccurs=""1"" name=""T_HUNUM"" nillable=""true"" type=""ns3:ArrayOfZITF_E07003_HUNUM"">
          <xs:annotation>
            <xs:documentation>HU Numbers</xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public Rfc() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [2];
                _RootElements[0] = "ZITF_E07003_GRB2B";
                _RootElements[1] = "ZITF_E07003_GRB2BResponse";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Rfc/",@"ZITF_E07003_GRB2B")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"ZITF_E07003_GRB2B"})]
        public sealed class ZITF_E07003_GRB2B : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public ZITF_E07003_GRB2B() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "ZITF_E07003_GRB2B";
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
        
        [Schema(@"http://Microsoft.LobServices.Sap/2007/03/Rfc/",@"ZITF_E07003_GRB2BResponse")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"ZITF_E07003_GRB2BResponse"})]
        public sealed class ZITF_E07003_GRB2BResponse : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public ZITF_E07003_GRB2BResponse() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "ZITF_E07003_GRB2BResponse";
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
