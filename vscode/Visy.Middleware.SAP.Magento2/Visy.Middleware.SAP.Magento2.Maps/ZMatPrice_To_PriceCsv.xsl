<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s2 s1 s0 userCSharp" version="1.0" xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" xmlns:ns0="http://Visy.Middleware.SAP.Magento2.Schemas.PricingCsv" xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZMATPRICE01//740" xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZMATPRICE01//740/Receive" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <ns0:Pricing>
      <Header>
        <customer_code>
          <xsl:text>customer_code</xsl:text>
        </customer_code>
        <product_sku>
          <xsl:text>product_sku</xsl:text>
        </product_sku>
        <qty_1>
          <xsl:text>qty_1</xsl:text>
        </qty_1>
        <price_1>
          <xsl:text>price_1</xsl:text>
        </price_1>
        <qty_2>
          <xsl:text>qty_2</xsl:text>
        </qty_2>
        <price_2>
          <xsl:text>price_2</xsl:text>
        </price_2>
        <qty_3>
          <xsl:text>qty_3</xsl:text>
        </qty_3>
        <price_3>
          <xsl:text>price_3</xsl:text>
        </price_3>
        <qty_4>
          <xsl:text>qty_4</xsl:text>
        </qty_4>
        <price_4>
          <xsl:text>price_4</xsl:text>
        </price_4>
        <qty_5>
          <xsl:text>qty_5</xsl:text>
        </qty_5>
        <price_5>
          <xsl:text>price_5</xsl:text>
        </price_5>
        <qty_6>
          <xsl:text>qty_6</xsl:text>
        </qty_6>
        <price_6>
          <xsl:text>price_6</xsl:text>
        </price_6>
        <qty_7>
          <xsl:text>qty_7</xsl:text>
        </qty_7>
        <price_7>
          <xsl:text>price_7</xsl:text>
        </price_7>
        <qty_8>
          <xsl:text>qty_8</xsl:text>
        </qty_8>
        <price_8>
          <xsl:text>price_8</xsl:text>
        </price_8>
        <qty_9>
          <xsl:text>qty_9</xsl:text>
        </qty_9>
        <price_9>
          <xsl:text>price_9</xsl:text>
        </price_9>
        <qty_10>
          <xsl:text>qty_10</xsl:text>
        </qty_10>
        <price_10>
          <xsl:text>price_10</xsl:text>
        </price_10>
      </Header>
      <xsl:for-each select="s1:idocData">
        <xsl:for-each select="s0:ZMATPRI000GRP">
          <xsl:variable name="var:v1" select="userCSharp:StringTrimLeft(string(s0:ZMATPRI000/s0:KUNNR/text()))" />
          <xsl:variable name="var:v2" select="userCSharp:StringTrimRight(string($var:v1))" />
          <xsl:variable name="var:v3" select="userCSharp:StringTrimLeft(string(s0:ZMATPRI000/s0:MATNR/text()))" />
          <xsl:variable name="var:v4" select="userCSharp:StringTrimRight(string($var:v3))" />
          <xsl:variable name="var:v5" select="./s0:ZMSCALE000[1]/s0:KSTBM/text()" />
          <xsl:variable name="var:v6" select="userCSharp:StringTrimLeft(string($var:v5))" />
          <xsl:variable name="var:v7" select="userCSharp:StringTrimRight(string($var:v6))" />
          <xsl:variable name="var:v8" select="./s0:ZMSCALE000[1]/s0:KBETR/text()" />
          <xsl:variable name="var:v9" select="userCSharp:StringTrimLeft(string($var:v8))" />
          <xsl:variable name="var:v10" select="userCSharp:StringTrimRight(string($var:v9))" />
          <xsl:variable name="var:v11" select="userCSharp:StringTrimRight(string(s0:ZMATPRI000/s0:KPEIN/text()))" />
          <xsl:variable name="var:v12" select="userCSharp:StringTrimLeft(string($var:v11))" />
          <xsl:variable name="var:v13" select="userCSharp:MathDivide(string($var:v10) , string($var:v12))" />
          <xsl:variable name="var:v22" select="./s0:ZMSCALE000[2]/s0:KSTBM/text()" />
          <xsl:variable name="var:v23" select="userCSharp:StringTrimLeft(string($var:v22))" />
          <xsl:variable name="var:v24" select="userCSharp:StringTrimRight(string($var:v23))" />
          <xsl:variable name="var:v25" select="./s0:ZMSCALE000[2]/s0:KBETR/text()" />
          <xsl:variable name="var:v26" select="userCSharp:StringTrimLeft(string($var:v25))" />
          <xsl:variable name="var:v27" select="userCSharp:StringTrimRight(string($var:v26))" />          
          <xsl:variable name="var:vKPEIN" select="normalize-space(string(s0:ZMATPRI000/s0:KPEIN/text()))" />
          <xsl:variable name="var:v31" select="userCSharp:MathDivide(string($var:v27) , string($var:vKPEIN))" />
          <xsl:variable name="var:v32" select="./s0:ZMSCALE000[3]/s0:KSTBM/text()" />
          <xsl:variable name="var:v33" select="userCSharp:StringTrimLeft(string($var:v32))" />
          <xsl:variable name="var:v34" select="userCSharp:StringTrimRight(string($var:v33))" />
          <xsl:variable name="var:v35" select="./s0:ZMSCALE000[3]/s0:KBETR/text()" />
          <xsl:variable name="var:v36" select="userCSharp:StringTrimLeft(string($var:v35))" />
          <xsl:variable name="var:v37" select="userCSharp:StringTrimRight(string($var:v36))" />
          <xsl:variable name="var:v38" select="userCSharp:MathDivide(string($var:v37) , string($var:vKPEIN))" />
          <xsl:variable name="var:v39" select="./s0:ZMSCALE000[4]/s0:KSTBM/text()" />
          <xsl:variable name="var:v40" select="userCSharp:StringTrimLeft(string($var:v39))" />
          <xsl:variable name="var:v41" select="userCSharp:StringTrimRight(string($var:v40))" />
          <xsl:variable name="var:v42" select="./s0:ZMSCALE000[4]/s0:KBETR/text()" />
          <xsl:variable name="var:v43" select="userCSharp:StringTrimLeft(string($var:v42))" />
          <xsl:variable name="var:v44" select="userCSharp:StringTrimRight(string($var:v43))" />
          <xsl:variable name="var:v45" select="userCSharp:MathDivide(string($var:v44) , string($var:vKPEIN))" />
          <xsl:variable name="var:v46" select="./s0:ZMSCALE000[5]/s0:KSTBM/text()" />
          <xsl:variable name="var:v47" select="userCSharp:StringTrimLeft(string($var:v46))" />
          <xsl:variable name="var:v48" select="userCSharp:StringTrimRight(string($var:v47))" />
          <xsl:variable name="var:v49" select="./s0:ZMSCALE000[5]/s0:KBETR/text()" />
          <xsl:variable name="var:v50" select="userCSharp:StringTrimLeft(string($var:v49))" />
          <xsl:variable name="var:v51" select="userCSharp:StringTrimRight(string($var:v50))" />
          <xsl:variable name="var:v52" select="userCSharp:MathDivide(string($var:v51) , string($var:vKPEIN))" />
          <xsl:variable name="var:v53" select="./s0:ZMSCALE000[6]/s0:KSTBM/text()" />
          <xsl:variable name="var:v54" select="userCSharp:StringTrimLeft(string($var:v53))" />
          <xsl:variable name="var:v55" select="userCSharp:StringTrimRight(string($var:v54))" />
          <xsl:variable name="var:v56" select="./s0:ZMSCALE000[6]/s0:KBETR/text()" />
          <xsl:variable name="var:v57" select="userCSharp:StringTrimLeft(string($var:v56))" />
          <xsl:variable name="var:v58" select="userCSharp:StringTrimRight(string($var:v57))" />
          <xsl:variable name="var:v59" select="userCSharp:MathDivide(string($var:v58) , string($var:vKPEIN))" />
          <xsl:variable name="var:v60" select="./s0:ZMSCALE000[7]/s0:KSTBM/text()" />
          <xsl:variable name="var:v61" select="userCSharp:StringTrimLeft(string($var:v60))" />
          <xsl:variable name="var:v62" select="userCSharp:StringTrimRight(string($var:v61))" />
          <xsl:variable name="var:v63" select="./s0:ZMSCALE000[7]/s0:KBETR/text()" />
          <xsl:variable name="var:v64" select="userCSharp:StringTrimLeft(string($var:v63))" />
          <xsl:variable name="var:v65" select="userCSharp:StringTrimRight(string($var:v64))" />
          <xsl:variable name="var:v66" select="userCSharp:MathDivide(string($var:v65) , string($var:vKPEIN))" />
          <xsl:variable name="var:v67" select="./s0:ZMSCALE000[8]/s0:KSTBM/text()" />
          <xsl:variable name="var:v68" select="userCSharp:StringTrimLeft(string($var:v67))" />
          <xsl:variable name="var:v69" select="userCSharp:StringTrimRight(string($var:v68))" />
          <xsl:variable name="var:v70" select="./s0:ZMSCALE000[8]/s0:KBETR/text()" />
          <xsl:variable name="var:v71" select="userCSharp:StringTrimLeft(string($var:v70))" />
          <xsl:variable name="var:v72" select="userCSharp:StringTrimRight(string($var:v71))" />
          <xsl:variable name="var:v73" select="userCSharp:MathDivide(string($var:v72) , string($var:vKPEIN))" />
          <xsl:variable name="var:v74" select="./s0:ZMSCALE000[9]/s0:KSTBM/text()" />
          <xsl:variable name="var:v75" select="userCSharp:StringTrimLeft(string($var:v74))" />
          <xsl:variable name="var:v76" select="userCSharp:StringTrimRight(string($var:v75))" />
          <xsl:variable name="var:v77" select="./s0:ZMSCALE000[9]/s0:KBETR/text()" />
          <xsl:variable name="var:v78" select="userCSharp:StringTrimLeft(string($var:v77))" />
          <xsl:variable name="var:v79" select="userCSharp:StringTrimRight(string($var:v78))" />
          <xsl:variable name="var:v80" select="userCSharp:MathDivide(string($var:v79) , string($var:vKPEIN))" />
          <xsl:variable name="var:v81" select="./s0:ZMSCALE000[10]/s0:KSTBM/text()" />
          <xsl:variable name="var:v82" select="userCSharp:StringTrimLeft(string($var:v81))" />
          <xsl:variable name="var:v83" select="userCSharp:StringTrimRight(string($var:v82))" />
          <xsl:variable name="var:v84" select="./s0:ZMSCALE000[10]/s0:KBETR/text()" />
          <xsl:variable name="var:v85" select="userCSharp:StringTrimLeft(string($var:v84))" />
          <xsl:variable name="var:v86" select="userCSharp:StringTrimRight(string($var:v85))" />
          <xsl:variable name="var:v87" select="userCSharp:MathDivide(string($var:v86) , string($var:vKPEIN))" />
          <Details>
            <customer_code>
              <xsl:value-of select="$var:v2" />
            </customer_code>
            <product_sku>
              <xsl:value-of select="$var:v4" />
            </product_sku>
           
            <xsl:variable name="var:scaleCnt" select ="count(./s0:ZMSCALE000)"></xsl:variable>
            <xsl:variable name="var:vBasePrice" select="userCSharp:MathDivide(string(normalize-space(s0:ZMATPRI000/s0:KBETR)), string(normalize-space(s0:ZMATPRI000/s0:KPEIN)))" />
            <xsl:choose>
              <xsl:when  test="$var:scaleCnt = 0">
                <qty_1>
                  <xsl:value-of select="'0.00'" />
                </qty_1>
                <price_1>
                  <xsl:value-of select="$var:vBasePrice" />
                </price_1>
                
              </xsl:when>
              <xsl:otherwise>
                <qty_1>
                  <xsl:value-of select="$var:v7" />
                </qty_1>
                <price_1>
                  <xsl:value-of select="$var:v13" />
                </price_1>
              </xsl:otherwise>
            </xsl:choose>
           
            <qty_2>
              <xsl:value-of select="$var:v24" />
            </qty_2>
            <price_2>
              <xsl:value-of select="$var:v31" />
            </price_2>
            <qty_3>
              <xsl:value-of select="$var:v34" />
            </qty_3>
            <price_3>
              <xsl:value-of select="$var:v38" />
            </price_3>
            <qty_4>
              <xsl:value-of select="$var:v41" />
            </qty_4>
            <price_4>
              <xsl:value-of select="$var:v45" />
            </price_4>
            <qty_5>
              <xsl:value-of select="$var:v48" />
            </qty_5>
            <price_5>
              <xsl:value-of select="$var:v52" />
            </price_5>
            <qty_6>
              <xsl:value-of select="$var:v55" />
            </qty_6>
            <price_6>
              <xsl:value-of select="$var:v59" />
            </price_6>
            <qty_7>
              <xsl:value-of select="$var:v62" />
            </qty_7>
            <price_7>
              <xsl:value-of select="$var:v66" />
            </price_7>
            <qty_8>
              <xsl:value-of select="$var:v69" />
            </qty_8>
            <price_8>
              <xsl:value-of select="$var:v73" />
            </price_8>
            <qty_9>
              <xsl:value-of select="$var:v76" />
            </qty_9>
            <price_9>
              <xsl:value-of select="$var:v80" />
            </price_9>
            <qty_10>
              <xsl:value-of select="$var:v83" />
            </qty_10>
            <price_10>
              <xsl:value-of select="$var:v87" />
            </price_10>
          </Details>
        </xsl:for-each>
      </xsl:for-each>
    </ns0:Pricing>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
}


public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
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


]]>
  </msxsl:script>
</xsl:stylesheet>