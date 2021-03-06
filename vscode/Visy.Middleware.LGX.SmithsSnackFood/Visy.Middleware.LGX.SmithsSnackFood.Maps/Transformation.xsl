<?xml version="1.0" encoding="UTF-16" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" version="1.0" xmlns:s0="http://Visy.Middleware.Common.Schemas.ExcelOrder" xmlns:ns1="http://Visy.Middleware.Common.Schemas.LGX.ORDEREnvelope" xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ExcelOrder" />
  </xsl:template>
  <xsl:template match="/s0:ExcelOrder">
    <ns1:ORDEREnvelope>
      <xsl:for-each select="s0:Product">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:StringSize(string(../s0:PurchaseOrderNumber/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:LogicalGt(string($var:v2) , &quot;0&quot;)" />
        <xsl:if test="$var:v3">
          <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;N&quot;)" />
          <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;EDI&quot;)" />
          <xsl:variable name="var:v6" select="string(../s0:PurchaseOrderNumber/text())" />
          <xsl:variable name="var:v7" select="userCSharp:StringConcat($var:v6 , &quot;-&quot; , string(s0:Description/text()))" />
          <xsl:variable name="var:v8" select="userCSharp:StringSize(string(../s0:PurchaseOrderDate/text()))" />
          <xsl:variable name="var:v9" select="userCSharp:LogicalGt(string($var:v8) , &quot;0&quot;)" />
          <xsl:variable name="var:v11" select="userCSharp:LogicalNot(string($var:v9))" />
          <xsl:variable name="var:v14" select="userCSharp:DateCurrentTime()" />
          <xsl:variable name="var:v15" select="userCSharp:StringConcat(string(../s0:DeliveryAddress/text()) , &quot;,&quot; , string(../s0:Suburb/text()) , &quot;,&quot; , string(../s0:Postcode/text()))" />
          <xsl:variable name="var:v16" select="userCSharp:StringConcat(&quot;.&quot;)" />
          <xsl:variable name="var:v17" select="userCSharp:StringConcat(&quot;AC&quot;)" />
          <xsl:variable name="var:v18" select="userCSharp:StringConcat(string($var:v1) , &quot;0&quot;)" />
          <xsl:variable name="var:v19" select="userCSharp:StringSize(string(s0:MaterialID/text()))" />
          <xsl:variable name="var:v20" select="userCSharp:LogicalGt(string($var:v19) , &quot;0&quot;)" />
          <xsl:variable name="var:v22" select="userCSharp:StringSize(string(s0:Quantity/text()))" />
          <xsl:variable name="var:v23" select="userCSharp:LogicalGt(string($var:v22) , &quot;0&quot;)" />
          <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;TH&quot;)" />
          <xsl:variable name="var:v28" select="userCSharp:StringSize(string(s0:DeliveryDate/text()))" />
          <xsl:variable name="var:v29" select="userCSharp:LogicalGt(string($var:v28) , &quot;0&quot;)" />
          <xsl:variable name="var:v40" select="userCSharp:StringConcat(&quot;0000&quot;)" />
          <xsl:variable name="var:v41" select="string(s0:Quantity/text())" />
          <xsl:variable name="var:v42" select="userCSharp:StringSize($var:v41)" />
          <xsl:variable name="var:v43" select="userCSharp:LogicalGt(string($var:v42) , &quot;0&quot;)" />
          <ns0:ORDER>
            <ns0:Header>
              <xsl:attribute name="order_type">
                <xsl:value-of select="$var:v4" />
              </xsl:attribute>
              <xsl:attribute name="application_code">
                <xsl:value-of select="$var:v5" />
              </xsl:attribute>
              <xsl:attribute name="customer_ean">
                <xsl:value-of select="../s0:CustomerEAN/text()" />
              </xsl:attribute>
              <xsl:attribute name="customer_code">
                <xsl:value-of select="../s0:CustomerNumber/text()" />
              </xsl:attribute>
              <xsl:attribute name="purchase_order_number">
                <xsl:value-of select="$var:v7" />
              </xsl:attribute>
              <xsl:if test="string($var:v9)='true'">
                <xsl:variable name="var:v10" select="../s0:PurchaseOrderDate/text()" />
                <xsl:attribute name="purchase_order_date">
                  <xsl:value-of select="$var:v10" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v11)='true'">
                <xsl:variable name="var:v12" select="userCSharp:DateCurrentDate()" />
                <xsl:variable name="var:v13" select="ScriptNS0:ReplaceString(string($var:v12) , &quot;-&quot; , &quot;&quot;)" />
                <xsl:attribute name="purchase_order_date">
                  <xsl:value-of select="$var:v13" />
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="purchase_order_time">
                <xsl:value-of select="$var:v14" />
              </xsl:attribute>
              <xsl:attribute name="customer_name">
                <xsl:value-of select="../s0:CustomerName/text()" />
              </xsl:attribute>
              <xsl:attribute name="customer_address">
                <xsl:value-of select="$var:v15" />
              </xsl:attribute>
              <xsl:attribute name="contact_name">
                <xsl:value-of select="../s0:Contact/text()" />
              </xsl:attribute>
              <xsl:attribute name="contact_number">
                <xsl:value-of select="../s0:Phone/text()" />
              </xsl:attribute>
              <xsl:attribute name="biztalk_id">
                <xsl:value-of select="$var:v16" />
              </xsl:attribute>
              <xsl:attribute name="acknowledge_document">
                <xsl:value-of select="$var:v17" />
              </xsl:attribute>
            </ns0:Header>
            <ns0:Detail>
              <xsl:attribute name="line_indicator">
                <xsl:value-of select="$var:v4" />
              </xsl:attribute>
              <xsl:attribute name="line_number">
                <xsl:value-of select="$var:v18" />
              </xsl:attribute>
              <xsl:if test="string($var:v20)='true'">
                <xsl:variable name="var:v21" select="s0:MaterialID/text()" />
                <xsl:attribute name="product_code">
                  <xsl:value-of select="$var:v21" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v23)='true'">
                <xsl:variable name="var:v24" select="s0:Quantity/text()" />
                <xsl:variable name="var:v25" select="userCSharp:MathDivide(string($var:v24) , &quot;1000&quot;)" />
                <xsl:variable name="var:v26" select="userCSharp:MathRound(string($var:v25) , &quot;3&quot;)" />
                <xsl:attribute name="quantity">
                  <xsl:value-of select="$var:v26" />
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="unit_of_measure">
                <xsl:value-of select="$var:v27" />
              </xsl:attribute>
              <xsl:if test="string($var:v29)='true'">
                <xsl:variable name="var:v30" select="s0:DeliveryDate/text()" />
                <xsl:variable name="var:v31" select="userCSharp:StringLeft(string($var:v30) , &quot;4&quot;)" />
                <xsl:variable name="var:v32" select="string(s0:DeliveryDate/text())" />
                <xsl:variable name="var:v33" select="userCSharp:StringSize($var:v32)" />
                <xsl:variable name="var:v34" select="userCSharp:LogicalGt(string($var:v33) , &quot;0&quot;)" />
                <xsl:if test="string($var:v34)='true'">
                  <xsl:variable name="var:v35" select="userCSharp:StringSubstring(string($var:v30) , &quot;5&quot; , &quot;6&quot;)" />
                  <xsl:if test="string($var:v34)='true'">
                    <xsl:variable name="var:v36" select="userCSharp:StringSubstring(string($var:v30) , &quot;7&quot; , &quot;8&quot;)" />
                    <xsl:variable name="var:v37" select="userCSharp:StringConcat(string($var:v31) , &quot;-&quot; , string($var:v35) , &quot;-&quot; , string($var:v36))" />
                    <xsl:variable name="var:v38" select="userCSharp:DateAddDays(string($var:v37) , &quot;-1&quot;)" />
                    <xsl:variable name="var:v39" select="ScriptNS0:ReplaceString(string($var:v38) , &quot;-&quot; , &quot;&quot;)" />
                    <xsl:attribute name="delivery_date">
                      <xsl:value-of select="$var:v39" />
                    </xsl:attribute>
                  </xsl:if>
                </xsl:if>
              </xsl:if>
              <xsl:attribute name="delivery_time">
                <xsl:value-of select="$var:v40" />
              </xsl:attribute>
              <xsl:attribute name="warehouse_code">
                <xsl:value-of select="../s0:DeliveryAddressCode/text()" />
              </xsl:attribute>
              <xsl:attribute name="comment">
                <xsl:value-of select="../s0:PickupMethod/text()" />
              </xsl:attribute>
            </ns0:Detail>
            <ns0:Summary>
              <xsl:if test="string($var:v43)='true'">
                <xsl:variable name="var:v44" select="s0:Quantity/text()" />
                <xsl:attribute name="total_order_quantity">
                  <xsl:value-of select="$var:v44" />
                </xsl:attribute>
              </xsl:if>
            </ns0:Summary>
          </ns0:ORDER>
        </xsl:if>
      </xsl:for-each>
    </ns1:ORDEREnvelope>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
public string StringConcat(string param0, string param1, string param2, string param3, string param4)
{
 return param0 + param1 + param2 + param3 + param4;
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


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public bool LogicalAnd(string param0, string param1, string param2)
{
	return ValToBool(param0) && ValToBool(param1) && ValToBool(param2);
	return false;
}


public string MathRound(string val)
{
	return MathRound(val, "0");
}

public string MathRound(string val, string decimals)
{
	string retval = "";
	double v = 0;
	double db = 0;
	if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	{
		try
		{
			int d = (int) db;
			double ret = Math.Round(v, d);
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}


public string MathDivide(string val1, string val2)
{
	string retval = "";
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		if (d2 != 0)
		{
			double ret = d1 / d2;
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
	}
	return retval;
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


public string DateAddDays(string date, string days)
{
	string retval = "";
	double db = 0;
	if (IsDate(date) && IsNumeric(days, ref db))
	{
		DateTime dt = DateTime.Parse(date);
		int d = (int) db;
		dt = dt.AddDays(d);
		retval = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
	}
	return retval;
}


public string StringConcat(string param0)
{
 return param0;
}


public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}


public string StringConcat(string param0, string param1, string param2)
{
 return param0 + param1 + param2;
}


public string StringConcat(string param0, string param1)
{
 return param0 + param1;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string DateCurrentDate()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
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

public bool IsDate(string val)
{
	bool retval = true;
	try
	{
		DateTime dt = Convert.ToDateTime(val, System.Globalization.CultureInfo.InvariantCulture);
	}
	catch (Exception)
	{
		retval = false;
	}
	return retval;
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




]]>
  </msxsl:script>
</xsl:stylesheet>