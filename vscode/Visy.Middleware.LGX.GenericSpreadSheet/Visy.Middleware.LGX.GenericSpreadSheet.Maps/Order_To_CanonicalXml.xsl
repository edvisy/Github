<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" version="1.0" xmlns:s0="http://Visy.Middleware.LGX.GenericSpreadSheet.Schemas.Order" xmlns:ns0="http://Visy.Middleware.LGX.GenericSpreadSheet.Schemas.Single" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Order" />
  </xsl:template>
  <xsl:template match="/s0:Order">
    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

    <xsl:variable name="var:customerCode" select="./s0:Details[translate(translate(s0:FieldB, $lowercase, $uppercase), ' ', '')='CUSTOMERCODE']/s0:FieldC/text()" />
    <xsl:variable name="var:PONumber" select="./s0:Details[translate(translate(s0:FieldB, $lowercase, $uppercase), ' ', '')='PONUMBER']/s0:FieldC/text()" />
    <xsl:variable name="var:customerName" select="./s0:Details[translate(translate(s0:FieldB, $lowercase, $uppercase), ' ', '')='CUSTOMERNAME']/s0:FieldC/text()" />
    <xsl:variable name="var:EAN" select="./s0:Details[translate(translate(s0:FieldB, $lowercase, $uppercase), ' ', '')='CUSTOMEREAN']/s0:FieldC/text()" />
    <xsl:variable name="var:v5" select="./s0:Details[translate(translate(s0:FieldB, $lowercase, $uppercase), ' ', '')='DELIVERYADDRESS']/s0:FieldC/text()" />
    <xsl:variable name="var:WHC" select="userCSharp:StringSubstring(string($var:v5) , &quot;1&quot; , &quot;12&quot;)" />
    
    <xsl:if test="string(normalize-space($var:customerCode))=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Empty Customer Code not allowed'"/>
      </xsl:message>
    </xsl:if>
    
    <xsl:if test="string(normalize-space($var:EAN))=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Empty EAN Code not allowed'"/>
      </xsl:message>
    </xsl:if>
      
    <xsl:if test="string(normalize-space($var:PONumber))=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Empty PO Number not allowed'"/>
      </xsl:message>
    </xsl:if>
    
    <xsl:if test="string(normalize-space($var:WHC))=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="concat('Empty WHC not allowed for Customer Code: ', $var:customerCode, 'with PO: ', $var:PONumber)"/>
      </xsl:message>
    </xsl:if>
    
    <xsl:if test="string(normalize-space($var:customerName))=''">
      <xsl:message terminate="yes">
        <xsl:value-of select="concat('Empty Customer Name for PO: ', $var:PONumber)"/>
      </xsl:message>
    </xsl:if>
 
    <ns0:Single>
      <CustomerCode>
        <xsl:value-of select="$var:customerCode" />
      </CustomerCode>
      <PONumber>
        <xsl:value-of select="$var:PONumber" />
      </PONumber>
      <CustomerName>
        <xsl:value-of select="$var:customerName" />
      </CustomerName>
      <EAN>
        <xsl:value-of select="$var:EAN" />
      </EAN>
      <WHC>
        <xsl:value-of select="$var:WHC" />
      </WHC>
      <xsl:for-each select="s0:Details">
        <xsl:variable name="var:v7" select="position()" />
        <xsl:variable name="var:v8" select="userCSharp:StringTrimLeft(string(s0:FieldD/text()))" />
        <xsl:variable name="var:v9" select="userCSharp:StringTrimRight(string($var:v8))" />
        <xsl:variable name="var:v10" select="userCSharp:MathInt(string($var:v9))" />
        <xsl:variable name="var:v11" select="userCSharp:LogicalGt(string($var:v10) , &quot;0&quot;)" />
        <xsl:variable name="var:v12" select="userCSharp:LogicalGt(string($var:v7) , &quot;9&quot;)" />
        <xsl:variable name="var:v13" select="userCSharp:LogicalAnd(string($var:v11) , string($var:v12))" />
        <xsl:if test="$var:v13">
          <Details>
            <xsl:variable name="var:v14" select="ScriptNS0:FormateDateNew(string(s0:FieldE/text()) , &quot;yyyyMMdd&quot; , &quot;d/M/yyyy&quot;)" />
            <xsl:if test="string(normalize-space($var:v14))=''">
              <xsl:message terminate="yes">
                <xsl:value-of select="concat('Invalid Delivery Date Value: ', string(s0:FieldE/text()), 'for Customer Code: ', $var:customerCode, ' with PO: ', $var:PONumber)"/>
              </xsl:message>
            </xsl:if>           
            
            <xsl:if test="string(normalize-space(s0:FieldB/text()))=''">
              <xsl:message terminate="yes">
                <xsl:value-of select="concat('Empty Product code not allowed for Customer Code: ', $var:customerCode, ' with PO: ', $var:PONumber)"/>
              </xsl:message>
            </xsl:if>
            
            <DeliveryDate>
              <xsl:value-of select="$var:v14" />
            </DeliveryDate>
            <xsl:if test="s0:FieldB">
              <ProductCode>
                <xsl:value-of select="s0:FieldB/text()" />
              </ProductCode>
            </xsl:if>
            <xsl:if test="s0:FieldF">
              <Price>
                <xsl:value-of select="s0:FieldF/text()" />
              </Price>
            </xsl:if>
            <xsl:if test="s0:FieldD">
              <Quantity>
                <xsl:value-of select="s0:FieldD/text()" />
              </Quantity>
            </xsl:if>
            <xsl:if test="s0:FieldC">
              <Description>
                <xsl:value-of select="s0:FieldC/text()" />
              </Description>
            </xsl:if>
            <xsl:if test="s0:FieldG">
              <Comments>
                <xsl:value-of select="s0:FieldG/text()" />
              </Comments>
            </xsl:if>
          </Details>
        </xsl:if>
      </xsl:for-each>
    </ns0:Single>
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


public string StringSubstring(string str, string left, string right)
{
	string retval = "";
	double dleft = 0;
	double dright = 0;
	if (str != null && IsNumeric(left, ref dleft) && IsNumeric(right, ref dright))
	{
		int lt = (int)dleft;
		int rt = (int)dright;
		lt--; rt--;
		if (lt >= 0 && rt >= lt && lt < str.Length)
		{
			if (rt < str.Length)
			{
				retval = str.Substring(lt, rt-lt+1);
			}
			else
			{
				retval = str.Substring(lt, str.Length-lt);
			}
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