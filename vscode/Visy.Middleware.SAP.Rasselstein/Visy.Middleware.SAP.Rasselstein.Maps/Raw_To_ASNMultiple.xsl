<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.SAP.Rasselstein.Schemas.ASN_Single" 
                xmlns:ns1="http://Visy.Middleware.SAP.Rasselstein.Schemas.ASN_Multiple" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                >
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="@PACKING_LIST_NUMBER" match="/PACKING_LISTS/PACKING_LIST/HEADER" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/PACKING_LISTS" />
  </xsl:template>
  <xsl:template match="/PACKING_LISTS">
    <ns1:ASN_Multiple>
      <xsl:for-each select="/PACKING_LISTS/PACKING_LIST/HEADER[generate-id(.)=generate-id(key('groups',@PACKING_LIST_NUMBER))]">       
        <ns0:ASN_Single>
          <PONumber>
            <xsl:value-of select="@PACKING_LIST_NUMBER" />
          </PONumber>
          <PODate></PODate>
          <xsl:for-each select="key('groups',@PACKING_LIST_NUMBER)">
            <Details>
              <DeliveryDate>
                <xsl:value-of select="@PACKING_LIST_DATE" />
              </DeliveryDate>
              <ContainerNumber>
                <xsl:value-of select="SUPPLIER/ADDRESS/NAME/text()" />
              </ContainerNumber>
              <InvoiceNumber>
                <xsl:value-of select="FieldA/text()" />
              </InvoiceNumber>
              <LineNo>
                <xsl:value-of select="FieldF/text()" />
              </LineNo>
              <SGVisyPONumber>
                <xsl:value-of select="FieldD/text()" />
              </SGVisyPONumber>
              <VisyPONumber>
                <xsl:value-of select="@PACKING_LIST_NUMBER/text()" />
              </VisyPONumber>
              <MaterialNumber>
                <xsl:value-of select="FieldG/text()" />
              </MaterialNumber>
              <PalletNumber>
                <xsl:value-of select="FieldH/text()" />
              </PalletNumber>
              <Quantity>
                <xsl:value-of select="FieldI/text()" />
              </Quantity>
              <UOM>
                <xsl:value-of select="FieldJ/text()" />
              </UOM>
              <DeliveryNumber>
                <xsl:value-of select="FieldK/text()" />
              </DeliveryNumber>
            </Details>
          </xsl:for-each>
        </ns0:ASN_Single>
      </xsl:for-each>
    </ns1:ASN_Multiple>
  </xsl:template>
</xsl:stylesheet>