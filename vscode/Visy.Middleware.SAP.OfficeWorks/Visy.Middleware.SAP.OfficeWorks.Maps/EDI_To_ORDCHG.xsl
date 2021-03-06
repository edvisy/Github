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
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
  xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:EFACT_D96A_ORDCHG_EAN005" />
  </xsl:template>
  <xsl:template match="/s0:EFACT_D96A_ORDCHG_EAN005">

    <xsl:variable name="var:vAG" select="userCSharp:StringConcat(&quot;AG&quot;)" />
    <xsl:variable name="var:vLF" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:vWE" select="userCSharp:StringConcat(&quot;WE&quot;)" />
    <xsl:variable name="var:vSpace" select="userCSharp:StringConcat(&quot; &quot;)" />
    <xsl:variable name="var:vEmpty" select="userCSharp:StringConcat(&quot;&quot;)" />
    <xsl:variable name="var:vCustomerName" select="userCSharp:StringConcat(&quot;OFFICEWORKS&quot;)" />
    <xsl:variable name="var:vPONumber" select="s0:BGM/BGM02/text()" />
    <xsl:variable name="var:vDeliveryDate" select="s0:DTM/s0:C507[C50701='2']/C50702/text()" />
    <xsl:variable name="var:vVendorNumber"  select="s0:NADLoop1/s0:NAD[NAD01='ST']/s0:C082/C08201/text()" />
    
    <xsl:variable name="var:RcvPor" select="ScriptNS1:GetLookupValue(&quot;RcvPor&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrn" select="ScriptNS1:GetLookupValue(&quot;RcvPrn&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrt" select="ScriptNS1:GetLookupValue(&quot;RcvPrt&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPfc" select="ScriptNS1:GetLookupValue(&quot;RcvPfc&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPor" select="ScriptNS1:GetLookupValue(&quot;SndPor&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrn" select="ScriptNS1:GetLookupValue(&quot;SndPrn&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrt" select="ScriptNS1:GetLookupValue(&quot;SndPrt&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPfc" select="ScriptNS1:GetLookupValue(&quot;SndPfc&quot; , &quot;SAP.OfficeWorks.SAPConnection&quot;)" />

    <xsl:variable name="var:v31" select="userCSharp:StringSize(string($var:vWE))" />
    <xsl:variable name="var:v32" select="userCSharp:LogicalGt(string($var:v31) , &quot;0&quot;)" />
    <xsl:variable name="var:v33" select="userCSharp:StringSize(string($var:vEmpty))" />
    <xsl:variable name="var:v34" select="userCSharp:LogicalGt(string($var:v33) , &quot;0&quot;)" />

    <xsl:variable name="var:v37" select="userCSharp:StringConcat(&quot;001&quot;)" />
    <ns0:Send>
      <ns0:idocData>
        <ns1:EDI_DC40>
          <ns2:TABNAM>EDI_DC40</ns2:TABNAM>
          <ns2:MANDT>330</ns2:MANDT>
          <ns2:DOCNUM> </ns2:DOCNUM>
          <ns2:DOCREL/>
          <ns2:STATUS> </ns2:STATUS>
          <ns2:DIRECT>2</ns2:DIRECT>
          <ns2:IDOCTYP>ORDERS05</ns2:IDOCTYP>
          <ns2:MESTYP>ORDCHG</ns2:MESTYP>
          <ns2:MESCOD> </ns2:MESCOD>
          <ns2:MESFCT> </ns2:MESFCT>
          <ns2:STD>X</ns2:STD>
          <ns2:STDVRS> </ns2:STDVRS>
          <ns2:STDMES> </ns2:STDMES>
          <ns2:SNDPOR><xsl:value-of select="$var:SndPor"/></ns2:SNDPOR>
			    <ns2:SNDPRT><xsl:value-of select="$var:SndPrt"/></ns2:SNDPRT>
			    <ns2:SNDPFC><xsl:value-of select="$var:SndPfc"/></ns2:SNDPFC>
          <ns2:SNDPRN><xsl:value-of select="$var:SndPrn"/></ns2:SNDPRN>          
			    <ns2:SNDSAD> </ns2:SNDSAD>
			    <ns2:SNDLAD> </ns2:SNDLAD>
			    <ns2:RCVPOR><xsl:value-of select="$var:RcvPor"/></ns2:RCVPOR>
			    <ns2:RCVPRT><xsl:value-of select="$var:RcvPrt"/></ns2:RCVPRT>
			    <ns2:RCVPFC><xsl:value-of select="$var:RcvPfc"/></ns2:RCVPFC>
          <ns2:RCVPRN><xsl:value-of select="$var:RcvPrn"/></ns2:RCVPRN>        
          <ns2:RCVSAD> </ns2:RCVSAD>
          <ns2:RCVLAD> </ns2:RCVLAD>
          <ns2:CREDAT>
            <xsl:value-of select="ScriptNS0:FormateDateNew(string(userCSharp:DateCurrentDate()) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)"></xsl:value-of>
          </ns2:CREDAT>
          <ns2:CRETIM>
            <xsl:value-of select="userCSharp:EDI_DC40_CRETIM_ReplaceColon(string(userCSharp:DateCurrentTime()))"></xsl:value-of>
          </ns2:CRETIM>
          <ns2:REFINT> </ns2:REFINT>
          <ns2:REFGRP> </ns2:REFGRP>
          <ns2:REFMES> </ns2:REFMES>
          <ns2:ARCKEY>
            <xsl:value-of select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
          </ns2:ARCKEY>
          <ns2:SERIAL> </ns2:SERIAL>
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
          <ns1:IDDAT><xsl:value-of select="'002'" /></ns1:IDDAT>
          <ns1:DATUM>
            <xsl:value-of select="$var:vDeliveryDate" />
          </ns1:DATUM>
        </ns1:E2EDK03>      
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
            <ns1:LIFNR>
              <xsl:value-of select="$var:vVendorNumber" />
            </ns1:LIFNR>
            <xsl:if test="string($var:v32)='true'">
              <ns1:NAME1>
                <xsl:value-of select="$var:vCustomerName" />
              </ns1:NAME1>
            </xsl:if>
          </ns1:E2EDKA1003>          
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
          </ns1:E2EDKA1003>         
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
            <ns1:LIFNR>
              <xsl:value-of select="$var:vVendorNumber" />
            </ns1:LIFNR>
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
        <xsl:for-each select="s0:LINLoop1/s0:LOCLoop2">
          <xsl:variable name="var:v38" select="position()" />                 
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
              <xsl:if test="../s0:LIN/LIN01">
                <ns1:POSEX>
                  <xsl:value-of select="userCSharp:MathInt(string(../s0:LIN/LIN01/text()))" />
                </ns1:POSEX>
              </xsl:if>
              <ns1:MENGE>
                <xsl:value-of select="s0:QTY_5/s0:C186_5/C18602/text()" />
              </ns1:MENGE>
              <ns1:MENEE>
                <xsl:value-of select="'EA'" />
              </ns1:MENEE>
              <xsl:if test="../s0:PRILoop1/s0:PRI/s0:C509/C50902">
                <ns1:VPREI>
                  <xsl:value-of select="../s0:PRILoop1/s0:PRI/s0:C509/C50902/text()" />
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
              <!--<xsl:if test="s0:LIN/LIN01">
                <ns1:ZEILE>
                  <xsl:value-of select="s0:LIN/LIN01/text()" />
                </ns1:ZEILE>
              </xsl:if>-->
            </ns1:E2EDP02001>   
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
                 <xsl:value-of select="'002'" />
              </ns1:IDDAT>
              <ns1:DATUM>
                <xsl:value-of select="$var:vDeliveryDate" />
              </ns1:DATUM>
            </ns1:E2EDP03> 
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
                <ns1:PARVW>ZW</ns1:PARVW>
                <ns1:LIFNR>
                  <xsl:value-of select="s0:LOC_5/s0:C517_5/C51701/text()" />
                </ns1:LIFNR>
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
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP19002</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF><xsl:value-of select="'001'" /></ns1:QUALF>
              <xsl:if test="../s0:LIN/s0:C212/C21202">
                <ns1:IDTNR>
                  <xsl:value-of select="../s0:LIN/s0:C212/C21201/text()" />
                </ns1:IDTNR>
              </xsl:if>
              <ns1:KTEXT>TC</ns1:KTEXT>
            </ns1:E2EDP19002>
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
                <xsl:value-of select="'001'" />
              </ns1:QUALF>
            </ns1:E2EDP17001>
            <!--<ns1:E2EDP18001>
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
                <xsl:value-of select="'001'" />
              </ns1:QUALF>
            </ns1:E2EDP18001>-->
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
                <xsl:value-of select="'001'" />
              </ns1:QUALZ>
            </ns1:E2EDP35000>
          </ns1:E2EDP01010GRP>
        </xsl:for-each>
        
        <ns1:E2EDS01>
          <ns1:DATAHEADERCOLUMN_SEGNAM>
            <xsl:text>E2EDS01</xsl:text>
          </ns1:DATAHEADERCOLUMN_SEGNAM>
        </ns1:E2EDS01>
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

 public string MathInt(string val)
        {
	        string retval = "";
	        double d = 0;
	        if (IsNumeric(val, ref d))
	        {
		        try
		        {
			        int i = Convert.ToInt32(d, System.Globalization.CultureInfo.InvariantCulture);
			        if (i > d)
			        {
				        i = i-1;
			        }
			        retval = i.ToString(System.Globalization.CultureInfo.InvariantCulture);
		        }
		        catch (Exception)
		        {
		        }
	        }
	        return retval;
        }
]]>
  </msxsl:script>
</xsl:stylesheet>