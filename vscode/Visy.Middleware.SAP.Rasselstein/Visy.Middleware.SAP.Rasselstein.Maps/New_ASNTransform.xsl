<?xml version="1.0" encoding="UTF-16" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var userCSharp ScriptNS0 ScriptNS1 ScriptNS2"
                version="1.0" xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DESADV01/Z2DESADV/620/Send"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
                xmlns:ns3="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620"
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                >
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/PACKING_LISTS" />
  </xsl:template>
  <xsl:template match="PACKING_LISTS">
    <xsl:variable name="var:vLI" select="userCSharp:StringConcat(&quot;LI&quot;)" />
    <xsl:variable name="var:vLF" select="userCSharp:StringConcat(&quot;LF&quot;)" />

    <xsl:variable name="var:vPackingListDatePlus60" select="userCSharp:DateAddDays(string(./PACKING_LIST[1]/HEADER[1]/@PACKING_LIST_DATE) , &quot;60&quot;)" />

    <xsl:variable name="var:v26" select="userCSharp:StringConcat(&quot;false&quot;)" />
    <ns0:Send>
      <ns0:idocData>
        <ns3:EDI_DC40>
          <ns2:IDOCTYP>DESADV01</ns2:IDOCTYP>
          <ns2:CIMTYP>
            <xsl:text>Z2DESADV</xsl:text>
          </ns2:CIMTYP>
          <ns2:MESTYP>DESADV</ns2:MESTYP>          
          <ns2:SNDPOR>
            <xsl:value-of select="ScriptNS0:GetLookupValue(&quot;SNDPOR&quot; , &quot;SAP.Rasselstein&quot;)" />
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="$var:vLI" />
          </ns2:SNDPRT>
          <ns2:SNDPFC>LF</ns2:SNDPFC>
          <ns2:SNDPRN>30238</ns2:SNDPRN>
          <ns2:SNDSAD>
            <xsl:text> </xsl:text>
          </ns2:SNDSAD>
          <ns2:SNDLAD>
            <xsl:text> </xsl:text>
          </ns2:SNDLAD>
          <ns2:RCVPOR>
            <xsl:value-of select="ScriptNS0:GetLookupValue(&quot;RCVPOR&quot; , &quot;SAP.Rasselstein&quot;)" />
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="$var:vLI" />
          </ns2:RCVPRT>
          <ns2:RCVPFC>LF</ns2:RCVPFC>
          <ns2:RCVPRN>30238</ns2:RCVPRN>
          <ns2:RCVSAD>
            <xsl:text> </xsl:text>
          </ns2:RCVSAD>          
          <ns2:ARCKEY>
            <xsl:value-of select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
          </ns2:ARCKEY>       
        </ns3:EDI_DC40>
        <ns3:E2EDK07001GRP>
          <ns3:E2EDK07001>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK07001</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>         
            <ns3:TRAID>
              <xsl:value-of select="PACKING_LIST/HEADER[1]/HEADER_REFERENCES[1]/SUPPLIER_TRANSPORT_NUMBER/text()" />
            </ns3:TRAID>          
        </ns3:E2EDK07001>
          <ns3:E2EDKA1003>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>          
            <ns3:PARVW>
              <xsl:value-of select="$var:vLF" />
            </ns3:PARVW>
            <ns3:PARTN>
              <xsl:value-of select="'30238'" />
            </ns3:PARTN>

            <xsl:variable name="var:vName1a" select="userCSharp:StringFind(string(PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/NAME/text()) , &quot;/&quot;)" />
            <xsl:variable name="var:vName1b" select="userCSharp:MathSubtract(string($var:vName1a) , &quot;1&quot;)" />
            <xsl:variable name="var:vName1c" select="userCSharp:StringLeft(string(PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/NAME/text()) , string($var:vName1b))" />

            <ns3:NAME1>
              <xsl:value-of select="$var:vName1c" />
            </ns3:NAME1>
            <ns3:STRAS>
              <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/STREET/text()" />
            </ns3:STRAS>
            <ns3:ORT01>
              <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/CITY/text()" />
            </ns3:ORT01>
            <ns3:PSTLZ>
              <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/ZIP/text()" />
            </ns3:PSTLZ>
            <ns3:ISOAL>
              <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/COUNTRY_ISO_CODE/text()" />
            </ns3:ISOAL>
          </ns3:E2EDKA1003>
          <ns3:E2EDK03>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK03</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:IDDAT>
              <xsl:value-of select="'001'" />
            </ns3:IDDAT>
            <ns3:DATUM>
              <xsl:value-of select="$var:vPackingListDatePlus60" />
            </ns3:DATUM>
          </ns3:E2EDK03>
        </ns3:E2EDK07001GRP>
        
        <ns3:E2EDK08001GRP>          
            <ns3:E2EDK08001>
              <ns3:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDK08001</xsl:text>
              </ns3:DATAHEADERCOLUMN_SEGNAM>              
              <ns3:VBELN>
                <xsl:value-of select="PACKING_LIST/HEADER[1]/SUPPLIER/ADDRESS/NAME/text()" />
              </ns3:VBELN>
              <ns3:TRAID>
                <xsl:value-of select="PACKING_LIST/HEADER[1]/HEADER_REFERENCES/SUPPLIER_TRANSPORT_NUMBER/text()" />
              </ns3:TRAID>
              <ns3:TRATY>
                <xsl:text>0003</xsl:text>
              </ns3:TRATY>
            </ns3:E2EDK08001>
            <ns3:E2EDKA2001>
              <ns3:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDKA2001</xsl:text>
              </ns3:DATAHEADERCOLUMN_SEGNAM>              
              <ns3:PARVW>
                <xsl:value-of select="$var:vLF" />
              </ns3:PARVW>
              <ns3:PARTN>
                <xsl:value-of select="'30238'" />
              </ns3:PARTN>

              <xsl:variable name="var:vName2a" select="userCSharp:StringFind(string(PACKING_LIST/HEADER/SUPPLIER/ADDRESS/NAME/text()) , &quot;/&quot;)" />
              <xsl:variable name="var:vName2b" select="userCSharp:MathSubtract(string($var:vName2a) , &quot;1&quot;)" />
              <xsl:variable name="var:vName2c" select="userCSharp:StringLeft(string(PACKING_LIST/HEADER/SUPPLIER/ADDRESS/NAME/text()) , string($var:vName2b))" />
              <ns3:NAME1>
                <xsl:value-of select="$var:vName2c" />
              </ns3:NAME1>
              <ns3:STRAS>
                <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER/ADDRESS/STREET/text()" />
              </ns3:STRAS>
              <ns3:ORT01>
                <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER/ADDRESS/CITY/text()" />
              </ns3:ORT01>
              <ns3:PSTLZ>
                <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER/ADDRESS/ZIP/text()" />
              </ns3:PSTLZ>
              <ns3:ISOAL>
                <xsl:value-of select="PACKING_LIST/HEADER/SUPPLIER/ADDRESS/COUNTRY_ISO_CODE/text()" />
              </ns3:ISOAL>
            </ns3:E2EDKA2001>
            <ns3:E2EDK06>
              <ns3:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDK06</xsl:text>
              </ns3:DATAHEADERCOLUMN_SEGNAM>              
              <ns3:IDDAT>
                <xsl:value-of select="'001'" />
              </ns3:IDDAT>
              <ns3:DATUM>
                <xsl:value-of select="$var:vPackingListDatePlus60" />
              </ns3:DATUM>
            </ns3:E2EDK06>
            <xsl:for-each select="PACKING_LIST/HEADER">
              <xsl:variable name="var:vPackingListNumber" select="@PACKING_LIST_NUMBER" />     
              <xsl:variable name="var:vRef3" select="userCSharp:StringFind(string(SUPPLIER/ADDRESS/NAME/text()) , &quot;/&quot;)" />
              <xsl:variable name="var:vRef1" select="userCSharp:MathAdd($var:vRef3 , &quot;1&quot;)" />
              <xsl:variable name="var:vRef2" select="userCSharp:StringSize(string(SUPPLIER/ADDRESS/NAME/text()))" />
              <xsl:variable name="var:vRef" select="userCSharp:StringSubstring(string(SUPPLIER/ADDRESS/NAME/text()) , string($var:vRef1) , string($var:vRef2))" />
              <ns3:E2EDP07GRP>
                <ns3:E2EDP07>
                  <ns3:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2EDP07</xsl:text>
                  </ns3:DATAHEADERCOLUMN_SEGNAM>              
                  <ns3:BSTNK>
                    <xsl:value-of select="Material/BUYER_ORDER_NUMBER/text()" />
                  </ns3:BSTNK>
                  <ns3:POSEX>
                    <xsl:value-of select="userCSharp:StringRight(string(Material/BUYER_POS_NUMBER/text()) , &quot;4&quot;)" />
                  </ns3:POSEX>
                </ns3:E2EDP07>
                <xsl:for-each select="Material/PACKAGES/PACKAGE">
                  <ns3:E2EDP09001GRP>
                    <ns3:E2EDP09001>
                      <ns3:DATAHEADERCOLUMN_SEGNAM>
                        <xsl:text>E2EDP09001</xsl:text>
                      </ns3:DATAHEADERCOLUMN_SEGNAM>
                      <ns3:VBELN>
                        <xsl:value-of select="$var:vRef" />
                      </ns3:VBELN>
                      <ns3:CHARG>
                        <xsl:value-of select="PACKAGE_NUMBER/text()" />
                      </ns3:CHARG>
                      <ns3:LFIMG>
                        <xsl:value-of select="ScriptNS2:ReplaceString(string(QUANTITY_OF_ARTICLES/text()) , &quot;,&quot; , &quot;.&quot;)" />
                      </ns3:LFIMG>
                      <ns3:VRKME>
                        <xsl:value-of select="'TNE'" />
                      </ns3:VRKME>
                    </ns3:E2EDP09001>
                  </ns3:E2EDP09001GRP>
                </xsl:for-each>
              </ns3:E2EDP07GRP>
          </xsl:for-each>
        </ns3:E2EDK08001GRP>
        
        <ns3:E2EDS02>
          <ns3:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDS02</xsl:text>
          </ns3:DATAHEADERCOLUMN_SEGNAM>
        </ns3:E2EDS02>
      </ns0:idocData>
    </ns0:Send>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
public string StringConcat(string param0)
{
 return param0;
}


public string DateAddDays(string date, string days)
{
	string retval = "";
	double db = 0;
	if (IsNumeric(days, ref db))
	{
		//DateTime dt = DateTime.Parse(date);
    DateTime dt = DateTime.ParseExact(date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
		int d = (int) db;
		dt = dt.AddDays(d);
		retval = dt.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
	}
	return retval;
}


public int StringFind(string str, string strFind)
{
	if (str == null || strFind == null || strFind == "")
	{
		return 0;
	}
	return (str.IndexOf(strFind) + 1);
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


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
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


public string MathAdd(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	foreach (string obj in listValues)
	{
	double d = 0;
		if (IsNumeric(obj, ref d))
		{
			ret += d;
		}
		else
		{
			return "";
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
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

public bool IsDate(string val)
{
	bool retval = true;
	try
	{
		DateTime dt = Convert.ToDateTime(val, System.Globalization.CultureInfo.InvariantCulture);
	}
	catch (Exception)
	{
		retval = false;
	}
	return retval;
}
public string EDI_DC40_ARCKEY_GenerateGUID()
{
  return System.Guid.NewGuid().ToString();
}




]]>
  </msxsl:script>
</xsl:stylesheet>