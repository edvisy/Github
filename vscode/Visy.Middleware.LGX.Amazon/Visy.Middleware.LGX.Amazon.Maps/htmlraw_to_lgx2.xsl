<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
  exclude-result-prefixes="msxsl var s0 ScriptNS0 ScriptNS1 userCSharp"
  version="1.0"
  xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER"
  xmlns:s0="http://schemas.microsoft.com/BizTalk/2003/Any"
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
  xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
  >
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">     
    <xsl:variable name="var:strXML" xml:space="preserve">
      <test>
      <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
        <xsl:copy-of select="@*|node()"  />
      <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
      </test>
    </xsl:variable>
    <xsl:value-of select="string($var:strXML)"/>
    <ns0:ORDER>
      <ns0:Header>
        <!--<xsl:copy-of select="$var:strXML" />-->
        <!--<xsl:value-of select="ScriptNS0:GetInterfaceLookupData(&quot;ponumber&quot;, &quot;LGX.Amazon.XPath&quot;)"/> 
        <xsl:value-of disable-output-escaping="yes" select="ScriptNS1:GetNodeValueByxPath(ScriptNS0:GetInterfaceLookupData(&quot;ponumber&quot;, &quot;LGX.Amazon.XPath&quot;), msxsl:node-set($var:strXML)/*)"/>  --> 
      </ns0:Header>
      <ns0:Summary>
        <xsl:attribute name="total_order_quantity">
          <xsl:value-of select="sum(s0:E2EDP01007GRP/s0:E2EDP20001/s0:WMENG)" />
               <xsl:if test="//s0:E2EDP01007/s0:MENEE/text() = 'TH'">000</xsl:if>
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
  </xsl:template>
  
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
      public string urlEncode(string strXml) {       
        return System.Net.WebUtility.UrlEncode(strXml);
      }
    ]]>
  </msxsl:script>
</xsl:stylesheet>
