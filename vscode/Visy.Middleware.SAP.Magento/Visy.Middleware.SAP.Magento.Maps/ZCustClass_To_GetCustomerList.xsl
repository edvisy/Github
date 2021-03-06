<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 ScriptNS0" version="1.0" xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZCUSTCLASS//740" xmlns:ns1="http://schemas.xmlsoap.org/soap/encoding/" xmlns:ns0="urn:Magento" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ZCUST000GRP" />
  </xsl:template>
  <xsl:template match="/s0:ZCUST000GRP">
    <ns0:customerCustomerList>
      <xsl:variable name="var:v1" select="ScriptNS0:GetDataValue(&quot;SessionId&quot;)" />
      <sessionId>
        <xsl:value-of select="$var:v1" />
      </sessionId>
      <filters>
        <filter>
          <associativeEntity>
            <key>email</key>
            <value>
              <xsl:value-of select="s0:ZVEMAIL000/s0:EMAIL/text()" />
            </value>
          </associativeEntity>
          <associativeEntity>
            <key>website_id</key>
            <value>
              <xsl:value-of select="s0:ZCUST000/s0:WEBST/text()" />
            </value>
          </associativeEntity>
          <associativeEntity>
            <key>store_id</key>
            <value>
              <xsl:value-of select="s0:ZCUST000/s0:STORE/text()" />
            </value>
          </associativeEntity>
        </filter>        
      </filters>
    </ns0:customerCustomerList>
  </xsl:template>
</xsl:stylesheet>