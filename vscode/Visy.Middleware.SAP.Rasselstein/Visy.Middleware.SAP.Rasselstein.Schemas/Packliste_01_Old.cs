namespace Visy.Middleware.SAP.Rasselstein.Schemas {
    using Microsoft.XLANGs.BaseTypes;
    
    
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.BizTalk.Schema.Compiler", "3.0.1.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [SchemaType(SchemaTypeEnum.Document)]
    [Schema(@"",@"PACKING_LISTS")]
    [System.SerializableAttribute()]
    [SchemaRoots(new string[] {@"PACKING_LISTS"})]
    public sealed class Packliste_01 : Microsoft.XLANGs.BaseTypes.SchemaBase {
        
        [System.NonSerializedAttribute()]
        private static object _rawSchema;
        
        [System.NonSerializedAttribute()]
        private const string _strSchema = @"<?xml version=""1.0"" encoding=""utf-16""?>
<xs:schema xmlns:b=""http://schemas.microsoft.com/BizTalk/2003"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"">
  <xs:element name=""PACKING_LISTS"" type=""PACKING_LISTS"">
    <xs:annotation>
      <xs:appinfo>
        <title>Packing List</title>
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:complexType name=""PACKING_LISTS"">
    <xs:sequence>
      <xs:element maxOccurs=""99"" name=""PACKING_LIST"">
        <xs:complexType>
          <xs:sequence>
            <xs:element maxOccurs=""99"" name=""HEADER"">
              <xs:complexType>
                <xs:sequence>
                  <xs:element name=""SUPPLIER"">
                    <xs:annotation>
                      <xs:appinfo>
                        <title>Lieferant</title>
                      </xs:appinfo>
                    </xs:annotation>
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name=""ADDRESS"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Addresse des Lieferanten</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:complexType>
                            <xs:sequence>
                              <xs:element maxOccurs=""99"" name=""NAME"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Firmenname des Lieferanten</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""35"" />
                                    <xs:maxLength value=""35"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""STREET"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Strasse</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""35"" />
                                    <xs:maxLength value=""35"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""ZIP"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>PLZ</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""10"" />
                                    <xs:maxLength value=""10"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""CITY"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Ort</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""35"" />
                                    <xs:maxLength value=""35"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""COUNTRY_ISO_CODE"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Land</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""3"" />
                                    <xs:maxLength value=""3"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                            </xs:sequence>
                          </xs:complexType>
                        </xs:element>
                      </xs:sequence>
                    </xs:complexType>
                  </xs:element>
                  <xs:element name=""BUYER"">
                    <xs:annotation>
                      <xs:appinfo>
                        <title>Kunde</title>
                      </xs:appinfo>
                    </xs:annotation>
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name=""CUSTOMER_NUMBER"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""10"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element minOccurs=""0"" name=""PLANT_NUMBER"" type=""xs:string"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Plant Number</title>
                            </xs:appinfo>
                          </xs:annotation>
                        </xs:element>
                        <xs:element name=""ADDRESS"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Addresse des Kunden</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:complexType>
                            <xs:sequence>
                              <xs:element maxOccurs=""99"" name=""NAME"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Firmenname des Lieferanten</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""40"" />
                                    <xs:maxLength value=""40"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""STREET"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Strasse</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""40"" />
                                    <xs:maxLength value=""40"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""ZIP"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>PLZ</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""10"" />
                                    <xs:maxLength value=""10"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""CITY"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Ort</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""40"" />
                                    <xs:maxLength value=""40"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element maxOccurs=""99"" name=""COUNTRY_ISO_CODE"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Land</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""3"" />
                                    <xs:maxLength value=""3"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                            </xs:sequence>
                          </xs:complexType>
                        </xs:element>
                      </xs:sequence>
                    </xs:complexType>
                  </xs:element>
                  <xs:element name=""HEADER_REFERENCES"">
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name=""TRANSPORT_MEDIUM"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Transportart</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""20"" />
                              <xs:maxLength value=""20"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""EXT_TRANSPORT_ID"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Waggon-Nr.</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""20"" />
                              <xs:maxLength value=""20"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUPPLIER_TRANSPORT_NUMBER"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Transport-Nr.</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""10"" />
                              <xs:maxLength value=""10"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element minOccurs=""0"" name=""BOL_NUMBER"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Bill of Lading Number</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""20"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                      </xs:sequence>
                    </xs:complexType>
                  </xs:element>
                  <xs:element name=""SUMMARY"">
                    <xs:annotation>
                      <xs:appinfo>
                        <title>Zusammenfassung</title>
                      </xs:appinfo>
                    </xs:annotation>
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name=""Weight"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Gewichte</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:complexType mixed=""true"">
                            <xs:sequence>
                              <xs:element name=""NET"">
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""15"" />
                                    <xs:maxLength value=""15"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                              <xs:element name=""GROSS"">
                                <xs:simpleType>
                                  <xs:restriction base=""xs:string"">
                                    <xs:minLength value=""15"" />
                                    <xs:maxLength value=""15"" />
                                  </xs:restriction>
                                </xs:simpleType>
                              </xs:element>
                            </xs:sequence>
                            <xs:attribute name=""Unit"" use=""required"">
                              <xs:annotation>
                                <xs:appinfo>
                                  <title>VME</title>
                                </xs:appinfo>
                              </xs:annotation>
                              <xs:simpleType>
                                <xs:restriction base=""xs:string"">
                                  <xs:minLength value=""3"" />
                                  <xs:maxLength value=""3"" />
                                </xs:restriction>
                              </xs:simpleType>
                            </xs:attribute>
                          </xs:complexType>
                        </xs:element>
                      </xs:sequence>
                      <xs:attribute name=""QUANTITY_OF_PACKAGES"" type=""xs:decimal"" use=""required"" />
                    </xs:complexType>
                  </xs:element>
                  <xs:element maxOccurs=""99"" name=""Material"">
                    <xs:annotation>
                      <xs:appinfo>
                        <title>Material</title>
                      </xs:appinfo>
                    </xs:annotation>
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name=""MATERIAL_TYPE"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""5"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUPPLIER_ORDER_NUMBER"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""10"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUPPLIER_ORDER_ITEM"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""6"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element minOccurs=""0"" name=""BUYER_ARTICLE_NUMBER"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Kundenmaterialnummer</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""25"" />
                              <xs:maxLength value=""25"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUPPLIER_MATERIAL_NUMBER"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""18"" />
                              <xs:maxLength value=""18"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUPPLIER_MATERIAL_DESCRIPTION"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:maxLength value=""40"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element minOccurs=""0"" name=""BUYER_ORDER_NUMBER"">
                          <xs:simpleType>
                            <xs:restriction base=""xs:string"">
                              <xs:minLength value=""35"" />
                              <xs:maxLength value=""35"" />
                            </xs:restriction>
                          </xs:simpleType>
                        </xs:element>
                        <xs:element name=""SUMMARY"">
                          <xs:annotation>
                            <xs:appinfo>
                              <title>Zusammenfassung</title>
                            </xs:appinfo>
                          </xs:annotation>
                          <xs:complexType>
                            <xs:sequence>
                              <xs:element default=""1.0"" name=""QUANTITY_PACKAGES"" type=""xs:decimal"" />
                              <xs:element name=""QUANTITY_OF_ARTICLES"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Menge in VME</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:complexType>
                                  <xs:simpleContent>
                                    <xs:extension base=""QUANTITY_OF_ARTICLES"">
                                      <xs:attribute name=""Unit"" use=""required"">
                                        <xs:annotation>
                                          <xs:appinfo>
                                            <title>VME</title>
                                          </xs:appinfo>
                                        </xs:annotation>
                                        <xs:simpleType>
                                          <xs:restriction base=""xs:string"">
                                            <xs:minLength value=""3"" />
                                            <xs:maxLength value=""3"" />
                                          </xs:restriction>
                                        </xs:simpleType>
                                      </xs:attribute>
                                    </xs:extension>
                                  </xs:simpleContent>
                                </xs:complexType>
                              </xs:element>
                              <xs:element name=""Weight"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Gewichte</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:complexType mixed=""true"">
                                  <xs:sequence>
                                    <xs:element name=""NET"">
                                      <xs:simpleType>
                                        <xs:restriction base=""xs:string"">
                                          <xs:minLength value=""15"" />
                                          <xs:maxLength value=""15"" />
                                        </xs:restriction>
                                      </xs:simpleType>
                                    </xs:element>
                                    <xs:element name=""GROSS"">
                                      <xs:simpleType>
                                        <xs:restriction base=""xs:string"">
                                          <xs:minLength value=""15"" />
                                          <xs:maxLength value=""15"" />
                                        </xs:restriction>
                                      </xs:simpleType>
                                    </xs:element>
                                  </xs:sequence>
                                  <xs:attribute name=""Unit"" use=""required"">
                                    <xs:annotation>
                                      <xs:appinfo>
                                        <title>VME</title>
                                      </xs:appinfo>
                                    </xs:annotation>
                                    <xs:simpleType>
                                      <xs:restriction base=""xs:string"">
                                        <xs:minLength value=""3"" />
                                        <xs:maxLength value=""3"" />
                                      </xs:restriction>
                                    </xs:simpleType>
                                  </xs:attribute>
                                </xs:complexType>
                              </xs:element>
                            </xs:sequence>
                          </xs:complexType>
                        </xs:element>
                        <xs:element maxOccurs=""99"" name=""PACKAGES"">
                          <xs:complexType>
                            <xs:sequence>
                              <xs:element maxOccurs=""999"" name=""PACKAGE"">
                                <xs:annotation>
                                  <xs:appinfo>
                                    <title>Packst??ck</title>
                                  </xs:appinfo>
                                </xs:annotation>
                                <xs:complexType>
                                  <xs:sequence>
                                    <xs:element name=""PACKAGE_NUMBER"">
                                      <xs:simpleType>
                                        <xs:restriction base=""xs:string"">
                                          <xs:minLength value=""10"" />
                                          <xs:maxLength value=""10"" />
                                        </xs:restriction>
                                      </xs:simpleType>
                                    </xs:element>
                                    <xs:element name=""WIDTH"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""WIDTH"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""3"" />
                                                  <xs:maxLength value=""3"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""LENGTH"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""LENGTH"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""3"" />
                                                  <xs:maxLength value=""3"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element name=""THICKNESS"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""THICKNESS"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""3"" />
                                                  <xs:maxLength value=""3"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""TINCOATING_UPSIDE"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""TINCOATING_UPSIDE"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""8"" />
                                                  <xs:maxLength value=""8"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""TINCOATING_DOWNSIDE"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""TINCOATING_DOWNSIDE"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""8"" />
                                                  <xs:maxLength value=""8"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""TEMPER"">
                                      <xs:simpleType>
                                        <xs:restriction base=""xs:string"">
                                          <xs:minLength value=""10"" />
                                          <xs:maxLength value=""10"" />
                                        </xs:restriction>
                                      </xs:simpleType>
                                    </xs:element>
                                    <xs:element name=""Weight"">
                                      <xs:annotation>
                                        <xs:appinfo>
                                          <title>Gewichte</title>
                                        </xs:appinfo>
                                      </xs:annotation>
                                      <xs:complexType mixed=""true"">
                                        <xs:sequence>
                                          <xs:element name=""NET"">
                                            <xs:simpleType>
                                              <xs:restriction base=""xs:string"">
                                                <xs:minLength value=""15"" />
                                                <xs:maxLength value=""15"" />
                                              </xs:restriction>
                                            </xs:simpleType>
                                          </xs:element>
                                          <xs:element name=""GROSS"">
                                            <xs:simpleType>
                                              <xs:restriction base=""xs:string"">
                                                <xs:minLength value=""15"" />
                                                <xs:maxLength value=""15"" />
                                              </xs:restriction>
                                            </xs:simpleType>
                                          </xs:element>
                                        </xs:sequence>
                                        <xs:attribute name=""Unit"" use=""required"">
                                          <xs:annotation>
                                            <xs:appinfo>
                                              <title>VME</title>
                                            </xs:appinfo>
                                          </xs:annotation>
                                          <xs:simpleType>
                                            <xs:restriction base=""xs:string"">
                                              <xs:minLength value=""3"" />
                                              <xs:maxLength value=""3"" />
                                            </xs:restriction>
                                          </xs:simpleType>
                                        </xs:attribute>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""QUANTITY_OF_SHEETS"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""QUANTITY_OF_SHEETS"">
                                            <xs:attribute default=""        "" name=""UNIT"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""8"" />
                                                  <xs:maxLength value=""8"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""QUANTITY_OF_METERS"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""QUANTITY_OF_METERS"">
                                            <xs:attribute default=""        "" name=""UNIT"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""8"" />
                                                  <xs:maxLength value=""8"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""QUANTITY_OF_ARTICLES"">
                                      <xs:complexType>
                                        <xs:simpleContent>
                                          <xs:extension base=""QUANTITY_OF_ARTICLES-1"">
                                            <xs:attribute name=""UNIT"" use=""required"">
                                              <xs:simpleType>
                                                <xs:restriction base=""xs:string"">
                                                  <xs:minLength value=""8"" />
                                                  <xs:maxLength value=""8"" />
                                                </xs:restriction>
                                              </xs:simpleType>
                                            </xs:attribute>
                                          </xs:extension>
                                        </xs:simpleContent>
                                      </xs:complexType>
                                    </xs:element>
                                    <xs:element minOccurs=""0"" name=""WA_NUMBER"">
                                      <xs:simpleType>
                                        <xs:restriction base=""xs:string"">
                                          <xs:minLength value=""10"" />
                                          <xs:maxLength value=""10"" />
                                        </xs:restriction>
                                      </xs:simpleType>
                                    </xs:element>
                                  </xs:sequence>
                                </xs:complexType>
                              </xs:element>
                            </xs:sequence>
                          </xs:complexType>
                        </xs:element>
                      </xs:sequence>
                    </xs:complexType>
                  </xs:element>
                </xs:sequence>
                <xs:attribute name=""PACKING_LIST_NUMBER"" use=""required"">
                  <xs:annotation>
                    <xs:appinfo>
                      <title>Lieferschein-Nr.</title>
                    </xs:appinfo>
                  </xs:annotation>
                  <xs:simpleType>
                    <xs:restriction base=""xs:string"">
                      <xs:minLength value=""10"" />
                      <xs:maxLength value=""10"" />
                    </xs:restriction>
                  </xs:simpleType>
                </xs:attribute>
                <xs:attribute name=""PACKING_LIST_DATE"" type=""xs:dateTime"" use=""required"">
                  <xs:annotation>
                    <xs:appinfo>
                      <title>Lieferdatum</title>
                    </xs:appinfo>
                  </xs:annotation>
                </xs:attribute>
                <xs:attribute name=""PACKING_LIST_PROCES_TYPE"" type=""xs:string"" />
              </xs:complexType>
            </xs:element>
          </xs:sequence>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name=""QUANTITY_OF_ARTICLES"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""15"" />
      <xs:maxLength value=""15"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""WIDTH"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""15"" />
      <xs:maxLength value=""15"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""LENGTH"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""15"" />
      <xs:maxLength value=""15"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""THICKNESS"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""15"" />
      <xs:maxLength value=""15"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""TINCOATING_UPSIDE"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""9"" />
      <xs:maxLength value=""9"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""TINCOATING_DOWNSIDE"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""9"" />
      <xs:maxLength value=""9"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""QUANTITY_OF_SHEETS"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""9"" />
      <xs:maxLength value=""9"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""QUANTITY_OF_METERS"">
    <xs:restriction base=""xs:string"">
      <xs:maxLength value=""9"" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name=""QUANTITY_OF_ARTICLES-1"">
    <xs:restriction base=""xs:string"">
      <xs:minLength value=""15"" />
      <xs:maxLength value=""15"" />
    </xs:restriction>
  </xs:simpleType>
</xs:schema>";
        
        public Packliste_01() {
        }
        
        public override string XmlContent {
            get {
                return _strSchema;
            }
        }
        
        public override string[] RootNodes {
            get {
                string[] _RootElements = new string [1];
                _RootElements[0] = "PACKING_LISTS";
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
