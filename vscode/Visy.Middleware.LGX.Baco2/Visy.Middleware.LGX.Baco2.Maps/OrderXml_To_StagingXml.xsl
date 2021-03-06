<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" version="1.0" xmlns:ns0="http://Visy.Middleware.LGX.Baco2.Schemas.StagingXml" xmlns:s0="http://Visy.Middleware.LGX.Baco2.Schemas" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Order" />
  </xsl:template>
  <xsl:template match="/s0:Order">
    <xsl:variable name="var:vWHC" select="userCSharp:StringConcat(&quot;WHC-B2884&quot;)" />
    <ns0:Staging>
      <xsl:for-each select="s0:Details">        
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:StringTrimLeft(string(s0:FieldD/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringTrimRight(string($var:v2))" />
        <xsl:variable name="var:v4" select="userCSharp:MathInt(string($var:v3))" />
        <xsl:variable name="var:v5" select="userCSharp:LogicalGt(string($var:v4) , &quot;0&quot;)" />
        <xsl:variable name="var:v6" select="userCSharp:LogicalGt(string($var:v1) , &quot;4&quot;)" />
        <xsl:variable name="var:v7" select="userCSharp:LogicalAnd(string($var:v5) , string($var:v6))" />
        <xsl:if test="$var:v7">
          <xsl:variable name="var:vPONumber" select="../s0:Details[1]/s0:FieldD/text()" />
          <xsl:variable name="var:v9" select="../s0:Details[2]/s0:FieldD/text()" />
          <xsl:variable name="var:vDeliveryDate" select="ScriptNS0:FormateDateNew(string($var:v9) , &quot;yyyyMMdd&quot; , &quot;yyyyMMdd&quot;)" />
          <Details>
            <PONumber>
              <xsl:value-of select="$var:vPONumber" />
            </PONumber>           
            <DeliveryDate>
              <xsl:value-of select="$var:vDeliveryDate" />
            </DeliveryDate>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v11" select="s0:FieldC/text()" />
              <ProductCode>
                <xsl:value-of select="$var:v11" />
              </ProductCode>
            </xsl:if>            
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v12" select="s0:FieldD/text()" />
              <Quantity>
                <xsl:value-of select="$var:v12" />
              </Quantity>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v13" select="s0:FieldB/text()" />
              <Description>
                <xsl:value-of select="$var:v13" />
              </Description>
            </xsl:if>
            <WHC>
              <xsl:value-of select="$var:vWHC" />
            </WHC>
          </Details>
        </xsl:if>
      </xsl:for-each>

      <xsl:for-each select="s0:Details">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:StringTrimLeft(string(s0:FieldE/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringTrimRight(string($var:v2))" />
        <xsl:variable name="var:v4" select="userCSharp:MathInt(string($var:v3))" />
        <xsl:variable name="var:v5" select="userCSharp:LogicalGt(string($var:v4) , &quot;0&quot;)" />
        <xsl:variable name="var:v6" select="userCSharp:LogicalGt(string($var:v1) , &quot;4&quot;)" />
        <xsl:variable name="var:v7" select="userCSharp:LogicalAnd(string($var:v5) , string($var:v6))" />
        <xsl:if test="$var:v7">
          <xsl:variable name="var:vPONumber" select="../s0:Details[1]/s0:FieldE/text()" />
          <xsl:variable name="var:v9" select="../s0:Details[2]/s0:FieldE/text()" />
          <xsl:variable name="var:vDeliveryDate" select="ScriptNS0:FormateDateNew(string($var:v9) , &quot;yyyyMMdd&quot; , &quot;yyyyMMdd&quot;)" />
          <Details>
            <PONumber>
              <xsl:value-of select="$var:vPONumber" />
            </PONumber>
            <DeliveryDate>
              <xsl:value-of select="$var:vDeliveryDate" />
            </DeliveryDate>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v11" select="s0:FieldC/text()" />
              <ProductCode>
                <xsl:value-of select="$var:v11" />
              </ProductCode>
            </xsl:if>        
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v12" select="s0:FieldE/text()" />
              <Quantity>
                <xsl:value-of select="$var:v12" />
              </Quantity>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v13" select="s0:FieldB/text()" />
              <Description>
                <xsl:value-of select="$var:v13" />
              </Description>
            </xsl:if>
            <WHC>
              <xsl:value-of select="$var:vWHC" />
            </WHC>
          </Details>
        </xsl:if>
      </xsl:for-each>

      <xsl:for-each select="s0:Details">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:StringTrimLeft(string(s0:FieldF/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringTrimRight(string($var:v2))" />
        <xsl:variable name="var:v4" select="userCSharp:MathInt(string($var:v3))" />
        <xsl:variable name="var:v5" select="userCSharp:LogicalGt(string($var:v4) , &quot;0&quot;)" />
        <xsl:variable name="var:v6" select="userCSharp:LogicalGt(string($var:v1) , &quot;4&quot;)" />
        <xsl:variable name="var:v7" select="userCSharp:LogicalAnd(string($var:v5) , string($var:v6))" />
        <xsl:if test="$var:v7">
          <xsl:variable name="var:vPONumber" select="../s0:Details[1]/s0:FieldF/text()" />
          <xsl:variable name="var:v9" select="../s0:Details[2]/s0:FieldF/text()" />
          <xsl:variable name="var:vDeliveryDate" select="ScriptNS0:FormateDateNew(string($var:v9) , &quot;yyyyMMdd&quot; , &quot;yyyyMMdd&quot;)" />
          <Details>
            <PONumber>
              <xsl:value-of select="$var:vPONumber" />
            </PONumber>
            <DeliveryDate>
              <xsl:value-of select="$var:vDeliveryDate" />
            </DeliveryDate>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v11" select="s0:FieldC/text()" />
              <ProductCode>
                <xsl:value-of select="$var:v11" />
              </ProductCode>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v12" select="s0:FieldF/text()" />
              <Quantity>
                <xsl:value-of select="$var:v12" />
              </Quantity>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v13" select="s0:FieldB/text()" />
              <Description>
                <xsl:value-of select="$var:v13" />
              </Description>
            </xsl:if>
            <WHC>
              <xsl:value-of select="$var:vWHC" />
            </WHC>
          </Details>
        </xsl:if>
      </xsl:for-each>

      <xsl:for-each select="s0:Details">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:StringTrimLeft(string(s0:FieldG/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringTrimRight(string($var:v2))" />
        <xsl:variable name="var:v4" select="userCSharp:MathInt(string($var:v3))" />
        <xsl:variable name="var:v5" select="userCSharp:LogicalGt(string($var:v4) , &quot;0&quot;)" />
        <xsl:variable name="var:v6" select="userCSharp:LogicalGt(string($var:v1) , &quot;4&quot;)" />
        <xsl:variable name="var:v7" select="userCSharp:LogicalAnd(string($var:v5) , string($var:v6))" />
        <xsl:if test="$var:v7">
          <xsl:variable name="var:vPONumber" select="../s0:Details[1]/s0:FieldG/text()" />
          <xsl:variable name="var:v9" select="../s0:Details[2]/s0:FieldG/text()" />
          <xsl:variable name="var:vDeliveryDate" select="ScriptNS0:FormateDateNew(string($var:v9) , &quot;yyyyMMdd&quot; , &quot;yyyyMMdd&quot;)" />
          <Details>
            <PONumber>
              <xsl:value-of select="$var:vPONumber" />
            </PONumber>
            <DeliveryDate>
              <xsl:value-of select="$var:vDeliveryDate" />
            </DeliveryDate>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v11" select="s0:FieldC/text()" />
              <ProductCode>
                <xsl:value-of select="$var:v11" />
              </ProductCode>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v12" select="s0:FieldG/text()" />
              <Quantity>
                <xsl:value-of select="$var:v12" />
              </Quantity>
            </xsl:if>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v13" select="s0:FieldB/text()" />
              <Description>
                <xsl:value-of select="$var:v13" />
              </Description>
            </xsl:if>
            <WHC>
              <xsl:value-of select="$var:vWHC" />
            </WHC>
          </Details>
        </xsl:if>
      </xsl:for-each>
    </ns0:Staging>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
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