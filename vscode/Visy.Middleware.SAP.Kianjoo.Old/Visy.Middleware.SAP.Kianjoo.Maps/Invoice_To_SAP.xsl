<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DESADV01/Z2DESADV/620/Send" xmlns:ns3="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620" xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" xmlns:s0="http://Visy.Middleware.SAP.Kianjoo.Schemas" xmlns:ns1="http://schemas.microsoft.com/2003/10/Serialization/" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Invoice" />
  </xsl:template>
  <xsl:template match="/s0:Invoice">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;DESADV01&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;Z2DESADV&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;DESADV&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;BIZTALK&quot;)" />
    <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;LI&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:v7" select="userCSharp:StringConcat(&quot;212007&quot;)" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;SAPSP1&quot;)" />
    <xsl:variable name="var:v9" select="./s0:Details[6]/s0:FieldA/text()" />
    <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;Kianjoo&quot;)" />
    <xsl:variable name="var:v11" select="userCSharp:StringConcat(&quot;001&quot;)" />
    <xsl:variable name="var:v12" select="./s0:Details[3]/s0:FieldB/text()" />
    <xsl:variable name="var:v13" select="userCSharp:DateCurrentTime()" />
    <xsl:variable name="var:v14" select="userCSharp:StringSubstring(string($var:v13) , &quot;1&quot; , &quot;2&quot;)" />
    <xsl:variable name="var:v15" select="userCSharp:StringSubstring(string($var:v13) , &quot;4&quot; , &quot;5&quot;)" />
    <xsl:variable name="var:v16" select="userCSharp:StringSubstring(string($var:v13) , &quot;7&quot; , &quot;8&quot;)" />
    <xsl:variable name="var:v17" select="userCSharp:StringConcat(string($var:v14) , string($var:v15) , string($var:v16))" />
    <xsl:variable name="var:v18" select="userCSharp:LogicalEq(&quot;False&quot; , &quot; &quot;)" />
    <xsl:variable name="var:v19" select="userCSharp:DateCurrentDate()" />
    <xsl:variable name="var:v20" select="userCSharp:StringSubstring(string($var:v19) , &quot;1&quot; , &quot;4&quot;)" />
    <xsl:variable name="var:v21" select="userCSharp:StringSubstring(string($var:v19) , &quot;6&quot; , &quot;7&quot;)" />
    <xsl:variable name="var:v22" select="userCSharp:StringSubstring(string($var:v19) , &quot;9&quot; , &quot;10&quot;)" />
    <xsl:variable name="var:v23" select="userCSharp:StringConcat(string($var:v20) , string($var:v21) , string($var:v22))" />
    <xsl:variable name="var:vContainer" select="./s0:Details[2]/s0:FieldB/text()" />
    <xsl:variable name="var:vInvoiceNumber" select="./s0:Details[6]/s0:FieldG/text()" />
    <ns0:Send>
      <ns0:idocData>
        <ns3:EDI_DC40>
          <ns2:IDOCTYP>
            <xsl:value-of select="$var:v1" />
          </ns2:IDOCTYP>
          <ns2:CIMTYP>
            <xsl:value-of select="$var:v2" />
          </ns2:CIMTYP>
          <ns2:MESTYP>
            <xsl:value-of select="$var:v3" />
          </ns2:MESTYP>
          <ns2:SNDPOR>
            <xsl:value-of select="$var:v4" />
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="$var:v5" />
          </ns2:SNDPRT>
          <ns2:SNDPFC>
            <xsl:value-of select="$var:v6" />
          </ns2:SNDPFC>
          <ns2:SNDPRN>
            <xsl:value-of select="$var:v7" />
          </ns2:SNDPRN>
          <ns2:RCVPOR>
            <xsl:value-of select="$var:v8" />
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="$var:v5" />
          </ns2:RCVPRT>
          <ns2:RCVPFC>
            <xsl:value-of select="$var:v6" />
          </ns2:RCVPFC>
          <ns2:RCVPRN>
            <xsl:value-of select="$var:v7" />
          </ns2:RCVPRN>
        </ns3:EDI_DC40>
        <ns3:E2EDK07001GRP>
          <ns3:E2EDK07001>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK07001</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:TRAID>
              <xsl:value-of select="$var:vInvoiceNumber" />
            </ns3:TRAID>
          </ns3:E2EDK07001>
          <ns3:E2EDKA1003>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:PARVW>
              <xsl:value-of select="$var:v6" />
            </ns3:PARVW>
            <ns3:PARTN>
              <xsl:value-of select="$var:v7" />
            </ns3:PARTN>
            <ns3:NAME1>
              <xsl:value-of select="$var:v10" />
            </ns3:NAME1>
          </ns3:E2EDKA1003>
          <ns3:E2EDK03>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK03</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:IDDAT>
              <xsl:value-of select="$var:v11" />
            </ns3:IDDAT>
            <ns3:DATUM>
              <xsl:value-of select="$var:v12" />
            </ns3:DATUM>
            <ns3:UZEIT>
              <xsl:value-of select="$var:v17" />
            </ns3:UZEIT>
          </ns3:E2EDK03>
          <xsl:if test="$var:v18">
            <ns3:E2EDKT1002GRP>
              <ns3:E2EDKT1002>
                <ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDKT1002</xsl:text>
                </ns3:DATAHEADERCOLUMN_SEGNAM>
              </ns3:E2EDKT1002>
              <ns3:E2EDKT2001>
                <ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDKT2001</xsl:text>
                </ns3:DATAHEADERCOLUMN_SEGNAM>
              </ns3:E2EDKT2001>
            </ns3:E2EDKT1002GRP>
          </xsl:if>
        </ns3:E2EDK07001GRP>
        <ns3:E2EDK08001GRP>
          <ns3:E2EDK08001>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK08001</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:VBELN>
              <xsl:value-of select="$var:vInvoiceNumber" />
            </ns3:VBELN>
          </ns3:E2EDK08001>
          <xsl:if test="$var:v18">
            <ns3:E2EDS01>
              <ns3:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDS01</xsl:text>
              </ns3:DATAHEADERCOLUMN_SEGNAM>
            </ns3:E2EDS01>
          </xsl:if>
          <ns3:E2EDKA2001>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA2001</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:PARVW>
              <xsl:value-of select="$var:v6" />
            </ns3:PARVW>
            <ns3:PARTN>
              <xsl:value-of select="$var:v7" />
            </ns3:PARTN>
            <ns3:NAME1>
              <xsl:value-of select="$var:v10" />
            </ns3:NAME1>
          </ns3:E2EDKA2001>
          <ns3:E2EDK06>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK06</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:IDDAT>
              <xsl:value-of select="$var:v11" />
            </ns3:IDDAT>
            <ns3:DATUM>
              <xsl:value-of select="$var:v23" />
            </ns3:DATUM>
            <ns3:UHRZE>
              <xsl:value-of select="$var:v17" />
            </ns3:UHRZE>
          </ns3:E2EDK06>
          <xsl:if test="$var:v18">
            <ns3:E2EDKT3001GRP>
              <ns3:E2EDKT3001>
                <ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDKT3001</xsl:text>
                </ns3:DATAHEADERCOLUMN_SEGNAM>
              </ns3:E2EDKT3001>
              <ns3:E2EDKT4001>
                <ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDKT4001</xsl:text>
                </ns3:DATAHEADERCOLUMN_SEGNAM>
              </ns3:E2EDKT4001>
            </ns3:E2EDKT3001GRP>
          </xsl:if>
          <xsl:if test="$var:v18">
            <ns3:E2EDP06>
              <ns3:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP06</xsl:text>
              </ns3:DATAHEADERCOLUMN_SEGNAM>
            </ns3:E2EDP06>
          </xsl:if>
          <xsl:for-each select="s0:Details">
            <xsl:variable name="var:v24" select="position()" />
            <xsl:variable name="var:v25" select="userCSharp:LogicalGte(string($var:v24) , &quot;6&quot;)" />
            <xsl:variable name="var:v26" select="userCSharp:StringTrimLeft(string(s0:FieldH/text()))" />
            <xsl:variable name="var:v27" select="userCSharp:StringTrimRight(string($var:v26))" />
            <xsl:variable name="var:v28" select="userCSharp:StringSize(string($var:v27))" />
            <xsl:variable name="var:v29" select="userCSharp:LogicalGt(string($var:v28) , &quot;0&quot;)" />
            <xsl:variable name="var:v30" select="userCSharp:LogicalAnd(string($var:v25) , string($var:v29))" />
            <xsl:if test="$var:v30">
              <xsl:variable name="var:v31" select="userCSharp:LogicalEq(&quot;False&quot; , &quot; &quot;)" />
              <xsl:variable name="var:v32" select="userCSharp:StringConcat(&quot;EA&quot;)" />
              <ns3:E2EDP07GRP>
                <ns3:E2EDP07>
                  <ns3:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2EDP07</xsl:text>
                  </ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:if test="s0:FieldA">
                    <ns3:BSTNK>
                      <xsl:value-of select="s0:FieldA/text()" />
                    </ns3:BSTNK>
                  </xsl:if>
                  <xsl:if test="s0:FieldB">
                    <ns3:POSEX>
                      <xsl:value-of select="s0:FieldB/text()" />
                    </ns3:POSEX>
                  </xsl:if>
                </ns3:E2EDP07>
                <xsl:if test="$var:v31">
                  <ns3:E2EDP08>
                    <ns3:DATAHEADERCOLUMN_SEGNAM>
                      <xsl:text>E2EDP08</xsl:text>
                    </ns3:DATAHEADERCOLUMN_SEGNAM>
                  </ns3:E2EDP08>
                </xsl:if>
                <ns3:E2EDP09001GRP>
                  <ns3:E2EDP09001>
                    <ns3:DATAHEADERCOLUMN_SEGNAM>
                      <xsl:text>E2EDP09001</xsl:text>
                    </ns3:DATAHEADERCOLUMN_SEGNAM>                    
                    <xsl:if test="$var:vContainer">
                      <ns3:VBELN>
                        <xsl:value-of select="$var:vContainer" />
                      </ns3:VBELN>
                    </xsl:if>
                    <xsl:if test="s0:FieldG">
                      <ns3:CHARG>
                        <xsl:value-of select="s0:FieldG/text()" />
                      </ns3:CHARG>
                    </xsl:if>
                    <xsl:if test="s0:FieldH">
                      <ns3:KDMAT>
                        <xsl:value-of select="s0:FieldH/text()" />
                      </ns3:KDMAT>
                    </xsl:if>
                    <xsl:if test="s0:FieldJ">
                      <ns3:LFIMG>
                        <xsl:value-of select="userCSharp:ReplaceCharacters_Qty(string(s0:FieldJ/text()))" />
                      </ns3:LFIMG>
                    </xsl:if>
                    <ns3:VRKME>
                      <xsl:value-of select="$var:v32" />
                    </ns3:VRKME>
                  </ns3:E2EDP09001>
                  <xsl:if test="$var:v31">
                    <ns3:Z2EDP09_2000>
                      <ns3:DATAHEADERCOLUMN_SEGNAM>
                        <xsl:text>Z2EDP09_2000</xsl:text>
                      </ns3:DATAHEADERCOLUMN_SEGNAM>
                    </ns3:Z2EDP09_2000>
                  </xsl:if>
                  <xsl:if test="$var:v31">
                    <ns3:Z2EDP09_1000>
                      <ns3:DATAHEADERCOLUMN_SEGNAM>
                        <xsl:text>Z2EDP09_1000</xsl:text>
                      </ns3:DATAHEADERCOLUMN_SEGNAM>
                    </ns3:Z2EDP09_1000>
                  </xsl:if>
                </ns3:E2EDP09001GRP>
                <xsl:if test="$var:v31">
                  <ns3:E2EDPT1001GRP>
                    <ns3:E2EDPT1001>
                      <ns3:DATAHEADERCOLUMN_SEGNAM>
                        <xsl:text>E2EDPT1001</xsl:text>
                      </ns3:DATAHEADERCOLUMN_SEGNAM>
                    </ns3:E2EDPT1001>
                    <ns3:E2EDPT2001>
                      <ns3:DATAHEADERCOLUMN_SEGNAM>
                        <xsl:text>E2EDPT2001</xsl:text>
                      </ns3:DATAHEADERCOLUMN_SEGNAM>
                    </ns3:E2EDPT2001>
                  </ns3:E2EDPT1001GRP>
                </xsl:if>
              </ns3:E2EDP07GRP>
            </xsl:if>
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
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string DateCurrentTime()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
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


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
}


public string DateCurrentDate()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
}


public bool LogicalGte(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 >= d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) >= 0;
	}
	return ret;
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


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
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
public string ReplaceCharacters_Qty(string param2)
{
string result = string.Empty;
        foreach (var c in param2)
        {
            int ascii = (int)c;
            if ((ascii >= 48 && ascii <= 57) || ascii == 46) 
            result += c;
        }
return result;
}

]]></msxsl:script>
</xsl:stylesheet>