<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 ScriptNS0"
                version="1.0"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZCUSTCLASS//740"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ZCUST000GRP" />
  </xsl:template>
  <xsl:template match="/s0:ZCUST000GRP">
    <customerinfo>
      <customer>
        <email>
          <xsl:value-of select="s0:ZVEMAIL000/s0:EMAIL/text()" />
        </email>
        <firstname>
          <xsl:value-of select="s0:ZCUST000/s0:PNAMEV/text()" />
        </firstname>
        <group_id>
          <xsl:value-of select="s0:ZCUST000/s0:KONDA/text()" />
        </group_id>
        <lastname>
          <xsl:value-of select="s0:ZCUST000/s0:PNAME1/text()" />
        </lastname>
        <website_id>
          <xsl:value-of select="s0:ZCUST000/s0:WEBST/text()" />
        </website_id>
        <store_id>
          <xsl:value-of select="s0:ZCUST000/s0:STORE/text()" />
        </store_id>
        <addresses>
          <city>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:ORT01/text()" />
          </city>
          <country_id>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:LAND1/text()" />
          </country_id>
          <defaultBilling>true</defaultBilling>
          <firstname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PNAMEV/text()" />
          </firstname>
          <lastname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PNAME1/text()" />
          </lastname>
          <postcode>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:PSTLZ/text()" />
          </postcode>
          <street>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:STRAS/text()" />
          </street>
          <street>
            <xsl:value-of select="''" />
          </street>
          <telephone>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='AG']/s0:TELF1/text()" />
          </telephone>
          <region_id>
            <xsl:value-of select="string(ScriptNS0:GetInterfaceLookupData(string(s0:ZPARTNR000[s0:PARVW='AG']/s0:REGIO/text()) , &quot;SAP.Magento2.RegionResponse&quot;))" />
          </region_id>
        </addresses>
        <addresses>
          <city>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:ORT01/text()" />
          </city>
          <country_id>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:LAND1/text()" />
          </country_id>
          <defaultShipping>true</defaultShipping>
          <firstname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:PNAMEV/text()" />
          </firstname>
          <lastname>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:PNAME1/text()" />
          </lastname>
          <postcode>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:PSTLZ/text()" />
          </postcode>
          <street>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:STRAS/text()" />
          </street>
          <street>
            <xsl:value-of select="''" />
          </street>
          <telephone>
            <xsl:value-of select="s0:ZPARTNR000[s0:PARVW='WE']/s0:TELF1/text()" />
          </telephone>
          <region_id>
            <xsl:value-of select="string(ScriptNS0:GetInterfaceLookupData(string(s0:ZPARTNR000[s0:PARVW='WE']/s0:REGIO/text()) , &quot;SAP.Magento2.RegionResponse&quot;))" />
          </region_id>
        </addresses>
        <custom_attributes>
          <abcn>
            <xsl:value-of select="s0:ZCUST000/s0:STCEG/text()" />
          </abcn>
          <company>
            <xsl:value-of select="s0:ZCUST000/s0:NAME1/text()" />
          </company>
          <customer_code>
            <xsl:value-of select="s0:ZCUST000/s0:KUNNR/text()" />
          </customer_code>
          <region>
            <xsl:value-of select="string(ScriptNS0:GetInterfaceLookupData(string(s0:ZPARTNR000[s0:PARVW='WE']/s0:REGIO/text()) , &quot;SAP.Magento2.RegionResponseCA&quot;))" />
          </region>
          <po_enabled>
            <xsl:value-of select="'5440'" />
          </po_enabled>
          <customer_industry> 
            <xsl:value-of select="20" />
          </customer_industry>            
          <customer_position>
            <xsl:value-of select="'-'" />
          </customer_position>
        </custom_attributes>
      </customer>
      <password>Visy123#$</password>
    </customerinfo>
  </xsl:template>
</xsl:stylesheet>