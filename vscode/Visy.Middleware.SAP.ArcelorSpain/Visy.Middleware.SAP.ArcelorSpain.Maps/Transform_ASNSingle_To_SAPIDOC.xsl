<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" 
                version="1.0"
                xmlns:s0="http://Visy.Middleware.SAP.ArcelorSpain.Schemas.ASN_Single" 
                xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DESADV01/Z2DESADV/620/Send"
                xmlns:ns3="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01/Z2DESADV/620" 
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:ns1="http://schemas.microsoft.com/2003/10/Serialization/" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:ASN_Single" />
  </xsl:template>
  <xsl:template match="/s0:ASN_Single">
    <xsl:variable name="var:partnerNo" select="'126932'" />       
   
    <xsl:variable name="var:v13" select="userCSharp:DateCurrentTime()" />
    <xsl:variable name="var:v14" select="userCSharp:StringSubstring(string($var:v13) , &quot;1&quot; , &quot;2&quot;)" />
    <xsl:variable name="var:v15" select="userCSharp:StringSubstring(string($var:v13) , &quot;4&quot; , &quot;5&quot;)" />
    <xsl:variable name="var:v16" select="userCSharp:StringSubstring(string($var:v13) , &quot;7&quot; , &quot;8&quot;)" />
    <xsl:variable name="var:vTime" select="userCSharp:StringConcat(string($var:v14) , string($var:v15) , string($var:v16))" />
   
    <ns0:Send>
      <ns0:idocData>
        <ns3:EDI_DC40>         
          <ns2:IDOCTYP>DESADV01</ns2:IDOCTYP>
          <ns2:CIMTYP>
            <xsl:text>Z2DESADV</xsl:text>
          </ns2:CIMTYP>
          <ns2:MESTYP>DESADV</ns2:MESTYP>
          <ns2:SNDPOR>
            <xsl:value-of select="'BIZTALK'" />
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="'LI'" />
          </ns2:SNDPRT>
          <ns2:SNDPFC>LF</ns2:SNDPFC>
          <ns2:SNDPRN>
            <xsl:value-of select="$var:partnerNo" />
          </ns2:SNDPRN>
          <ns2:SNDSAD>
            <xsl:text> </xsl:text>
          </ns2:SNDSAD>
          <ns2:SNDLAD>
            <xsl:text> </xsl:text>
          </ns2:SNDLAD>
          <ns2:RCVPOR>
            <xsl:value-of select="'SAPSP1'" />
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="'LI'" />
          </ns2:RCVPRT>
          <ns2:RCVPFC>LF</ns2:RCVPFC>
          <ns2:RCVPRN>
            <xsl:value-of select="$var:partnerNo" />
          </ns2:RCVPRN>
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
              <xsl:value-of select="//Details[1]/ContainerNumber/text()" />
            </ns3:TRAID>
          </ns3:E2EDK07001>
          <ns3:E2EDKA1003>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:PARVW>
              <xsl:value-of select="'LF'" />
            </ns3:PARVW>
            <ns3:PARTN>
              <xsl:value-of select="$var:partnerNo" />
            </ns3:PARTN>
            <ns3:NAME1>
              <xsl:value-of select="'Arcelor'" />
            </ns3:NAME1>
          </ns3:E2EDKA1003>
          <ns3:E2EDK03>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK03</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:IDDAT>
              <xsl:value-of select="'001'" />
            </ns3:IDDAT>
            <ns3:DATUM>
              <xsl:value-of select="//Details[1]/DeliveryDate/text()" />
            </ns3:DATUM>
            <ns3:UZEIT>
              <xsl:value-of select="$var:vTime" />
            </ns3:UZEIT>
          </ns3:E2EDK03>        
        </ns3:E2EDK07001GRP>

        <ns3:E2EDK08001GRP>
          <ns3:E2EDK08001>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK08001</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:VBELN>
              <xsl:value-of select="//Details[1]/ContainerNumber/text()" />
            </ns3:VBELN>
            <ns3:TRAID>
              <xsl:value-of select="//Details[1]/DeliveryNumber/text()" />
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
              <xsl:value-of select="'LF'" />
            </ns3:PARVW>
            <ns3:PARTN>
              <xsl:value-of select="$var:partnerNo" />
            </ns3:PARTN>
           
          </ns3:E2EDKA2001>
          <ns3:E2EDK06>
            <ns3:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK06</xsl:text>
            </ns3:DATAHEADERCOLUMN_SEGNAM>
            <ns3:IDDAT>
              <xsl:value-of select="'001'" />
            </ns3:IDDAT>
            <ns3:DATUM>
              <xsl:value-of select="//Details[1]/DeliveryDate/text()" />
            </ns3:DATUM>
          </ns3:E2EDK06>
          <xsl:for-each select="Details">   
            <ns3:E2EDP07GRP>
              <ns3:E2EDP07>
                <ns3:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDP07</xsl:text>
                </ns3:DATAHEADERCOLUMN_SEGNAM>
                <ns3:BSTNK>
                  <xsl:value-of select="VisyPONumber" />
                </ns3:BSTNK>
                <ns3:POSEX>
                  <xsl:value-of select="LineNo" />
                </ns3:POSEX>
              </ns3:E2EDP07>            
                <ns3:E2EDP09001GRP>
                  <ns3:E2EDP09001>
                    <ns3:DATAHEADERCOLUMN_SEGNAM>
                      <xsl:text>E2EDP09001</xsl:text>
                    </ns3:DATAHEADERCOLUMN_SEGNAM>
                    <ns3:VBELN>
                      <xsl:value-of select="ContainerNumber" />
                    </ns3:VBELN>
                    <ns3:CHARG>
                      <xsl:value-of select="concat('A', LotNumber)" />
                    </ns3:CHARG>
                    <ns3:KDMAT>
                      <xsl:value-of select="MaterialNumber" />
                    </ns3:KDMAT>
                    <ns3:LFIMG>
                      <xsl:value-of select="round(Quantity * 1000) div 1000" />
                    </ns3:LFIMG>
                    <ns3:VRKME>
                      <xsl:value-of select="UOM" />
                    </ns3:VRKME>
                  </ns3:E2EDP09001>
                </ns3:E2EDP09001GRP>              
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

  public string EDI_DC40_ARCKEY_GenerateGUID()
  {
    return System.Guid.NewGuid().ToString();
  }


]]></msxsl:script>
</xsl:stylesheet>