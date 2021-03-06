<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" version="1.0" xmlns:s0="http://Visy.Middleware.Common.Schemas.ExcelOrder" xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ExcelOrder" />
  </xsl:template>
  <xsl:template match="/s0:ExcelOrder">
    <xsl:variable name="var:v1" select="userCSharp:StringSize(string(s0:PurchaseOrderNumber/text()))" />
    <xsl:variable name="var:v2" select="userCSharp:LogicalGt(string($var:v1) , &quot;0&quot;)" />
    <xsl:variable name="var:v41" select="string(s0:PurchaseOrderNumber/text())" />
    <xsl:variable name="var:v42" select="userCSharp:StringSize($var:v41)" />
    <xsl:variable name="var:v43" select="userCSharp:LogicalGt(string($var:v42) , &quot;0&quot;)" />
    <ns0:ORDER>
      <xsl:if test="$var:v2">
        <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;N&quot;)" />
        <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;EDI&quot;)" />
        <xsl:variable name="var:v5" select="userCSharp:StringSize(string(s0:PurchaseOrderDate/text()))" />
        <xsl:variable name="var:v6" select="userCSharp:LogicalGt(string($var:v5) , &quot;0&quot;)" />
        <xsl:variable name="var:v8" select="userCSharp:LogicalNot(string($var:v6))" />
        <xsl:variable name="var:v11" select="userCSharp:DateCurrentTime()" />
        <xsl:variable name="var:v12" select="userCSharp:StringConcat(string(s0:DeliveryAddress/text()) , &quot;,&quot;, string(s0:Suburb/text()) , &quot;,&quot;, string(s0:Postcode/text()))" />
        <xsl:variable name="var:v13" select="userCSharp:StringConcat(&quot;.&quot;)" />
        <xsl:variable name="var:v14" select="userCSharp:StringConcat(&quot;AC&quot;)" />
        <ns0:Header>
          <xsl:attribute name="order_type">
            <xsl:value-of select="$var:v3" />
          </xsl:attribute>
          <xsl:attribute name="application_code">
            <xsl:value-of select="$var:v4" />
          </xsl:attribute>
          <xsl:attribute name="customer_ean">
            <xsl:value-of select="s0:CustomerEAN/text()" />
          </xsl:attribute>
          <xsl:attribute name="customer_code">
            <xsl:value-of select="s0:CustomerNumber/text()" />
          </xsl:attribute>
          <xsl:attribute name="purchase_order_number">
            <xsl:value-of select="s0:PurchaseOrderNumber/text()" />
          </xsl:attribute>
          <xsl:if test="string($var:v6)='true'">
            <xsl:variable name="var:v7" select="s0:PurchaseOrderDate/text()" />
            <xsl:attribute name="purchase_order_date">
              <xsl:value-of select="$var:v7" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v8)='true'">
            <xsl:variable name="var:v9" select="userCSharp:DateCurrentDate()" />
            <xsl:variable name="var:v10" select="ScriptNS0:ReplaceString(string($var:v9) , &quot;-&quot; , &quot;&quot;)" />
            <xsl:attribute name="purchase_order_date">
              <xsl:value-of select="$var:v10" />
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="purchase_order_time">
            <xsl:value-of select="$var:v11" />
          </xsl:attribute>
          <xsl:attribute name="customer_name">
            <xsl:value-of select="s0:CustomerName/text()" />
          </xsl:attribute>
          <xsl:attribute name="customer_address">
            <xsl:value-of select="$var:v12" />
          </xsl:attribute>
          <xsl:attribute name="contact_name">
            <xsl:value-of select="s0:Contact/text()" />
          </xsl:attribute>
          <xsl:attribute name="contact_number">
            <xsl:value-of select="s0:Phone/text()" />
          </xsl:attribute>
          <xsl:attribute name="biztalk_id">
            <xsl:value-of select="$var:v13" />
          </xsl:attribute>
          <xsl:attribute name="acknowledge_document">
            <xsl:value-of select="$var:v14" />
          </xsl:attribute>
        </ns0:Header>
      </xsl:if>
      <xsl:for-each select="s0:Product">
        <xsl:variable name="var:v15" select="userCSharp:StringSize(string(s0:MaterialID/text()))" />
        <xsl:variable name="var:v16" select="userCSharp:LogicalGt(string($var:v15) , &quot;0&quot;)" />
        <xsl:variable name="var:v17" select="userCSharp:StringSize(string(s0:Quantity/text()))" />
        <xsl:variable name="var:v18" select="userCSharp:LogicalGt(string($var:v17) , &quot;0&quot;)" />
        <xsl:variable name="var:v19" select="userCSharp:StringSize(string(s0:DeliveryDate/text()))" />
        <xsl:variable name="var:v20" select="userCSharp:LogicalGt(string($var:v19) , &quot;0&quot;)" />
        <xsl:variable name="var:v21" select="userCSharp:LogicalAnd(string($var:v16) , string($var:v18) , string($var:v20))" />
        <xsl:if test="$var:v21">
          <xsl:variable name="var:v22" select="userCSharp:StringConcat(&quot;N&quot;)" />
          <xsl:variable name="var:v23" select="string(s0:Quantity/text())" />
          <xsl:variable name="var:v24" select="userCSharp:LogicalGt($var:v23 , &quot;0&quot;)" />
          <xsl:variable name="var:v26" select="string(s0:MaterialID/text())" />
          <xsl:variable name="var:v27" select="userCSharp:StringSize($var:v26)" />
          <xsl:variable name="var:v28" select="userCSharp:LogicalGt(string($var:v27) , &quot;0&quot;)" />
          <xsl:variable name="var:v30" select="userCSharp:StringSize($var:v23)" />
          <xsl:variable name="var:v31" select="userCSharp:LogicalGt(string($var:v30) , &quot;0&quot;)" />
          <xsl:variable name="var:v35" select="userCSharp:StringConcat(&quot;TH&quot;)" />
          <xsl:variable name="var:v36" select="string(s0:DeliveryDate/text())" />
          <xsl:variable name="var:v37" select="userCSharp:StringSize($var:v36)" />
          <xsl:variable name="var:v38" select="userCSharp:LogicalGt(string($var:v37) , &quot;0&quot;)" />
          <xsl:variable name="var:v40" select="userCSharp:StringConcat(&quot;0000&quot;)" />
          <ns0:Detail>
            <xsl:attribute name="line_indicator">
              <xsl:value-of select="$var:v22" />
            </xsl:attribute>
            <xsl:variable name="var:v25" select="userCSharp:MyConcat(string($var:v24))" />
            <xsl:attribute name="line_number">
              <xsl:value-of select="$var:v25" />
            </xsl:attribute>
            <xsl:if test="string($var:v28)='true'">
              <xsl:variable name="var:v29" select="s0:MaterialID/text()" />
              <xsl:attribute name="product_code">
                <xsl:value-of select="$var:v29" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="string($var:v31)='true'">
              <xsl:variable name="var:v32" select="s0:Quantity/text()" />
              <xsl:variable name="var:v33" select="userCSharp:ConvertWithoutRoundingDiv(string($var:v32))" />
              <xsl:variable name="var:v34" select="userCSharp:MathRound(string($var:v33) , &quot;3&quot;)" />
              <xsl:attribute name="quantity">
                <xsl:value-of select="$var:v34" />
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="unit_of_measure">
              <xsl:value-of select="$var:v35" />
            </xsl:attribute>
            <xsl:if test="string($var:v38)='true'">
              <xsl:variable name="var:v39" select="s0:DeliveryDate/text()" />
              <xsl:attribute name="delivery_date">
                <xsl:value-of select="$var:v39" />
              </xsl:attribute>
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
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="$var:v43">
        <ns0:Summary>
          <xsl:variable name="var:v44" select="userCSharp:InitCumulativeSum(0)" />
          <xsl:for-each select="/s0:ExcelOrder/s0:Product">
            <xsl:variable name="var:v45" select="string(s0:Quantity/text())" />
            <xsl:variable name="var:v46" select="userCSharp:StringSize($var:v45)" />
            <xsl:variable name="var:v47" select="userCSharp:LogicalGt(string($var:v46) , &quot;0&quot;)" />
            <xsl:if test="string($var:v47)='true'">
              <xsl:variable name="var:v48" select="s0:Quantity/text()" />
              <xsl:variable name="var:v49" select="userCSharp:ConvertWithoutRounding(string($var:v48))" />
              <xsl:variable name="var:v50" select="userCSharp:AddToCumulativeSum(0,string($var:v49),&quot;1000&quot;)" />
            </xsl:if>
          </xsl:for-each>
          <xsl:variable name="var:v51" select="userCSharp:GetCumulativeSum(0)" />
          <xsl:attribute name="total_order_quantity">
            <xsl:value-of select="$var:v51" />
          </xsl:attribute>
        </ns0:Summary>
      </xsl:if>
    </ns0:ORDER>
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


public string InitCumulativeSum(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeSumArray.Count)
		{
			int i = myCumulativeSumArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeSumArray.Add("");
			}
		}
		else
		{
			myCumulativeSumArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeSumArray = new System.Collections.ArrayList();

public string AddToCumulativeSum(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
}
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		if (myCumulativeSumArray[index] == "")
		{
			myCumulativeSumArray[index] = d;
		}
		else
		{
			myCumulativeSumArray[index] = (double)(myCumulativeSumArray[index]) + d;
		}
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
}

public string GetCumulativeSum(int index)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
}

public float ConvertWithoutRoundingDiv(string Param)
{
string[] stringArray;
float retFloat;
stringArray = Param.Split('.');
Param = stringArray[0];
retFloat = float.Parse(Param);
retFloat = retFloat / 1000; 
 return retFloat;
}

public float ConvertWithoutRounding(string Param)
{
string[] stringArray;
float retFloat;
stringArray = Param.Split('.');
Param = stringArray[0];
retFloat = float.Parse(Param);
 return retFloat;
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


public string StringConcat(string param0)
{
 return param0;
}


public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}


int i = 0;
public int MyConcat(bool row)
{
	if (row)
		i++;
	return i;
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