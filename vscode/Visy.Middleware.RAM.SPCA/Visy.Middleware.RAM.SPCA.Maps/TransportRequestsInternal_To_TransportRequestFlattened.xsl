<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 s1 userCSharp" version="1.0" 
                xmlns:s0="http://Visy.Middleware.RAM.SPCA.Schemas.TransportRequestInternal" 
                xmlns:s1="http://Visy.Middleware.RAM.SPCA.Schemas.TransportRequestsInternal" 
  xmlns:ns0="http://Visy.Middleware.RAM.SPCA.Schemas.TransportRequestMulti" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:TransportRequests" />
  </xsl:template>
  <xsl:template match="/s1:TransportRequests">
    <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)" />
    <xsl:for-each select="/s1:TransportRequests/s0:TransportRequest">
      <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(Pallets/text()),string(./text()))" />
    </xsl:for-each>
    <xsl:variable name="var:v3" select="userCSharp:GetCumulativeSum(0)" />

    <xsl:variable name="var:v4" select="userCSharp:InitCumulativeSum(1)" />
    <xsl:for-each select="/s1:TransportRequests/s0:TransportRequest">
      <xsl:variable name="var:v5" select="userCSharp:AddToCumulativeSum(1,string(PalletSpaces/text()),string(./text()))" />
    </xsl:for-each>
    <xsl:variable name="var:v6" select="userCSharp:GetCumulativeSum(1)" />

    <xsl:variable name="var:v7" select="userCSharp:InitCumulativeSum(2)" />
    <xsl:for-each select="/s1:TransportRequests/s0:TransportRequest">
      <xsl:variable name="var:v8" select="userCSharp:AddToCumulativeSum(2,string(Weight/text()),string(./text()))" />
    </xsl:for-each>
    <xsl:variable name="var:v9" select="userCSharp:GetCumulativeSum(2)" />

    <xsl:variable name="var:v10" select="userCSharp:InitCumulativeConcat(0)" />
    <xsl:for-each select="/s1:TransportRequests/s0:TransportRequest">
      <xsl:variable name="var:v11" select="userCSharp:AddToCumulativeConcat(0,userCSharp:StringConcat(string(OrderNo/text()) , ','),string(./text()))" />
    </xsl:for-each>    
    <xsl:variable name="var:v12" select="userCSharp:GetCumulativeConcat(0)" />    
    <xsl:variable name="var:v13" select="userCSharp:StringSize(string($var:v12))" />
    <xsl:variable name="var:v14" select="userCSharp:MathSubtract(string($var:v13) , &quot;1&quot;)" />    
    <xsl:variable name="var:v15" select="userCSharp:StringSubstring($var:v12 , &quot;1&quot; , string($var:v14))" />
    
    <xsl:variable name="var:v16" select="userCSharp:StringSubstring(string(s0:TransportRequest/ShipToAdd4/text()) , &quot;1&quot; , &quot;1&quot;)" />
    
    <xsl:variable name="var:v17" select="userCSharp:LogicalEq(string($var:v16) , &quot;0&quot;)" />
    <xsl:variable name="var:v19" select="userCSharp:LogicalEq(string($var:v16) , &quot;6&quot;)" />
    <xsl:variable name="var:v21" select="userCSharp:LogicalEq(string($var:v16) , &quot;7&quot;)" />

    <!--Check if the post code belongs to WA,NT or TAS-->
    <xsl:variable name="var:v31" select="userCSharp:LogicalOr(string($var:v17) , string($var:v19) , string($var:v21))" />
    
    <xsl:variable name="var:v23" select="userCSharp:LogicalNe(string($var:v16) , &quot;0&quot;)" />
    <xsl:variable name="var:v24" select="userCSharp:LogicalNe(string($var:v16) , &quot;6&quot;)" />
    <xsl:variable name="var:v25" select="userCSharp:LogicalNe(string($var:v16) , &quot;7&quot;)" />

    <!--Check if the post code does not belong to WA,NT or TAS-->
    <xsl:variable name="var:v26" select="userCSharp:LogicalAnd(string($var:v23) , string($var:v24) , string($var:v25))" />
    
    <!--Take the count of transport requests-->
    <xsl:variable name="var:v28" select="count(/s1:TransportRequests/s0:TransportRequest)" />
    
    <!--Check if there is only one transport request. Eligible for direct mapping of Required Date-->
    <xsl:variable name="var:v29" select="userCSharp:LogicalEq(string($var:v28) , &quot;1&quot;)" />

    <!--Check if there are more than one transport requests. Add 1 to collect date and map to required date if the post code does not belong to WA,NT or TAS-->
    <xsl:variable name="var:v30" select="userCSharp:LogicalGt(string($var:v28) , &quot;1&quot;)" />

    <!--Add one day to collect date-->
    <xsl:variable name="var:v32" select="userCSharp:LogicalAnd(string($var:v30) , string($var:v31))" />
    
    <xsl:variable name="var:v33" select="userCSharp:LogicalAnd(string($var:v26) , string($var:v30))" />
    <!--Direct mapping-->    
    <xsl:variable name="var:v34" select="userCSharp:LogicalOr(string($var:v33) , string($var:v29))" />
    

    <ns0:Request>
      <TransportRequest>
        <RequestNumber>
          <xsl:value-of select="s0:TransportRequest/RequestNumber/text()" />
        </RequestNumber>
        <TruckLoadNo>
          <xsl:value-of select="s0:TransportRequest/TruckLoadNo/text()" />
        </TruckLoadNo>
        <PurchaseOrder>
          <xsl:value-of select="s0:TransportRequest/PurchaseOrder/text()" />
        </PurchaseOrder>
        <ShipFromCode>
          <xsl:value-of select="s0:TransportRequest/ShipFromCode/text()" />
        </ShipFromCode>
        <ShipFromAdd1>
          <xsl:value-of select="s0:TransportRequest/ShipFromAdd1/text()" />
        </ShipFromAdd1>
        <ShipFromAdd2>
          <xsl:value-of select="s0:TransportRequest/ShipFromAdd2/text()" />
        </ShipFromAdd2>
        <ShipFromAdd3>
          <xsl:value-of select="s0:TransportRequest/ShipFromAdd3/text()" />
        </ShipFromAdd3>
        <ShipFromAdd4>
          <xsl:value-of select="s0:TransportRequest/ShipFromAdd4/text()" />
        </ShipFromAdd4>
        <xsl:if test="string($var:v17)='true'">
          <xsl:variable name="var:v18" select="&quot;FC0347&quot;" />
          <ShipToCode>
            <xsl:value-of select="$var:v18" />
          </ShipToCode>
        </xsl:if>
        <xsl:if test="string($var:v19)='true'">
          <xsl:variable name="var:v20" select="&quot;FC0194&quot;" />
          <ShipToCode>
            <xsl:value-of select="$var:v20" />
          </ShipToCode>
        </xsl:if>
        <xsl:if test="string($var:v21)='true'">
          <xsl:variable name="var:v22" select="&quot;FC0542&quot;" />
          <ShipToCode>
            <xsl:value-of select="$var:v22" />
          </ShipToCode>
        </xsl:if>
        <xsl:if test="string($var:v26)='true'">
          <xsl:variable name="var:v27" select="s0:TransportRequest/ShipToCode/text()" />
          <ShipToCode>
            <xsl:value-of select="$var:v27" />
          </ShipToCode>
        </xsl:if>
        <ShipToAdd1>
          <xsl:value-of select="s0:TransportRequest/ShipToAdd1/text()" />
        </ShipToAdd1>
        <ShipToAdd2>
          <xsl:value-of select="s0:TransportRequest/ShipToAdd2/text()" />
        </ShipToAdd2>
        <ShipToAdd3>
          <xsl:value-of select="s0:TransportRequest/ShipToAdd3/text()" />
        </ShipToAdd3>
        <ShipToAdd4>
          <xsl:value-of select="s0:TransportRequest/ShipToAdd4/text()" />
        </ShipToAdd4>
        <CollectDate>
          <xsl:value-of select="s0:TransportRequest/CollectDate/text()" />
        </CollectDate>
        <CollectTime>
          <xsl:value-of select="s0:TransportRequest/CollectTime/text()" />
        </CollectTime>
        <xsl:if test="string($var:v34)='true'">
          <xsl:variable name="var:v35" select="s0:TransportRequest/RequiredDate/text()" />
           <RequiredDate>
            <xsl:value-of select="$var:v35" />
          </RequiredDate>
        </xsl:if>
        <xsl:if test="string($var:v32)='true'">
          <xsl:variable name="var:v36" select="userCSharp:addDay(string(s0:TransportRequest/CollectDate/text()))" />
           <RequiredDate>
            <xsl:value-of select="$var:v36" />
          </RequiredDate>
        </xsl:if>
        <RequiredTime>
        <xsl:value-of select="s0:TransportRequest/RequiredTime/text()" />
        </RequiredTime>
        <ItemNo>
          <xsl:value-of select="s0:TransportRequest/ItemNo/text()" />
        </ItemNo>
        <OrderNo>
          <xsl:value-of select="$var:v15" />
        </OrderNo>
        <QtyOrdered>
          <xsl:value-of select="s0:TransportRequest/QtyOrdered/text()" />
        </QtyOrdered>        
        <Pallets>
          <xsl:value-of select="$var:v3" />
        </Pallets>        
        <PalletSpaces>
          <xsl:value-of select="$var:v6" />
        </PalletSpaces>       
        <Weight>
          <xsl:value-of select="$var:v9" />
        </Weight>
        <TopLoad>
          <xsl:value-of select="s0:TransportRequest/TopLoad/text()" />
        </TopLoad>
        <Comments>
          <xsl:value-of select="s0:TransportRequest/Comments/text()" />
        </Comments>
        <ChargeAccount>
          <xsl:value-of select="s0:TransportRequest/ChargeAccount/text()" />
        </ChargeAccount>
      </TransportRequest>     
    </ns0:Request>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
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

public string InitCumulativeConcat(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeConcatArray.Count)
		{
			int i = myCumulativeConcatArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeConcatArray.Add("");
			}
		}
		else
		{
			myCumulativeConcatArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeConcatArray = new System.Collections.ArrayList();

public string AddToCumulativeConcat(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	myCumulativeConcatArray[index] = (string)(myCumulativeConcatArray[index]) + val;
	return myCumulativeConcatArray[index].ToString();
}

public string GetCumulativeConcat(int index)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	return myCumulativeConcatArray[index].ToString();
}

public string StringConcat(string param0, string param1)
{
   return param0 + param1;
}

public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
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


public string MathSubtract(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	bool first = true;
	foreach (string obj in listValues)
	{
		if (first)
		{
			first = false;
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret = d;
			}
			else
			{
				return "";
			}
		}
		else
		{
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret -= d;
			}
			else
			{
				return "";
			}
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
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


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
}


public bool LogicalAnd(string param0, string param1, string param2)
{
	return ValToBool(param0) && ValToBool(param1) && ValToBool(param2);
	return false;
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

public bool LogicalOr(string param0, string param1, string param2)
{
	return ValToBool(param0) || ValToBool(param1) || ValToBool(param2);
	return false;
}

public bool LogicalOr(string param0, string param1)
{
	return ValToBool(param0) || ValToBool(param1);
	return false;
}

public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
}


// Add a day to Collect Date and assign to Required Date
  public string addDay(string collectDate)
  {
DateTime s1= DateTime.ParseExact(collectDate,"ddMMyy",System.Globalization.CultureInfo.InvariantCulture);

       string requiredDate = s1.AddDays(1).ToString("ddMMyy",System.Globalization.CultureInfo.InvariantCulture) ;

      return requiredDate;

  }


]]></msxsl:script>
</xsl:stylesheet>