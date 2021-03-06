<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.RAM.SPCA.Schemas.TransportRequestInternal" 
                xmlns:ns1="http://Visy.Middleware.RAM.SPCA.Schemas.TransportRequestsInternal">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/ns1:TransportRequests" />
  </xsl:template>
  <xsl:template match="/ns1:TransportRequests">
    <ns1:TransportRequests>
      <xsl:for-each select="ns0:TransportRequest">
        <xsl:sort select="RequestNumber" data-type="number" order="ascending" />
        <ns0:TransportRequest>
          <RequestNumber>
            <xsl:value-of select="RequestNumber/text()" />
          </RequestNumber>
          <TruckLoadNo>
            <xsl:value-of select="TruckLoadNo/text()" />
          </TruckLoadNo>
          <PurchaseOrder>
            <xsl:value-of select="PurchaseOrder/text()" />
          </PurchaseOrder>
          <ShipFromCode>
            <xsl:value-of select="ShipFromCode/text()" />
          </ShipFromCode>
          <ShipFromAdd1>
            <xsl:value-of select="ShipFromAdd1/text()" />
          </ShipFromAdd1>
          <ShipFromAdd2>
            <xsl:value-of select="ShipFromAdd2/text()" />
          </ShipFromAdd2>
          <ShipFromAdd3>
            <xsl:value-of select="ShipFromAdd3/text()" />
          </ShipFromAdd3>
          <ShipFromAdd4>
            <xsl:value-of select="ShipFromAdd4/text()" />
          </ShipFromAdd4>
          <ShipToCode>
            <xsl:value-of select="ShipToCode/text()" />
          </ShipToCode>
          <ShipToAdd1>
            <xsl:value-of select="ShipToAdd1/text()" />
          </ShipToAdd1>
          <ShipToAdd2>
            <xsl:value-of select="ShipToAdd2/text()" />
          </ShipToAdd2>
          <ShipToAdd3>
            <xsl:value-of select="ShipToAdd3/text()" />
          </ShipToAdd3>
          <ShipToAdd4>
            <xsl:value-of select="ShipToAdd4/text()" />
          </ShipToAdd4>
          <CollectDate>
            <xsl:value-of select="CollectDate/text()" />
          </CollectDate>
          <CollectTime>
            <xsl:value-of select="CollectTime/text()" />
          </CollectTime>
          <RequiredDate>
            <xsl:value-of select="RequiredDate/text()" />
          </RequiredDate>
          <RequiredTime>
            <xsl:value-of select="RequiredTime/text()" />
          </RequiredTime>
          <ItemNo>
            <xsl:value-of select="ItemNo/text()" />
          </ItemNo>
          <OrderNo>
            <xsl:value-of select="OrderNo/text()" />
          </OrderNo>
          <QtyOrdered>
            <xsl:value-of select="QtyOrdered/text()" />
          </QtyOrdered>
          <Pallets>
            <xsl:value-of select="Pallets/text()" />
          </Pallets>
          <PalletSpaces>
            <xsl:value-of select="PalletSpaces/text()" />
          </PalletSpaces>
          <Weight>
            <xsl:value-of select="Weight/text()" />
          </Weight>
          <TopLoad>
            <xsl:value-of select="TopLoad/text()" />
          </TopLoad>
          <Comments>
            <xsl:value-of select="Comments/text()" />
          </Comments>
          <ChargeAccount>
            <xsl:value-of select="ChargeAccount/text()" />
          </ChargeAccount>
        </ns0:TransportRequest>
      </xsl:for-each>
    </ns1:TransportRequests>
  </xsl:template>
</xsl:stylesheet>