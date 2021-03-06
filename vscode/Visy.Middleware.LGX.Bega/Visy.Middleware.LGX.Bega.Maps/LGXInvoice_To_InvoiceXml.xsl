<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 ScriptNS0 userCSharp" version="1.0" xmlns:ns0="https://Visy.Middleware.LGX.Bega.Schemas.Invoice" xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;TAX INVOICE&quot;)" />
    <xsl:variable name="var:v3" select="string(Header/CompanyCode/text())" />
    <xsl:variable name="var:v7" select="./Detail[1]/PurchaseOrderNumber/text()" />
    <xsl:variable name="var:taxCodeH" select="userCSharp:StringConcat(&quot;10&quot;)" />
    <xsl:variable name="var:v11" select="userCSharp:StringConcat(&quot;BIZTALK&quot;)" />
    <xsl:variable name="var:v12" select="userCSharp:DateCurrentDate()" />
    <ns0:Invoice>
      <ns0:InvoiceHeader>
        <xsl:variable name="var:v1" select="ScriptNS0:GetInterfaceLookupData(string(Header/CompanyCode/text()) , &quot;LGX.Bega.Outbound.Division&quot;)" />
        <ns0:DIVI>
          <xsl:value-of select="$var:v1" />
        </ns0:DIVI>
        <ns0:SINO>
          <xsl:value-of select="Header/InvoiceNumber/text()" />
        </ns0:SINO>
        <ns0:INVTYPE>
          <xsl:value-of select="$var:v2" />
        </ns0:INVTYPE>
        <xsl:variable name="var:v4" select="ScriptNS0:GetInterfaceLookupData($var:v3 , &quot;LGX.Bega.Outbound.VisyABN&quot;)" />
        <ns0:INVABN>
          <xsl:value-of select="$var:v4" />
        </ns0:INVABN>
        <xsl:variable name="var:v5" select="ScriptNS0:GetInterfaceLookupData($var:v3 , &quot;LGX.Bega.Outbound.CustomerABN&quot;)" />
        <ns0:BUYABN>
          <xsl:value-of select="$var:v5" />
        </ns0:BUYABN>
        <ns0:BUYIDN>
          <xsl:value-of select="Header/CompanyCode/text()" />
        </ns0:BUYIDN>
        <xsl:variable name="var:v6" select="ScriptNS0:GetInterfaceLookupData($var:v3 , &quot;LGX.Bega.Outbound.VendorCode&quot;)" />
        <ns0:SUNO>
          <xsl:value-of select="$var:v6" />
        </ns0:SUNO>
        <ns0:PUNO>
          <xsl:value-of select="$var:v7" />
        </ns0:PUNO>
        <ns0:INVDEL>
          <xsl:value-of select="Header/InvoiceNumber/text()" />
        </ns0:INVDEL>
        <ns0:IVDT>
          <xsl:value-of select="Header/InvoiceDate/text()" />
        </ns0:IVDT>
        <ns0:CUCD>
          <xsl:value-of select="Header/InvoiceCurrency/text()" />
        </ns0:CUCD>
        <xsl:variable name="var:v8" select="userCSharp:GetHeaderAmount(string(Header/InvoiceTotal/text()))" />
        <ns0:CUAM>
          <xsl:value-of select="$var:v8" />
        </ns0:CUAM>
        <ns0:VTCD>
          <xsl:value-of select="$var:taxCodeH" />
        </ns0:VTCD>
        <ns0:INVGST>
          <xsl:value-of select="Header/TaxPercent/text()" />
        </ns0:INVGST>
        <xsl:variable name="var:v10" select="userCSharp:GetHeaderGST(string(Header/InvoiceGST/text()))" />
        <ns0:VTA1>
          <xsl:value-of select="$var:v10" />
        </ns0:VTA1>
        <ns0:EXPUSERID>
          <xsl:value-of select="$var:v11" />
        </ns0:EXPUSERID>
        <xsl:variable name="var:v13" select="userCSharp:RemoveDashes(string($var:v12))" />
        <ns0:EXPDATE>
          <xsl:value-of select="$var:v13" />
        </ns0:EXPDATE>
      </ns0:InvoiceHeader>
      <xsl:for-each select="Detail">
        <xsl:variable name="var:taxCode" select="userCSharp:StringConcat(&quot;10&quot;)" />
        <xsl:variable name="var:productCode" select="ProductCode/text()" />
        <!--<xsl:if test="string(normalize-space($var:productCode))=''">
          <xsl:message terminate="yes">
            <xsl:value-of select="'Empty ProductCode'"/>
          </xsl:message>
        </xsl:if>-->
        <xsl:if test="string(normalize-space(PurchaseOrderNumber/text()))=''">
          <xsl:message terminate="yes">
            <xsl:value-of select="'Empty Purchase Order Number'"/>
          </xsl:message>
        </xsl:if>
        <ns0:InvoiceLineItems>
          <ns0:LNSINO>
            <xsl:value-of select="../Header/InvoiceNumber/text()" />
          </ns0:LNSINO>
          <ns0:PUNO>
            <xsl:value-of select="PurchaseOrderNumber/text()" />
          </ns0:PUNO>
          <ns0:LNINUM>
            <xsl:value-of select="InvoiceLineNumber/text()" />
          </ns0:LNINUM>
          <ns0:CUCD>
            <xsl:value-of select="../Header/InvoiceCurrency/text()" />
          </ns0:CUCD>
          <xsl:variable name="var:v14" select="userCSharp:GetLineAmount(string(InvoiceLineAmount/text()))" />
          <ns0:LNEXGT>
            <xsl:value-of select="$var:v14" />
          </ns0:LNEXGT>
          <ns0:IBVTCD>
            <xsl:value-of select="$var:taxCode" />
          </ns0:IBVTCD>
          <ns0:LNGSTP>
            <xsl:value-of select="../Header/TaxPercent/text()" />
          </ns0:LNGSTP>
          <xsl:variable name="var:v16" select="userCSharp:GetTotalGST(string(InvoiceLineGST/text()))" />
          <ns0:VTA1>
            <xsl:value-of select="$var:v16" />
          </ns0:VTA1>
          <xsl:variable name="var:v17" select="userCSharp:GetTotalAmtWithGST(string(InvoiceLineTotal/text()))" />
          <ns0:CUAM>
            <xsl:value-of select="$var:v17" />
          </ns0:CUAM>
          <ns0:LNITEM>
            <xsl:value-of select="ProductCode/text()" />
          </ns0:LNITEM>
          <ns0:LNITTX>
            <xsl:value-of select="ItemDescription/text()" />
          </ns0:LNITTX>
          <ns0:LNIQTY>
            <xsl:value-of select="Quantity/text()" />
          </ns0:LNIQTY>
          <!--<xsl:variable name="var:v18" select="userCSharp:GetUnitPrice(string(UnitPrice/text()))" />-->
          <ns0:LNITUP>
            <xsl:value-of select="UnitPrice/text()" />
          </ns0:LNITUP>
        </ns0:InvoiceLineItems>
      </xsl:for-each>
    </ns0:Invoice>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetHeaderAmount(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}

///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetHeaderGST(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}

public string DateCurrentDate()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
}


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string RemoveDashes(string str){return str.Replace("-", "");}


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetLineAmount(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}

///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetTotalGST(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}

///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetTotalAmtWithGST(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}

///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetUnitPrice(string b){

decimal a = Convert.ToDecimal(b);

return Math.Round(a, 2).ToString();
}


]]></msxsl:script>
</xsl:stylesheet>