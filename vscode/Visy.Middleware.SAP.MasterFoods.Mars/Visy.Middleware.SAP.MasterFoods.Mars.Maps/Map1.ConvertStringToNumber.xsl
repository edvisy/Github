<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var ScriptNS0 ScriptNS1 ScriptNS2 userCSharp" version="1.0" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1" xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/VISY" />
  </xsl:template>
  <xsl:template match="/VISY">
    <VISY>
      <PurchaseOrders>
        <PurchaseOrder>
          <Details>
			  <xsl:for-each select="//Detail">
				  <xsl:if test="position()>2">
					  <xsl:variable name="var:v5" select="string(@F10)" />
					  <xsl:variable name="var:v6" select="userCSharp:MathMultiply($var:v5 , &quot;0.1&quot;)" />
					  <xsl:variable name="var:v7" select="userCSharp:MathMultiply($var:v5 , &quot;1.1&quot;)" />
					  <Detail>
						  <xsl:if test="@F1">
							  <xsl:attribute name="F1">
								  <xsl:value-of select="@F1" />
							  </xsl:attribute>
						  </xsl:if>
						  <xsl:variable name="var:v1" select="ScriptNS0:retrieveValue(&quot;BizTalkDataConn&quot;)" />
						  <xsl:variable name="var:v2" select="ScriptNS1:RunStoredProcedure(string($var:v1) , &quot;p_mars_vendor_map&quot; , &quot;@VendorNo&quot; , string(@F1))" />
						  <xsl:variable name="var:v3" select="ScriptNS1:ExtractValue(string($var:v2) , &quot;VisyCompanyCode&quot;)" />
						  <xsl:attribute name="F2">
							  <xsl:value-of select="$var:v3" />
						  </xsl:attribute>
						  <xsl:variable name="var:v4" select="ScriptNS2:ReplaceString(string(@F10) , &quot;,&quot; , &quot;&quot;)" />
						  <xsl:attribute name="F10">
							  <xsl:value-of select="$var:v4" />
						  </xsl:attribute>
						  <xsl:attribute name="F11">
							  <xsl:value-of select="$var:v6" />
						  </xsl:attribute>
						  <xsl:attribute name="F12">
							  <xsl:value-of select="$var:v7" />
						  </xsl:attribute>
						  <xsl:if test="@F14">
							  <xsl:attribute name="F14">
								  <xsl:value-of select="@F14" />
							  </xsl:attribute>
						  </xsl:if>
					  </Detail>
				  </xsl:if>
			  </xsl:for-each>
		  </Details>
        </PurchaseOrder>
      </PurchaseOrders>
    </VISY>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string MathMultiply(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 1;
	bool first = true;
	foreach (string obj in listValues)
	{
		double d = 0;
		if (IsNumeric(obj, ref d))
		{
			if (first)
			{
				first = false;
				ret = d;
			}
			else
			{
				ret *= d;
			}
		}
		else
		{
			return "";
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
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


]]></msxsl:script>
</xsl:stylesheet>