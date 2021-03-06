<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s2 s3 s1 s0 userCSharp ScriptNS0" version="1.0" xmlns:s0="uri:ds" xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Rfc/" xmlns:s3="uri:xades" xmlns:ns3="http://Microsoft.LobServices.Sap/2007/03/Types/Rfc/" xmlns:s1="http://www.w3.org/XML/1998/namespace" xmlns:s2="http://tempuri.org/cXML_1.2.031" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s2:cXML" />
  </xsl:template>
  <xsl:template match="/s2:cXML">
    <xsl:variable name="var:v2" select="s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:IdReference[1]/@identifier" />
    <xsl:variable name="var:v3" select="s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address[1]/@addressID" />
    <ns0:Z_GET_CUSTOMER_MATERIAL>
      <ns0:CUST_MAT>
        <xsl:if test="&quot;false&quot;='true'">
          <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;false&quot;)" />
          <xsl:value-of select="$var:v1" />
        </xsl:if>
      </ns0:CUST_MAT>
      <ns0:KDMAT_TAB>
        <xsl:for-each select="s2:Request/s2:OrderRequest/s2:ItemOut">
          <ns3:ZST_KDMAT>
            <xsl:if test="s2:ItemID/s2:BuyerPartID">
              <ns3:KDMAT>
                <xsl:value-of select="number(s2:ItemID/s2:BuyerPartID/text())" />
              </ns3:KDMAT>
            </xsl:if>
          </ns3:ZST_KDMAT>
        </xsl:for-each>
      </ns0:KDMAT_TAB>
      <ns0:KUNNR_TAB>
        <ns3:ZST_KUNNR>
          <xsl:variable name="var:v4" select="userCSharp:ReturnPlantID(string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderType) , string($var:v2) , string($var:v3))" />
          <xsl:variable name="var:v5" select="ScriptNS0:GetInterfaceLookupData(string($var:v4) , &quot;SAP.Lion.ShipTo&quot;)" />
          <ns3:KUNNR>
            <xsl:value-of select="$var:v5" />
          </ns3:KUNNR>
        </ns3:ZST_KUNNR>
      </ns0:KUNNR_TAB>
    </ns0:Z_GET_CUSTOMER_MATERIAL>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string ReturnPlantID(string orderType, string identifier, string addressID)
{
 switch(orderType)
    {
       case "regular" : return identifier;
       case "release" : return addressID;
    };
    return "";
}


]]>
  </msxsl:script>
</xsl:stylesheet>