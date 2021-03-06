<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
                xmlns:ns0="http://JFH.Interfaces2006.Accolade.Schemas.ASN" 
                xmlns:s0="http://www.openapplications.org/oagis/10"                
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

    <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"  />
   
    <xsl:template match="/">
      <xsl:apply-templates select="/s0:NotifyShipment" />
    </xsl:template>
    <xsl:template match="/s0:NotifyShipment">   
    <!-- <xsl:variable name="validation">
			<xsl:if test="normalize-space(string(s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ShipToParty/s0:ID/text()))=''">
				<xsl:text>ShipTo Party ID Missing</xsl:text>
			</xsl:if>		
		</xsl:variable>

    <xsl:if test="not($validation='')">
			<xsl:message terminate="yes" >
				<div><xsl:value-of select="$validation"/></div>
			</xsl:message>
		</xsl:if>     -->
      <ASNMessageRoot>
        <Header>
          <MessageId><xsl:value-of select="s0:ApplicationArea/s0:BODID/text()"/></MessageId>
          <SentDateTime><xsl:value-of select="s0:ApplicationArea/s0:CreationDateTime/text()"/></SentDateTime>
        </Header>
        <Body>
          <Customerid>274690</Customerid>
          <OrderCompany><xsl:value-of select="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:VariationID/text()"/></OrderCompany>
          <OrderType>OT</OrderType>
          <OrderReference><xsl:value-of select="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ID/text()"/></OrderReference>
          <SourceLocation>
            <ID><xsl:value-of select="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ShipFromParty/s0:ID/text()"/></ID>
            <Description><xsl:value-of select="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ShipFromParty/s0:Name/text()"/></Description>
          </SourceLocation>
          <DestinationLocation>
            <ID>
              <xsl:call-template name="warehousevaluemapping"></xsl:call-template>
            </ID>
            <Description><xsl:value-of select="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ShipToParty/s0:Name/text()"/></Description>
          </DestinationLocation>
          <ScheduledDeliveryDate>
            <xsl:value-of select="substring-before(s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ScheduledDeliveryDateTime/text(), 'T')"/>
          </ScheduledDeliveryDate>
          <Details>
          <xsl:for-each select="s0:DataArea/s0:Shipment/s0:ShipmentUnit/s0:ShipmentUnitItem">            
            <xsl:for-each select="s0:ItemInstance">
              <Detail>
                <PalletId></PalletId>
                <SSCC><xsl:value-of select="../../s0:ContainerID/text()"/></SSCC>
                <ProductNo><xsl:value-of select="s0:ID/text()"/></ProductNo>
                <LotNo><xsl:value-of select="s0:Lot/s0:ID/text()"/></LotNo>
                <ExpectedQuantity><xsl:value-of select="s0:Quantity/text()"/></ExpectedQuantity>
                <PalletStatus><xsl:value-of select="s0:Classification/text()"/></PalletStatus>
                <Vintage><xsl:value-of select="s0:VariationID/text()"/></Vintage>
                <BottlingDate><xsl:value-of select="s0:Lot/s0:EffectiveTimePeriod/text()"/></BottlingDate>
                <OrderLineId><xsl:value-of select="../../s0:ID/text()"/></OrderLineId>
                <Action></Action>
                <OrderUOM><xsl:call-template name="uomvaluemapping"></xsl:call-template></OrderUOM>
              </Detail>
            </xsl:for-each>
           </xsl:for-each>           
          </Details>
        </Body>
      </ASNMessageRoot>
    </xsl:template>
  <xsl:template name="warehousevaluemapping">
		<xsl:choose>
			<xsl:when test="s0:DataArea/s0:Shipment/s0:ShipmentHeader/s0:ShipToParty/s0:ID/text() = '1167'">
				<xsl:value-of select="'52276'"/>
			</xsl:when>
						<xsl:otherwise>
				<xsl:value-of select="'52276'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  <xsl:template name="uomvaluemapping">
		<xsl:choose>
			<xsl:when test="../s0:Quantity/@unitCode = 'CA'">
				<xsl:value-of select="'CS'"/>
			</xsl:when>
      <xsl:when test="../s0:Quantity/@unitCode = 'EA'">
				<xsl:value-of select="'EA'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'CS'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>