<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.LGX.ClassicMeats.Schemas.Single" 
                xmlns:ns1="http://Visy.Middleware.LGX.ClassicMeats.Schemas.Multiple" 
                xmlns:s0="http://Visy.Middleware.LGX.ClassicMeats.Schemas.StagingXml">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="PONumber" match="/s0:Staging/Details" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Staging" />
  </xsl:template>
  <xsl:template match="/s0:Staging">
    <ns1:Multiple>
      <xsl:for-each select="Details[generate-id(.)=generate-id(key('groups',PONumber))]">       
          <ns0:Single>
            <PONumber>
              <xsl:value-of select="PONumber/text()" />
            </PONumber>
            <PODate>
              <xsl:value-of select="DeliveryDate/text()" />
            </PODate>
            <xsl:for-each select="key('groups',PONumber)">
              <Details>
                <DeliveryDate>
                  <xsl:value-of select="DeliveryDate/text()" />
                </DeliveryDate>
                <ProductCode>
                  <xsl:value-of select="ProductCode/text()" />
                </ProductCode>
                <Price>
                  <xsl:value-of select="Price/text()" />
                </Price>
                <Quantity>
                  <xsl:value-of select="Quantity/text()" />
                </Quantity>
                <Description>
                  <xsl:value-of select="Description/text()" />
                </Description>                
                <UOM>
                  <xsl:value-of select="UOM/text()" />
                </UOM>
                <WHC>
                  <xsl:value-of select="WHC/text()" />
                </WHC>
              </Details>
            </xsl:for-each>
          </ns0:Single>       
      </xsl:for-each>
    </ns1:Multiple>
  </xsl:template>
</xsl:stylesheet>