<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0"
                xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" 
                xmlns:s0="http://Visy.Middleware.LGX.TegelFoods.Schemas.OrderEnvelope"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Orders" />
  </xsl:template>
  <xsl:template match="/s0:Orders">

    <xsl:variable name="varPONumber">
      <xsl:value-of select="//Order[2]/PONr"/>
    </xsl:variable>

    <xsl:variable name="varPODate">
      <xsl:value-of select="//Order[2]/OrderDate"/>
    </xsl:variable>

    <xsl:variable name="var:v18" select="userCSharp:InitCumulativeSum(0)" />
    <xsl:for-each select="Order">
      <xsl:variable name="var:v19" select="userCSharp:AddToCumulativeSum(0,string(OrderQty/text()),&quot;1&quot;)" />
    </xsl:for-each>
    <xsl:variable name="var:v20" select="userCSharp:GetCumulativeSum(0)" />
    <xsl:variable name="var:v21" select="userCSharp:MathRound(string($var:v20) , &quot;2&quot;)" />


    <ns0:ORDER>
      <ns0:Header>
        <xsl:attribute name="order_type">
          <xsl:value-of select="'N'" />
        </xsl:attribute>
        <xsl:attribute name="application_code">
          <xsl:value-of select="'EDI'" />
        </xsl:attribute>
        <xsl:attribute name="customer_ean">
          <xsl:value-of select="'9399999002159'" />
        </xsl:attribute>
        <xsl:attribute name="customer_code">
          <xsl:value-of select="'T205'" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_number">
          <xsl:value-of select="$varPONumber" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_date">
          <xsl:value-of select="$varPODate" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_time">
          <xsl:value-of select="userCSharp:DateCurrentTime()" />
        </xsl:attribute>
        <xsl:attribute name="customer_name">
          <xsl:value-of select="'TegalFoods'" />
        </xsl:attribute>
        <xsl:attribute name="biztalk_id">
          <xsl:value-of select="userCSharp:GetGUID()" />
        </xsl:attribute>
        <xsl:attribute name="acknowledge_document">
          <xsl:value-of select="'AC'" />
        </xsl:attribute>
      </ns0:Header>
      <xsl:for-each select="Order">
        <xsl:if test="position() &gt; 1">
          <xsl:variable name="varQuantity">
            <xsl:value-of select="userCSharp:GetQuantity(OrderQty/text() , '1000')"/>
          </xsl:variable>
          <xsl:variable name="varWareHouseCode">
            <xsl:value-of select="userCSharp:GetWareHouseCode(Address1/text() , 12)"/>
          </xsl:variable>

          <ns0:Detail>
            <xsl:attribute name="line_indicator">
              <xsl:value-of select="'N'" />
            </xsl:attribute>
            <xsl:attribute name="line_number">
              <xsl:value-of select="position()-1" />
            </xsl:attribute>
            <xsl:attribute name="product_code">
              <xsl:value-of select="ItemNr/text()" />
            </xsl:attribute>
            <xsl:attribute name="quantity">
              <xsl:value-of select="$varQuantity" />
            </xsl:attribute>
            <xsl:attribute name="unit_of_measure">
              <xsl:value-of select="'TH'" />
            </xsl:attribute>
            <xsl:attribute name="delivery_date">
              <xsl:value-of select="DelDate/text()" />
            </xsl:attribute>
            <xsl:attribute name="delivery_time">
              <xsl:value-of select="'0000'" />
            </xsl:attribute>
            <xsl:attribute name="warehouse_code">
              <xsl:value-of select="$varWareHouseCode" />
            </xsl:attribute>
          </ns0:Detail>
        </xsl:if>
      </xsl:for-each>
      <ns0:Summary>

        <xsl:attribute name="total_order_quantity">
          <xsl:value-of select="$var:v21" />
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[

public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}

public string GetWareHouseCode(string str, int count)
        {
            str = str.Replace("\"", "");
            return str.Substring(0,count);
        }

public static double GetQuantity(double str, double count)
        {
            return Math.Round(str / count, 2);
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

//START SCRIPT: Generate GUID
public string GetGUID()
{
     return System.Guid.NewGuid().ToString();
}
//END SCRIPT

]]>
  </msxsl:script>
</xsl:stylesheet>