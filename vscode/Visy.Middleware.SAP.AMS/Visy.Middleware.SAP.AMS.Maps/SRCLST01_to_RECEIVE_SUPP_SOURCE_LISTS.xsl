<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s1 s0 s2 userCSharp" version="1.0" xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/SRCLST01//740/Receive" xmlns:ns0="urn:ifsworld-com:schemas:sap_interface_inbound_messages_receive_supp_source_list_request" xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/SRCLST01//740" xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">   
    <ns0:RECEIVE_SUPP_SOURCE_LIST>
      <ns0:SUPP_SOURCE_LISTS>
        <xsl:variable name="var:lstCount" select="count(/s1:Receive/s1:idocData/s0:E2EORDH001GRP/s0:E2EORDM001)" />
        <xsl:if test="$var:lstCount > 0">
          <xsl:for-each select="s1:idocData">
            <xsl:for-each select="s0:E2EORDH001GRP/s0:E2EORDM001">
              <xsl:variable name="var:v1" select="userCSharp:LogicalEq(string(s0:FLIFN/text()) , &quot;X&quot;)" />
              <xsl:variable name="var:v2" select="userCSharp:LogicalEq(string(s0:NOTKZ/text()) , &quot;X&quot;)" />
              <xsl:variable name="var:v3" select="userCSharp:LogicalOr(string($var:v1) , string($var:v2))" />            
              <xsl:variable name="var:v5" select="userCSharp:LogicalEq(string($var:lstCount) , &quot;0&quot;)" />
              <xsl:variable name="var:v6" select="userCSharp:LogicalOr(string($var:v3) , string($var:v5))" />
              <xsl:if test="$var:v6">
                <xsl:variable name="var:v10" select="string(s0:NOTKZ/text())" />
                <xsl:variable name="var:v11" select="userCSharp:LogicalNe($var:v10 , &quot;X&quot;)" />
                <xsl:variable name="var:v14" select="userCSharp:LogicalEq($var:v10 , &quot;X&quot;)" />
                <xsl:variable name="var:v15" select="userCSharp:LogicalOr(string($var:v5) , string($var:v14))" />
                <ns0:SUPP_SOURCE_LIST>
                  <xsl:if test="../s0:E2EORDH001/s0:WERKS">
                    <xsl:variable name="var:v7" select="string(../s0:E2EORDH001/s0:WERKS/@xsi:nil) = 'true'" />
                    <xsl:if test="string($var:v7)='true'">
                      <ns0:CONTRACT>
                        <xsl:attribute name="xsi:nil">
                          <xsl:value-of select="'true'" />
                        </xsl:attribute>
                      </ns0:CONTRACT>
                    </xsl:if>
                    <xsl:if test="string($var:v7)='false'">
                      <ns0:CONTRACT>
                        <xsl:value-of select="../s0:E2EORDH001/s0:WERKS/text()" />
                      </ns0:CONTRACT>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="../s0:E2EORDH001/s0:MATNR">
                    <xsl:variable name="var:v8" select="string(../s0:E2EORDH001/s0:MATNR/@xsi:nil) = 'true'" />
                    <xsl:if test="string($var:v8)='true'">
                      <ns0:PART_NO>
                        <xsl:attribute name="xsi:nil">
                          <xsl:value-of select="'true'" />
                        </xsl:attribute>
                      </ns0:PART_NO>
                    </xsl:if>
                    <xsl:if test="string($var:v8)='false'">
                      <ns0:PART_NO>
                        <xsl:value-of select="../s0:E2EORDH001/s0:MATNR/text()" />
                      </ns0:PART_NO>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="s0:LIFNR">
                    <xsl:variable name="var:v9" select="string(s0:LIFNR/@xsi:nil) = 'true'" />
                    <xsl:if test="string($var:v9)='true'">
                      <ns0:SUPPLIER>
                        <xsl:attribute name="xsi:nil">
                          <xsl:value-of select="'true'" />
                        </xsl:attribute>
                      </ns0:SUPPLIER>
                    </xsl:if>
                    <xsl:if test="string($var:v9)='false'">
                      <ns0:SUPPLIER>                       
                        <xsl:value-of select="userCSharp:MathInt(string(s0:LIFNR/text()))" />
                      </ns0:SUPPLIER>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="string($var:v11)='true'">
                    <xsl:variable name="var:v12" select="s0:VDATU/text()" />
                    <xsl:variable name="var:v13" select="userCSharp:FormatVDatu(string($var:v12))" />
                    <ns0:VALID_FROM>
                      <xsl:value-of select="$var:v13" />
                    </ns0:VALID_FROM>
                  </xsl:if>
                  <xsl:if test="string($var:v15)='true'">
                    <ns0:VALID_FROM>
                      <xsl:attribute name="xsi:nil">
                        <xsl:value-of select="'true'" />
                      </xsl:attribute>
                    </ns0:VALID_FROM>
                  </xsl:if>
                  <xsl:if test="string($var:v11)='true'">
                    <xsl:variable name="var:v16" select="s0:BDATU/text()" />
                    <xsl:variable name="var:v17" select="userCSharp:FormatBDatu(string($var:v16))" />
                    <ns0:VALID_TO>
                      <xsl:value-of select="$var:v17" />
                    </ns0:VALID_TO>
                  </xsl:if>
                  <xsl:if test="string($var:v15)='true'">
                    <ns0:VALID_TO>
                      <xsl:attribute name="xsi:nil">
                        <xsl:value-of select="'true'" />
                      </xsl:attribute>
                    </ns0:VALID_TO>
                  </xsl:if>
                </ns0:SUPP_SOURCE_LIST>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>    
        </xsl:if>
        <xsl:if test="$var:lstCount = 0">
          <ns0:SUPP_SOURCE_LIST>
            <xsl:if test="s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:WERKS">
              <xsl:variable name="var:v7" select="string(s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:WERKS/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v7)='true'">
                <ns0:CONTRACT>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns0:CONTRACT>
              </xsl:if>
              <xsl:if test="string($var:v7)='false'">
                <ns0:CONTRACT>
                  <xsl:value-of select="s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:WERKS/text()" />
                </ns0:CONTRACT>
              </xsl:if>
            </xsl:if>
            <xsl:if test="s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:MATNR">
              <xsl:variable name="var:v8" select="string(s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:MATNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v8)='true'">
                <ns0:PART_NO>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns0:PART_NO>
              </xsl:if>
              <xsl:if test="string($var:v8)='false'">
                <ns0:PART_NO>
                  <xsl:value-of select="s1:idocData/s0:E2EORDH001GRP/s0:E2EORDH001/s0:MATNR/text()" />
                </ns0:PART_NO>
              </xsl:if>           
            </xsl:if>  
            <xsl:call-template name="NullDates">
              <xsl:with-param name="containsValidFrom" select="'false'"></xsl:with-param>
              <xsl:with-param name="containsValidTo" select="'false'"></xsl:with-param>
            </xsl:call-template>
          </ns0:SUPP_SOURCE_LIST>
        </xsl:if>
      </ns0:SUPP_SOURCE_LISTS>
    </ns0:RECEIVE_SUPP_SOURCE_LIST>
  </xsl:template>
  <xsl:template name="NullDates">
    <xsl:param name="containsValidFrom" />
    <xsl:param name="containsValidTo" />
    <xsl:choose>
      <xsl:when test="$containsValidFrom='false' and $containsValidTo='false'">
        <ns0:VALID_FROM xsi:nil="true"/>   
        <ns0:VALID_TO xsi:nil="true"/>       
      </xsl:when>      
      <xsl:otherwise>
        <ns0:VALID_FROM>
          <xsl:value-of select="$containsValidFrom"/>
        </ns0:VALID_FROM>
        <ns0:VALID_TO>
          <xsl:value-of select="$containsValidTo"/>
        </ns0:VALID_TO>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
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


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string FormatVDatu(string dateString)
{
	return DateTime.ParseExact(dateString, "yyyyMMdd", null).ToString("yyyy-MM-dd");
}


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string FormatBDatu(string dateString)
{
	return DateTime.ParseExact(dateString, "yyyyMMdd", null).ToString("yyyy-MM-dd");
}


public bool LogicalOr(string param0, string param1)
{
	return ValToBool(param0) || ValToBool(param1);
	return false;
}


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
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

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}
public string MathInt(string val)
{
	string retval = "";
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		try
		{
			int i = Convert.ToInt32(d, System.Globalization.CultureInfo.InvariantCulture);
			if (i > d)
			{
				i = i-1;
			}
			retval = i.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}

]]></msxsl:script>
</xsl:stylesheet>