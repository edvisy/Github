<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" 
                version="1.0" 
                xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE" 
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">
    <xsl:variable name="var:vCurrency" select="Header/InvoiceCurrency/text()" />   
    <xsl:variable name="var:vDeliveryId" select="./Detail[1]/DeliveryID/text()" />
 
    <xsl:variable name="var:vDeliveryDate" select="userCSharp:StringConcat(string(./Detail[1]/DeliveryID/text()) , string(./Detail[1]/DeliveryTime/text()) , &quot;00&quot;)" />
    <xsl:variable name="var:vPONumber" select="./Detail[1]/PurchaseOrderNumber/text()" />    
    <xsl:variable name="var:vCompanyCode" select="string(Header/CompanyCode/text())" />   
  
  
    
    <xsl:variable name="var:vLineCount" select="count(/s0:INVOICE/Detail)" /> 
    <xsl:variable name="var:vInvoiceTotal" select="userCSharp:MathRound(string(Header/InvoiceTotal) , &quot;3&quot;)" />   
    <xsl:variable name="var:vInvoiceAmount" select="userCSharp:MathRound(string(Header/InvoiceAmount) , &quot;3&quot;)" />
    <xsl:variable name="var:vTaxableAmount" select="userCSharp:MathRound(string(Header/InvoiceGST) , &quot;3&quot;)" />
    
    <ns0:EFACT_D01B_INVOIC_EAN011_V2>
      <UNH>
        <UNH1>
          <xsl:value-of select="'001'" />
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
            <xsl:value-of select="'EAN010'" />
          </UNH2.5>
        </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'388'" />
          </C00201>
          <C00203>
            <xsl:value-of select="'9'" />
          </C00203>
          <C00204>
            <xsl:value-of select="'TAX INVOICE'" />
          </C00204>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="Header/InvoiceNumber/text()" />
          </C10601>
        </ns0:C106>
        <BGM03>
          <xsl:value-of select="'9'" />
        </BGM03>
      </ns0:BGM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'137'" />
          </C50701>          
          <C50702>
            <xsl:value-of select="string(Header/InvoiceDate/text())" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'11'" />
          </C50701>         
          <C50702>
            <xsl:value-of select="string(Header/LoadDate/text())" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>     
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'PE'" />
          </NAD01>        
          <ns0:C080>           
            <C08001>
              <xsl:value-of select="'VISY BOARD PTY LTD'" />
            </C08001>           
            <C08002>
              <xsl:value-of select="'VISYBOARD'" />
            </C08002>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="Header/SupplierStreet1" />
            </C05901>
          </ns0:C059>        
          <NAD06>
            <xsl:value-of select="Header/SupplierCity" />
          </NAD06>
          <ns0:C819>         
            <C81901>
              <xsl:value-of select="Header/SupplierState" />
            </C81901>
          </ns0:C819>       
          <NAD08>
            <xsl:value-of select="Header/SupplierPostCode" />
          </NAD08>        
          <NAD09>
            <xsl:value-of select="'AU'" />
          </NAD09>
        </ns0:NAD>
        <xsl:element name="ns0:RFFLoop2" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'AMT'" />
              </C50601>
              <C50602>
                <xsl:value-of select="'58005787913'" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
      </xsl:element>
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'IV'" />
          </NAD01>         
          <ns0:C080>
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/CompanyName) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>            
            <C08002>
              <xsl:value-of select="''" />
            </C08002>
          </ns0:C080>
          <ns0:C059> 
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/BillingStreet) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="Header/BillingCity" />
          </NAD06>
          <ns0:C819> 
            <C81901>
              <xsl:value-of select="Header/BillingState" />
            </C81901>
          </ns0:C819>          
          <NAD08>
            <xsl:value-of select="Header/BillingPostCode" />
          </NAD08>         
          <NAD09>
            <xsl:value-of select="'AU'" />
          </NAD09>
        </ns0:NAD>       
        <xsl:element name="ns0:RFFLoop2" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'VA'" />
              </C50601>
              <C50602>
                <xsl:value-of select="'30616935623'" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </xsl:element>
      </ns0:NADLoop1>      
      <ns0:NADLoop1>
        <ns0:NAD>         
          <NAD01>
            <xsl:value-of select="'ST'" />
          </NAD01>         
          <ns0:C080>        
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/CompanyName) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>
         
            <C08002>
              <xsl:value-of select="''" />
            </C08002>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/DeliveryStreet1) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>         
          <xsl:choose>
            <xsl:when test="Header/DeliveryCity[contains(text(), 'PERTH')]">
              <NAD06>
                <xsl:value-of select="'Perth'" />
              </NAD06>            
            </xsl:when>
            <xsl:otherwise>
                <NAD06>
                  <xsl:value-of select="Header/DeliveryCity" />
                </NAD06>
            </xsl:otherwise>
          </xsl:choose> 
          <ns0:C819> 
            <C81901>
              <xsl:value-of select="Header/DeliveryState" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="Header/DeliveryPostCode" />
          </NAD08>
          <NAD09>
            <xsl:value-of select="'AU'" />
          </NAD09>
        </ns0:NAD>       
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>         
          <NAD01>
            <xsl:value-of select="'RE'" />
          </NAD01>         
          <ns0:C080> 
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/CompanyName) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>      
            <C08002>
              <xsl:value-of select="''" />
            </C08002>
          </ns0:C080>
          <ns0:C059>           
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(Header/BillingStreet) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="Header/BillingCity" />
          </NAD06>
          <ns0:C819>          
            <C81901>
              <xsl:value-of select="Header/BillingState" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="Header/BillingPostCode" />
          </NAD08> 
          <NAD09>
            <xsl:value-of select="'AU'" />
          </NAD09>
        </ns0:NAD>        
      </ns0:NADLoop1>
      <ns0:TAXLoop1>
        <ns0:TAX>
          <TAX01>
            <xsl:value-of select="'7'" />
          </TAX01>
          <ns0:C241>
            <C24101>GST</C24101>
          </ns0:C241>
          <ns0:C243>
            <C24304>
              <xsl:value-of select="Header/TaxPercent/text()" />
            </C24304>
          </ns0:C243>
          <TAX06>
            <xsl:value-of select="'S'" />
          </TAX06>
        </ns0:TAX>
      </ns0:TAXLoop1>
      <ns0:CUXLoop1>
		    <ns0:CUX>
			    <ns0:C504>
				    <C50401>2</C50401>
            <C50402><xsl:value-of select="$var:vCurrency"/></C50402>
            <C50403><xsl:value-of select="'4'"/></C50403>
			    </ns0:C504>
			    <ns0:C504_2>
				    <C50401>3</C50401>
            <C50402>
                <xsl:value-of select="$var:vCurrency"/>
            </C50402>
            <C50403>10E</C50403>
			    </ns0:C504_2>       
		    </ns0:CUX>       
	    </ns0:CUXLoop1>         
      <ns0:PATLoop1>
        <ns0:PAT>
          <PAT01>
            <xsl:value-of select="'37'" />
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
              <xsl:value-of select="'2'" />
            </C11204>
          </ns0:C112>
        </ns0:PAT>
      </ns0:PATLoop1>
      <xsl:for-each select="Detail">
        <ns0:LINLoop1>
          <ns0:LIN>
            <LIN01>
              <xsl:value-of select="InvoiceLineNumber/text()" />
            </LIN01>
            <ns0:C212>
              <C21201>
                <xsl:value-of select="ProductCode/text()" />
              </C21201>
              <C21202>
                <xsl:value-of select="'BP'" />
              </C21202>
            </ns0:C212>
          </ns0:LIN>        
          <ns0:IMD>
            <IMD01>
              <xsl:value-of select="'F'" />
            </IMD01>
            <ns0:C273>
              <C27301>
                <xsl:value-of select="'GS'" />
              </C27301>
              <C27302>
                <xsl:value-of select="''" />
              </C27302>
              <C27303>
                <xsl:value-of select="''" />
              </C27303>
              <C27304>
                <xsl:value-of select="ItemDescription/text()" />
              </C27304>
            </ns0:C273>
          </ns0:IMD>
          <ns0:QTY_2>
            <ns0:C186_2>
              <C18601>
                <xsl:value-of select="'47'" />
              </C18601>
              <xsl:if test="not(Quantity)">              
                <C18602>
                  <xsl:value-of select="'0'" />
                </C18602>
              </xsl:if>
              <xsl:if test="Quantity">
                <C18602>
                  <xsl:value-of select="Quantity" />
                </C18602>
              </xsl:if>
              <C18603>
                <xsl:value-of select="'EA'" />
              </C18603>
            </ns0:C186_2>
          </ns0:QTY_2>        
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>
                <C51601>
                  <xsl:value-of select="'86'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="userCSharp:MathRound(string(InvoiceLineAmount) , &quot;3&quot;)" />
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
                  <xsl:value-of select="userCSharp:MathRound(string(UnitPrice/text()) , &quot;3&quot;)" />
                </C50902>              
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
                  <xsl:value-of select="PurchaseOrderNumber" />
                </C50602>
                <C50603>
                  <xsl:value-of select="PurchaseOrderLineNumber" />
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
                  <xsl:value-of select="number(../Header/TaxPercent/text())" />
                </C24304>
              </ns0:C243_3>
              <TAX06>
                <xsl:value-of select="'S'" />
              </TAX06>
            </ns0:TAX_3>
          </ns0:TAXLoop3>
          <!--<ns0:MOA_7 xmlns:gen203="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
            <ns0:C516_7 xmlns:gen204="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
              <C51601>124</C51601>
              <C51602>
                <xsl:value-of select="userCSharp:MathRound(string(InvoiceLineTotal) , &quot;3&quot;)"/>
              </C51602>
            </ns0:C516_7>
          </ns0:MOA_7>
          <ns0:MOA_7 xmlns:gen203="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
            <ns0:C516_7 xmlns:gen204="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
              <C51601>125</C51601>
              <C51602>
                <xsl:value-of select="userCSharp:MathRound(string(InvoiceLineAmount) , &quot;3&quot;)"/>
              </C51602>
            </ns0:C516_7>
          </ns0:MOA_7>-->
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
            <xsl:value-of select="'2'" />
          </C27001>
          <C27002>
            <xsl:value-of select="$var:vLineCount" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'86'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vInvoiceTotal" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'124'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vInvoiceAmount" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'125'" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:vTaxableAmount" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
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


public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
}


public string StringConcat(string param0, string param1)
{
   return param0 + param1;
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


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
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
	return retval.Replace("*", "-").Replace(":", "-").Replace("+", "");
}


public string SelectVisyCode(string CompanyCode)
        {
               return CompanyCode;
            
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


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
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

  <xsl:template name="CTATemplate">

    <xsl:param name="NAD" />

    <!-- NAD+RE  segment-->
    <xsl:variable name="RE" select="'RE'" />
    <xsl:if test="$NAD = $RE">
      <xsl:element name="ns0:CTALoop1" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
        <ns0:CTA>
          <CTA01>PD</CTA01>
        </ns0:CTA>
        <ns0:COM>
          <ns0:C076>
            <C07601>03 9188 8000</C07601>
            <C07602>TE</C07602>
          </ns0:C076>
        </ns0:COM>
        <ns0:COM>
          <ns0:C076>
            <C07601>03 9188 8001</C07601>
            <C07602>FX</C07602>
          </ns0:C076>
        </ns0:COM>
      </xsl:element>
    </xsl:if>

    <!-- NAD+SU segment -->
    <xsl:variable name="PE" select="'PE'" />
    <xsl:if test="$NAD = $PE">
      <xsl:element name="ns0:CTALoop1" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
        <ns0:CTA>
          <CTA01>SR</CTA01>
        </ns0:CTA>
        <ns0:COM>
          <ns0:C076>
            <C07601>03 9209 0520</C07601>
            <C07602>TE</C07602>
          </ns0:C076>
        </ns0:COM>

      </xsl:element>
    </xsl:if>

    <!-- NAD+ST segment -->
    <xsl:variable name="ST" select="'ST'" />
    <xsl:if test="$NAD = $ST">
      <xsl:element name="ns0:CTALoop1" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
        <ns0:CTA>
          <CTA01>GR</CTA01>
        </ns0:CTA>

        <ns0:COM>
          <ns0:C076>
            <C07601>02 9827 4600</C07601>
            <C07602>TE</C07602>
          </ns0:C076>
        </ns0:COM>
        <ns0:COM>
          <ns0:C076>
            <C07601>02 9827 4766</C07601>
            <C07602>FX</C07602>
          </ns0:C076>
        </ns0:COM>

      </xsl:element>
    </xsl:if>

  </xsl:template>
</xsl:stylesheet>