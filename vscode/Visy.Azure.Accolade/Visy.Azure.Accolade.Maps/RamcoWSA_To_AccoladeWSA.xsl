<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
                xmlns:s0="http://JFH.Interfaces2006.Accolade.Schemas.AccoladeOrderStatusMessage" 
                xmlns:ns0="http://www.openapplications.org/oagis/10"                
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"  />
   
    <xsl:template match="/">
      <xsl:apply-templates select="/s0:AccoladeOrderStatusMessageRoot" />
    </xsl:template>
    <xsl:template match="/s0:AccoladeOrderStatusMessageRoot">     
        <ns0:ProcessWarehouseShippingAdvice>
          <ns0:ApplicationArea>
            <ns0:Sender>
                <ns0:LogicalID>http://www.3PLTechincalName.com</ns0:LogicalID>
                <ns0:ComponentID>3PL Name</ns0:ComponentID>
                <ns0:ReferenceID>3PL's reference</ns0:ReferenceID>
            </ns0:Sender>
            <ns0:Receiver>
                <ns0:LogicalID>http://www.accoladewines.com</ns0:LogicalID>
                <ns0:ComponentID>Accolade</ns0:ComponentID>
            </ns0:Receiver>
            <ns0:CreationDateTime><xsl:value-of select="s0:Header/s0:SentDateTime/text()" /></ns0:CreationDateTime>
            <ns0:BODID><xsl:value-of select="concat(s0:Header/s0:Reference/text(), format-dateTime(current-dateTime(), '[Y0001][M01][D01][h01][m01][s01][f01]'))" /></ns0:BODID>
          </ns0:ApplicationArea>
          <ns0:DataArea>
            <ns0:Process>
                <ns0:ActionCriteria>
                  <ns0:ActionExpression>SHIPCONFIRM</ns0:ActionExpression>
                </ns0:ActionCriteria>
            </ns0:Process>
            <ns0:WarehouseShippingAdvice>
                <ns0:WarehouseShippingAdviceHeader>
                  <ns0:ID><xsl:value-of select="s0:Header/s0:Reference/text()" /></ns0:ID>
                  <!-- <ns0:VariationID><xsl:value-of select="s0:Body/s0:ApplicationSpecific/s0:Field[s0:FieldName='OrderCompany']/s0:FieldValue/text() "/></ns0:VariationID> -->
                  <ns0:VariationID><xsl:value-of select="''"/></ns0:VariationID>
                  <ns0:DocumentReference>
                      <ns0:ID><xsl:value-of select="s0:Body/s0:ApplicationSpecific/s0:Field[s0:FieldName='OrderType']/s0:FieldValue/text() "/></ns0:ID>
                  </ns0:DocumentReference>
                  <ns0:ShipToParty>
                      <ns0:ID></ns0:ID>
                  </ns0:ShipToParty>
                  <ns0:WarehouseParty>
                      <ns0:Location>
                        <ns0:ID>1167</ns0:ID>
                        <ns0:StorageLocation>
                            <ns0:ContainerID></ns0:ContainerID>
                            <ns0:SealID></ns0:SealID>
                        </ns0:StorageLocation>
                      </ns0:Location>
                  </ns0:WarehouseParty>
                  <ns0:TotalQuantity unitCode="EA"><xsl:value-of select="sum(s0:Body/s0:OrderDetails/s0:OrderDetail/s0:Quantity)" /></ns0:TotalQuantity>
                </ns0:WarehouseShippingAdviceHeader>
                <xsl:for-each select="s0:Body/s0:OrderDetails/s0:OrderDetail">   
                  <ns0:WarehouseShippingAdviceLine>
                    <ns0:LineNumberID><xsl:value-of select="s0:ID/text()" /></ns0:LineNumberID>
                    <ns0:ContainerID><xsl:value-of select="s0:ApplicationSpecific/s0:Field[s0:FieldName='JDEPalletNumber']/s0:FieldValue/text()" /></ns0:ContainerID>
                    <ns0:Quantity unitCode="EA"></ns0:Quantity>
                      <ns0:ItemInstance>
                          <ns0:ID><xsl:value-of select="s0:CompanyProductCode/text()" /></ns0:ID>
                          <ns0:Lot>
                            <ns0:ID><xsl:value-of select="s0:ApplicationSpecific/s0:Field[s0:FieldName='JDELotNumber']/s0:FieldValue/text()" /></ns0:ID>
                          </ns0:Lot>
                          <ns0:Quantity unitCode="EA"><xsl:value-of select="s0:Quantity/text()" /></ns0:Quantity>
                          <ns0:Classification>
                            <ns0:ID></ns0:ID>
                          </ns0:Classification>
                      </ns0:ItemInstance>
                    </ns0:WarehouseShippingAdviceLine>                
                  </xsl:for-each>
              </ns0:WarehouseShippingAdvice>
              
          </ns0:DataArea>
      </ns0:ProcessWarehouseShippingAdvice>
    </xsl:template>
</xsl:stylesheet>