<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var s0" 
  version="1.0" 
  xmlns:ns1="http://tempuri.org/cXML_1.2.031" 
  xmlns:ns2="uri:xades" 
  xmlns:s0="http://schemas.microsoft.com/BizTalk/2003/aggschema" 
  xmlns:xml="http://www.w3.org/XML/1998/namespace" 
  xmlns:ns0="uri:ds">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Root" />
  </xsl:template>
  <xsl:template match="/s0:Root">
    <ns1:cXML>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@version">
        <xsl:attribute name="version">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@version" />
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="payloadID">
        <xsl:value-of select="InputMessagePart_0/ns1:cXML/@payloadID" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <xsl:value-of select="InputMessagePart_0/ns1:cXML/@timestamp" />
      </xsl:attribute>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@signatureVersion">
        <xsl:attribute name="signatureVersion">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@signatureVersion" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@xml:lang">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@xml:lang" />
        </xsl:attribute>
      </xsl:if>
      <ns1:Header>
        <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Header/@*" />
        <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Header/*" />
      </ns1:Header>      
      <ns1:Request>
        <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/@deploymentMode">
          <xsl:attribute name="deploymentMode">
            <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/@deploymentMode" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/@Id">
          <xsl:attribute name="Id">
            <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/@Id" />
          </xsl:attribute>
        </xsl:if>
        <ns1:OrderRequest>
          <ns1:OrderRequestHeader>
            <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@*" />
            <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/*" />
          </ns1:OrderRequestHeader>
          <ns1:ItemOut>
            <xsl:copy-of select="InputMessagePart_1/ns1:ItemOut/@*" />
            <xsl:copy-of select="InputMessagePart_1/ns1:ItemOut/*" />
          </ns1:ItemOut>
        </ns1:OrderRequest>      
      </ns1:Request>      
    </ns1:cXML>
  </xsl:template>
</xsl:stylesheet>