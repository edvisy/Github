<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.VBAM.VisyBoard.Schemas.AddressResponseXml" 
                xmlns:s0="http://Visy.Middleware.VBAM.VisyBoard.Schemas.AddressRsp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:AddressRsp" />
  </xsl:template>
  <xsl:template match="/s0:AddressRsp">
    <ns0:AddrRspXml>
      <biztalk_id>
        <xsl:value-of select="Header/biztalk_id/text()" />
      </biztalk_id>
      <reject_message>
        <xsl:apply-templates select="Details/reject_message"></xsl:apply-templates>
      </reject_message>
      <edi_address_id>
        <xsl:apply-templates select="Details/edi_address_id"></xsl:apply-templates>
      </edi_address_id>
    </ns0:AddrRspXml>
  </xsl:template>
  
  <xsl:template match="Details/reject_message">
    <xsl:if test="normalize-space(text()) != ''">
      <xsl:value-of select="normalize-space(concat(text(),'&lt;br /&gt;'))"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Details/edi_address_id">
    <xsl:if test="normalize-space(text()) != ''">
      <xsl:value-of select="normalize-space(concat(text(),'&lt;br /&gt;'))"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>