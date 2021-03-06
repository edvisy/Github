<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"    
                xmlns:s0="http://www.openapplications.org/oagis/10"
                xmlns:ns0="http://Visy.Middleware.Ramco.Accolade.Schemas.asncanonical"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"  />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:NotifyShipment" />
  </xsl:template>
  <xsl:template match="/s0:NotifyShipment">
    <ns0:NotifyShipment>
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
        <ns0:Notify>
          <xsl:for-each select="s0:DataArea/s0:Notify/s0:ActionCriteria">
            <xsl:for-each select="s0:ActionExpression">
              <ns0:ActionCriteria>
                <ns0:ActionExpression>
                  <xsl:value-of select="./text()" />
                </ns0:ActionExpression>
              </ns0:ActionCriteria>
            </xsl:for-each>
          </xsl:for-each>
        </ns0:Notify>
        <ns0:Shipment>
          <xsl:for-each select="s0:DataArea/s0:Shipment">
            <xsl:for-each select="s0:ShipmentHeader">
              <xsl:for-each select="s0:ID">
                <ns0:ShipmentHeader>
                  <ns0:ID>
                    <xsl:value-of select="./text()" />
                  </ns0:ID>
                  <xsl:if test="../s0:VariationID">
                    <ns0:VariationID>
                      <xsl:value-of select="../s0:VariationID/text()" />
                    </ns0:VariationID>
                  </xsl:if>
                  <xsl:for-each select="../s0:DocumentReference">
                    <ns0:DocumentReference>
                      <xsl:if test="s0:ID">
                        <ns0:ID>
                          <xsl:value-of select="s0:ID/text()" />
                        </ns0:ID>
                      </xsl:if>
                      <xsl:value-of select="./text()" />
                    </ns0:DocumentReference>
                  </xsl:for-each>
                  <xsl:if test="../s0:ActualShipDateTime">
                    <ns0:ActualShipDateTime>
                      <xsl:value-of select="../s0:ActualShipDateTime/text()" />
                    </ns0:ActualShipDateTime>
                  </xsl:if>
                  <xsl:if test="../s0:ScheduledDeliveryDateTime">
                    <ns0:ScheduledDeliveryDateTime>
                      <xsl:value-of select="../s0:ScheduledDeliveryDateTime/text()" />
                    </ns0:ScheduledDeliveryDateTime>
                  </xsl:if>
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
                  <xsl:for-each select="../s0:ShipFromParty">
                    <xsl:for-each select="s0:ID">
                      <ns0:ShipFromParty>
                        <ns0:ID>
                          <xsl:value-of select="./text()" />
                        </ns0:ID>
                        <xsl:if test="../s0:Name">
                          <ns0:Name>
                            <xsl:value-of select="../s0:Name/text()" />
                          </ns0:Name>
                        </xsl:if>
                      </ns0:ShipFromParty>
                    </xsl:for-each>
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
                                <ns0:Address>
                                <xsl:for-each select="s0:AddressLine">
                                  <ns0:AddressLine>
                                    <xsl:value-of select="./text()" />
                                  </ns0:AddressLine>
                                </xsl:for-each>
                                  <xsl:if test="s0:CityName">
                                    <ns0:CityName>
                                      <xsl:value-of select="s0:CityName/text()" />
                                    </ns0:CityName>
                                  </xsl:if>
                                  <xsl:if test="s0:CountrySubDivisionCode">
                                    <ns0:CountrySubDivisionCode>
                                      <xsl:value-of select="../s0:CountrySubDivisionCode/text()" />
                                    </ns0:CountrySubDivisionCode>
                                  </xsl:if>
                                  <xsl:if test="s0:CountryCode">
                                    <ns0:CountryCode>
                                      <xsl:value-of select="s0:CountryCode/text()" />
                                    </ns0:CountryCode>
                                  </xsl:if>
                                  <xsl:if test="s0:PostalCode">
                                    <ns0:PostalCode>
                                      <xsl:value-of select="s0:PostalCode/text()" />
                                    </ns0:PostalCode>
                                  </xsl:if>
                                </ns0:Address>                              
                            </xsl:for-each>
                          </xsl:for-each>
                        </ns0:Location>
                      </ns0:ShipToParty>
                    </xsl:for-each>
                  </xsl:for-each>
                </ns0:ShipmentHeader>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:for-each select="s0:DataArea/s0:Shipment">
            <xsl:for-each select="s0:ShipmentUnit">
              <xsl:for-each select="s0:ID">
                <ns0:ShipmentUnit>
                  <ns0:ID>
                    <xsl:value-of select="./text()" />
                  </ns0:ID>
                  <xsl:if test="../s0:ContainerID">
                    <ns0:ContainerID>
                      <xsl:value-of select="../s0:ContainerID/text()" />
                    </ns0:ContainerID>
                  </xsl:if>
                  <ns0:ShipmentUnitItem>
                    <xsl:for-each select="../s0:ShipmentUnitItem">
                      <xsl:for-each select="s0:Quantity">
                        <ns0:Quantity>
                          <xsl:if test="@unitCode">
                            <xsl:attribute name="unitCode">
                              <xsl:value-of select="@unitCode" />
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="./text()" />
                        </ns0:Quantity>
                      </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="../s0:ShipmentUnitItem">
                      <xsl:for-each select="s0:ItemInstance">
                        <xsl:for-each select="s0:Description">
                          <ns0:ItemInstance>
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
                            <xsl:for-each select="../s0:Lot">
                              <xsl:for-each select="s0:ID">
                                <ns0:Lot>
                                  <ns0:ID>
                                    <xsl:value-of select="./text()" />
                                  </ns0:ID>
                                  <xsl:for-each select="../s0:EffectiveTimePeriod">                                    
                                      <ns0:EffectiveTimePeriod>
                                        <ns0:StartDateTime>
                                          <xsl:value-of select="s0:StartDateTime/text()" />
                                        </ns0:StartDateTime>
                                        <ns0:EndDateTime>
                                          <xsl:value-of select="s0:EndDateTime/text()" />
                                        </ns0:EndDateTime>
                                      </ns0:EffectiveTimePeriod>
                                  </xsl:for-each>
                                  <xsl:if test="..">
                                    <xsl:value-of select="../text()" />
                                  </xsl:if>
                                </ns0:Lot>
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
                            <xsl:for-each select="../s0:Packaging">
                              <xsl:for-each select="s0:ID">
                                <ns0:Packaging>
                                  <ns0:ID>
                                    <xsl:value-of select="./text()" />
                                  </ns0:ID>
                                  <xsl:if test="../s0:Description">
                                    <ns0:Description>
                                      <xsl:value-of select="../s0:Description/text()" />
                                    </ns0:Description>
                                  </xsl:if>
                                </ns0:Packaging>
                              </xsl:for-each>
                            </xsl:for-each>
                            <xsl:if test="..">
                              <xsl:value-of select="../text()" />
                            </xsl:if>
                          </ns0:ItemInstance>
                        </xsl:for-each>
                      </xsl:for-each>
                    </xsl:for-each>
                  </ns0:ShipmentUnitItem>
                </ns0:ShipmentUnit>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </ns0:Shipment>
      </ns0:DataArea>
    </ns0:NotifyShipment>
  </xsl:template>
</xsl:stylesheet>