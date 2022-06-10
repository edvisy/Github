<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s2 s3 s1 userCSharp ScriptNS0 ScriptNS1" 
                version="1.0" xmlns:s2="http://tempuri.org/cXML_1.2.031" xmlns:s3="uri:xades" 
                xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" 
                xmlns:s1="uri:ds" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s2:cXML" />
  </xsl:template>
  <xsl:template match="/s2:cXML">
    <ns0:ORDER>
      <xsl:for-each select="s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo">
        <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;N&quot;)" />
        <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;EDI&quot;)" />
        <xsl:variable name="var:vEAN" select="userCSharp:StringConcat(&quot;9399999008939&quot;)" />
        <xsl:variable name="var:vCustomerCode" select="ScriptNS0:GetCustomerCode(string(s2:Address/@addressID) , &quot;LGX.Coles.CustomerCode&quot;)" />
        
        <xsl:variable name="var:v6" select="string(../@orderDate)" />
        <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;Coles&quot;)" />
        <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;AC&quot;)" />
        <ns0:Header>
          <xsl:attribute name="order_type">
            <xsl:value-of select="$var:v1" />
          </xsl:attribute>
          <xsl:attribute name="application_code">
            <xsl:value-of select="$var:v2" />
          </xsl:attribute>
          <xsl:attribute name="customer_ean">
            <xsl:value-of select="$var:vEAN" />
          </xsl:attribute>        
          <xsl:attribute name="customer_code">
            <xsl:value-of select="$var:vCustomerCode" />
          </xsl:attribute>
          <xsl:attribute name="purchase_order_number">
            <xsl:value-of select="../@orderID" />
          </xsl:attribute>
          <xsl:variable name="var:v5" select="ScriptNS1:FormateDateNew(string(../@orderDate) , &quot;yyyyMMdd&quot;)" />
          <xsl:attribute name="purchase_order_date">
            <xsl:value-of select="$var:v5" />
          </xsl:attribute>
          <xsl:variable name="var:v7" select="ScriptNS1:FormateDateNew($var:v6 , &quot;HH:mm:ss&quot;)" />
          <xsl:attribute name="purchase_order_time">
            <xsl:value-of select="$var:v7" />
          </xsl:attribute>
          <xsl:attribute name="customer_name">
            <xsl:value-of select="$var:v8" />
          </xsl:attribute>
          <xsl:variable name="var:v9" select="userCSharp:GetGUID()" />
          <xsl:attribute name="biztalk_id">
            <xsl:value-of select="$var:v9" />
          </xsl:attribute>
          <xsl:attribute name="acknowledge_document">
            <xsl:value-of select="$var:v10" />
          </xsl:attribute>
        </ns0:Header>
      </xsl:for-each>
      <xsl:for-each select="s2:Request/s2:OrderRequest/s2:ItemOut">
        <xsl:variable name="var:v11" select="userCSharp:StringConcat(&quot;N&quot;)" />
        <xsl:variable name="var:v12" select="userCSharp:StringUpperCase(string(s2:ItemDetail/s2:UnitOfMeasure/text()))" />      
      
        <xsl:variable name="var:v18" select="userCSharp:StringConcat(&quot;TH&quot;)" />
        <xsl:variable name="var:v20" select="string(@requestedDeliveryDate)" />
        <xsl:variable name="var:vWHC" select="string(../s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID)" />
        <ns0:Detail>
          <xsl:attribute name="line_indicator">
            <xsl:value-of select="$var:v11" />
          </xsl:attribute>
          <xsl:if test="@lineNumber">
            <xsl:attribute name="line_number">
              <xsl:value-of select="@lineNumber" />
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="product_code">
            <xsl:value-of select="s2:ItemID/s2:SupplierPartID/text()" />
          </xsl:attribute>
            <xsl:attribute name="quantity">
              <xsl:value-of select="translate(@quantity, ',', '')" />
            </xsl:attribute>
        
          <xsl:attribute name="unit_of_measure">
            <xsl:value-of select="$var:v18" />
          </xsl:attribute>
          <xsl:attribute name="price_excluding_tax">
            <xsl:value-of select="translate(s2:ItemDetail/s2:UnitPrice/s2:Money/text(), ',', '')" />
          </xsl:attribute>
          <xsl:variable name="var:v19" select="ScriptNS1:FormateDateNew(string(@requestedDeliveryDate) , &quot;yyyyMMdd&quot;)" />
          <xsl:attribute name="delivery_date">
            <xsl:value-of select="$var:v19" />
          </xsl:attribute>
          <xsl:variable name="var:v21" select="ScriptNS1:FormateDateNew($var:v20 , &quot;HHmm&quot;)" />
          <xsl:attribute name="delivery_time">
            <xsl:value-of select="$var:v21" />
          </xsl:attribute>
          <xsl:if test="../s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID">
            <xsl:attribute name="warehouse_code">
              <xsl:value-of select="$var:vWHC" />
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
          <xsl:with-param name="sum" select="$sum + translate($node/@quantity, ',', '') * 1000"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$sum"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
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


]]></msxsl:script>
</xsl:stylesheet>