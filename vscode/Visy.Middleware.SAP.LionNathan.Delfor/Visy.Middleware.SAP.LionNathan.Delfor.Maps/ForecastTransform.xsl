<?xml version="1.0" encoding="utf-16" ?>
<xsl:stylesheet 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
                xmlns:ns1="http://Visy.Middleware.SAP.LionNathan.Delfor.Schemas.ForecastEnvelope" 
                xmlns:ns0="http://Visy.Middleware.SAP.LionNathan.Delfor.Schemas.Forecast" version="1.0" 
                exclude-result-prefixes="msxsl var s0 userCSharp" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:EFACT_D01B_DELFOR_EAN004" />
  </xsl:template>
  <xsl:template match="/s0:EFACT_D01B_DELFOR_EAN004">
    <ns1:ForecastEnvelope>
      <xsl:for-each select="s0:GISLoop1">
        <xsl:variable name="var:v1" select="../s0:DTM[1]/s0:C507[1]/C50702/text()" />
        <xsl:variable name="var:v2" select="../s0:DTM[2]/s0:C507[1]/C50702/text()" />
        <xsl:variable name="var:v3" select="userCSharp:StringSize(string($var:v2))" />
        <xsl:variable name="var:v4" select="userCSharp:LogicalGt(string($var:v3) , &quot;0&quot;)" />
        <xsl:variable name="var:v5" select="userCSharp:LogicalNot(string($var:v4))" />
        <xsl:variable name="var:v10" select="../s0:NADLoop1[2]/s0:NAD[1]/s0:C082[1]/C08201/text()" />
        <xsl:variable name="var:v12" select="string(s0:NADLoop2/s0:NAD_2/s0:C082_2/C08201/text())" />
        <ns0:Forecast>
          <Header>
            <xsl:if test="../s0:BGM/s0:C106/C10601">
              <xsl:attribute name="PurchaseOrder">
                <xsl:value-of select="../s0:BGM/s0:C106/C10601/text()" />
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="DocumentDate">
              <xsl:value-of select="$var:v1" />
            </xsl:attribute>
            <xsl:if test="string($var:v5)='true'">
              <xsl:variable name="var:v6" select="&quot;NIL&quot;" />
              <xsl:attribute name="FromPeriod">
                <xsl:value-of select="$var:v6" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="string($var:v4)='true'">
              <xsl:variable name="var:v7" select="userCSharp:StringLeft(string($var:v2) , &quot;8&quot;)" />
              <xsl:attribute name="FromPeriod">
                <xsl:value-of select="$var:v7" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="string($var:v5)='true'">
              <xsl:variable name="var:v8" select="&quot;NIL&quot;" />
              <xsl:attribute name="ToPeriod">
                <xsl:value-of select="$var:v8" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="string($var:v4)='true'">
              <xsl:variable name="var:v9" select="userCSharp:StringRight(string($var:v2) , &quot;8&quot;)" />
              <xsl:attribute name="ToPeriod">
                <xsl:value-of select="$var:v9" />
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="BuyerCode">
              <xsl:value-of select="$var:v10" />
            </xsl:attribute>
            <xsl:variable name="var:v11" select="userCSharp:GetVisyBuyer(string(s0:NADLoop2/s0:NAD_2/s0:C082_2/C08201/text()))" />
            <xsl:attribute name="VisyBuyerCode">
              <xsl:value-of select="$var:v11" />
            </xsl:attribute>
            <xsl:attribute name="SupplierCode">
              <xsl:value-of select="s0:NADLoop2/s0:NAD_2/s0:C082_2/C08201/text()" />
            </xsl:attribute>
            <xsl:variable name="var:v13" select="userCSharp:GetVisySupplier($var:v12)" />
            <xsl:attribute name="VisySupplierCode">
              <xsl:value-of select="$var:v13" />
            </xsl:attribute>
          </Header>
          <xsl:for-each select="s0:LINLoop1">
            <xsl:variable name="var:v14" select="./s0:RFFLoop4[1]/s0:RFF_4[1]/s0:C506_4[1]/C50602/text()" />
            <xsl:variable name="var:v15" select="userCSharp:StringSize(string($var:v14))" />
            <xsl:variable name="var:v16" select="userCSharp:LogicalGt(string($var:v15) , &quot;0&quot;)" />
            <xsl:variable name="var:v17" select="userCSharp:LogicalNot(string($var:v16))" />
            <xsl:variable name="var:v19" select="./s0:RFFLoop4[2]/s0:RFF_4[1]/s0:C506_4[1]/C50602/text()" />
            <xsl:variable name="var:v20" select="userCSharp:StringSize(string($var:v19))" />
            <xsl:variable name="var:v21" select="userCSharp:LogicalGt(string($var:v20) , &quot;0&quot;)" />
            <xsl:variable name="var:v22" select="userCSharp:LogicalNot(string($var:v21))" />
            <xsl:variable name="var:v24" select="./s0:RFFLoop4[2]/s0:DTM_9[1]/s0:C507_9[1]/C50702/text()" />
            <xsl:variable name="var:v25" select="userCSharp:StringSize(string($var:v24))" />
            <xsl:variable name="var:v26" select="userCSharp:LogicalGt(string($var:v25) , &quot;0&quot;)" />
            <xsl:variable name="var:v27" select="userCSharp:LogicalNot(string($var:v26))" />
            <xsl:variable name="var:v29" select="./s0:RFFLoop4[3]/s0:RFF_4[1]/s0:C506_4[1]/C50602/text()" />
            <xsl:variable name="var:v30" select="userCSharp:StringSize(string($var:v29))" />
            <xsl:variable name="var:v31" select="userCSharp:LogicalGt(string($var:v30) , &quot;0&quot;)" />
            <xsl:variable name="var:v32" select="userCSharp:LogicalNot(string($var:v31))" />
            <xsl:variable name="var:v34" select="./s0:RFFLoop4[3]/s0:DTM_9[1]/s0:C507_9[1]/C50702/text()" />
            <xsl:variable name="var:v35" select="userCSharp:StringSize(string($var:v34))" />
            <xsl:variable name="var:v36" select="userCSharp:LogicalGt(string($var:v35) , &quot;0&quot;)" />
            <xsl:variable name="var:v37" select="userCSharp:LogicalNot(string($var:v36))" />
            <xsl:variable name="var:v39" select="./s0:FTX_3[1]/s0:C108_3[1]/C10802/text()" />
            <xsl:variable name="var:v40" select="userCSharp:StringSize(string($var:v39))" />
            <xsl:variable name="var:v41" select="userCSharp:LogicalGt(string($var:v40) , &quot;0&quot;)" />
            <xsl:variable name="var:v42" select="userCSharp:LogicalNot(string($var:v41))" />
            <xsl:variable name="var:v44" select="./s0:FTX_3[2]/s0:C108_3[1]/C10802/text()" />
            <xsl:variable name="var:v45" select="userCSharp:StringSize(string($var:v44))" />
            <xsl:variable name="var:v46" select="userCSharp:LogicalGt(string($var:v45) , &quot;0&quot;)" />
            <xsl:variable name="var:v47" select="userCSharp:LogicalNot(string($var:v46))" />
            <Details>
              <xsl:if test="s0:LIN/LIN01">
                <xsl:attribute name="LineNo">
                  <xsl:value-of select="s0:LIN/LIN01/text()" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="s0:LIN/s0:C212/C21201">
                <xsl:attribute name="Material">
                  <xsl:value-of select="s0:LIN/s0:C212/C21201/text()" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="s0:IMD/s0:C273/C27304">
                <xsl:attribute name="MaterialDescription">
                  <xsl:value-of select="s0:IMD/s0:C273/C27304/text()" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v16)='true'">
                <xsl:attribute name="BlanketOrderNo">
                  <xsl:value-of select="$var:v14" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v17)='true'">
                <xsl:variable name="var:v18" select="&quot;NIL&quot;" />
                <xsl:attribute name="BlanketOrderNo">
                  <xsl:value-of select="$var:v18" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v21)='true'">
                <xsl:attribute name="CustomerRef">
                  <xsl:value-of select="$var:v19" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v22)='true'">
                <xsl:variable name="var:v23" select="&quot;NIL&quot;" />
                <xsl:attribute name="CustomerRef">
                  <xsl:value-of select="$var:v23" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v26)='true'">
                <xsl:attribute name="CustomerRefPeriod">
                  <xsl:value-of select="$var:v24" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v27)='true'">
                <xsl:variable name="var:v28" select="&quot;NIL&quot;" />
                <xsl:attribute name="CustomerRefPeriod">
                  <xsl:value-of select="$var:v28" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v31)='true'">
                <xsl:attribute name="PrincipalRef">
                  <xsl:value-of select="$var:v29" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v32)='true'">
                <xsl:variable name="var:v33" select="&quot;NIL&quot;" />
                <xsl:attribute name="PrincipalRef">
                  <xsl:value-of select="$var:v33" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v36)='true'">
                <xsl:attribute name="PrincipalRefPeriod">
                  <xsl:value-of select="$var:v34" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v37)='true'">
                <xsl:variable name="var:v38" select="&quot;NIL&quot;" />
                <xsl:attribute name="PrincipalRefPeriod">
                  <xsl:value-of select="$var:v38" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v41)='true'">
                <xsl:attribute name="PriorCumQuantity">
                  <xsl:value-of select="$var:v39" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v42)='true'">
                <xsl:variable name="var:v43" select="&quot;NIL&quot;" />
                <xsl:attribute name="PriorCumQuantity">
                  <xsl:value-of select="$var:v43" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v46)='true'">
                <xsl:attribute name="PriorPastNet">
                  <xsl:value-of select="$var:v44" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v47)='true'">
                <xsl:variable name="var:v48" select="&quot;NIL&quot;" />
                <xsl:attribute name="PriorPastNet">
                  <xsl:value-of select="$var:v48" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v31)='true'">
                <xsl:attribute name="RawQuantity">
                  <xsl:value-of select="$var:v29" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v32)='true'">
                <xsl:variable name="var:v49" select="&quot;NIL&quot;" />
                <xsl:attribute name="RawQuantity">
                  <xsl:value-of select="$var:v49" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v21)='true'">
                <xsl:attribute name="FabricQuantity">
                  <xsl:value-of select="$var:v19" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v22)='true'">
                <xsl:variable name="var:v50" select="&quot;NIL&quot;" />
                <xsl:attribute name="FabricQuantity">
                  <xsl:value-of select="$var:v50" />
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="DeliveryPoint">
                <xsl:value-of select="../s0:NADLoop2/s0:NAD_2/s0:C082_2/C08201/text()" />
              </xsl:attribute>
              <xsl:variable name="var:v51" select="userCSharp:GetVisyBuyer(string(../s0:NADLoop2/s0:NAD_2/s0:C082_2/C08201/text()))" />
              <xsl:attribute name="VisyShipTo">
                <xsl:value-of select="$var:v51" />
              </xsl:attribute>
              <xsl:for-each select="s0:SCCLoop1">
                <xsl:variable name="var:v52" select="userCSharp:LogicalEq(string(s0:SCC/s0:C329/C32901/text()) , &quot;M&quot;)" />
                <xsl:variable name="var:v54" select="string(s0:SCC/s0:C329/C32901/text())" />
                <xsl:variable name="var:v55" select="userCSharp:LogicalEq($var:v54 , &quot;W&quot;)" />
                <xsl:variable name="var:v57" select="userCSharp:LogicalEq($var:v54 , &quot;Y&quot;)" />
                <xsl:variable name="var:v59" select="userCSharp:LogicalEq(string(s0:SCC/SCC01/text()) , &quot;4&quot;)" />
                <xsl:variable name="var:v60" select="userCSharp:LogicalNot(string($var:v59))" />
                <Schedules>
                  <xsl:attribute name="Quantity">
                    <xsl:value-of select="s0:QTYLoop2/s0:QTY_2/s0:C186_2/C18602/text()" />
                  </xsl:attribute>
                  <xsl:if test="s0:QTYLoop2/s0:DTM_13/s0:C507_13/C50702">
                    <xsl:attribute name="Date">
                      <xsl:value-of select="s0:QTYLoop2/s0:DTM_13/s0:C507_13/C50702/text()" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="string($var:v52)='true'">
                    <xsl:variable name="var:v53" select="&quot;MONTHLY&quot;" />
                    <xsl:attribute name="Bucket">
                      <xsl:value-of select="$var:v53" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="string($var:v55)='true'">
                    <xsl:variable name="var:v56" select="&quot;WEEKLY&quot;" />
                    <xsl:attribute name="Bucket">
                      <xsl:value-of select="$var:v56" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="string($var:v57)='true'">
                    <xsl:variable name="var:v58" select="&quot;DAILY&quot;" />
                    <xsl:attribute name="Bucket">
                      <xsl:value-of select="$var:v58" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="string($var:v60)='true'">
                    <xsl:variable name="var:v61" select="&quot;FIRM&quot;" />
                    <xsl:attribute name="DeliveryPlan">
                      <xsl:value-of select="$var:v61" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="string($var:v59)='true'">
                    <xsl:variable name="var:v62" select="&quot;PLAN&quot;" />
                    <xsl:attribute name="DeliveryPlan">
                      <xsl:value-of select="$var:v62" />
                    </xsl:attribute>
                  </xsl:if>
                </Schedules>
              </xsl:for-each>
            </Details>
          </xsl:for-each>
        </ns0:Forecast>
      </xsl:for-each>
    </ns1:ForecastEnvelope>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
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


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string StringRight(string str, string count)
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
				retval = str.Substring(str.Length-i);
			}
			else
			{
				retval = str;
			}
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


public string GetVisyBuyer(string param) 
{ 
    switch(param) 
    { 
       case "AX01" : return "12626"; 
       case "AT01" : return "15617"; 
       case "AA01" : return "15828"; 
       case "ABOS" : return "17232"; 
       case "AS01" : return "17455"; 
       case "AG01" : return "239489";
       case "AM01" : return "267517"; 
       case "AB01" : return "17232"; 
    }; 
    return ""; 
}

public string GetVisySupplier(string param) 
{ 
    switch(param) 
    { 
       case "AX01" : return "2136"; 
       case "AT01" : return "2114"; 
       case "AA01" : return "2113"; 
       case "ABOS" : return "2113"; 
       case "AS01" : return "2113"; 
       case "AG01" : return "2113"; 
       case "AM01" : return "2113"; 
       case "AB01" : return "2113"; 
    }; 
    return ""; 
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