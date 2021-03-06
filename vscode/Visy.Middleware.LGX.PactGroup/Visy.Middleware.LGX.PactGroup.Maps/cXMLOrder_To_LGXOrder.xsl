<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s2 s3 s1 userCSharp ScriptNS0 ScriptNS1" 
                version="1.0" xmlns:s2="http://tempuri.org/cXML_1.2.031" 
                xmlns:s3="uri:xades" 
                xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER"                 
                xmlns:s1="uri:ds" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s2:cXML" />
  </xsl:template>
  <xsl:template match="/s2:cXML">
    <ns0:ORDER>
      <xsl:for-each select="s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo">        
        <xsl:variable name="var:vCustomerEAN" select="userCSharp:StringConcat(&quot;9399999002029&quot;)" />
        <xsl:variable name="var:vOrderDate" select="userCSharp:FormatDate(string(../@orderDate))" />
        <xsl:variable name="var:vCustomerName" select="userCSharp:StringConcat(&quot;PactGroup&quot;)" />       
        <ns0:Header>
          <xsl:attribute name="order_type">
            <xsl:value-of select="'N'" />
          </xsl:attribute>
          <xsl:attribute name="application_code">
            <xsl:value-of select="'EDI'" />
          </xsl:attribute>
          <xsl:attribute name="customer_ean">
            <xsl:value-of select="$var:vCustomerEAN" />
          </xsl:attribute>
          <xsl:attribute name="customer_code">
            <xsl:value-of select="ScriptNS0:GetCustomerCode(string(s2:Address/@addressID) , &quot;LGX.PactGroup.CustomerCode&quot;)" />
          </xsl:attribute>
          <xsl:attribute name="purchase_order_number">
            <xsl:value-of select="../@orderID" />
          </xsl:attribute>        
          <xsl:attribute name="purchase_order_date">
            <xsl:value-of select="$var:vOrderDate" />
          </xsl:attribute>    
          <xsl:attribute name="purchase_order_time">
            <xsl:value-of select="userCSharp:FormatTime(string(../@orderDate))" />
          </xsl:attribute>
          <xsl:attribute name="customer_name">
            <xsl:value-of select="$var:vCustomerName" />
          </xsl:attribute>
          <xsl:variable name="var:v9" select="userCSharp:GetGUID()" />
          <xsl:attribute name="biztalk_id">
            <xsl:value-of select="$var:v9" />
          </xsl:attribute>
          <xsl:attribute name="acknowledge_document">
            <xsl:value-of select="'AC'" />
          </xsl:attribute>
        </ns0:Header>
      </xsl:for-each>
      <xsl:for-each select="s2:Request/s2:OrderRequest/s2:ItemOut">       
        <xsl:variable name="var:vUOM" select="userCSharp:StringUpperCase(string(s2:ItemDetail/s2:UnitOfMeasure/text()))" />
        <xsl:variable name="var:v13" select="userCSharp:LogicalEq(string($var:vUOM) , &quot;EA&quot;)" />
        <xsl:variable name="var:v16" select="userCSharp:LogicalNot(string($var:v13))" />
        <xsl:variable name="var:v18" select="userCSharp:StringConcat(&quot;TH&quot;)" />
        
        <ns0:Detail>
          <xsl:attribute name="line_indicator">
            <xsl:value-of select="'N'" />
          </xsl:attribute>
          <xsl:if test="@lineNumber">
            <xsl:attribute name="line_number">
              <xsl:value-of select="@lineNumber" />
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="product_code">
            <xsl:value-of select="s2:ItemID/s2:SupplierPartID/text()" />
          </xsl:attribute>
          <xsl:if test="string($var:v13)='true'">
            <xsl:variable name="var:v14" select="@quantity" />
            <xsl:variable name="var:v15" select="userCSharp:MathDivide(string($var:v14) , &quot;1000&quot;)" />
            <xsl:attribute name="quantity">
              <xsl:value-of select="$var:v15" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v16)='true'">
            <xsl:variable name="var:v17" select="@quantity" />
            <xsl:attribute name="quantity">
              <xsl:value-of select="$var:v17" />
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="unit_of_measure">
            <xsl:value-of select="$var:vUOM" />
          </xsl:attribute>
          <xsl:attribute name="price_excluding_tax">
            <xsl:value-of select="number(s2:ItemDetail/s2:UnitPrice/s2:Money/text()) * 1000" />
          </xsl:attribute>
          <xsl:variable name="var:v19" select="userCSharp:FormatDate(string(@requestedDeliveryDate))" />
          <xsl:attribute name="delivery_date">
            <xsl:value-of select="$var:v19" />
          </xsl:attribute>
          <xsl:variable name="var:v21" select="userCSharp:FormatTime(string(@requestedDeliveryDate))" />
          <xsl:attribute name="delivery_time">
            <xsl:value-of select="$var:v21" />
          </xsl:attribute>
          <xsl:if test="../s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID">
            <xsl:attribute name="warehouse_code">
              <xsl:value-of select="../s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID" />
            </xsl:attribute>
          </xsl:if>
        </ns0:Detail>
      </xsl:for-each>
      <ns0:Summary>       
        <xsl:variable name="var:notEA" select="sum(s2:Request/s2:OrderRequest/s2:ItemOut/@quantity[//s2:ItemDetail/s2:UnitOfMeasure/text()!='EA'])"></xsl:variable>
        <!--<xsl:variable name="var:EA" select="sum(s2:Request/s2:OrderRequest/s2:ItemOut/@quantity[//s2:ItemDetail/s2:UnitOfMeasure/text()='EA'])"></xsl:variable>-->       
       
        <xsl:attribute name="total_order_quantity">
          <xsl:call-template name="sum">
            <xsl:with-param name="node" select="s2:Request/s2:OrderRequest/s2:ItemOut"/>
          </xsl:call-template>
          <!--<xsl:value-of select="number($var:EA) div 1000 +  number($var:notEA) * 1000" />-->
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
  </xsl:template>
  <xsl:template name="sum">
    <xsl:param name="node"/>
    <xsl:param name="sum" select="0"/>
    <xsl:choose>
      <xsl:when test="$node">
        <xsl:call-template name="sum">
          <xsl:with-param name="node" select="$node/following-sibling::s2:ItemOut[1]"/>
          <xsl:with-param name="sum" select="$sum + translate($node/@quantity, ',', '')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$sum"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


//START SCRIPT: Generate GUID
public string GetGUID()
{
     return System.Guid.NewGuid().ToString();
}
//END SCRIPT

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


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string StringUpperCase(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.ToUpper(System.Globalization.CultureInfo.InvariantCulture);
}


public string MathMultiply(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 1;
	bool first = true;
	foreach (string obj in listValues)
	{
		double d = 0;
		if (IsNumeric(obj, ref d))
		{
			if (first)
			{
				first = false;
				ret = d;
			}
			else
			{
				ret *= d;
			}
		}
		else
		{
			return "";
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
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

 public string FormatDate(string dateString)
      {
	      return DateTime.ParseExact(dateString, "yyyy-MM-ddTHH:mm:ssZ", null).ToString("yyyyMMdd");                                                
      }

 public string FormatTime(string dateString)
      {
	      return DateTime.ParseExact(dateString, "yyyy-MM-ddTHH:mm:ssZ", null).ToString("HH:mm:ss");                                                
      }
]]></msxsl:script>
</xsl:stylesheet>