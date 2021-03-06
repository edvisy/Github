<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var userCSharp ns2" version="1.0" 
                xmlns:ns2="http://tempuri.org/cXML_1.2.031" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml"  /> <!--doctype-system="http://xml.cxml.org/schemas/cXML/1.2.031/cXML.dtd" />-->
  <xsl:template match="/">
    <xsl:apply-templates select="/ns2:cXML" />
  </xsl:template>
  <xsl:template match="/ns2:cXML">
    <xsl:variable name="var:vStatusCode" select="userCSharp:StringConcat(&quot;200&quot;)" />
    <xsl:variable name="var:vStatusDesc" select="userCSharp:StringConcat(&quot;OK&quot;)" />
    <cXML>    
      <xsl:attribute name="payloadID">
        <xsl:value-of select="@payloadID" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <xsl:value-of select="@timestamp" />
      </xsl:attribute>     
      <Response>
        <Status>
          <xsl:attribute name="code">
            <xsl:value-of select="$var:vStatusCode" />
          </xsl:attribute>
          <xsl:attribute name="text">
            <xsl:value-of select="$var:vStatusDesc" />
          </xsl:attribute>
        </Status>      
      </Response>
    </cXML>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]></msxsl:script>
</xsl:stylesheet>