<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" 
                version="1.0" xmlns:ns0="http://Visy.ECommerce.LGX.COMMON.SCHEMAS.ORDER" 
                xmlns:s0="http://Visy.ECommerce.T2.LGX.CREATIVE.COMMON.CREATIVE_COMMON_ORDERS_V1" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ORDER" />
  </xsl:template>
  <xsl:template match="/s0:ORDER">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;N&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;EDI&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;9399999001152&quot;)" />
    <xsl:variable name="var:v4" select="./Details[1]/OrderNo/text()" />
    <xsl:variable name="var:v6" select="userCSharp:DateCurrentTime()" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;AC&quot;)" />
    <ns0:ORDER>
      <ns0:Header>
        <xsl:attribute name="order_type">
          <xsl:value-of select="$var:v1" />
        </xsl:attribute>
        <xsl:attribute name="application_code">
          <xsl:value-of select="$var:v2" />
        </xsl:attribute>
        <xsl:attribute name="customer_ean">
          <xsl:value-of select="$var:v3" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_number">
          <xsl:value-of select="$var:v4" />
        </xsl:attribute>
        <xsl:variable name="var:v5" select="userCSharp:GetDateTime()" />
        <xsl:attribute name="purchase_order_date">
          <xsl:value-of select="$var:v5" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_time">
          <xsl:value-of select="$var:v6" />
        </xsl:attribute>
        <xsl:variable name="var:v7" select="userCSharp:GetGUID()" />
        <xsl:attribute name="biztalk_id">
          <xsl:value-of select="$var:v7" />
        </xsl:attribute>
        <xsl:attribute name="acknowledge_document">
          <xsl:value-of select="$var:v8" />
        </xsl:attribute>
      </ns0:Header>
      <xsl:for-each select="Details">
        <xsl:variable name="var:v9" select="position()" />
        <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;N&quot;)" />
        <xsl:variable name="var:v11" select="userCSharp:MathDivide(string(Qty/text()) , &quot;1000&quot;)" />
        <xsl:variable name="var:v12" select="userCSharp:StringConcat(&quot;TH&quot;)" />
        <xsl:variable name="var:v14" select="userCSharp:StringConcat(&quot;0000&quot;)" />
        <xsl:variable name="var:v15" select="userCSharp:StringLeft(string(DeliveryAddress/text()) , &quot;12&quot;)" />
        <xsl:variable name="var:v16" select="userCSharp:StringTrimRight(string($var:v15))" />
        <ns0:Detail>
          <xsl:attribute name="line_indicator">
            <xsl:value-of select="$var:v10" />
          </xsl:attribute>
          <xsl:attribute name="line_number">
            <xsl:value-of select="$var:v9" />
          </xsl:attribute>
          <xsl:attribute name="product_code">
            <xsl:value-of select="Material/text()" />
          </xsl:attribute>
          <xsl:attribute name="quantity">
            <xsl:value-of select="$var:v11" />
          </xsl:attribute>
          <xsl:attribute name="unit_of_measure">
            <xsl:value-of select="$var:v12" />
          </xsl:attribute>
          <xsl:variable name="var:v13" select="userCSharp:FormatDateFunctoid(string(DeliveryDate/text()) , &quot;en-AU&quot; , &quot;yyyyMMdd&quot;)" />
          <xsl:attribute name="delivery_date">
            <xsl:value-of select="$var:v13" />
          </xsl:attribute>
          <xsl:attribute name="delivery_time">
            <xsl:value-of select="$var:v14" />
          </xsl:attribute>
          <xsl:attribute name="warehouse_code">
            <xsl:value-of select="$var:v16" />
          </xsl:attribute>
          <xsl:attribute name="comment">
            <xsl:value-of select="Comments/text()" />
          </xsl:attribute>
        </ns0:Detail>
      </xsl:for-each>
      <ns0:Summary>
        <xsl:variable name="var:v17" select="userCSharp:InitCumulativeSum(0)" />
        <xsl:for-each select="/s0:ORDER/Details">
          <xsl:variable name="var:v18" select="userCSharp:AddToCumulativeSum(0,string(Qty/text()),&quot;1000&quot;)" />
        </xsl:for-each>
        <xsl:variable name="var:v19" select="userCSharp:GetCumulativeSum(0)" />
        <xsl:attribute name="total_order_quantity">
          <xsl:value-of select="$var:v19" />
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


//START SCIRPT: CONVERT THE INPUT DATE TO ANY DESIRED DATE FORMAT
/* This script must have 3 input parameters. The first input is the date to be converted.
    The second input is the culture of the first input string (eg. en-AU, en-US).
    The third input is the format of the desired output date (eg. yyyyMMdd). */

public string FormatDateFunctoid(String strInputValue, String strInputCulture, String strOutputFormat)
{
      System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo(strInputCulture, true);
      DateTime dt = DateTime.Parse(strInputValue, culture);
      String strOutputValue = dt.ToString(strOutputFormat);
      return strOutputValue;
}

//END SCIRPT

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


public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
}


//START SCRIPT:
public string GetDateTime()
{
      return System.DateTime.Now.ToString("yyyyMMdd");
}
//END SCRIPT

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


//START SCRIPT: Generate GUID
public string GetGUID()
{
     return System.Guid.NewGuid().ToString();
}
//END SCRIPT

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