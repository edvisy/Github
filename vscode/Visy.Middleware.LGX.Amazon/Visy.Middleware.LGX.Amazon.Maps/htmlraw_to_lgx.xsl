<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 ScriptNS0 ScriptNS1" 
                version="1.0" xmlns:s0="http://Visy.Middleware.LGX.Amazon.Schemas.xmlstring" 
                xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:xmlstring" />
  </xsl:template>
  <xsl:template match="/s0:xmlstring">
    <xsl:variable name="var:interface_name" select="&quot;LGX.Amazon.XPath&quot;" />
    <xsl:variable name="var:xml_string" select="normalize-space(string(xmlstring/text()))" />
    <ns0:ORDER>
      <ns0:Header>
        <xsl:variable name="var:poxPath" select="ScriptNS0:GetInterfaceLookupData(&quot;ponumber&quot;, string($var:interface_name))" />        
        <xsl:attribute name="purchase_order_number">
          <xsl:value-of select="ScriptNS1:GetNodeValueByxPath(string($var:poxPath), $var:xml_string)" />
        </xsl:attribute>
      </ns0:Header>
    </ns0:ORDER>
  </xsl:template>
</xsl:stylesheet>