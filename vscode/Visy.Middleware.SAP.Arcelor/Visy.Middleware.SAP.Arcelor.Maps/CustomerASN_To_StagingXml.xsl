<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" 
                version="1.0" 
                xmlns:s0="http://Visy.Middleware.SAP.Arcelor.Schemas" 
                xmlns:ns0="http://Visy.Middleware.SAP.Arcelor.Schemas.StagingXml" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ASNDetails" />
  </xsl:template>
  <xsl:template match="/s0:ASNDetails">
    <ns0:Staging>
      <xsl:variable name="var:vesselNumber" select="translate(string(s0:Details[s0:FieldA[contains(text(), 'Vessel:')]]/s0:FieldA/text()), 'Vessel:', '')" />
      <xsl:variable name="var:loadingPort" select="translate(string(s0:Details[s0:FieldA[contains(text(), 'Loading port:')]]/s0:FieldA/text()), 'Loading port:', '')" />
      <xsl:variable name="var:discharginPort" select="translate(string(s0:Details[s0:FieldA[contains(text(), 'Discharging port:')]]/s0:FieldA/text()), 'Discharging port:', '')" />
      <xsl:variable name="var:ets" select="translate(string(s0:Details[s0:FieldA[contains(text(), 'ADD:')]]/s0:FieldA/text()), 'ADD:', '')" />
      <xsl:variable name="var:eta" select="translate(string(s0:Details[s0:FieldA[contains(text(), 'ETA at destination')]]/s0:FieldA/text()), 'ETA at destination :', '')" />
      <xsl:variable name="var:refno" select="string(s0:Details[s0:FieldA[contains(text(), 'SWB N')]]/s0:FieldA/text())" />
      <xsl:for-each select="s0:Details[normalize-space(s0:FieldA)!='']">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:vQTYtmp" select="userCSharp:StringTrimLeft(string(s0:FieldO/text()))" />
        <xsl:variable name="var:vQTY" select="userCSharp:StringTrimRight(string($var:vQTYtmp))" />       
        <xsl:if test="string(number($var:vQTY)) != 'NaN'">
          <xsl:variable name="var:v8" select="../s0:Details[1]/s0:FieldB/text()" />
          <xsl:variable name="var:v9" select="../s0:Details[2]/s0:FieldB/text()" />
          <xsl:variable name="var:v10" select="../s0:Details[1]/s0:FieldL/text()" />
          <xsl:variable name="var:v11" select="../s0:Details[2]/s0:FieldL/text()" />
          <xsl:variable name="var:v12" select="../s0:Details[3]/s0:FieldB/text()" />
          <Details>
            <VesselNumber>
              <xsl:value-of select="$var:vesselNumber" />
            </VesselNumber>
            <LoadingPort>
              <xsl:value-of select="$var:loadingPort" />
            </LoadingPort>
            <ETS>
              <xsl:value-of select="$var:ets" />
            </ETS>
            <ETA>
              <xsl:value-of select="$var:eta" />
            </ETA>
            <DischargingPort>
              <xsl:value-of select="$var:discharginPort" />
            </DischargingPort>
            <xsl:if test="s0:FieldE">
              <InvoiceNumber>
                <xsl:value-of select="s0:FieldE/text()" />
              </InvoiceNumber>
            </xsl:if>
            <xsl:if test="s0:FieldC">
              <SGVisyPONumber>
                <xsl:value-of select="s0:FieldC/text()" />
              </SGVisyPONumber>
            </xsl:if>
            <xsl:if test="s0:FieldG">
              <VisyPONumber>
                <xsl:value-of select="s0:FieldG/text()" />
              </VisyPONumber>
            </xsl:if>
            <xsl:if test="substring(s0:FieldH/text(), 1, 1) = 'P'">             
              <VisyPOLineItemNumber>
                <xsl:value-of select="substring(s0:FieldH/text(), 2, string-length(s0:FieldH/text())-1)" />
              </VisyPOLineItemNumber>
            </xsl:if>
            <xsl:if test="substring(s0:FieldH/text(), 1, 1) != 'P'">             
              <VisyPOLineItemNumber>
                <xsl:value-of select="s0:FieldH/text()" />
              </VisyPOLineItemNumber>
            </xsl:if>
            <xsl:if test="s0:FieldI">
              <VisyMaterialNumber>
                <xsl:value-of select="concat('0', string(number(s0:FieldI/text())))" />
              </VisyMaterialNumber>
            </xsl:if>
            <xsl:if test="s0:FieldC">
              <OrderNumber>
                <xsl:value-of select="s0:FieldC/text()" />
              </OrderNumber>
            </xsl:if>
            <xsl:if test="s0:FieldD">
              <Item>
                <xsl:value-of select="s0:FieldD/text()" />
              </Item>
            </xsl:if>
            <xsl:if test="s0:FieldK">
              <ProductNumber>
                <xsl:value-of select="s0:FieldK/text()" />
              </ProductNumber>
            </xsl:if>
            <xsl:if test="s0:FieldJ">
              <BundleNum>
                <xsl:value-of select="s0:FieldJ/text()" />
              </BundleNum>
            </xsl:if>
            <xsl:if test="s0:FieldK">
              <ContainerNumber>
                <xsl:value-of select="s0:FieldK/text()" />
              </ContainerNumber>
            </xsl:if>
            <xsl:if test="s0:FieldL">
              <Seal>
                <xsl:value-of select="s0:FieldL/text()" />
              </Seal>
            </xsl:if>
            <xsl:if test="s0:FieldM">
              <GrossWeight>
                <xsl:value-of select="s0:FieldM/text()" />
              </GrossWeight>
            </xsl:if>
            <xsl:if test="s0:FieldO">
              <Quantity>
                <xsl:value-of select="format-number(s0:FieldO/text(), '0.000')" />
              </Quantity>
            </xsl:if>
            <Origin>
              <xsl:value-of select="$var:refno" />
            </Origin>
          </Details>
        </xsl:if>
      </xsl:for-each>
    </ns0:Staging>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
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


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
}


public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
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


]]></msxsl:script>
</xsl:stylesheet>