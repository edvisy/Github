<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 ScriptNS0 userCSharp" version="1.0" xmlns:ns1="http://schemas.xmlsoap.org/soap/encoding/" xmlns:ns0="urn:Magento" xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZMATLCLASS//740" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ZMATL000GRP" />
  </xsl:template>
  <xsl:template match="/s0:ZMATL000GRP">
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;sku&quot;)" />
    <ns0:catalogProductUpdate>
      <xsl:variable name="var:v1" select="ScriptNS0:GetDataValue(&quot;SessionId&quot;)" />
      <sessionId>
        <xsl:value-of select="$var:v1" />
      </sessionId>
      <product>
        <xsl:value-of select="s0:ZMATL000/s0:MATNR/text()" />
      </product>
      <productData>
        <name>
          <xsl:value-of select="s0:ZMATL000/s0:MAKTX/text()" />
        </name>
        <website_ids>
          <xsl:for-each select="s0:ZVBAM000">
            <item>
              <xsl:value-of select="userCSharp:MathInt(string(s0:WEBSITE/text()))" />
            </item>
          </xsl:for-each>
        </website_ids>
      </productData>
      <productIdentifierType>
        <xsl:value-of select="$var:v2" />
      </productIdentifierType>
    </ns0:catalogProductUpdate>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
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