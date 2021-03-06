<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s2 s0 s1 userCSharp" version="1.0" 
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/PROJECT01//740/Receive" 
                xmlns:ns1="urn:sobject.enterprise.soap.sforce.com" 
                xmlns:ns0="urn:enterprise.soap.sforce.com" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/PROJECT01//740" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">   
      <xsl:apply-templates select="/s1:Receive" />    
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Name&quot;)" />
    <ns0:upsert>
      <ns0:externalIDFieldName>
        <xsl:value-of select="$var:v1" />
      </ns0:externalIDFieldName>
      <xsl:for-each select="s1:idocData">
        <xsl:for-each select="s0:E2BP2054_MASTERDATA_ALE002">          
          <ns0:sObjects>
            <xsl:attribute name="xsi:type">
              <xsl:value-of select="'ns1:WBS_Number__c'" />
            </xsl:attribute>
            <xsl:if test="s0:DESCRIPTION">
              <xsl:variable name="var:v2" select="string(s0:DESCRIPTION/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v2)='true'">
                <ns1:Description__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Description__c>
              </xsl:if>
              <xsl:if test="string($var:v2)='false'">
                <ns1:Description__c>
                  <xsl:value-of select="s0:DESCRIPTION/text()" />
                </ns1:Description__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="s0:WBS_ELEMENT">
              <xsl:variable name="var:v3" select="string(s0:WBS_ELEMENT/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v3)='true'">
                <ns1:Name>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Name>
              </xsl:if>
              <xsl:if test="string($var:v3)='false'">
                <ns1:Name>
                  <xsl:value-of select="s0:WBS_ELEMENT/text()" />
                </ns1:Name>
              </xsl:if>
            </xsl:if>
            <xsl:variable name="var:v7" select="string(s0:WBS_ELEMENT/text())" />
            
              <xsl:call-template name="StatusTemplate">
                <xsl:with-param name="param1" select="string($var:v7)" />
              </xsl:call-template>              
                              
          </ns0:sObjects>
        </xsl:for-each>
      </xsl:for-each>
    </ns0:upsert>
  </xsl:template>
  
  <xsl:template name="StatusTemplate">
    <xsl:param name="param1" />
    <xsl:for-each select="/s1:Receive/s1:idocData/s0:E2BP2054_OBJECTSTATUS_ALE000">
      <xsl:variable name="var:v8" select="string(s0:WBS_OBJECTID/text())" />
      <xsl:variable name="var:v9" select="userCSharp:LogicalEq($param1 , $var:v8)"/>
      <xsl:if test="string($var:v9)='true'">
        <xsl:variable name="var:v5" select="string(s0:INACTIVE/text())" />
        <xsl:variable name="var:v6" select="userCSharp:GetIsActive(string($var:v5))" />
        <ns1:Status__c>
          <xsl:value-of select="$var:v6" />
        </ns1:Status__c>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public bool GetIsActive(string STATUS)
  {
 	if (STATUS == "X")
                  return false;
                else if (STATUS == string.Empty)
                   return true;
                 else
                    return false;
     
  }



public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}


]]>
  </msxsl:script>
</xsl:stylesheet>