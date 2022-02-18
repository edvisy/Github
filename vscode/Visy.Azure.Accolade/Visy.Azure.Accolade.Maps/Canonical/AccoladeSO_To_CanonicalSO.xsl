<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"    
                xmlns:s0="http://www.openapplications.org/oagis/10"
                xmlns:ns0="http://Visy.Middleware.Ramco.Accolade.Schemas.salesordercanonical"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"  />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ProcessSalesOrder" />
  </xsl:template>
  <xsl:template match="/s0:ProcessSalesOrder">
    <ns0:ProcessSalesOrder>
      <ns0:ApplicationArea>
        <xsl:for-each select="s0:ApplicationArea/s0:Sender">
          <xsl:for-each select="s0:LogicalID">
            <ns0:Sender>
              <ns0:LogicalID>
                <xsl:value-of select="./text()" />
              </ns0:LogicalID>
              <xsl:if test="../s0:ComponentID">
                <ns0:ComponentID>
                  <xsl:value-of select="../s0:ComponentID/text()" />
                </ns0:ComponentID>
              </xsl:if>
              <xsl:if test="../s0:ReferenceID">
                <ns0:ReferenceID>
                  <xsl:value-of select="../s0:ReferenceID/text()" />
                </ns0:ReferenceID>
              </xsl:if>
            </ns0:Sender>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="s0:ApplicationArea/s0:Receiver">
          <xsl:for-each select="s0:LogicalID">
            <ns0:Receiver>
              <ns0:LogicalID>
                <xsl:value-of select="./text()" />
              </ns0:LogicalID>
              <xsl:if test="../s0:ComponentID">
                <ns0:ComponentID>
                  <xsl:value-of select="../s0:ComponentID/text()" />
                </ns0:ComponentID>
              </xsl:if>
            </ns0:Receiver>
          </xsl:for-each>
        </xsl:for-each>
        <ns0:CreationDateTime>
          <xsl:value-of select="s0:ApplicationArea/s0:CreationDateTime/text()" />
        </ns0:CreationDateTime>
        <xsl:if test="s0:ApplicationArea/s0:BODID">
          <ns0:BODID>
            <xsl:value-of select="s0:ApplicationArea/s0:BODID/text()" />
          </ns0:BODID>
        </xsl:if>
      </ns0:ApplicationArea>
      <ns0:DataArea>
        <ns0:Process>
          <xsl:for-each select="s0:DataArea/s0:Process/s0:ActionCriteria">
            <xsl:for-each select="s0:ActionExpression">
              <ns0:ActionCriteria>
                <ns0:ActionExpression>
                  <xsl:value-of select="./text()" />
                </ns0:ActionExpression>
              </ns0:ActionCriteria>
            </xsl:for-each>
          </xsl:for-each>
        </ns0:Process>
        <ns0:SalesOrder>
          <xsl:for-each select="s0:DataArea/s0:SalesOrder">
            <xsl:for-each select="s0:SalesOrderHeader">
              <xsl:for-each select="s0:VariationID">
                <ns0:SalesOrderHeader>
                  <xsl:for-each select="../s0:ID">
                    <ns0:ID>
                      <xsl:value-of select="./text()" />
                    </ns0:ID>
                  </xsl:for-each>
                  <ns0:VariationID>
                    <xsl:value-of select="./text()" />
                  </ns0:VariationID>
                  <xsl:for-each select="../s0:DocumentReference">
                    <xsl:for-each select="s0:ID">
                      <ns0:DocumentReference>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                      </ns0:DocumentReference>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:for-each select="../s0:CustomerParty">
                    <xsl:for-each select="s0:ID">
                      <ns0:CustomerParty>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                        <xsl:if test="../s0:Name">
                          <ns0:Name>
                            <xsl:value-of select="../s0:Name/text()" />
                          </ns0:Name>
                        </xsl:if>
                      </ns0:CustomerParty>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:for-each select="../s0:ShipToParty">
                    <xsl:for-each select="s0:ID">
                      <ns0:ShipToParty>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                        <xsl:if test="../s0:Name">
                          <ns0:Name>
                            <xsl:value-of select="../s0:Name/text()" />
                          </ns0:Name>
                        </xsl:if>
                        <ns0:Location>
                          <xsl:for-each select="../s0:Location">
                            <xsl:for-each select="s0:Address">
                              <xsl:for-each select="s0:CitySubDivisionName">
                                <ns0:Address>
                                  <xsl:for-each select="../s0:AddressLine">
                                    <ns0:AddressLine>
                                      <xsl:value-of select="./text()" />
                                    </ns0:AddressLine>
                                  </xsl:for-each>
                                  <xsl:if test="../s0:CityName">
                                    <ns0:CityName>
                                      <xsl:value-of select="../s0:CityName/text()" />
                                    </ns0:CityName>
                                  </xsl:if>
                                  <ns0:CitySubDivisionName>
                                    <xsl:value-of select="./text()" />
                                  </ns0:CitySubDivisionName>
                                  <xsl:if test="../s0:CountryCode">
                                    <ns0:CountryCode>
                                      <xsl:value-of select="../s0:CountryCode/text()" />
                                    </ns0:CountryCode>
                                  </xsl:if>
                                  <xsl:if test="../s0:PostalCode">
                                    <ns0:PostalCode>
                                      <xsl:value-of select="../s0:PostalCode/text()" />
                                    </ns0:PostalCode>
                                  </xsl:if>
                                </ns0:Address>
                              </xsl:for-each>
                            </xsl:for-each>
                          </xsl:for-each>
                          <xsl:for-each select="../s0:Location">
                            <xsl:for-each select="s0:LocationArea">
                              <xsl:for-each select="s0:ID">
                                <ns0:LocationArea>
                                  <ns0:ID>
                                    <xsl:value-of select="./text()" />
                                  </ns0:ID>
                                </ns0:LocationArea>
                              </xsl:for-each>
                            </xsl:for-each>
                          </xsl:for-each>
                        </ns0:Location>
                        <ns0:Contact>
                          <xsl:for-each select="../s0:Contact">
                            <xsl:for-each select="s0:PersonName">
                              <xsl:for-each select="s0:FormattedName">
                                <ns0:PersonName>
                                  <ns0:FormattedName>
                                    <xsl:value-of select="./text()" />
                                  </ns0:FormattedName>
                                </ns0:PersonName>
                              </xsl:for-each>
                            </xsl:for-each>
                          </xsl:for-each>
                        </ns0:Contact>
                      </ns0:ShipToParty>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:for-each select="../s0:ExtendedAmount">
                    <ns0:ExtendedAmount>
                      <xsl:if test="@currencyCode">
                        <xsl:attribute name="currencyCode">
                          <xsl:value-of select="@currencyCode" />
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:value-of select="./text()" />
                    </ns0:ExtendedAmount>
                  </xsl:for-each>
                  <xsl:for-each select="../s0:CarrierParty">
                    <xsl:for-each select="s0:ID">
                      <ns0:CarrierParty>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                        <xsl:if test="../s0:Name">
                          <ns0:Name>
                            <xsl:value-of select="../s0:Name/text()" />
                          </ns0:Name>
                        </xsl:if>
                      </ns0:CarrierParty>
                    </xsl:for-each>
                  </xsl:for-each>
                  <ns0:FulfillmentTerm>
                    <xsl:for-each select="../s0:FulfillmentTerm">
                      <xsl:for-each select="s0:RequestedDeliveryEquipmentSpecification">
                        <xsl:for-each select="s0:ID">
                          <ns0:RequestedDeliveryEquipmentSpecification>
                            <ns0:ID>
                              <xsl:value-of select="./text()" />
                            </ns0:ID>
                          </ns0:RequestedDeliveryEquipmentSpecification>
                        </xsl:for-each>
                      </xsl:for-each>
                    </xsl:for-each>
                  </ns0:FulfillmentTerm>
                  <xsl:for-each select="../s0:TransportStep">
                    <xsl:for-each select="s0:TransportationMethodCode">
                      <ns0:TransportStep>
                        <ns0:TransportationMethodCode>
                          <xsl:value-of select="./text()" />
                        </ns0:TransportationMethodCode>
                        <xsl:for-each select="../s0:TransportationTerm">
                          <xsl:for-each select="s0:Description">
                            <ns0:TransportationTerm>
                              <xsl:if test="../s0:IncotermsCode">
                                <ns0:IncotermsCode>
                                  <xsl:value-of select="../s0:IncotermsCode/text()" />
                                </ns0:IncotermsCode>
                              </xsl:if>
                              <ns0:Description>
                                <xsl:value-of select="./text()" />
                              </ns0:Description>
                            </ns0:TransportationTerm>
                          </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="../s0:GrossWeightMeasure">
                          <ns0:GrossWeightMeasure>
                            <xsl:if test="@unitCode">
                              <xsl:attribute name="unitCode">
                                <xsl:value-of select="@unitCode" />
                              </xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="./text()" />
                          </ns0:GrossWeightMeasure>
                        </xsl:for-each>
                        <xsl:for-each select="../s0:TotalVolumeMeasure">
                          <ns0:TotalVolumeMeasure>
                            <xsl:if test="@unitCode">
                              <xsl:attribute name="unitCode">
                                <xsl:value-of select="@unitCode" />
                              </xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="./text()" />
                          </ns0:TotalVolumeMeasure>
                        </xsl:for-each>
                        <xsl:for-each select="../s0:CarrierRouteReference">
                          <xsl:for-each select="s0:ID">
                            <ns0:CarrierRouteReference>
                              <ns0:ID>
                                <xsl:value-of select="./text()" />
                              </ns0:ID>
                            </ns0:CarrierRouteReference>
                          </xsl:for-each>
                        </xsl:for-each>
                      </ns0:TransportStep>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:if test="../s0:PromisedDeliveryDateTime">
                    <ns0:PromisedDeliveryDateTime>
                      <xsl:value-of select="../s0:PromisedDeliveryDateTime/text()" />
                    </ns0:PromisedDeliveryDateTime>
                  </xsl:if>
                  <xsl:for-each select="../s0:Payment">
                    <xsl:for-each select="s0:Description">
                      <ns0:Payment>
                        <ns0:Description>
                          <xsl:value-of select="./text()" />
                        </ns0:Description>
                        <xsl:for-each select="../s0:PaymentTerm">
                          <xsl:for-each select="s0:ID">
                            <ns0:PaymentTerm>
                              <ns0:ID>
                                <xsl:value-of select="./text()" />
                              </ns0:ID>
                            </ns0:PaymentTerm>
                          </xsl:for-each>
                        </xsl:for-each>
                      </ns0:Payment>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:if test="../s0:ShippingInstructions">
                    <ns0:ShippingInstructions>
                      <xsl:value-of select="../s0:ShippingInstructions/text()" />
                    </ns0:ShippingInstructions>
                  </xsl:if>
                  <xsl:if test="../s0:DistributionCenterCode">
                    <ns0:DistributionCenterCode>
                      <xsl:value-of select="../s0:DistributionCenterCode/text()" />
                    </ns0:DistributionCenterCode>
                  </xsl:if>
                  <xsl:for-each select="../s0:PurchaseOrderReference">
                    <xsl:for-each select="s0:ID">
                      <ns0:PurchaseOrderReference>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                      </ns0:PurchaseOrderReference>
                    </xsl:for-each>
                  </xsl:for-each>
                  <ns0:Extension>
                    <xsl:for-each select="../s0:Extension">
                      <xsl:for-each select="s0:ValueText">
                        <ns0:ValueText>
                          <xsl:if test="@typeCode">
                            <xsl:attribute name="typeCode">
                              <xsl:value-of select="@typeCode" />
                            </xsl:attribute>
                          </xsl:if>
                        </ns0:ValueText>
                      </xsl:for-each>
                    </xsl:for-each>
                  </ns0:Extension>
                </ns0:SalesOrderHeader>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:for-each select="s0:DataArea/s0:SalesOrder">
            <xsl:for-each select="s0:SalesOrderLine">
              <xsl:for-each select="s0:LineNumberID">
                <ns0:SalesOrderLine>
                  <ns0:LineNumberID>
                    <xsl:value-of select="./text()" />
                  </ns0:LineNumberID>
                  <xsl:for-each select="../s0:Item">
                    <xsl:for-each select="s0:Description">
                      <ns0:Item>
                        <xsl:if test="../s0:ID">
                          <ns0:ID>
                            <xsl:value-of select="../s0:ID/text()" />
                          </ns0:ID>
                        </xsl:if>
                        <xsl:if test="../s0:VariationID">
                          <ns0:VariationID>
                            <xsl:value-of select="../s0:VariationID/text()" />
                          </ns0:VariationID>
                        </xsl:if>
                        <ns0:Description>
                          <xsl:value-of select="./text()" />
                        </ns0:Description>
                        <xsl:for-each select="../s0:Classification">
                          <xsl:for-each select="s0:ID">
                            <ns0:Classification>
                              <ns0:ID>
                                <xsl:value-of select="./text()" />
                              </ns0:ID>
                            </ns0:Classification>
                          </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="../s0:Lot">
                          <xsl:for-each select="s0:ID">
                            <ns0:Lot>
                              <ns0:ID>
                                <xsl:value-of select="./text()" />
                              </ns0:ID>
                            </ns0:Lot>
                          </xsl:for-each>
                        </xsl:for-each>
                      </ns0:Item>
                    </xsl:for-each>
                  </xsl:for-each>
                  <xsl:for-each select="../s0:Quantity">
                    <ns0:Quantity>
                      <xsl:if test="@unitCode">
                        <xsl:attribute name="unitCode">
                          <xsl:value-of select="@unitCode" />
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:value-of select="./text()" />
                    </ns0:Quantity>
                  </xsl:for-each>
                  <ns0:UnitPrice>
                    <xsl:for-each select="../s0:UnitPrice">
                      <xsl:for-each select="s0:UnitAmount">
                        <ns0:UnitAmount>
                          <xsl:if test="@currencyCode">
                            <xsl:attribute name="currencyCode">
                              <xsl:value-of select="@currencyCode" />
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="./text()" />
                        </ns0:UnitAmount>
                      </xsl:for-each>
                    </xsl:for-each>
                  </ns0:UnitPrice>
                  <xsl:for-each select="../s0:ExtendedAmount">
                    <ns0:ExtendedAmount>
                      <xsl:if test="@currencyCode">
                        <xsl:attribute name="currencyCode">
                          <xsl:value-of select="@currencyCode" />
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:value-of select="./text()" />
                    </ns0:ExtendedAmount>
                  </xsl:for-each>
                </ns0:SalesOrderLine>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </ns0:SalesOrder>
      </ns0:DataArea>
    </ns0:ProcessSalesOrder>
  </xsl:template>
</xsl:stylesheet>