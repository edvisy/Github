<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"                 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" 
                version="1.0" 
                xmlns:ns0="http://Visy.Middleware.LGX.Glamapack.Schemas.OrderFF_Single" 
                xmlns:s0="http://Visy.Middleware.LGX.Glamapack.Schemas.Order_FF_New" 
                xmlns:ns1="http://Visy.Middleware.LGX.Glamapack.Schemas.Order_Multiple">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="s0:FieldA" match="/s0:Orders/s0:Details" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Orders" />
  </xsl:template>
  <xsl:template match="/s0:Orders">
    <ns1:Order_Multiple>
      <xsl:for-each select="/s0:Orders/s0:Details[generate-id(.)=generate-id(key('groups',s0:FieldA))]">
        <ns0:Order_Single>
          <PONumber>
            <xsl:value-of select="s0:FieldA/text()" />
          </PONumber>
          <PODate>
            <xsl:value-of select="s0:FieldH/text()" />
          </PODate>
          <xsl:for-each select="key('groups',s0:FieldA)">
            <OrderDetails>
              <OrderLine>
                <xsl:value-of select="s0:FieldB/text()" />
              </OrderLine>
              <ProductCode>
                <xsl:value-of select="s0:FieldC/text()" />
              </ProductCode>
              <Quantity>
                <xsl:value-of select="s0:FieldR/text()" />
              </Quantity>
              <Price>
                <xsl:value-of select="s0:FieldS/text()" />
              </Price>
              <DeliveryDate>
                <xsl:value-of select="s0:FieldK/text()" />
              </DeliveryDate>
            </OrderDetails>
          </xsl:for-each>
        </ns0:Order_Single>
      </xsl:for-each>
    </ns1:Order_Multiple>
  </xsl:template>
</xsl:stylesheet>