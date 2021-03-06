<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" 
                version="1.0" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
                xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DESADV01//620" 
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DESADV01//620/Send" 
                xmlns:ns3="http://schemas.microsoft.com/2003/10/Serialization/" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />

  <xsl:variable name="var:threadId" select="ScriptNS1:GetCurrentThreadId()" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:EFACT_D97A_DESADV" />

    <xsl:value-of select="ScriptNS1:ClearOccurances($var:threadId)" />
  </xsl:template>
  <xsl:template match="/s0:EFACT_D97A_DESADV">
    <xsl:variable name="var:supplierNode" select="s0:NADLoop1/s0:NAD[NAD01='SU']" />
    <xsl:variable name="var:scheduledBeforeDateNode" select="s0:DTM/s0:C507[C50701='359' and C50703='201']" />
    <ns0:Send>
      <ns0:idocData>
        <ns1:EDI_DC40>
          <ns2:IDOCTYP>
            <xsl:value-of select="'DESADV01'" />
          </ns2:IDOCTYP>
          <ns2:CIMTYP>
            <xsl:value-of select="' '"/>
          </ns2:CIMTYP>
          <ns2:MESTYP>
            <xsl:value-of select="'DESADV'" />
          </ns2:MESTYP>
          <ns2:SNDPOR>
            <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(&quot;SNDPOR&quot; , &quot;SAP.WestRock&quot;)" />
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="'LI'" />
          </ns2:SNDPRT>
          <ns2:SNDPFC>
            <xsl:value-of select="'LF'" />
          </ns2:SNDPFC>
          <ns2:SNDPRN>
            <xsl:value-of select="'0000017685'" />
          </ns2:SNDPRN>
          <ns2:RCVPOR>
            <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(&quot;RCVPOR&quot; , &quot;SAP.WestRock&quot;)" />
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="'LI'" />
          </ns2:RCVPRT>
          <ns2:RCVPFC>
            <xsl:value-of select="'LF'" />
          </ns2:RCVPFC>
          <ns2:RCVPRN>
            <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(&quot;RECPORNO&quot; , &quot;SAP.WestRock&quot;)" />
          </ns2:RCVPRN>
        </ns1:EDI_DC40>
        <ns1:E2EDK07001GRP>
            <ns1:E2EDK07001>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDK07001</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_SEGNUM>1</ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:if test="s0:BGM/s0:C106/C10601">
                <ns1:TRAID>
                  <xsl:value-of select="s0:BGM/s0:C106/C10601" />
                </ns1:TRAID>
              </xsl:if>
            </ns1:E2EDK07001>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_SEGNUM>2</ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>1</ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:if test="$var:supplierNode">
              <ns1:PARVW>
                <xsl:value-of select="'LI'" />
              </ns1:PARVW>
              <ns1:PARTN>
                <xsl:value-of select="'0000017685'" />
              </ns1:PARTN>
              <ns1:NAME1>
                <xsl:value-of select="'WESTVACO'" />
              </ns1:NAME1>
            </xsl:if>
          </ns1:E2EDKA1003>
          <ns1:E2EDK03>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK03</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_SEGNUM>3</ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>1</ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:if test="$var:scheduledBeforeDateNode">
              <ns1:IDDAT>
                <xsl:value-of select="'001'" />
              </ns1:IDDAT>
              <ns1:DATUM>
                <xsl:value-of select="substring($var:scheduledBeforeDateNode/C50702/text(), 1, 8)" />
              </ns1:DATUM>
              <ns1:UZEIT>
                <xsl:value-of select="substring($var:scheduledBeforeDateNode/C50702/text(), 9, 4)" />
                <xsl:value-of select="'00'" />
              </ns1:UZEIT>
            </xsl:if>
          </ns1:E2EDK03>
        </ns1:E2EDK07001GRP>
        <ns1:E2EDK08001GRP>
          <ns1:E2EDK08001>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK08001</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_SEGNUM>4</ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:VBELN>
              <xsl:value-of select="/*/s0:BGM/s0:C106/C10601" />
            </ns1:VBELN>
          </ns1:E2EDK08001>
          <ns1:E2EDKA2001>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA2001</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_SEGNUM>5</ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>4</ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:if test="$var:supplierNode">
              <ns1:PARVW>
                <xsl:value-of select="'LI'" />
              </ns1:PARVW>
              <ns1:PARTN>
                <xsl:value-of select="'0000017685'" />
              </ns1:PARTN>
              <ns1:NAME1>
                <xsl:value-of select="'WESTVACO'" />
              </ns1:NAME1>
            </xsl:if>
          </ns1:E2EDKA2001>
          <ns1:E2EDK06>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDK06</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_SEGNUM>6</ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>4</ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:if test="$var:scheduledBeforeDateNode">
              <ns1:IDDAT>
                <xsl:value-of select="'001'" />
              </ns1:IDDAT>
              <ns1:DATUM>
                <xsl:value-of select="substring($var:scheduledBeforeDateNode/C50702/text(), 1, 8)" />
              </ns1:DATUM>
              <ns1:UHRZE>
                <xsl:value-of select="substring($var:scheduledBeforeDateNode/C50702/text(), 9, 4)" />
                <xsl:value-of select="'00'" />
              </ns1:UHRZE>
            </xsl:if>
          </ns1:E2EDK06>
          <xsl:apply-templates select="s0:CPSLoop1/s0:LINLoop1[s0:RFFLoop3/s0:RFF_4/s0:C506_4/C50601='CO']">
            <xsl:sort select="s0:RFFLoop3[s0:RFF_4/s0:C506_4/C50601='CO']/s0:RFF_4/s0:C506_4/C50602" />
            <xsl:sort select="s0:RFFLoop3[s0:RFF_4/s0:C506_4/C50601='CO']/s0:RFF_4/s0:C506_4/C50603" />
          </xsl:apply-templates>
        </ns1:E2EDK08001GRP>
      </ns0:idocData>
    </ns0:Send>
  </xsl:template>

  <!-- Template executes for each Line in the source document -->
  <xsl:template match="*[local-name()='LINLoop1']">
    <xsl:variable name="lineNo" select="s0:LIN/LIN01" />
    <xsl:variable name="purchOrderNo" select="s0:RFFLoop3/s0:RFF_4/s0:C506_4/C50602" />
    <xsl:variable name="poLineNo" select="s0:RFFLoop3/s0:RFF_4/s0:C506_4/C50603" />
    <!-- Create a key based on the Customer Purchase Order # and the PO Line # -->
    <xsl:variable name="headerKey">
      <xsl:value-of select="$purchOrderNo" />
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$poLineNo" />
    </xsl:variable>
    <!-- We only output the header (E2EDP07) section if this is the first occurance of the current Purchase Order and PO Line Number -->
    <xsl:variable name="printHeader" select="ScriptNS1:IsFirstOccurance($var:threadId, $headerKey)" />
    <xsl:if test="$printHeader = 'true'">
      <ns1:E2EDP07GRP>
        <xsl:variable name="segnum" select="position() + 6" />
        <ns1:E2EDP07>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDP07</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_SEGNUM>
            <xsl:value-of select="$segnum" />
          </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM>4</ns1:DATAHEADERCOLUMN_PSGNUM>
          <ns1:BSTNK>
          <xsl:variable name="subPurchOrderNo" select="substring-before($purchOrderNo,'/')" />
          <xsl:choose>
            <xsl:when test="$subPurchOrderNo != ''">
              <xsl:value-of select="$subPurchOrderNo" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$purchOrderNo" />
            </xsl:otherwise>
          </xsl:choose>
          </ns1:BSTNK>
          <ns1:POSEX>
            <xsl:value-of select="$poLineNo" />
          </ns1:POSEX>
        </ns1:E2EDP07>
        <!-- Now we need to collect all the line data for the current Purchase Order and PO Line Number-->
        <xsl:apply-templates mode="items" select="../s0:LINLoop1[s0:RFFLoop3/s0:RFF_4/s0:C506_4/C50602=$purchOrderNo and s0:RFFLoop3/s0:RFF_4/s0:C506_4/C50603=$poLineNo]">
          <xsl:with-param name="parentSegNum" select="$segnum" />
        </xsl:apply-templates>
      </ns1:E2EDP07GRP>
    </xsl:if>
  </xsl:template>
  <!-- Template displays the Item data for a single input line -->

  <xsl:template match="*[local-name()='LINLoop1']" mode="items">
    <xsl:param name="parentSegNum" />
    <!-- Create 1 E2EDP09 segment for each source LIN segment -->
    <ns1:E2EDP09001>
      <ns1:DATAHEADERCOLUMN_SEGNAM>
        <xsl:text>E2EDP09001</xsl:text>
      </ns1:DATAHEADERCOLUMN_SEGNAM>
      <ns1:DATAHEADERCOLUMN_PSGNUM>
        <xsl:value-of select="$parentSegNum" />
      </ns1:DATAHEADERCOLUMN_PSGNUM>
      <ns1:VBELN>
        <xsl:value-of select="/*/s0:BGM/s0:C106/C10601" />
      </ns1:VBELN>
      <ns1:CHARG>
        <xsl:value-of select="s0:PIA/s0:C212_2/C21201" />
      </ns1:CHARG>
      <ns1:KDMAT>
        <xsl:value-of select="s0:LIN/s0:C212/C21201" />
      </ns1:KDMAT>
      <ns1:LFIMG>
        <xsl:value-of select="s0:QTY_2/s0:C186_2/C18602" />
      </ns1:LFIMG>
      <ns1:VRKME>
        <!-- Map the different UOM values (only MTR at the moment -->
        <xsl:variable name="uom" select="s0:QTY_2/s0:C186_2/C18603" />
        <xsl:choose>
          <xsl:when test="$uom = 'MT'">MTR</xsl:when>
        </xsl:choose>
      </ns1:VRKME>
    </ns1:E2EDP09001>
  </xsl:template>
  
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}

public bool LogicalEq(string val1, string val2) 
{  
bool ret = false;  
double d1 = 0;  
double d2 = 0;  
if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))  
{   ret = d1 == d2;  }
else  
{   
ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;  
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

public string StringSubstring(string str, string left, string right) 
{  
string retval = "";  
double dleft = 0;  
double dright = 0;  

if (str != null && IsNumeric(left, ref dleft) && IsNumeric(right, ref dright))  
{   
int lt = (int)dleft;   
int rt = (int)dright;   
lt--; 
rt--;   
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