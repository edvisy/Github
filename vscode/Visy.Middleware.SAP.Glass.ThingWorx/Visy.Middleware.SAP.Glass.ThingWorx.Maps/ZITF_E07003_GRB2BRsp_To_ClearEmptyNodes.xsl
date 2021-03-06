<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var" version="1.0">
  <xsl:output method="xml" indent="yes" />
  <xsl:template match="node()">
    <xsl:if test="count(descendant::text()[string-length(normalize-space(.))>0]|@*)">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xsl:if>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:copy />
  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="normalize-space(.)" />
  </xsl:template>
</xsl:stylesheet>