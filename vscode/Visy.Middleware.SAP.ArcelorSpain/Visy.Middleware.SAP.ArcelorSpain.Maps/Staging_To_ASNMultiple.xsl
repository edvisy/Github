<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.SAP.ArcelorSpain.Schemas.ASN_Single" 
                xmlns:ns1="http://Visy.Middleware.SAP.ArcelorSpain.Schemas.ASN_Multiple" 
                xmlns:s0="http://Visy.Middleware.SAP.ArcelorSpain.Schemas.StagingXml">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="VisyPONumber" match="/s0:Staging/Details" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Staging" />
  </xsl:template>
  <xsl:template match="/s0:Staging">
    <ns1:ASN_Multiple>
      <xsl:for-each select="Details[generate-id(.)=generate-id(key('groups',VisyPONumber))]">       
          <ns0:ASN_Single>
            <PONumber>
              <xsl:value-of select="VisyPONumber/text()" />
            </PONumber>
            <PODate>
              <xsl:value-of select="ETS/text()" />
            </PODate>
            <xsl:for-each select="key('groups',VisyPONumber)">
              <Details>
                <DeliveryDate>
                  <xsl:value-of select="ETA/text()" />
                </DeliveryDate>
                <ContainerNumber>
                  <xsl:value-of select="ContainerNumber/text()" />
                </ContainerNumber>
                <InvoiceNumber>
                  <xsl:value-of select="InvoiceNumber/text()" />
                </InvoiceNumber>
                <LineNo>
                  <xsl:value-of select="VisyPOLineItemNumber/text()" />
                </LineNo>
                <SGVisyPONumber>
                  <xsl:value-of select="SGVisyPONumber/text()" />
                </SGVisyPONumber>
                <VisyPONumber>
                  <xsl:value-of select="VisyPONumber/text()" />
                </VisyPONumber>
                <MaterialNumber>
                  <xsl:value-of select="VisyMaterialNumber/text()" />
                </MaterialNumber>
                <LotNumber>
                  <xsl:value-of select="LotNumber/text()" />
                </LotNumber>
                <PalletNumber>
                  <xsl:value-of select="PalletNumber/text()" />
                </PalletNumber>
                <Quantity>
                  <xsl:value-of select="Quantity/text()" />
                </Quantity>
                <UOM>
                  <xsl:value-of select="UOM/text()" />
                </UOM>
                <DeliveryNumber>
                  <xsl:value-of select="DeliveryNumber/text()" />
                </DeliveryNumber>
                <ItemName>
                  <xsl:value-of select="Item/text()" />
                </ItemName>
                <MRN>
                  <xsl:value-of select="PalletNumber/text()" />
                </MRN>
              </Details>
            </xsl:for-each>
          </ns0:ASN_Single>       
      </xsl:for-each>
    </ns1:ASN_Multiple>
  </xsl:template>
</xsl:stylesheet>