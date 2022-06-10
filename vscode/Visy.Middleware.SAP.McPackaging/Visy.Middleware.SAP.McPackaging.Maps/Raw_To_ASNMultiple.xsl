<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.SAP.McPackaging.Schemas.ASN_Single" 
                xmlns:ns1="http://Visy.Middleware.SAP.McPackaging.Schemas.ASN_Multiple" 
                xmlns:s0="http://Visy.Middleware.SAP.McPackaging.Schemas.Order">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="s0:FieldE" match="/s0:Orders/s0:Details" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Orders" />
  </xsl:template>
  <xsl:template match="/s0:Orders">
    <ns1:ASN_Multiple>
      <xsl:for-each select="/s0:Orders/s0:Details[generate-id(.)=generate-id(key('groups',s0:FieldE))]">
        <ns0:ASN_Single>
          <PONumber>
            <xsl:value-of select="s0:FieldE/text()" />
          </PONumber>
          <PODate></PODate>
          <xsl:for-each select="key('groups',s0:FieldE)">
            <Details>
              <DeliveryDate>
                <xsl:value-of select="s0:FieldC/text()" />
              </DeliveryDate>
              <ContainerNumber>
                <xsl:value-of select="s0:FieldB/text()" />
              </ContainerNumber>
              <InvoiceNumber>
                <xsl:value-of select="s0:FieldA/text()" />
              </InvoiceNumber>
              <LineNo>
                <xsl:value-of select="s0:FieldF/text()" />
              </LineNo>
              <SGVisyPONumber>
                <xsl:value-of select="s0:FieldD/text()" />
              </SGVisyPONumber>
              <VisyPONumber>
                <xsl:value-of select="s0:FieldE/text()" />
              </VisyPONumber>
              <MaterialNumber>
                <xsl:value-of select="s0:FieldG/text()" />
              </MaterialNumber>
              <PalletNumber>
                <xsl:value-of select="s0:FieldH/text()" />
              </PalletNumber>
              <Quantity>
                <xsl:value-of select="s0:FieldI/text()" />
              </Quantity>
              <UOM>
                <xsl:value-of select="s0:FieldJ/text()" />
              </UOM>
              <DeliveryNumber>
                <xsl:value-of select="s0:FieldK/text()" />
              </DeliveryNumber>
            </Details>
          </xsl:for-each>
        </ns0:ASN_Single>
      </xsl:for-each>
    </ns1:ASN_Multiple>
  </xsl:template>
</xsl:stylesheet>