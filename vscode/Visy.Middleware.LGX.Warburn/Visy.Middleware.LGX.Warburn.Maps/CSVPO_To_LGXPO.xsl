<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://Visy.Middleware.LGX.Warburn.Schemas.ReceivePO_WarburnCSV" xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:CSVPO" />
  </xsl:template>
  <xsl:template match="/s0:CSVPO">
    <ns0:ORDER>
      <xsl:for-each select="CSVPO_DTL">
        <xsl:variable name="var:v1" select="position()" />
        <xsl:variable name="var:v2" select="userCSharp:LogicalEq(string($var:v1) , &quot;1&quot;)" />
        <xsl:if test="$var:v2">
          <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;N&quot;)" />
          <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;EDI&quot;)" />
          <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;9399999000469&quot;)" />
          <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;R692&quot;)" />
          <xsl:variable name="var:v8" select="userCSharp:DateCurrentTime()" />
          <xsl:variable name="var:v9" select="userCSharp:StringConcat(&quot;Waburn&quot;)" />
          <xsl:variable name="var:v11" select="userCSharp:StringConcat(&quot;AC&quot;)" />
          <ns0:Header>
            <xsl:attribute name="order_type">
              <xsl:value-of select="$var:v3" />
            </xsl:attribute>
            <xsl:attribute name="application_code">
              <xsl:value-of select="$var:v4" />
            </xsl:attribute>
            <xsl:attribute name="customer_ean">
              <xsl:value-of select="$var:v5" />
            </xsl:attribute>
            <xsl:attribute name="customer_code">
              <xsl:value-of select="$var:v6" />
            </xsl:attribute>
            <xsl:attribute name="purchase_order_number">
              <xsl:value-of select="OrderNo/text()" />
            </xsl:attribute>
            <xsl:variable name="var:v7" select="userCSharp:dateConversion(string(OrderDate/text()))" />
            <xsl:attribute name="purchase_order_date">
              <xsl:value-of select="$var:v7" />
            </xsl:attribute>
            <xsl:attribute name="purchase_order_time">
              <xsl:value-of select="$var:v8" />
            </xsl:attribute>
            <xsl:attribute name="customer_name">
              <xsl:value-of select="$var:v9" />
            </xsl:attribute>
            <xsl:variable name="var:v10" select="userCSharp:GetGUID()" />
            <xsl:attribute name="biztalk_id">
              <xsl:value-of select="$var:v10" />
            </xsl:attribute>
            <xsl:attribute name="acknowledge_document">
              <xsl:value-of select="$var:v11" />
            </xsl:attribute>
          </ns0:Header>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="CSVPO_DTL">
        <xsl:variable name="var:v12" select="position()" />
        <xsl:variable name="var:v13" select="userCSharp:removeDobleQuote(string(ProductCode/text()))" />
        <xsl:variable name="var:v14" select="userCSharp:StringSize(string($var:v13))" />
        <xsl:variable name="var:v15" select="userCSharp:LogicalGt(string($var:v14) , &quot;0&quot;)" />
        <xsl:if test="$var:v15">
          <xsl:variable name="var:v16" select="userCSharp:StringConcat(&quot;N&quot;)" />
          <xsl:variable name="var:v18" select="string(ProductCode/text())" />
          <xsl:variable name="var:v23" select="userCSharp:MathDivide(string(Qty/text()) , &quot;1000&quot;)" />
          <xsl:variable name="var:v24" select="userCSharp:MathRound(string($var:v23) , &quot;3&quot;)" />
          <xsl:variable name="var:v25" select="userCSharp:StringConcat(&quot;TH&quot;)" />
          <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;0000&quot;)" />
          <ns0:Detail>
            <xsl:attribute name="line_indicator">
              <xsl:value-of select="$var:v16" />
            </xsl:attribute>
            <xsl:variable name="var:v17" select="userCSharp:getCNT()" />
            <xsl:attribute name="line_number">
              <xsl:value-of select="$var:v17" />
            </xsl:attribute>
            <xsl:variable name="var:v19" select="userCSharp:removeDobleQuote($var:v18)" />
            <xsl:variable name="var:v20" select="userCSharp:StringSize(string($var:v19))" />
            <xsl:variable name="var:v21" select="userCSharp:LogicalGt(string($var:v20) , &quot;0&quot;)" />
            <xsl:if test="string($var:v21)='true'">
              <xsl:variable name="var:v22" select="userCSharp:removeDobleQuote($var:v18)" />
              <xsl:attribute name="product_code">
                <xsl:value-of select="$var:v22" />
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="quantity">
              <xsl:value-of select="$var:v24" />
            </xsl:attribute>
            <xsl:attribute name="unit_of_measure">
              <xsl:value-of select="$var:v25" />
            </xsl:attribute>
            <xsl:variable name="var:v26" select="userCSharp:dateConversion(string(DeliveryDate/text()))" />
            <xsl:attribute name="delivery_date">
              <xsl:value-of select="$var:v26" />
            </xsl:attribute>
            <xsl:attribute name="delivery_time">
              <xsl:value-of select="$var:v27" />
            </xsl:attribute>
            <xsl:variable name="var:v28" select="userCSharp:removeDobleQuote(string(DeliveryAddress1/text()))" />
            <xsl:variable name="var:v29" select="userCSharp:StringLeft(string($var:v28) , &quot;14&quot;)" />
            <xsl:attribute name="warehouse_code">
              <xsl:value-of select="$var:v29" />
            </xsl:attribute>
          </ns0:Detail>
        </xsl:if>
      </xsl:for-each>
      <ns0:Summary>
        <xsl:variable name="var:v30" select="userCSharp:InitCumulativeSum(0)" />
        <xsl:for-each select="/s0:CSVPO/CSVPO_DTL">
          <xsl:variable name="var:v31" select="userCSharp:AddToCumulativeSum(0,string(Qty/text()),&quot;1000&quot;)" />
        </xsl:for-each>
        <xsl:variable name="var:v32" select="userCSharp:GetCumulativeSum(0)" />
        <xsl:attribute name="total_order_quantity">
          <xsl:value-of select="$var:v32" />
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}


public string dateConversion(string currDate)

       {
           currDate = currDate.Replace("\"", "");

           System.Globalization.CultureInfo ci = System.Globalization.CultureInfo.InvariantCulture;

           DateTime convertedDate = System.DateTime.ParseExact(currDate, "dd/MM/yy", ci);

           return convertedDate.ToString("yyyyMMdd", ci);

       }

public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


//START SCRIPT: Generate GUID
public string GetGUID()
{
     return System.Guid.NewGuid().ToString();
}
//END SCRIPT

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


public string removeDobleQuote(string param1)

       {
           param1 = param1.Replace("\"", "");      
            return param1;

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

public int intCnt;
public int SetCount()
{
                intCnt = 0;
	return intCnt;
}


public string getCNT()
{
                intCnt = intCnt + 1;
	return intCnt.ToString();
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