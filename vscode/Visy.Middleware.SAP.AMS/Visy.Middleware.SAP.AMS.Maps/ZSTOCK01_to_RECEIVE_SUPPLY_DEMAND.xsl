<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s1 s2 s0 userCSharp"
                version="1.0"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:ns0="urn:ifsworld-com:schemas:sap_interface_inbound_messages_receive_supply_demand_request"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZSTOCK01//740/Receive"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZSTOCK01//740"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <ns0:RECEIVE_SUPPLY_DEMAND>
      <ns0:SUPPLY_DEMANDS>
        <xsl:for-each select="s1:idocData">
          <xsl:for-each select="s0:ZSTOKHD000">
            <xsl:variable name="var:v7" select="userCSharp:StringConcat(&quot;''&quot;)" />
            <xsl:variable name="var:v8" select="userCSharp:StringFind(string(s0:SUPPLY_QTY/text()) , &quot;-&quot;)" />
            <xsl:variable name="var:v9" select="userCSharp:LogicalLte(string($var:v8) , &quot;0&quot;)" />
            <xsl:variable name="var:v11" select="userCSharp:LogicalGt(string($var:v8) , &quot;0&quot;)" />
            <ns0:SUPPLY_DEMAND>
              <xsl:if test="s0:CONTRACT">
                <xsl:variable name="var:v1" select="string(s0:CONTRACT/@xsi:nil) = 'true'" />
                <xsl:if test="string($var:v1)='true'">
                  <ns0:CONTRACT>
                    <xsl:attribute name="xsi:nil">
                      <xsl:value-of select="'true'" />
                    </xsl:attribute>
                  </ns0:CONTRACT>
                </xsl:if>
                <xsl:if test="string($var:v1)='false'">
                  <ns0:CONTRACT>
                    <xsl:value-of select="s0:CONTRACT/text()" />
                  </ns0:CONTRACT>
                </xsl:if>
              </xsl:if>
              <xsl:if test="s0:PART_NO">
                <xsl:variable name="var:v2" select="string(s0:PART_NO/@xsi:nil) = 'true'" />
                <xsl:if test="string($var:v2)='true'">
                  <ns0:PART_NO>
                    <xsl:attribute name="xsi:nil">
                      <xsl:value-of select="'true'" />
                    </xsl:attribute>
                  </ns0:PART_NO>
                </xsl:if>
                <xsl:if test="string($var:v2)='false'">
                  <ns0:PART_NO>
                    <xsl:value-of select="s0:PART_NO/text()" />
                  </ns0:PART_NO>
                </xsl:if>
              </xsl:if>
              <xsl:if test="s0:WO_NO">
                <xsl:variable name="var:v3" select="string(s0:WO_NO/@xsi:nil) = 'true'" />
                <xsl:if test="string($var:v3)='true'">
                  <ns0:SUPPLY_DEMAND_ID>
                    <xsl:attribute name="xsi:nil">
                      <xsl:value-of select="'true'" />
                    </xsl:attribute>
                  </ns0:SUPPLY_DEMAND_ID>
                </xsl:if>
                <xsl:if test="string($var:v3)='false'">
                  <ns0:SUPPLY_DEMAND_ID>
                    <xsl:value-of select="s0:WO_NO/text()" />
                  </ns0:SUPPLY_DEMAND_ID>
                </xsl:if>
              </xsl:if>
              <xsl:if test="s0:LINE_NO">
                <xsl:variable name="var:v4" select="string(s0:LINE_NO/@xsi:nil) = 'true'" />
                <xsl:if test="string($var:v4)='true'">
                  <ns0:LINE_NO>
                    <xsl:attribute name="xsi:nil">
                      <xsl:value-of select="'true'" />
                    </xsl:attribute>
                  </ns0:LINE_NO>
                </xsl:if>
                <xsl:if test="string($var:v4)='false'">
                  <ns0:LINE_NO>
                    <!--<xsl:value-of select="s0:LINE_NO/text()" />-->
                    <xsl:value-of select="number(s0:LINE_NO/text())" />
                  </ns0:LINE_NO>
                </xsl:if>
              </xsl:if>
              <xsl:if test="s0:DEL_SCH_LINE_NO">
                <xsl:variable name="var:v5" select="s0:DEL_SCH_LINE_NO" />
                <xsl:choose>
                  <xsl:when test="string($var:v5)=''">
                    <ns0:DEL_SCH_LINE_NO>
                      <xsl:value-of select="'*'" />
                    </ns0:DEL_SCH_LINE_NO>
                  </xsl:when>
                  <xsl:otherwise>
                    <ns0:DEL_SCH_LINE_NO>
                      <xsl:value-of select="number($var:v5)" />
                    </ns0:DEL_SCH_LINE_NO>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <!--<xsl:if test="s0:DEL_SCH_LINE_NO">
                <xsl:variable name="var:v5" select="string(s0:DEL_SCH_LINE_NO/@xsi:nil) = 'true'" />
                <xsl:if test="string($var:v5)='true'">
                  <ns0:DEL_SCH_LINE_NO>
                    <xsl:value-of select="'*'" />
                  </ns0:DEL_SCH_LINE_NO>
                </xsl:if>
                <xsl:if test="string($var:v5)='false'">
                  <ns0:DEL_SCH_LINE_NO>
                    <xsl:value-of select="s0:DEL_SCH_LINE_NO/text()" />
                  </ns0:DEL_SCH_LINE_NO>
                </xsl:if>
              </xsl:if>-->
              <xsl:variable name="var:v6" select="userCSharp:IfThenElseIf(string(s0:SUPPLY_DEMAND_TYPE/text()))" />
              <ns0:SUPPLY_DEMAND_TYPE>
                <xsl:value-of select="$var:v6" />
              </ns0:SUPPLY_DEMAND_TYPE>
              <ns0:WO_NO/>
              <ns0:DEMAND_QTY/>
              <xsl:if test="string($var:v9)='true'">
                <xsl:variable name="var:v10" select="s0:SUPPLY_QTY/text()" />
                <ns0:SUPPLY_QTY>
                  <xsl:value-of select="$var:v10" />
                </ns0:SUPPLY_QTY>
              </xsl:if>
              <xsl:if test="string($var:v11)='true'">
                <xsl:variable name="var:v12" select="s0:SUPPLY_QTY/text()" />
                <xsl:variable name="var:v13" select="string(s0:SUPPLY_QTY/text())" />
                <xsl:variable name="var:v14" select="userCSharp:StringFind($var:v13 , &quot;-&quot;)" />
                <xsl:variable name="var:v15" select="userCSharp:MathSubtract(string($var:v14) , &quot;1&quot;)" />
                <xsl:variable name="var:v16" select="userCSharp:StringLeft(string($var:v12) , string($var:v15))" />
                <xsl:variable name="var:v17" select="userCSharp:StringConcat(&quot;-&quot; , string($var:v16))" />
                <ns0:SUPPLY_QTY>
                  <xsl:value-of select="$var:v17" />
                </ns0:SUPPLY_QTY>
              </xsl:if>
              <xsl:variable name="var:v18" select="userCSharp:FormatDate(string(s0:REQUESTED_DATE/text()))" />
              <ns0:REQUESTED_DATE>
                <xsl:value-of select="$var:v18" />
              </ns0:REQUESTED_DATE>
              <ns0:SAP_LEAD_TIME/>
              <xsl:variable name="var:v19" select="userCSharp:FormatDate(string(s0:SAP_EST_DEL_DATE/text()))" />
              <ns0:SAP_EST_DEL_DATE>
                <xsl:value-of select="$var:v19" />
              </ns0:SAP_EST_DEL_DATE>
            </ns0:SUPPLY_DEMAND>
          </xsl:for-each>
        </xsl:for-each>
      </ns0:SUPPLY_DEMANDS>
    </ns0:RECEIVE_SUPPLY_DEMAND>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string FormatDate(string dateString)
{
	return DateTime.ParseExact(dateString, "yyyyMMdd", null).ToString("yyyy-MM-dd");
}


public int StringFind(string str, string strFind)
{
	if (str == null || strFind == null || strFind == "")
	{
		return 0;
	}
	return (str.IndexOf(strFind) + 1);
}


public string MathSubtract(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	bool first = true;
	foreach (string obj in listValues)
	{
		if (first)
		{
			first = false;
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret = d;
			}
			else
			{
				return "";
			}
		}
		else
		{
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret -= d;
			}
			else
			{
				return "";
			}
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
}


public string StringLeft(string str, string count)
{
	string retval = "";
	double d = 0;
	if (str != null && IsNumeric(count, ref d))
	{
		int i = (int) d;
		if (i > 0)
		{ 
			if (i <= str.Length)
			{
				retval = str.Substring(0, i);
			}
			else
			{
				retval = str;
			}
		}
	}
	return retval;
}


public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
}


public bool LogicalLte(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 <= d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) <= 0;
	}
	return ret;
}


public string StringConcat(string param0, string param1)
{
   return param0 + param1;
}


public string IfThenElseIf(string param1)
{
  if (param1 == "BA")
    return "PR";
  else if (param1 == "BE")
    return "PO";
  else
    return param1;
} 

public string StringConcat(string param0)
{
   return param0;
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