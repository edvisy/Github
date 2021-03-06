<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
	              xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	              exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0"
	              version="1.0" 
	              xmlns:s0="http://Visy.Middleware.LGX.Nestle.N778.Schemas.Order2" 
	              xmlns:ns0="http://Visy.Middleware.LGX.Nestle.N778.OrderCanonical" 
	              xmlns:ns1="http://Visy.Middleware.LGX.Nestle.N778.Schemas.Envelope"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">               
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Order" />
  </xsl:template>
  <xsl:template match="/s0:Order">
    <ns1:Orders>     
      <xsl:variable name="var:v1" select="position()" />
      <xsl:variable name="var:PONumber" select="string(s0:Details[2]/s0:FieldA/text())" />
      <xsl:variable name="var:WarehouseCode" select='"N778-WHC"' />
      <xsl:for-each select="s0:Details">
        <xsl:if test="string(s0:FieldB/text()) != ''">
          <ns0:Order>
              <PONumber>
                <xsl:value-of select="$var:PONumber" />
              </PONumber>
              <DeliveryDate>
                <xsl:value-of select="ScriptNS0:FormateDateNew(string(s0:FieldI/text()) , &quot;yyyyMMdd&quot; , &quot;d.M.yyyy&quot;)" />
              </DeliveryDate>
              <Description>
                <xsl:value-of select="s0:FieldD/text()" />
              </Description>
              <ProductCode>
                <xsl:value-of select="s0:FieldB/text()" />
              </ProductCode>
              <OrderQuantity>
                <xsl:value-of select="s0:FieldG/text()" />
              </OrderQuantity>
              <WarehouseCode>
                <xsl:value-of select="$var:WarehouseCode" />
              </WarehouseCode>
              <Price>
                <xsl:value-of select="s0:FieldJ/text()" />
              </Price>
              <PODate>
                <xsl:value-of select="ScriptNS0:FormateDateNew(string(s0:FieldK/text()) , &quot;yyyyMMdd&quot; , &quot;d.M.yyyy&quot;)" />
              </PODate>
            </ns0:Order>
          </xsl:if>
      </xsl:for-each>
    </ns1:Orders>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
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

public string OLEDate(string param1)
{
    double number = double.Parse(param1);
	  DateTime conv = DateTime.FromOADate(number);

    return conv.ToString("MM/dd/yyyy");
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