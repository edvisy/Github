<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:msxsl="urn:schemas-microsoft-com:xslt"
				xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
				exclude-result-prefixes="msxsl var s0 userCSharp"
				version="1.0" xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE"
				xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"
				xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">
    <xsl:variable name="var:vDeliveryId" select="./Detail[1]/DeliveryID/text()" />
    <xsl:variable name="var:vDeliveryDate" select="./Detail[1]/DeliveryDate/text()" />
    <xsl:variable name="var:vCustomerABN" select="'43076651959'" />
    <xsl:variable name="var:vCustomerName" select="'SANOFI'" />
    
    <xsl:variable name="var:vSupplierABN" select="'58005787913'" />
    <xsl:variable name="var:vSupplierName" select="'VISYBOARD'" />

    <!--<xsl:variable name="var:vVendorCode" select="'100280401'" />-->
    <xsl:variable name="var:vCurrency" select="userCSharp:StringConcat(&quot;AUD&quot;)" />
    <xsl:variable name="var:vItemCount" select="count(/s0:INVOICE/Detail)" />   
    <xsl:variable name="var:vInvoiceAmount" select="userCSharp:MathRound(string(Header/InvoiceAmount) , &quot;2&quot;)" />    
    <xsl:variable name="var:vInvoiceTotal" select="userCSharp:MathRound(string(Header/InvoiceTotal) , &quot;2&quot;)" />   
    <xsl:variable name="var:vInvoiceGST" select="userCSharp:MathRound(string(Header/InvoiceGST) , &quot;2&quot;)" />
    <xsl:variable name="var:vPONumber" select="userCSharp:GetPONumberRFF(string(Detail[1]/PurchaseOrderNumber/text()))" />
    <ns0:EFACT_D01B_INVOIC_EAN011_V2>
      <UNH>
        <UNH1>
          <xsl:value-of select="'0001'" />
        </UNH1>
        <UNH2>
          <UNH2.1>
            <xsl:value-of select="'INVOIC'" />
          </UNH2.1>
          <UNH2.2>
            <xsl:value-of select="'D'" />
          </UNH2.2>
          <UNH2.3>
            <xsl:value-of select="'01B'" />
          </UNH2.3>
          <UNH2.4>
            <xsl:value-of select="'UN'" />
          </UNH2.4>
          <UNH2.5>
            <xsl:value-of select="'EAN011'" />
          </UNH2.5>
        </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'380'" />
          </C00201>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="Header/InvoiceNumber/text()" />
          </C10601>
        </ns0:C106>
      </ns0:BGM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'171'" />
          </C50701>
          <C50702>
            <xsl:value-of select="Header/InvoiceDate/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>
      <ns0:PAI>
        <ns0:C534>
          <C53403>
            <xsl:value-of select="'42'" />
          </C53403>
        </ns0:C534>
      </ns0:PAI>
      <xsl:if test="'ON'"> 
        <xsl:variable name="var:v16" select="''" />
        <xsl:variable name="var:v17" select="userCSharp:StringSize(string($var:v16))" />
        <xsl:variable name="var:v18" select="userCSharp:LogicalGt(string($var:v17) , &quot;0&quot;)" />
        <ns0:RFFLoop1>
          <ns0:RFF>
            <ns0:C506>
              <C50601>
                <xsl:value-of select="'ON'" />
              </C50601>
              <C50602>
                <xsl:value-of select="$var:vPONumber" />
              </C50602>
            </ns0:C506>
          </ns0:RFF>
          <xsl:if test="$var:v18">
            <ns0:DTM_2>
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="$var:v16" />
                </C50701>
                <C50702>
                  <xsl:value-of select="$var:v16" />
                </C50702>
                <C50703>
                  <xsl:value-of select="$var:v16" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
          </xsl:if>
        </ns0:RFFLoop1>
      </xsl:if>
      <xsl:if test="'DQ'">      
        <xsl:variable name="var:v20" select="$var:vDeliveryId" />
        <xsl:variable name="var:v21" select="'171'" />
        <xsl:variable name="var:v22" select="userCSharp:StringSize(string($var:v21))" />
        <xsl:variable name="var:v23" select="userCSharp:LogicalGt(string($var:v22) , &quot;0&quot;)" />
        <ns0:RFFLoop1>
          <ns0:RFF>
            <ns0:C506>
              <C50601>
                <xsl:value-of select="'DQ'" />
              </C50601>
              <C50602>
                <xsl:value-of select="$var:v20" />
              </C50602>
            </ns0:C506>
          </ns0:RFF>
          <xsl:if test="$var:v23">           
            <ns0:DTM_2>
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="'171'" />
                </C50701>
                <C50702>
                  <xsl:value-of select="$var:vDeliveryDate" />
                </C50702>
                <C50703>
                  <xsl:value-of select="'102'" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
          </xsl:if>
        </ns0:RFFLoop1>
      </xsl:if>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>BY</NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="$var:vCustomerName" />
            </C08201>
            <C08203>9</C08203>
          </ns0:C082>
          <xsl:variable name="var:v44" select="Header/CompanyCode" />
          <xsl:variable name="var:v45" select="userCSharp:StringSize(string($var:v44))" />
          <xsl:variable name="var:v46" select="userCSharp:LogicalGt(string($var:v45) , &quot;0&quot;)" />
          <xsl:if test="$var:v46">
            <ns0:C058>
              <xsl:variable name="var:v48" select="Header/CompanyCode" />
              <C05801>
                <xsl:value-of select="$var:v48" />
              </C05801>
              <C05802>
                <xsl:value-of select="userCSharp:StringLeft(string(Header/CompanyName/text()), &quot;35&quot;)" />
              </C05802>
            </ns0:C058>
          </xsl:if>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>VA</C50601>
              <C50602>
                <xsl:value-of select="$var:vCustomerABN"/>
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>SU</NAD01>
          <ns0:C082>
            <C08201><xsl:value-of select="$var:vSupplierName"/></C08201>
            <C08203>ZZZ</C08203>
          </ns0:C082>
          <xsl:variable name="var:v71" select="userCSharp:StringSize(string(userCSharp:StringLeft(string(Header/SupplierAddressee/text()) , &quot;35&quot;)))" />
          <xsl:variable name="var:v72" select="userCSharp:LogicalGt(string($var:v71) , &quot;0&quot;)" />
          <xsl:if test="$var:v72">
            <ns0:C058>
              <C05801>
                <xsl:value-of select="userCSharp:StringLeft(string(Header/SupplierAddressee/text()) , &quot;35&quot;)" />
              </C05801>
              <C05802>
                <xsl:value-of select="userCSharp:StringLeft(string(Header/SupplierStreet1/text()) , &quot;35&quot;)" />
              </C05802>
            </ns0:C058>
          </xsl:if>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>VA</C50601>
              <C50602><xsl:value-of select="$var:vSupplierABN"/></C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>
        <!--<ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>ZZZ</C50601>
              <C50602>
                <xsl:value-of select="$var:vVendorCode" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>-->
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'ST'" />
          </NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="'WE'" />
            </C08201>
            <C08202>
              <xsl:value-of select="'106'" />
            </C08202>
          </ns0:C082>
          <ns0:C080>
            <C08001>
              <xsl:value-of select="userCSharp:StringLeft(string(Header/DeliveryAddressee/text()), &quot;35&quot;)" />
            </C08001>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="userCSharp:StringLeft(string(Header/DeliveryStreet1/text()), &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="string(Header/DeliveryCity/text())" />
          </NAD06>
          <ns0:C819>
            <C81901>
              <xsl:value-of select="string(Header/DeliveryState/text())" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="string(Header/DeliveryPostCode/text())" />
          </NAD08>
          <NAD09>
            <xsl:value-of select="'AU'" />
          </NAD09>
        </ns0:NAD>
      </ns0:NADLoop1>
      <ns0:CUXLoop1>
        <ns0:CUX>
          <ns0:C504>
            <C50401>
              <xsl:value-of select="'2'" />
            </C50401>
            <C50402>
              <xsl:value-of select="$var:vCurrency" />
            </C50402>
            <C50403>
              <xsl:value-of select="'4'" />
            </C50403>
          </ns0:C504>
        </ns0:CUX>
      </ns0:CUXLoop1>
      <ns0:PATLoop1>
        <ns0:PAT>
          <PAT01>
            <xsl:value-of select="'1'" />
          </PAT01>
          <ns0:C112>
            <C11201>
              <xsl:value-of select="'5'" />
            </C11201>
            <C11202>
              <xsl:value-of select="'3'" />
            </C11202>
            <C11203>
              <xsl:value-of select="'M'" />
            </C11203>
            <C11204>
              <xsl:value-of select="'1'" />
            </C11204>
          </ns0:C112>
        </ns0:PAT>
      </ns0:PATLoop1>
      <xsl:for-each select="Detail">       
        <xsl:variable name="var:vInvoiceLineTotal" select="userCSharp:MathRound(string(InvoiceLineTotal), &quot;2&quot;)" />
        <xsl:variable name="var:vInvoiceLineGST" select="userCSharp:MathRound(string(InvoiceLineGST) , &quot;2&quot;)" />       
        <xsl:variable name="var:vUnitPrice" select="userCSharp:MathRound(string(UnitPrice/text()) , &quot;6&quot;)" />  
        <ns0:LINLoop1>
          <ns0:LIN>
            <LIN01>
              <xsl:value-of select="InvoiceLineNumber/text()" />
            </LIN01>
            <ns0:C212>
              <xsl:if test="ProductCode/text()">
                <C21201>
                  <xsl:value-of select="ProductCode/text()" />
                </C21201>
              </xsl:if>
              <xsl:if test="not(string(ProductCode/text()))">
                <C21201>
                  <xsl:value-of select="SundryItemCode/text()" />
                </C21201>
              </xsl:if>
              <xsl:if test="ProductCode/text()">
                <C21202>
                  <xsl:value-of select="'BP'" />
                </C21202>
              </xsl:if>
              <xsl:if test="not(string(ProductCode/text()))">
                <C21202>
                  <xsl:value-of select="'VN'" />
                </C21202>
              </xsl:if>
            </ns0:C212>
          </ns0:LIN>
          <ns0:IMD>
            <IMD01>
              <xsl:value-of select="'F'" />
            </IMD01>
            <ns0:C273>
              <C27305>
                <xsl:value-of select="ItemDescription/text()" />
              </C27305>
            </ns0:C273>
          </ns0:IMD>
          <ns0:QTY_2>
            <ns0:C186_2>
              <xsl:if test="ProductCode/text()">
                <C18601>
                  <xsl:value-of select="'47'" />
                </C18601>
              </xsl:if>
              <xsl:if test="not(string(ProductCode/text()))">
                <C18601>
                  <xsl:value-of select="'2'" />
                </C18601>
              </xsl:if>
              <C18602>
                <xsl:value-of select="Quantity/text()" />
              </C18602>
              <C18603>
                <xsl:value-of select="UnitOfMeasurement/text()" />
              </C18603>
            </ns0:C186_2>
          </ns0:QTY_2>
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>               
                <C51601>
                  <xsl:value-of select="'203'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:vInvoiceLineTotal" />
                </C51602>
              </ns0:C516_5>
            </ns0:MOA_5>
          </ns0:MOALoop2>
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>              
                <C51601>
                  <xsl:value-of select="'369'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:vInvoiceLineGST" />
                </C51602>
              </ns0:C516_5>
            </ns0:MOA_5>
          </ns0:MOALoop2>
          <ns0:PRILoop1>
            <ns0:PRI>
              <ns0:C509>
                <C50901>
                  <xsl:value-of select="'AAA'" />
                </C50901>
                <C50902>
                  <xsl:value-of select="$var:vUnitPrice" />
                </C50902>
                <C50903>
                  <xsl:value-of select="'PE'" />
                </C50903>
              </ns0:C509>
            </ns0:PRI>
          </ns0:PRILoop1>
          <ns0:RFFLoop3>
            <ns0:RFF_3>
              <ns0:C506_3>
                <C50601>
                  <xsl:value-of select="'ON'" />
                </C50601>                
                <C50602>
                  <xsl:value-of select="$var:vPONumber" />
                </C50602>
                <C50603>
                  <xsl:value-of select="PurchaseOrderLineNumber/text()" />
                </C50603>
              </ns0:C506_3>
            </ns0:RFF_3>
          </ns0:RFFLoop3>
          <ns0:TAXLoop3>
            <ns0:TAX_3>
              <TAX01>
                <xsl:value-of select="'7'" />
              </TAX01>
              <ns0:C241_3>
                <C24101>
                  <xsl:value-of select="'GST'" />
                </C24101>
              </ns0:C241_3>
              <ns0:C243_3>
                <C24304>
                  <xsl:value-of select="'10'" />
                </C24304>
              </ns0:C243_3>
            </ns0:TAX_3>
          </ns0:TAXLoop3>
        </ns0:LINLoop1>
      </xsl:for-each>
      <ns0:UNS>
        <UNS01>
          <xsl:value-of select="'S'" />
        </UNS01>
      </ns0:UNS>
      <ns0:CNT>
        <ns0:C270>
          <C27001>
            <xsl:value-of select="'4'" />
          </C27001>
          <C27002>
            <xsl:value-of select="$var:vItemCount" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>            
            <C51601>
              <xsl:value-of select="'79'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vInvoiceAmount" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>           
            <C51601>
              <xsl:value-of select="'128'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vInvoiceTotal" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>           
            <C51601>
              <xsl:value-of select="'176'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vInvoiceGST" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
    </ns0:EFACT_D01B_INVOIC_EAN011_V2>
  </xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


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


public bool LogicalNot(string val)
{
	return !ValToBool(val);
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

public string GetPONumberRFF(string poNumber)
{
	 string outPO = poNumber;
            if (poNumber.Contains("/")) {
                outPO = poNumber.Split('/')[1];
            }

            if (poNumber.Contains("-"))
            {
                outPO = poNumber.Split('-')[1].Length > poNumber.Split('-')[0].Length ? poNumber.Split('-')[1] : poNumber.Split('-')[0];
            }

            return outPO;
}
public string GetPONumberLT(string poNumber)
{
	 string outPO = poNumber;
            if (poNumber.Contains("/")) {
                outPO = poNumber.Split('/')[1];
            }

            if (poNumber.Contains("-"))
            {
                outPO = poNumber.Split('-')[1].Length > poNumber.Split('-')[0].Length ? poNumber.Split('-')[1] : poNumber.Split('-')[0];
            }

            return outPO;
}
]]>
  </msxsl:script>
</xsl:stylesheet>