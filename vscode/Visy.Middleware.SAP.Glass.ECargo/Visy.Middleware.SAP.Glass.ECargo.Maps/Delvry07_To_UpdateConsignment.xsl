<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp ScriptNS0 ScriptNS1" version="1.0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/DELVRY07" />
  </xsl:template>
  <xsl:template match="/DELVRY07">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;17376&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;APIKey&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:MathInt(string(IDOC/E1EDL20/VBELN/text()))" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;Delivery Deleted&quot;)" />
    <UpdateConsignment>
      <Sender>
        <xsl:value-of select="$var:v1" />
      </Sender>
      <xsl:variable name="var:v3" select="ScriptNS0:GetInterfaceLookupData(string($var:v2) , &quot;SAP.Glass.ECargo.APISettings&quot;)" />
      <ApiKey>
        <xsl:value-of select="$var:v3" />
      </ApiKey>
      <ConsignmentNumber>
        <xsl:value-of select="$var:v4" />
      </ConsignmentNumber>
      <xsl:variable name="var:vConsignmentOwner" select="ScriptNS1:GetConsignmentOwner(string(IDOC/E1EDL20/VSTEL/text()))" />
      
     <xsl:if test="$var:vConsignmentOwner=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="concat(string(IDOC/E1EDL20/VSTEL/text()), ' does not have matching consignment owner')"/>
      </xsl:message>
     </xsl:if>
      <ConsignmentOwner>
        <xsl:value-of select="$var:vConsignmentOwner" />
      </ConsignmentOwner>
      <Updates>
        <WithdrawConsignment>
          <Comment>
            <xsl:value-of select="$var:v6" />
          </Comment>
        </WithdrawConsignment>
      </Updates>
    </UpdateConsignment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
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