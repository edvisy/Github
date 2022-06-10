namespace Visy.Middleware.SLX.Salesforce.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Microsoft.XLANGs.BaseTypes.PropertyAttribute(typeof(global::Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.custDesc), XPath = @"/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='custDesc' and namespace-uri()='']", XsdType = @"string")]
    [Microsoft.XLANGs.BaseTypes.PropertyAttribute(typeof(global::Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.userName), XPath = @"/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='userName' and namespace-uri()='']", XsdType = @"string")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"Request", @"Response"})]
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.PropertySchema", typeof(global::Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.PropertySchema))]
    public sealed class GetSapCustomerCode : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns=""http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" xmlns:ns0=""https://Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema"" targetNamespace=""http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:annotation>
    <xs:appinfo>
      <b:imports>
        <b:namespace prefix=""ns0"" uri=""https://Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema"" location=""Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.PropertySchema"" />
      </b:imports>
    </xs:appinfo>
  </xs:annotation>
  <xs:element name=""Request"">
    <xs:annotation>
      <xs:appinfo>
        <b:properties>
          <b:property name=""ns0:custDesc"" xpath=""/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='custDesc' and namespace-uri()='']"" />
          <b:property name=""ns0:userName"" xpath=""/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='userName' and namespace-uri()='']"" />
        </b:properties>
      </xs:appinfo>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name=""custDesc"" type=""xs:string"" />
        <xs:element name=""userName"" type=""xs:string"" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name=""Response"">
    <xs:complexType>
      <xs:sequence>
        <xs:element name=""sapCustCode"" type=""xs:string"" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public GetSapCustomerCode() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [2];
                _RootElements[0] = "Request";
                _RootElements[1] = "Response";
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
        
        [Schema(@"http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId",@"Request")]
        [Microsoft.XLANGs.BaseTypes.PropertyAttribute(typeof(global::Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.custDesc), XPath = @"/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='custDesc' and namespace-uri()='']", XsdType = @"string")]
        [Microsoft.XLANGs.BaseTypes.PropertyAttribute(typeof(global::Visy.Middleware.SLX.Salesforce.Schemas.PropertySchema.userName), XPath = @"/*[local-name()='Request' and namespace-uri()='http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId']/*[local-name()='userName' and namespace-uri()='']", XsdType = @"string")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"Request"})]
        public sealed class Request : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public Request() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "Request";
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
        
        [Schema(@"http://Visy.Middleware.SLX.Salesforce.Schemas.CustomAPIGETCustomerId",@"Response")]
        [System.SerializableAttribute()]
        [SchemaRoots(new string[] {@"Response"})]
        public sealed class Response : Microsoft.XLANGs.BaseTypes.SchemaBase {
            
            [System.NonSerializedAttribute()]
            private static object _rawSchema;
            
            public Response() {
            }
            
            public override string XmlContent {
                get {
                    return _strSchema;
                }
            }
            
            public override string[] RootNodes {
                get {
                    string[] _RootElements = new string [1];
                    _RootElements[0] = "Response";
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
