<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" 
                version="1.0" 
                xmlns:ns0="http://Visy.Middleware.LGX.Glamapack.Schemas.OrderFF_Single"
                xmlns:s0="http://Visy.Middleware.LGX.Glamapack.Schemas.OrderFFWithHeader"
                xmlns:ns1="http://Visy.Middleware.LGX.Glamapack.Schemas.Order_Multiple">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="PO_ID" match="/s0:OrderFF/Body" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:OrderFF" />
  </xsl:template>
  <xsl:template match="/s0:OrderFF">
    <ns1:Order_Multiple>
      <xsl:for-each select="/s0:OrderFF/Body[generate-id(.)=generate-id(key('groups',PO_ID))]">        
          <ns0:Order_Single>
            <PONumber>
              <xsl:value-of select="PO_ID/text()" />
            </PONumber>
            <PODate>
              <xsl:value-of select="PO_DATE/text()" />
            </PODate>
            <xsl:for-each select="key('groups',PO_ID)">
              <OrderDetails>
                <OrderLine>
                  <xsl:value-of select="ITEM/text()" />
                </OrderLine>
                <ProductCode>
                  <xsl:value-of select="MATERIAL/text()" />
                </ProductCode>
                <Quantity>
                  <xsl:value-of select="QTY/text()" />
                </Quantity>
                <Price>
                  <xsl:value-of select="NET_PRICE/text()" />
                </Price>
              </OrderDetails>
            </xsl:for-each>
          </ns0:Order_Single>        
      </xsl:for-each>
    </ns1:Order_Multiple>    
  </xsl:template>
</xsl:stylesheet>