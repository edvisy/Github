<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
                xmlns:s0="http://JFH.Interfaces2006.Accolade.Schemas.ASNReceipt" 
                xmlns:ns0="http://www.openapplications.org/oagis/10"                
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"  />
   
    <xsl:template match="/">
      <xsl:apply-templates select="/s0:ASNReceiptMessageRoot" />
    </xsl:template>
    <xsl:template match="/s0:ASNReceiptMessageRoot">     
        <ns0:ProcessReceiveDelivery xmlns:ns0="http://www.openapplications.org/oagis/10">
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
            <ns0:CreationDateTime><xsl:value-of select="s0:Header/s0:SentDateTime/text()"/></ns0:CreationDateTime>
            <ns0:BODID><xsl:value-of select="s0:Header/s0:MessageId/text()"/></ns0:BODID>
          </ns0:ApplicationArea>
          <ns0:DataArea>
            <ns0:Process>
                <ns0:ActionCriteria>
                  <ns0:ActionExpression>ASNR</ns0:ActionExpression>
                </ns0:ActionCriteria>
            </ns0:Process>
            <ns0:ReceiveDelivery>
                <ns0:ReceiveDeliveryHeader>
                  <ns0:ID><xsl:value-of select="s0:Body/s0:OrderReference/text()"/></ns0:ID>
                  <ns0:VariationID><xsl:value-of select="s0:Body/s0:OrderCompany/text()" /></ns0:VariationID>
                  <ns0:DocumentReference>
                      <ns0:ID><xsl:value-of select="s0:Body/s0:OrderType/text()"/></ns0:ID>
                  </ns0:DocumentReference>
                  <ns0:ActualDeliveryDateTime><xsl:value-of select="s0:Header/s0:SentDateTime/text()"/></ns0:ActualDeliveryDateTime>
                  <ns0:TotalVolumeMeasure unitCode="CA"></ns0:TotalVolumeMeasure>
                  <ns0:ReceivingLocation>
                      <ns0:ID>1167</ns0:ID>
                  </ns0:ReceivingLocation>
                </ns0:ReceiveDeliveryHeader>
                <xsl:for-each select="s0:Body/s0:Details/s0:Detail">
                   <ns0:ReceiveDeliveryUnit>
                    <ns0:ID><xsl:value-of select="s0:OrderLineId/text()" /></ns0:ID>
                    <ns0:ContainerID><xsl:value-of select="s0:SSCC/text()" /></ns0:ContainerID>
                    <ns0:ReceiveDeliveryUnitItem>
                        <ns0:Quantity> 
                          <xsl:attribute name="unitCode"><xsl:call-template name="uomvaluemapping" />
                          </xsl:attribute>
                          <xsl:value-of select="s0:ActualQuantity/text()" />
                        </ns0:Quantity>
                        <ns0:ItemInstance>
                          <ns0:ID><xsl:value-of select="s0:ProductNo/text()" /></ns0:ID>
                          <ns0:Lot>
                              <ns0:ID><xsl:value-of select="s0:LotNo/text()" /></ns0:ID>
                          </ns0:Lot>
                          <ns0:Quantity>
                          <xsl:attribute name="unitCode"><xsl:call-template name="uomvaluemapping" />
                          </xsl:attribute><xsl:value-of select="s0:ActualQuantity/text()" /></ns0:Quantity>
                          <ns0:Classification>
                              <ns0:ID></ns0:ID>
                          </ns0:Classification>
                        </ns0:ItemInstance>
                    </ns0:ReceiveDeliveryUnitItem>
                  </ns0:ReceiveDeliveryUnit>
                </xsl:for-each>
            </ns0:ReceiveDelivery>
          </ns0:DataArea>
      </ns0:ProcessReceiveDelivery>
    </xsl:template>

    <xsl:template name="uomvaluemapping">
		<xsl:choose>
			<xsl:when test="s0:OrderUOM = 'CS'">
				<xsl:value-of select="'CA'"/>
			</xsl:when>
      <xsl:when test="s0:OrderUOM = 'EA'">
				<xsl:value-of select="'EA'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'CA'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>