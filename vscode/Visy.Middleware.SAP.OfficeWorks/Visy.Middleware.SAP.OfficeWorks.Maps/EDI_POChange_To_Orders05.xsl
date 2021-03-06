<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0" 
  version="1.0" 
  xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//740" 
  xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//740/Send" 
  xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
  xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
  xmlns:ns3="http://schemas.microsoft.com/2003/10/Serialization/" 
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:EFACT_D96A_ORDERS_EAN008" />
  </xsl:template>
  <xsl:template match="/s0:EFACT_D96A_ORDERS_EAN008">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;EDI_DC40&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;330&quot;)" /> 
    <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;2&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;ORDERS05&quot;)" />
    <xsl:variable name="var:v7" select="userCSharp:StringConcat(&quot;ORDERS&quot;)" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;X&quot;)" />
    <xsl:variable name="var:v9" select="userCSharp:StringConcat(&quot;SNDPOR&quot;)" />
    <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;KU&quot;)" />
   
    <xsl:variable name="var:v12" select="userCSharp:StringConcat(&quot;SAPSP1&quot;)" />
    <xsl:variable name="var:v13" select="userCSharp:StringConcat(&quot;L1&quot;)" />
    
    <xsl:variable name="var:v15" select="userCSharp:DateCurrentDate()" />
    <xsl:variable name="var:v17" select="userCSharp:DateCurrentTime()" />
    <xsl:variable name="var:v20" select="userCSharp:StringConcat(&quot;002&quot;)" />   
    
    <xsl:variable name="var:v23" select="userCSharp:StringConcat(&quot;AU&quot;)" />
    <xsl:variable name="var:v24" select="userCSharp:StringConcat(&quot;1&quot;)" />
   
    <xsl:variable name="var:v26" select="userCSharp:StringConcat(&quot;134097&quot;)" />
    <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;2105&quot;)" />   
    
    <xsl:variable name="var:vAG" select="userCSharp:StringConcat(&quot;AG&quot;)" />
    <xsl:variable name="var:vLF" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:vWE" select="userCSharp:StringConcat(&quot;WE&quot;)" />
    <xsl:variable name="var:vSpace" select="userCSharp:StringConcat(&quot; &quot;)" />
    <xsl:variable name="var:vEmpty" select="userCSharp:StringConcat(&quot;&quot;)" />
    <xsl:variable name="var:vCustomerName" select="userCSharp:StringConcat(&quot;OFFICEWORKS&quot;)" />
    <xsl:variable name="var:vPONumber" select="s0:BGM/BGM02/text()" />
    <xsl:variable name="var:vDeliveryDate" select="s0:DTM/s0:C507[C50701='2']/C50702/text()" />   
  

    <xsl:variable name="var:v31" select="userCSharp:StringSize(string($var:vWE))" />
    <xsl:variable name="var:v32" select="userCSharp:LogicalGt(string($var:v31) , &quot;0&quot;)" />
    <xsl:variable name="var:v33" select="userCSharp:StringSize(string($var:vEmpty))" />
    <xsl:variable name="var:v34" select="userCSharp:LogicalGt(string($var:v33) , &quot;0&quot;)" />
  
    
    <xsl:variable name="var:v37" select="userCSharp:StringConcat(&quot;001&quot;)" />
    <ns0:Send>
      <ns0:idocData>
        <ns1:EDI_DC40>
          <ns2:TABNAM>
            <xsl:value-of select="$var:v1" />
          </ns2:TABNAM>
          <ns2:MANDT>
            <xsl:value-of select="$var:v2" />
          </ns2:MANDT>
          <ns2:DOCNUM>
            <xsl:value-of select="$var:vSpace" />
          </ns2:DOCNUM>
          <ns2:DOCREL>
            <xsl:value-of select="$var:vEmpty" />
          </ns2:DOCREL>
          <ns2:STATUS>
            <xsl:value-of select="$var:vSpace" />
          </ns2:STATUS>
          <ns2:DIRECT>
            <xsl:value-of select="$var:v5" />
          </ns2:DIRECT>        
          <ns2:IDOCTYP>
            <xsl:value-of select="$var:v6" />
          </ns2:IDOCTYP>
          <ns2:MESTYP>
            <xsl:value-of select="$var:v7" />
          </ns2:MESTYP>
          <ns2:MESCOD>
            <xsl:value-of select="$var:vSpace" />
          </ns2:MESCOD>
          <ns2:MESFCT>
            <xsl:value-of select="$var:vSpace" />
          </ns2:MESFCT>
          <ns2:STD>
            <xsl:value-of select="$var:v8" />
          </ns2:STD>
          <ns2:STDVRS>
            <xsl:value-of select="$var:vSpace" />
          </ns2:STDVRS>
          <ns2:STDMES>
            <xsl:value-of select="$var:vSpace" />
          </ns2:STDMES>
          <ns2:SNDPOR>
            <xsl:value-of select="$var:v9" />
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="$var:v10" />
          </ns2:SNDPRT>
          <ns2:SNDPFC>
            <xsl:value-of select="$var:vAG" />
          </ns2:SNDPFC>
          <ns2:SNDSAD>
            <xsl:value-of select="$var:vSpace" />
          </ns2:SNDSAD>
          <ns2:SNDLAD>
            <xsl:value-of select="$var:vSpace" />
          </ns2:SNDLAD>
          <ns2:RCVPOR>
            <xsl:value-of select="$var:v12" />
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="$var:v13" />
          </ns2:RCVPRT>
          <ns2:RCVPFC>
            <xsl:value-of select="$var:vLF" />
          </ns2:RCVPFC>
          <ns2:RCVSAD>
            <xsl:value-of select="$var:vSpace" />
          </ns2:RCVSAD>
          <ns2:RCVLAD>
            <xsl:value-of select="$var:vSpace" />
          </ns2:RCVLAD>
          <xsl:variable name="var:v16" select="ScriptNS0:FormateDateNew(string($var:v15) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)" />
          <ns2:CREDAT>
            <xsl:value-of select="$var:v16" />
          </ns2:CREDAT>
          <xsl:variable name="var:v18" select="userCSharp:EDI_DC40_CRETIM_ReplaceColon(string($var:v17))" />
          <ns2:CRETIM>
            <xsl:value-of select="$var:v18" />
          </ns2:CRETIM>
          <ns2:REFINT>
            <xsl:value-of select="$var:vSpace" />
          </ns2:REFINT>
          <ns2:REFGRP>
            <xsl:value-of select="$var:vSpace" />
          </ns2:REFGRP>
          <ns2:REFMES>
            <xsl:value-of select="$var:vSpace" />
          </ns2:REFMES>
          <xsl:variable name="var:v19" select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
          <ns2:ARCKEY>
            <xsl:value-of select="$var:v19" />
          </ns2:ARCKEY>
          <ns2:SERIAL>
            <xsl:value-of select="$var:vSpace" />
          </ns2:SERIAL>
        </ns1:EDI_DC40>
        <ns1:E2EDK01005>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK01005</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:value-of select="$var:vEmpty" />
          </ns1:DATAHEADERCOLUMN_PSGNUM>     
          <xsl:if test="s0:BGM/BGM02">
            <ns1:BELNR>
              <xsl:value-of select="$var:vPONumber" />
            </ns1:BELNR>
          </xsl:if>        
        </ns1:E2EDK01005>
        <ns1:E2EDK14>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK14</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:value-of select="$var:vEmpty" />
          </ns1:DATAHEADERCOLUMN_PSGNUM>
          <ns1:DATAHEADERCOLUMN_HLEVEL>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>
            <xsl:value-of select="$var:vEmpty" />
          </ns1:QUALF>
        </ns1:E2EDK14>
        <ns1:E2EDK03>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK03</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:value-of select="$var:vEmpty" />
          </ns1:DATAHEADERCOLUMN_PSGNUM>
          <ns1:DATAHEADERCOLUMN_HLEVEL>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:IDDAT>
            <xsl:value-of select="$var:v20" />
          </ns1:IDDAT>
          <ns1:DATUM>
            <xsl:value-of select="$var:vDeliveryDate" />
          </ns1:DATUM>
        </ns1:E2EDK03>
        <ns1:E2EDK04001>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK04001</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK04001>
        <ns1:E2EDK05001>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK05001</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK05001>        
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:PARVW>
              <xsl:value-of select="$var:vWE" />
            </ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="s0:NADLoop1/s0:NAD[NAD01='ST']/s0:C082/C08201/text()" />
            </ns1:PARTN>
            <xsl:if test="string($var:v32)='true'">
              <ns1:NAME1>
                <xsl:value-of select="$var:vCustomerName" />
              </ns1:NAME1>
            </xsl:if>
            <xsl:if test="string($var:v34)='true'">
              <ns1:STRAS>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:STRAS>
            </xsl:if>
          </ns1:E2EDKA1003>
          <ns1:E2EDKA3>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2EDKA3>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:PARVW>
              <xsl:value-of select="$var:vLF" />
            </ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="s0:NADLoop1/s0:NAD[NAD01='SU']/s0:C082/C08201/text()" />
            </ns1:PARTN>
            <xsl:if test="string($var:v34)='true'">
              <ns1:NAME1>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:NAME1>
            </xsl:if>
            <xsl:if test="string($var:v34)='true'">
              <ns1:STRAS>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:STRAS>
            </xsl:if>
          </ns1:E2EDKA1003>
          <ns1:E2EDKA3>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2EDKA3>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:PARVW>
              <xsl:value-of select="$var:vAG" />
            </ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="s0:NADLoop1/s0:NAD[NAD01='ST']/s0:C082/C08201/text()" />
            </ns1:PARTN>           
          </ns1:E2EDKA1003>
          <ns1:E2EDKA3>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2EDKA3>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDK02>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK02</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM>
            <xsl:value-of select="$var:vEmpty" />
          </ns1:DATAHEADERCOLUMN_PSGNUM>
          <ns1:DATAHEADERCOLUMN_HLEVEL>
            <xsl:value-of select="$var:vSpace" />
          </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>
            <xsl:value-of select="$var:v37" />
          </ns1:QUALF>
          <xsl:if test="s0:BGM/BGM02">
            <ns1:BELNR>
              <xsl:value-of select="$var:vPONumber" />
            </ns1:BELNR>
          </xsl:if>
        </ns1:E2EDK02>
        <ns1:E2EDK17>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK17</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK17>
        <ns1:E2EDK18>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK18</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK18>
        <ns1:E2EDK35000>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK35000</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK35000>
        <ns1:E2EDK36000>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDK36000</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDK36000>
        <ns1:E2EDKT1002GRP>
          <ns1:E2EDKT1002>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKT1002</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:TDID>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:TDID>
          </ns1:E2EDKT1002>
          <ns1:E2EDKT2001>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDKT2001</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:TDLINE>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:TDLINE>
          </ns1:E2EDKT2001>
        </ns1:E2EDKT1002GRP>
        <xsl:for-each select="s0:LINLoop1">
          <xsl:variable name="var:v38" select="position()" />         
          <xsl:variable name="var:v49" select="userCSharp:StringConcat(&quot;002&quot;)" />
          <xsl:variable name="var:v50" select="userCSharp:StringConcat(&quot;001&quot;)" />
          <ns1:E2EDP01010GRP>
            <ns1:E2EDP01010>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP01010</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:POSEX>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:POSEX>
              <ns1:MENGE>
                <xsl:value-of select="s0:QTY_3/s0:C186_3/C18602/text()" />
              </ns1:MENGE>
              <ns1:MENEE>
                 <xsl:value-of select="'EA'" />              
              </ns1:MENEE>
              <xsl:if test="s0:PRILoop1/s0:PRI/s0:C509/C50902">
                <ns1:VPREI>
                  <xsl:value-of select="s0:PRILoop1/s0:PRI/s0:C509/C50902/text()" />
                </ns1:VPREI>
              </xsl:if>
            </ns1:E2EDP01010>
          
            <ns1:E2EDP02001>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDP02001</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_DOCNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_DOCNUM>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="'001'" />
                </ns1:QUALF>
                <ns1:BELNR>
                  <xsl:value-of select="$var:vPONumber" />
                </ns1:BELNR>
                 <xsl:if test="s0:LIN/LIN01">
                <ns1:ZEILE>
                  <xsl:value-of select="s0:LIN/LIN01/text()" />
                </ns1:ZEILE>
              </xsl:if>
            </ns1:E2EDP02001>
         
            <ns1:E2CUREF>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2CUREF</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:POSEX>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:POSEX>
            </ns1:E2CUREF>
            <ns1:E2ADDI1001>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2ADDI1001</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:ADDIMATNR>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:ADDIMATNR>
            </ns1:E2ADDI1001>
            <ns1:E2EDP03>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP03</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:IDDAT>
                <xsl:value-of select="$var:v49" />
              </ns1:IDDAT>
              <ns1:DATUM>
                <xsl:value-of select="$var:vDeliveryDate" />  
              </ns1:DATUM>
            </ns1:E2EDP03>
            <ns1:E2EDP04001>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP04001</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:MWSKZ>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:MWSKZ>
            </ns1:E2EDP04001>
            <ns1:E2EDP05002GRP>
              <ns1:E2EDP05002>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDP05002</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:ALCKZ>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:ALCKZ>
              </ns1:E2EDP05002>
              <ns1:E2EDPS5000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPS5000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
              </ns1:E2EDPS5000>
            </ns1:E2EDP05002GRP>
            <ns1:E2EDP20002>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP20002</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:WMENG>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:WMENG>
            </ns1:E2EDP20002>
            <ns1:E2EDPA1003GRP>
              <ns1:E2EDPA1003>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPA1003</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:PARVW>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:PARVW>
              </ns1:E2EDPA1003>
              <ns1:E2EDPA3>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPA3</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALP>
                  <xsl:value-of select="'001'" />
                </ns1:QUALP>
              </ns1:E2EDPA3>
            </ns1:E2EDPA1003GRP>
            <ns1:E2EDP19002>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP19002</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF>
                <xsl:value-of select="$var:v50" />
              </ns1:QUALF>
              <xsl:if test="s0:LIN/s0:C212/C21202">
                <ns1:IDTNR>
                  <xsl:value-of select="s0:LIN/s0:C212/C21201/text()" />
                </ns1:IDTNR>
              </xsl:if>
            </ns1:E2EDP19002>
            <ns1:E2EDPAD001GRP>
              <ns1:E2EDPAD001>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPAD001</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:QUALF>
              </ns1:E2EDPAD001>
              <ns1:E2TXTH1001GRP>
                <ns1:E2TXTH1001>
                  <ns1:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2TXTH1001</xsl:text>
                  </ns1:DATAHEADERCOLUMN_SEGNAM>
                  <ns1:DATAHEADERCOLUMN_MANDT>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_MANDT>
                  <ns1:DATAHEADERCOLUMN_SEGNUM>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_SEGNUM>
                  <ns1:DATAHEADERCOLUMN_PSGNUM>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:DATAHEADERCOLUMN_PSGNUM>
                  <ns1:DATAHEADERCOLUMN_HLEVEL>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_HLEVEL>
                  <ns1:FUNCTION>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:FUNCTION>
                </ns1:E2TXTH1001>
                <ns1:E2TXTP1>
                  <ns1:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2TXTP1</xsl:text>
                  </ns1:DATAHEADERCOLUMN_SEGNAM>
                  <ns1:DATAHEADERCOLUMN_MANDT>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_MANDT>
                  <ns1:DATAHEADERCOLUMN_SEGNUM>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_SEGNUM>
                  <ns1:DATAHEADERCOLUMN_PSGNUM>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:DATAHEADERCOLUMN_PSGNUM>
                  <ns1:DATAHEADERCOLUMN_HLEVEL>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_HLEVEL>
                  <ns1:TDFORMAT>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:TDFORMAT>
                </ns1:E2TXTP1>
              </ns1:E2TXTH1001GRP>
            </ns1:E2EDPAD001GRP>
            <ns1:E2EDP17001>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP17001</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF>
                <xsl:value-of select="$var:v50" />
              </ns1:QUALF>
            </ns1:E2EDP17001>
            <ns1:E2EDP18001>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP18001</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF>
                <xsl:value-of select="$var:v50" />
              </ns1:QUALF>
            </ns1:E2EDP18001>
            <ns1:E2EDP35000>
              <ns1:DATAHEADERCOLUMN_SEGNAM>
                <xsl:text>E2EDP35000</xsl:text>
              </ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM>
                <xsl:value-of select="$var:vEmpty" />
              </ns1:DATAHEADERCOLUMN_PSGNUM>
              <ns1:DATAHEADERCOLUMN_HLEVEL>
                <xsl:value-of select="$var:vSpace" />
              </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALZ>
                <xsl:value-of select="$var:v50" />
              </ns1:QUALZ>
            </ns1:E2EDP35000>
            <ns1:E2EDPT1001GRP>
              <ns1:E2EDPT1001>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPT1001</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:TDID>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:TDID>
              </ns1:E2EDPT1001>
              <ns1:E2EDPT2001>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDPT2001</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:TDLINE>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:TDLINE>
              </ns1:E2EDPT2001>
            </ns1:E2EDPT1001GRP>
            <ns1:E2EDC01GRP>
              <ns1:E2EDC01>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC01</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:SGTYP>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:SGTYP>
              </ns1:E2EDC01>
              <ns1:E2EDC02>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC02</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:QUALF>
              </ns1:E2EDC02>
              <ns1:E2EDC03>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC03</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:IDDAT>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:IDDAT>
              </ns1:E2EDC03>
              <ns1:E2EDC04>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC04</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:MWSKZ>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:MWSKZ>
              </ns1:E2EDC04>
              <ns1:E2EDC05>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC05</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:ALCKZ>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:ALCKZ>
              </ns1:E2EDC05>
              <ns1:E2EDC06000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC06000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:FORMELNR>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:FORMELNR>
              </ns1:E2EDC06000>
              <ns1:E2EDC07000>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC07000</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:USERF1_NUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:USERF1_NUM>
              </ns1:E2EDC07000>
              <ns1:E2EDCA1>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDCA1</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:PARVW>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:PARVW>
              </ns1:E2EDCA1>
              <ns1:E2EDC19>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC19</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:QUALF>
              </ns1:E2EDC19>
              <ns1:E2EDC17>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC17</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:QUALF>
              </ns1:E2EDC17>
              <ns1:E2EDC18>
                <ns1:DATAHEADERCOLUMN_SEGNAM>
                  <xsl:text>E2EDC18</xsl:text>
                </ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:DATAHEADERCOLUMN_PSGNUM>
                <ns1:DATAHEADERCOLUMN_HLEVEL>
                  <xsl:value-of select="$var:vSpace" />
                </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:QUALF>
                  <xsl:value-of select="$var:vEmpty" />
                </ns1:QUALF>
              </ns1:E2EDC18>
              <ns1:E2EDCT1GRP>
                <ns1:E2EDCT1>
                  <ns1:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2EDCT1</xsl:text>
                  </ns1:DATAHEADERCOLUMN_SEGNAM>
                  <ns1:DATAHEADERCOLUMN_MANDT>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_MANDT>
                  <ns1:DATAHEADERCOLUMN_SEGNUM>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_SEGNUM>
                  <ns1:DATAHEADERCOLUMN_PSGNUM>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:DATAHEADERCOLUMN_PSGNUM>
                  <ns1:DATAHEADERCOLUMN_HLEVEL>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_HLEVEL>
                  <ns1:TDID>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:TDID>
                </ns1:E2EDCT1>
                <ns1:E2EDCT2>
                  <ns1:DATAHEADERCOLUMN_SEGNAM>
                    <xsl:text>E2EDCT2</xsl:text>
                  </ns1:DATAHEADERCOLUMN_SEGNAM>
                  <ns1:DATAHEADERCOLUMN_MANDT>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_MANDT>
                  <ns1:DATAHEADERCOLUMN_SEGNUM>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_SEGNUM>
                  <ns1:DATAHEADERCOLUMN_PSGNUM>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:DATAHEADERCOLUMN_PSGNUM>
                  <ns1:DATAHEADERCOLUMN_HLEVEL>
                    <xsl:value-of select="$var:vSpace" />
                  </ns1:DATAHEADERCOLUMN_HLEVEL>
                  <ns1:TDLINE>
                    <xsl:value-of select="$var:vEmpty" />
                  </ns1:TDLINE>
                </ns1:E2EDCT2>
              </ns1:E2EDCT1GRP>
            </ns1:E2EDC01GRP>
          </ns1:E2EDP01010GRP>
        </xsl:for-each>
        <ns1:E2CUCFG003GRP>
          <ns1:E2CUCFG003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2CUCFG003</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2CUCFG003>
          <ns1:E2CUINS002>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2CUINS002</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2CUINS002>
          <ns1:E2CUPRT002>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2CUPRT002</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2CUPRT002>
          <ns1:E2CUVAL002>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2CUVAL002</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2CUVAL002>
          <ns1:E2CUBLB000>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2CUBLB000</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
          </ns1:E2CUBLB000>
        </ns1:E2CUCFG003GRP>
        <ns1:E2EDL37005GRP>
          <ns1:E2EDL37005>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDL37005</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:EXIDV>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:EXIDV>
          </ns1:E2EDL37005>
          <ns1:E2EDL39000>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDL39000</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:QUALF>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:QUALF>
          </ns1:E2EDL39000>
          <ns1:E2EDL38>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDL38</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:VEGR1_BEZ>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:VEGR1_BEZ>
          </ns1:E2EDL38>
          <ns1:E2EDL44004>
            <ns1:DATAHEADERCOLUMN_SEGNAM>
              <xsl:text>E2EDL44004</xsl:text>
            </ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL>
              <xsl:value-of select="$var:vSpace" />
            </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:VELIN>
              <xsl:value-of select="$var:vEmpty" />
            </ns1:VELIN>
          </ns1:E2EDL44004>
        </ns1:E2EDL37005GRP>
        <ns1:E2EDS01>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDS01</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDS01>
      </ns0:idocData>
    </ns0:Send>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
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