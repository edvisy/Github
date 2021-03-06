<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 ScriptNS0" 
                version="1.0" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZCUSTCLASS//740" 
                xmlns:ns1="http://schemas.xmlsoap.org/soap/encoding/" 
                xmlns:ns0="urn:Magento" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ZCUST000GRP" />
  </xsl:template>
  <xsl:template match="/s0:ZCUST000GRP">
    <ns0:customerAddressCreate>
      <sessionId>
        <xsl:value-of select="ScriptNS0:GetDataValue(&quot;SessionId&quot;)" />
      </sessionId>
      <customerId>
        <xsl:value-of select="ScriptNS0:GetDataValue(&quot;CustomerId&quot;)" />
      </customerId>
        <addressData>
          <city>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:ORT01/text()" />
          </city>
          <company>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:NAME1/text()" />
          </company>  
          <country_id>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:LAND1/text()" />
          </country_id>
          <fax>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:TELFX/text()" />
          </fax>
          <firstname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PNAMEV/text()" />
          </firstname>
          <lastname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PNAME1/text()" />
          </lastname>
          <postcode>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PSTLZ/text()" />
          </postcode>
          <prefix>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:ANRED/text()" />
          </prefix>
          <region>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:REGIO/text()" />
          </region>
          <street>
            <item>
              <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:STRAS/text()" />
            </item>
          </street>
          <telephone>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:TELF1/text()" />
          </telephone>
          <is_default_billing>1</is_default_billing>
        </addressData>    
    </ns0:customerAddressCreate>
  </xsl:template>
</xsl:stylesheet>