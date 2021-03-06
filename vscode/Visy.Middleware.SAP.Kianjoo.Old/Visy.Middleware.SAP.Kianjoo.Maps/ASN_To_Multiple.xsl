<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:ns1="http://Visy.Middleware.SAP.Kianjoo.Schemas.ASN_Multiple" xmlns:ns0="http://Visy.Middleware.SAP.Kianjoo.Schemas.ASN_Single" xmlns:s0="http://Visy.Middleware.SAP.Kianjoo.Schemas">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />

  <xsl:key name="kQtyByPO" match="s0:Details"
     use="concat(generate-id(..), s0:FieldA, '+', s0:FieldB, '+', s0:FieldH)"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Invoice" />
  </xsl:template>
  
  
  <xsl:template match="/s0:Invoice">
    <ns1:ASN_Multiple>
      <xsl:for-each select ="s0:Details[generate-id()
          =
           generate-id(key('kQtyByPO',
                           concat(generate-id(..), s0:FieldA, '+', s0:FieldB, '+', s0:FieldH)
                           )[1]
                       ) and s0:FieldA != 'CUSTOMER PO'
           ]
     ">
        <xsl:variable name="vkeyGroup" select=
       "key('kQtyByPO', concat(generate-id(..), s0:FieldA, '+', s0:FieldB, '+', s0:FieldH))"/>
        
        <ns0:ASN_Single>
          <xsl:if test="s0:FieldA">
            <PONumber>
              <xsl:value-of select="s0:FieldA/text()" />
            </PONumber>
          </xsl:if>
          <Details>
            <xsl:if test="s0:FieldL">
              <DeliveryDate>
                <xsl:value-of select="s0:FieldL/text()" />
              </DeliveryDate>
            </xsl:if>
            <xsl:if test="s0:FieldB">
              <LineNo>
                <xsl:value-of select="s0:FieldB/text()" />
              </LineNo>
            </xsl:if>
            <xsl:if test="s0:FieldH">
              <MaterialNumber>
                <xsl:value-of select="s0:FieldH/text()" />
              </MaterialNumber>
            </xsl:if>
            <Quantity>
              <xsl:value-of select="sum($vkeyGroup/s0:FieldJ)"/>
            </Quantity>
          </Details>
        </ns0:ASN_Single>
      </xsl:for-each>
    </ns1:ASN_Multiple>
  </xsl:template>
</xsl:stylesheet>