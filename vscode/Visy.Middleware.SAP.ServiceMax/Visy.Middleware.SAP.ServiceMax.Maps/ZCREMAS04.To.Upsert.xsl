<?xml version="1.0" encoding="UTF-16"?>
<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s1 s0 s2 userCSharp" version="1.0" xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/CREMAS04/ZCREMAS04/740/Receive" xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/CREMAS04/ZCREMAS04/740" xmlns:ns1="urn:sobject.enterprise.soap.sforce.com" xmlns:ns0="urn:enterprise.soap.sforce.com" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s1 s0 s2 userCSharp ScriptNS0" 
                version="1.0" 
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/CREMAS04/ZCREMAS04/740/Receive" 
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/CREMAS04/ZCREMAS04/740" 
                xmlns:ns1="urn:sobject.enterprise.soap.sforce.com" xmlns:ns0="urn:enterprise.soap.sforce.com" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Billing_External_ID__c&quot;)" />
    <ns0:upsert>
      <ns0:externalIDFieldName>
        <xsl:value-of select="$var:v1" />
      </ns0:externalIDFieldName>
      <xsl:for-each select="s1:idocData">
        <xsl:variable name="var:v6" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LAND1/text())" />
        <xsl:variable name="var:v12" select="userCSharp:StringConcat(&quot;Vendor&quot;)" />
        <ns0:sObjects>
          <xsl:attribute name="xsi:type">
            <xsl:value-of select="'ns1:Account'" />
          </xsl:attribute>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STCEG">
            <xsl:variable name="var:v2" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STCEG/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v2)='true'">
              <ns1:ABN__c>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:ABN__c>
            </xsl:if>
            <xsl:if test="string($var:v2)='false'">
              <ns1:ABN__c>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STCEG/text()" />
              </ns1:ABN__c>
            </xsl:if>
          </xsl:if>
		  <!--<xsl:if test="./s0:E2LFA1M002GRP/s0:E2LFB1M007GRP/s0:E2LFB1M007/s0:SMTP_ADDR">-->
        <ns1:Email__c>
                <xsl:value-of select="./s0:E2LFA1M002GRP/s0:ZE1BPADSMTP000/s0:E_MAIL/text()" />
        </ns1:Email__c>
		  <!--</xsl:if>-->
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:ORT01">
            <xsl:variable name="var:v3" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:ORT01/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v3)='true'">
              <ns1:BillingCity>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:BillingCity>
            </xsl:if>
            <xsl:if test="string($var:v3)='false'">
              <ns1:BillingCity>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:ORT01/text()" />
              </ns1:BillingCity>
            </xsl:if>
          </xsl:if>
          <!--<xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LAND1">
            <xsl:variable name="var:v4" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LAND1/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v4)='true'">
              <ns1:BillingCountry>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:BillingCountry>
            </xsl:if>
            <xsl:if test="string($var:v4)='false'">
              <ns1:BillingCountry>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LAND1/text()" />
              </ns1:BillingCountry>
            </xsl:if>
          </xsl:if>-->
          <xsl:variable name="var:v4" select="ScriptNS0:GetCountryNameFromCode(string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LAND1/text()))" />
          <ns1:BillingCountry>
            <xsl:value-of select="$var:v4" />
          </ns1:BillingCountry>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:PSTLZ">
            <xsl:variable name="var:v5" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:PSTLZ/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v5)='true'">
              <ns1:BillingPostalCode>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:BillingPostalCode>
            </xsl:if>
            <xsl:if test="string($var:v5)='false'">
              <ns1:BillingPostalCode>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:PSTLZ/text()" />
              </ns1:BillingPostalCode>
            </xsl:if>
          </xsl:if>
          <!--<xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:REGIO">
            <xsl:variable name="var:v6" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:REGIO/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v6)='true'">
              <ns1:BillingState>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:BillingState>
            </xsl:if>
            <xsl:if test="string($var:v6)='false'">
              <ns1:BillingState>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:REGIO/text()" />
              </ns1:BillingState>
            </xsl:if>
          </xsl:if>-->
          <xsl:variable name="var:v7" select="ScriptNS0:GetRegionNameFromCode($var:v6 , string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:REGIO/text()))" />
          <ns1:BillingState>
            <xsl:value-of select="$var:v7" />
          </ns1:BillingState>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STRAS">
            <xsl:variable name="var:v14" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STRAS/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v14)='true'">
              <ns1:BillingStreet>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:BillingStreet>
            </xsl:if>
            <xsl:if test="string($var:v14)='false'">
              <ns1:BillingStreet>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:STRAS/text()" />
              </ns1:BillingStreet>
            </xsl:if>
          </xsl:if>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR">
            <xsl:variable name="var:v8" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v8)='true'">
              <ns1:Billing_External_ID__c>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:Billing_External_ID__c>
            </xsl:if>
            <xsl:if test="string($var:v8)='false'">
              <ns1:Billing_External_ID__c>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR/text()" />
              </ns1:Billing_External_ID__c>
            </xsl:if>
          </xsl:if>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELFX">
            <xsl:variable name="var:v9" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELFX/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v9)='true'">
              <ns1:Fax>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:Fax>
            </xsl:if>
            <xsl:if test="string($var:v9)='false'">
              <ns1:Fax>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELFX/text()" />
              </ns1:Fax>
            </xsl:if>
          </xsl:if>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:NAME1">
            <xsl:variable name="var:v10" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:NAME1/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v10)='true'">
              <ns1:Name>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:Name>
            </xsl:if>
            <xsl:if test="string($var:v10)='false'">
              <ns1:Name>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:NAME1/text()" />
              </ns1:Name>
            </xsl:if>
          </xsl:if>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELF1">
            <xsl:variable name="var:v11" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELF1/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v11)='true'">
              <ns1:Phone>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:Phone>
            </xsl:if>
            <xsl:if test="string($var:v11)='false'">
              <ns1:Phone>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:TELF1/text()" />
              </ns1:Phone>
            </xsl:if>
          </xsl:if>
          <ns1:Type>
            <xsl:value-of select="$var:v12" />
          </ns1:Type>
          <xsl:if test="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR">
            <xsl:variable name="var:v13" select="string(s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR/@xsi:nil) = 'true'" />
            <xsl:if test="string($var:v13)='true'">
              <ns1:Vendor_Account_Number__c>
                <xsl:attribute name="xsi:nil">
                  <xsl:value-of select="'true'" />
                </xsl:attribute>
              </ns1:Vendor_Account_Number__c>
            </xsl:if>
            <xsl:if test="string($var:v13)='false'">
              <ns1:Vendor_Account_Number__c>
                <xsl:value-of select="s0:E2LFA1M002GRP/s0:E2LFA1M002/s0:LIFNR/text()" />
              </ns1:Vendor_Account_Number__c>
            </xsl:if>
          </xsl:if>
        </ns0:sObjects>
      </xsl:for-each>
    </ns0:upsert>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]></msxsl:script>
</xsl:stylesheet>