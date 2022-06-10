namespace Visy.Middleware.LGX.Nestle.Excel.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Multiple",@"ASN_Multiple")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"ASN_Multiple"})]
    [Microsoft.XLANGs.BaseTypes.SchemaReference(@"Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single", typeof(global::Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single))]
    public sealed class ASN_Multiple : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Multiple"" xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" xmlns:ns0=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single"" targetNamespace=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Multiple"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:import schemaLocation=""Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single"" namespace=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single"" />
  <xs:annotation>
    <xs:appinfo>
      <b:references>
        <b:reference targetNamespace=""http://Visy.Middleware.LGX.Nestle.Excel.Schemas.ASN_Single"" />
      </b:references>
    </xs:appinfo>
  </xs:annotation>
  <xs:element name=""ASN_Multiple"">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref=""ns0:ASN_Single"" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>";
        
        public ASN_Multiple() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "ASN_Multiple";
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
