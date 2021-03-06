<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s1 s0 userCSharp ScriptNS0 ScriptNS1" 
                version="1.0" 
                xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/PORDCR101//620/Send" 
                xmlns:s0="urn:Magento" 
                xmlns:ns3="http://schemas.microsoft.com/2003/10/Serialization/" 
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:s1="http://schemas.xmlsoap.org/soap/encoding/" 
                xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/PORDCR101//620"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:salesOrderInfoResponse" />
  </xsl:template>
  <xsl:template match="/s0:salesOrderInfoResponse">
    <xsl:variable name="var:RcvPor" select="ScriptNS1:GetLookupValue(&quot;RcvPor&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrn" select="ScriptNS1:GetLookupValue(&quot;RcvPrn&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrt" select="ScriptNS1:GetLookupValue(&quot;RcvPrt&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPfc" select="ScriptNS1:GetLookupValue(&quot;RcvPfc&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPor" select="ScriptNS1:GetLookupValue(&quot;SndPor&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrn" select="ScriptNS1:GetLookupValue(&quot;SndPrn&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrt" select="ScriptNS1:GetLookupValue(&quot;SndPrt&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPfc" select="ScriptNS1:GetLookupValue(&quot;SndPfc&quot; , &quot;SAP.Magento.SAPConnection&quot;)" />   
    
    <xsl:variable name="var:incrementId" select="result/increment_id/text()"></xsl:variable>
    <xsl:variable name="var:poNumber" select="string(result/payment/po_number/text())"/>
    <xsl:variable name="var:plantNo" select="string(result/payment/business_area/text())" />
    <xsl:variable name="var:costCenter" select="substring(
          concat('0000000000', result/payment/cost_center/text()), 
          string-length(result/payment/cost_center/text()) + 1, 
          10
        )"/>  
    <xsl:variable name="var:deliveryDate" select="ScriptNS0:FormateDateNew(string(result/division_request_date/text()) , &quot;yyyyMMdd&quot;)"/>
    <ns0:Send>
        <ns0:idocData>
          <ns1:EDI_DC40>
            <ns2:IDOCTYP>PORDCR101</ns2:IDOCTYP>
            <ns2:MESTYP>PORDCR1</ns2:MESTYP>            
            <ns2:SNDPOR>
              <xsl:value-of select="$var:SndPor" />
            </ns2:SNDPOR>
            <ns2:SNDPRT>
              <xsl:value-of select="$var:SndPrt" />
            </ns2:SNDPRT>
            <ns2:SNDPRN>
              <xsl:value-of select="$var:SndPrn" />
            </ns2:SNDPRN>          
            <ns2:RCVPOR>
              <xsl:value-of select="$var:RcvPor" />
            </ns2:RCVPOR>
            <ns2:RCVPRT>
              <xsl:value-of select="$var:RcvPrt" />
            </ns2:RCVPRT>
            <ns2:RCVPFC>
              <xsl:value-of select="$var:RcvPfc" />
            </ns2:RCVPFC>           
            <ns2:RCVPRN>
              <xsl:value-of select="$var:RcvPrn" />
            </ns2:RCVPRN>
            <ns2:CREDAT><xsl:value-of select="ScriptNS0:FormateDateNew(string(userCSharp:DateCurrentDate()) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)" /></ns2:CREDAT>
			      <ns2:CRETIM><xsl:value-of select="userCSharp:EDI_DC40_CRETIM_ReplaceColon(string(userCSharp:DateCurrentTime()))" /></ns2:CRETIM>
            <ns2:ARCKEY>
              <xsl:value-of select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
            </ns2:ARCKEY>
            <ns2:SERIAL></ns2:SERIAL>            
          </ns1:EDI_DC40>
          <ns1:E2PORDCR1000GRP>
            <ns1:E2PORDCR1000>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2PORDCR1000</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:NO_PRICE_FROM_PO>X</ns1:NO_PRICE_FROM_PO>
            </ns1:E2PORDCR1000>
            <ns1:E2BPMEPOHEADER000>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2BPMEPOHEADER000</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <!--<ns1:PO_NUMBER>
                <xsl:value-of select="$var:incrementId" />
              </ns1:PO_NUMBER>-->
              <ns1:COMP_CODE>2180</ns1:COMP_CODE>
              <ns1:DOC_TYPE>NB</ns1:DOC_TYPE>
              <ns1:CREATED_BY>MAGENTO</ns1:CREATED_BY>
              <ns1:VENDOR>0000008010</ns1:VENDOR>
              <ns1:PURCH_ORG>3100</ns1:PURCH_ORG>
              <ns1:PUR_GROUP>150</ns1:PUR_GROUP>             
              <ns1:CURRENCY><xsl:value-of select="result/store_currency_code/text()" /></ns1:CURRENCY>
              <ns1:DOC_DATE>
                <xsl:value-of select="ScriptNS0:FormateDateNew(string(result/created_at/text()), &quot;yyyyMMdd&quot;)" />
              </ns1:DOC_DATE>
            </ns1:E2BPMEPOHEADER000>
            <ns1:E2BPMEPOHEADERX000>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2BPMEPOHEADERX000</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:PO_NUMBER>X</ns1:PO_NUMBER>
              <ns1:COMP_CODE>X</ns1:COMP_CODE>
              <ns1:DOC_TYPE>X</ns1:DOC_TYPE>
              <ns1:CREATED_BY>X</ns1:CREATED_BY>
              <ns1:ITEM_INTVL>X</ns1:ITEM_INTVL>
              <ns1:VENDOR>X</ns1:VENDOR>
              <ns1:PURCH_ORG>X</ns1:PURCH_ORG>
              <ns1:PUR_GROUP>X</ns1:PUR_GROUP>
              <ns1:CURRENCY>X</ns1:CURRENCY>
              <ns1:DOC_DATE>X</ns1:DOC_DATE>
            </ns1:E2BPMEPOHEADERX000>
            
            <xsl:for-each select="result/items/item">            
              <ns1:E2BPMEPOITEM000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOITEM000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <xsl:if test="name">
                  <ns1:SHORT_TEXT>
                    <xsl:value-of select="substring(name/text(), 1, 40)" />
                  </ns1:SHORT_TEXT>
                </xsl:if>
                <ns1:MATERIAL>
                  <xsl:value-of select="sku/text()" />
                </ns1:MATERIAL>
                <ns1:PLANT>
                  <xsl:value-of select="$var:plantNo" />
                </ns1:PLANT>
                <ns1:STGE_LOC>001</ns1:STGE_LOC>
                <ns1:TRACKINGNO><xsl:value-of select="$var:incrementId" /></ns1:TRACKINGNO>
                <ns1:MATL_GROUP>MISC</ns1:MATL_GROUP>
                <ns1:QUANTITY>
                  <xsl:value-of select="number(qty_ordered/text())" />
                </ns1:QUANTITY>
                <ns1:PO_UNIT_ISO>EA</ns1:PO_UNIT_ISO>
                <ns1:NET_PRICE>
                  <xsl:value-of select="number(price/text())" />
                </ns1:NET_PRICE>
                <ns1:PRICE_UNIT>1</ns1:PRICE_UNIT>
                <ns1:TAX_CODE/>
                <ns1:OVER_DLV_TOL>0</ns1:OVER_DLV_TOL>
                <ns1:UNLIMITED_DLV>X</ns1:UNLIMITED_DLV>
                <ns1:UNDER_DLV_TOL>0</ns1:UNDER_DLV_TOL>
                <ns1:ACCTASSCAT>K</ns1:ACCTASSCAT>
                <ns1:TAXJURCODE/>
                <ns1:INCOTERMS1/>
                <ns1:INCOTERMS2/>
              </ns1:E2BPMEPOITEM000>
            </xsl:for-each>
            <xsl:for-each select="result/items/item"> 
              <ns1:E2BPMEPOITEMX000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOITEMX000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <ns1:PO_ITEMX>X</ns1:PO_ITEMX>
                <ns1:SHORT_TEXT>X</ns1:SHORT_TEXT>                
                <ns1:MATERIAL>X</ns1:MATERIAL>
                <ns1:PLANT>X</ns1:PLANT>
                <ns1:STGE_LOC>X</ns1:STGE_LOC>
                <ns1:TRACKINGNO>X</ns1:TRACKINGNO>
                <ns1:MATL_GROUP>X</ns1:MATL_GROUP>
                <ns1:QUANTITY>X</ns1:QUANTITY>
                <ns1:PO_UNIT_ISO>X</ns1:PO_UNIT_ISO>
                <ns1:NET_PRICE>X</ns1:NET_PRICE>
                <ns1:PRICE_UNIT>X</ns1:PRICE_UNIT>
                <ns1:TAX_CODE>X</ns1:TAX_CODE>
                <ns1:OVER_DLV_TOL>X</ns1:OVER_DLV_TOL>
                <ns1:UNLIMITED_DLV>X</ns1:UNLIMITED_DLV>
                <ns1:UNDER_DLV_TOL>X</ns1:UNDER_DLV_TOL>
                <ns1:ACCTASSCAT>X</ns1:ACCTASSCAT>
                <ns1:TAXJURCODE>X</ns1:TAXJURCODE>
                <ns1:INCOTERMS1>X</ns1:INCOTERMS1>
                <ns1:INCOTERMS2>X</ns1:INCOTERMS2>           
              </ns1:E2BPMEPOITEMX000>
            </xsl:for-each>
            
            <xsl:for-each select="result/items/item">          
              <ns1:E2BPMEPOSCHEDULE000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOSCHEDULE000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <xsl:if test="$var:deliveryDate">
                   <ns1:DELIVERY_DATE>
                    <xsl:value-of select="$var:deliveryDate"/>
                  </ns1:DELIVERY_DATE>
                </xsl:if>
                <ns1:QUANTITY>
                  <xsl:value-of select="qty_ordered/text()" />
                </ns1:QUANTITY>
              </ns1:E2BPMEPOSCHEDULE000>
            </xsl:for-each>
            
            <xsl:for-each select="result/items/item">            
              <ns1:E2BPMEPOSCHEDULX000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOSCHEDULX000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <ns1:PO_ITEMX>X</ns1:PO_ITEMX>
                <ns1:DELIVERY_DATE>X</ns1:DELIVERY_DATE>                
                <ns1:QUANTITY>X</ns1:QUANTITY>
              </ns1:E2BPMEPOSCHEDULX000>
            </xsl:for-each>
            
            <xsl:for-each select="result/items/item">
              <ns1:E2BPMEPOACCOUNT000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOACCOUNT000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <!--<xsl:if test="$var:costCenter">
                  <ns1:GL_ACCOUNT>
                    <xsl:value-of select="$var:costCenter" />
                  </ns1:GL_ACCOUNT>
                </xsl:if>-->
                <xsl:if test="$var:costCenter">
                  <ns1:COSTCENTER>
                    <xsl:value-of select="$var:costCenter" />
                  </ns1:COSTCENTER>
                </xsl:if>
              </ns1:E2BPMEPOACCOUNT000>
            </xsl:for-each>
           
            <xsl:for-each select="result/items/item">
              <xsl:variable name="var:v32" select="userCSharp:StringConcat(&quot;X&quot;)" />
              <xsl:variable name="var:v33" select="userCSharp:LogicalExistence(boolean(GLAccount))" />
              <xsl:variable name="var:v34" select="userCSharp:LogicalExistence(boolean(CostCentre))" />
              <ns1:E2BPMEPOACCOUNTX000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2BPMEPOACCOUNTX000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:PO_ITEM>
                  <xsl:value-of select="position()*10" />
                </ns1:PO_ITEM>
                <ns1:PO_ITEMX>X</ns1:PO_ITEMX>
                <!--<ns1:GL_ACCOUNT>X</ns1:GL_ACCOUNT>-->                
                <ns1:COSTCENTER>X</ns1:COSTCENTER>                
              </ns1:E2BPMEPOACCOUNTX000>
            </xsl:for-each>
          </ns1:E2PORDCR1000GRP>
        </ns0:idocData>
    </ns0:Send>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
    public string StringConcat(string param0)
    {
       return param0;
    }


    public string DateCurrentDate()
    {
	    DateTime dt = DateTime.Now;
	    return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
    }


    public string DateCurrentTime()
    {
	    DateTime dt = DateTime.Now;
	    return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
    }


    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string EDI_DC40_CRETIM_ReplaceColon(string param1)
    {
	    return param1.Replace(":", "");
    }


    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string EDI_DC40_ARCKEY_GenerateGUID()
    {
           return System.Guid.NewGuid().ToString();
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


    public string StringConcat(string param0, string param1, string param2)
    {
       return param0 + param1 + param2;
    }


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


    public string StringConcat(string param0, string param1)
    {
       return param0 + param1;
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

    public bool LogicalExistence(bool val)
    {
	    return val;
    }


]]>
  </msxsl:script>
</xsl:stylesheet>