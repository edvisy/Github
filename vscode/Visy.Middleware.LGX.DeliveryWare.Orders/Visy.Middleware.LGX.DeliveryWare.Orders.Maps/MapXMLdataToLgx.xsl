<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS1 ScriptNS2"
                version="1.0"
                xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER"
                xmlns:s0="http://Visy.ECommerce.SCHEMAS.ExcelOrder"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2">
	<xsl:output omit-xml-declaration="yes"
	            method="xml"
	            version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:ExcelOrder"/>
	</xsl:template>
	<xsl:template match="/s0:ExcelOrder">
		<xsl:variable name="var:v1"
		              select="position()"/>
		<xsl:variable name="var:v2"
		              select="userCSharp:LogicalEq(string($var:v1) , &quot;1&quot;)"/>
   
		<xsl:variable name="validation">
			<xsl:if test="normalize-space(string(s0:PurchaseOrderNumber/text()))=''">
				<xsl:text>- PO Number~</xsl:text>
			</xsl:if>
			<!--<xsl:if test="normalize-space(string(s0:CustomerNumber/text()))=''">
				<xsl:text>- Customer Code~</xsl:text>
			</xsl:if>-->
			<xsl:if test="normalize-space(string(s0:CustomerName/text()))=''">
				<xsl:text>- Customer Name~</xsl:text>
			</xsl:if>
			<xsl:if test="normalize-space(string(s0:DeliveryAddressCode/text()))=''">
				<xsl:text>- Delivery Address~</xsl:text>
			</xsl:if>
			<xsl:if test="s0:Product[normalize-space(string(s0:MaterialID/text())) = '']">
				<xsl:text>- Product Code~</xsl:text>
			</xsl:if>
			<xsl:if test="s0:Product[normalize-space(string(s0:Quantity/text())) = '']">
				<xsl:text>- Quantity~</xsl:text>
			</xsl:if>
			<xsl:if test="s0:Product[normalize-space(string(s0:DeliveryDate/text())) = '']">
				<xsl:text>- Delivery Date~</xsl:text>
			</xsl:if>
			<xsl:if test="count(s0:Product) = 0">
				<xsl:text>- Missing Line Items~</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:if test="not($validation='')">
			<xsl:message terminate="yes">
				<xsl:value-of select="$validation"/>
			</xsl:message>
		</xsl:if>
		<ns0:ORDER>
			<xsl:if test="$var:v2">
				<xsl:variable name="var:v10"
				              select="count(/s0:ExcelOrder/s0:Product)"/>
				<ns0:Header>
					<xsl:attribute name="order_type">
						<xsl:value-of select="'N'"/>
					</xsl:attribute>
					<xsl:attribute name="application_code">
						<xsl:value-of select="'EDI'"/>
					</xsl:attribute>
					<xsl:attribute name="customer_ean">
						<xsl:value-of select="normalize-space(s0:CustomerEAN/text())"/>
					</xsl:attribute>
					<xsl:attribute name="customer_code">
						<xsl:value-of select="normalize-space(s0:CustomerNumber/text())"/>
					</xsl:attribute>
					<xsl:attribute name="purchase_order_number">
						<xsl:value-of select="string(s0:PurchaseOrderNumber/text())"/>
					</xsl:attribute>      
          <xsl:attribute name="purchase_order_date">
            <xsl:value-of select="userCSharp:CheckDate(normalize-space(string(s0:PurchaseOrderDate/text())))"/>
          </xsl:attribute>       
         
					<xsl:attribute name="purchase_order_time">
						<xsl:value-of select="userCSharp:DateCurrentTime()"/>
					</xsl:attribute>
					<xsl:attribute name="customer_name">
						<xsl:value-of select="string(s0:CustomerName/text())"/>
					</xsl:attribute>
					<xsl:attribute name="biztalk_id">
						<xsl:value-of select="ScriptNS2:GetDataValue(&quot;biztalkid&quot;)"/>
					</xsl:attribute>
					<xsl:attribute name="acknowledge_document">
						<xsl:value-of select="'AC'"/>
					</xsl:attribute>
				</ns0:Header>
			</xsl:if>
			<xsl:for-each select="s0:Product">
				<xsl:variable name="var:v22"
				              select="userCSharp:StringConcat(&quot;TH&quot;)"/>
				<xsl:variable name="var:v27"
				              select="userCSharp:StringConcat(&quot;0000&quot;)"/>
				<ns0:Detail>
					<xsl:attribute name="line_indicator">
						<xsl:value-of select="'N'"/>
					</xsl:attribute>
					<xsl:attribute name="line_number">
						<xsl:value-of select="position()"/>
					</xsl:attribute>
					<xsl:attribute name="product_code">
						<xsl:value-of select="string(s0:MaterialID/text())"/>
					</xsl:attribute>
					<xsl:variable name="var:v21"
					              select="userCSharp:QtyLogic(string(s0:Quantity/text()) , string(s0:UOM/text()))"/>
					<xsl:attribute name="quantity">
						<xsl:value-of select="$var:v21"/>
					</xsl:attribute>
					<xsl:attribute name="unit_of_measure">
						<xsl:value-of select="$var:v22"/>
					</xsl:attribute>
					<xsl:variable name="var:v23"
					              select="ScriptNS1:CustomerUOM(string(../s0:CustomerEAN/text()))"/>
					<xsl:variable name="var:v24"
					              select="userCSharp:unit_Price_Factor(string($var:v23) , string(s0:UnitPrice/text()))"/>
					<xsl:variable name="var:v25"
					              select="userCSharp:MathRound(string($var:v24) , &quot;3&quot;)"/>
					<xsl:variable name="var:v26"
					              select="userCSharp:UM(string($var:v25))"/>
					<xsl:attribute name="price_excluding_tax">
						<xsl:value-of select="$var:v26"/>
					</xsl:attribute>
					<xsl:attribute name="delivery_date">
						<xsl:value-of select="s0:DeliveryDate/text()"/>
					</xsl:attribute>
					<xsl:attribute name="delivery_time">
						<xsl:value-of select="$var:v27"/>
					</xsl:attribute>
					<xsl:attribute name="warehouse_code">
						<xsl:value-of select="../s0:DeliveryAddressCode/text()"/>
					</xsl:attribute>
				</ns0:Detail>
			</xsl:for-each>
			<ns0:Summary>
				<xsl:variable name="var:v28"
				              select="userCSharp:InitCumulativeSum(0)"/>
				<xsl:for-each select="/s0:ExcelOrder/s0:Product/s0:Quantity">
					<xsl:variable name="var:v29"
					              select="userCSharp:TotQty(string(./text()) , string(../s0:UOM/text()))"/>
					<xsl:variable name="var:v30"
					              select="userCSharp:AddToCumulativeSum(0,string($var:v29),&quot;1000&quot;)"/>
				</xsl:for-each>
				<xsl:variable name="var:v31"
				              select="userCSharp:GetCumulativeSum(0)"/>
				<xsl:variable name="var:v32"
				              select="userCSharp:MathRound(string($var:v31))"/>
				<xsl:attribute name="total_order_quantity">
					<xsl:value-of select="$var:v32"/>
				</xsl:attribute>
			</ns0:Summary>
		</ns0:ORDER>
	</xsl:template>
	<msxsl:script language="C#"
	              implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


//START SCRIPT: Generate GUID
public string GetGUID()
{
     return "PDF" + System.Guid.NewGuid().ToString();
}
//END SCRIPT

public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}


public string CheckPOValue(string poNum)
{
	string error = "ERR";
if (poNum =="")
{
return error;
}

else return poNum;
}


public string MissingPO_Number(string rvalue)
{
	if (rvalue == "ERR")
{
throw new System.Exception("Purchase order missing");
}
else
            return rvalue;

}


public string CheckDate(string date)
{
	
if (date =="")
{
return System.DateTime.Now.ToString("yyyyMMdd");//"ERR";
}

else return date;
}


public string MissingPO_Date(string rvalue)
{
	if (rvalue == "ERR")
{
throw new System.Exception("Purchase order missing");
}
else
            return rvalue;

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


public string QtyLogic(decimal qty, string UOM)
        {
           if (UOM == "EA")

            {
               decimal quantity = (qty/1000);
                return Convert.ToString(quantity);            
            }

            else if (UOM == "ea")
            {
             
                decimal quantity = (qty/1000);
                return Convert.ToString(quantity);    
            }
             else if (UOM == "TH")
            {
              
                return Convert.ToString(qty);
             }
            else if (UOM == "th")
            {
            
                return Convert.ToString(qty);
            
           }

            else if (UOM == "")
            {
                UOM = "TH";
               decimal quantity = (qty/1000);
                return Convert.ToString(quantity);   
             
            

            }

            else 
            {
                
                decimal quantity = (qty/1000);
                return Convert.ToString(quantity);   
            
            }
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


public decimal TotQty(decimal qty, string UOM)
{
	 if (UOM == "ea")
            {
                return qty;
            
            }
            else if (UOM == "EA")
            {
                return qty;
            
            }

            else if (UOM == "TH")

            {
                decimal quantity = qty*1000;

                return quantity;

        }

            else if (UOM == "th")

            {
                decimal quantity = qty*1000;

                return quantity;
            }

            else
            {
                return qty;
            
            }
}



public float unit_Price_Factor(double upf, double price)
{	
 
float newPrice;

newPrice = Convert.ToSingle(upf*price);

return newPrice;

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


public string UM(string UOM)
        {
           if (UOM == "NaN")

            {
               string unitofmeasure="";
                return  unitofmeasure;           
            }

                      

            else 
            {
          
               return UOM;       

            }

          
        }

public string productCount(int count)
{
string error = "ERR";

if (count == 0)

	return error;
               else return count.ToString();

}


public string MissingProductRecord(string rvalue, string productCode)
{
	if (rvalue == "ERR")
{
throw new System.Exception("Material Code is missing");
}
else
            return productCode;

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


public string StringConcat(string param0, string param1)
{
   return param0 + param1;
}


public string CheckMaterial(string MaterialID)
{
	
if (MaterialID =="")
{
return "ERR";
}

else return MaterialID;
}


public string Missing_ProductCode(string rvalue)
{
	if (rvalue == "ERR")
{
throw new System.Exception("Purchase order missing");
}
else
            return rvalue;

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