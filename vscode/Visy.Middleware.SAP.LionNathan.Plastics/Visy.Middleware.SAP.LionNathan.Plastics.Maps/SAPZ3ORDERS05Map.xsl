<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:ns0="http://Z3ORDERS05.V3" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:EFACT_D01B_ORDERS_EAN010" />
  </xsl:template>
  <xsl:template match="/s0:EFACT_D01B_ORDERS_EAN010">
    <xsl:variable name="var:PONumber" select="string(s0:BGM/s0:C106/C10601/text())" />
    <xsl:variable name="var:PODate" select="string(s0:DTM/s0:C507/C50702/text())" />  
    <ns0:Z3ORDERS05>

      <xsl:for-each select="s0:NADLoop1">
        <xsl:variable name="var:NADIdentifier" select="string(s0:NAD/NAD01/text())" />
        <xsl:variable name="var:NADID" select="string(s0:NAD/s0:C082/C08201/text())" />

        <xsl:if test="string($var:NADIdentifier)='BY'">
          <xsl:for-each select="s0:FII">
            <xsl:variable name="var:FIIIdentifier" select="string(FII01/text())" />
            <xsl:if test="string($var:FIIIdentifier)='AP'">
              <xsl:variable name="var:vsetAPValue" select="userCSharp:AddListData('vsetAPValue', string(s0:C078/C07801/text()))" />
            </xsl:if>
            <xsl:if test="string($var:FIIIdentifier)='DP'">
              <xsl:variable name="var:vsetDPValue" select="userCSharp:AddListData('vsetDPValue', string(s0:C078/C07801/text()))" />
              <xsl:variable name="var:vsetDPName" select="userCSharp:AddListData('vsetDPName', string(s0:C078/C07802/text()))" />
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="s0:RFFLoop2">
            <xsl:variable name="var:RFFLoop2Identifier" select="string(s0:RFF_2/s0:C506_2/C50601/text())" />
            <xsl:if test="string($var:RFFLoop2Identifier)='IT'">
              <xsl:variable name="var:vSetPOType" select="userCSharp:AddListData('vSetPOType', string(s0:RFF_2/s0:C506_2/C50602/text()))" />
            </xsl:if>
            <xsl:if test="string($var:RFFLoop2Identifier)='VA'">
              <xsl:variable name="var:vSetCompCode" select="userCSharp:AddListData('vSetCompCode', string(s0:RFF_2/s0:C506_2/C50602/text()))" />
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="string($var:NADIdentifier)='SU'">
          <xsl:variable name="var:vsetNADIDSU" select="userCSharp:AddListData('vsetNADIDSU', string($var:NADID))" />
        </xsl:if>
        <xsl:if test="string($var:NADIdentifier)='ST'">
          <xsl:variable name="var:vsetNADIDST" select="userCSharp:AddListData('vsetNADIDST', string($var:NADID))" />
        </xsl:if>
      </xsl:for-each>

      <xsl:variable name="var:vgetAPValue" select="userCSharp:getListData('vsetAPValue')" />
      <xsl:variable name="var:vgetDPValue" select="userCSharp:getListData('vsetDPValue')" />
      <xsl:variable name="var:vgetDPName" select="userCSharp:getListData('vsetDPName')" />
      <xsl:variable name="var:vgetPOType" select="userCSharp:getListData('vSetPOType')" />
      <xsl:variable name="var:vgetCompCode" select="userCSharp:getListData('vSetCompCode')" />
      <xsl:variable name="var:vgetNADIDSU" select="userCSharp:getListData('vsetNADIDSU')" />
      <xsl:variable name="var:vgetNADIDST" select="userCSharp:getListData('vsetNADIDST')" />
      <xsl:variable name="var:GetLionsPlasticDairyOrdersDetails" select="ScriptNS0:GetLionPlasticsDairyOrdersWithPipes($var:vgetNADIDST, $var:vgetNADIDSU)" />
      <xsl:variable name="var:vLionsPlantCode" select="ScriptNS0:GetValueFromDelimeteredList($var:GetLionsPlasticDairyOrdersDetails, '|', '1')" />
      <xsl:variable name="var:vSoldToCode" select="ScriptNS0:GetValueFromDelimeteredList($var:GetLionsPlasticDairyOrdersDetails, '|', '2')" />      
      <xsl:variable name="var:vShipToCode" select="ScriptNS0:GetValueFromDelimeteredList($var:GetLionsPlasticDairyOrdersDetails, '|', '3')" />      
      <EDI_DC40>
        <TABNAM>
          <xsl:text>EDI_DC40</xsl:text>
        </TABNAM>
        <MANDT>
          <xsl:text></xsl:text>
        </MANDT>
        <DOCNUM>
          <xsl:text>1</xsl:text>
        </DOCNUM>
        <DOCREL>
          <xsl:text></xsl:text>
        </DOCREL>
        <STATUS>
          <xsl:text> </xsl:text>
        </STATUS>
        <DIRECT>
          <xsl:text> </xsl:text>
        </DIRECT>
        <OUTMOD>
          <xsl:text> </xsl:text>
        </OUTMOD>
        <EXPRSS>
          <xsl:text> </xsl:text>
        </EXPRSS>
        <TEST>
          <xsl:text> </xsl:text>
        </TEST>
        <IDOCTYP>
          <xsl:text> </xsl:text>
        </IDOCTYP>
        <CIMTYP>
          <xsl:text> </xsl:text>
        </CIMTYP>
        <MESTYP>
          <xsl:text> </xsl:text>
        </MESTYP>
        <MESCOD>
          <xsl:text> </xsl:text>
        </MESCOD>
        <MESFCT>
          <xsl:text> </xsl:text>
        </MESFCT>
        <STD>
          <xsl:text> </xsl:text>
        </STD>
        <STDVRS>
          <xsl:text> </xsl:text>
        </STDVRS>
        <STDMES>
          <xsl:text> </xsl:text>
        </STDMES>
        <SNDPOR>
          <xsl:text> </xsl:text>
        </SNDPOR>
        <SNDPRT>
          <xsl:text> </xsl:text>
        </SNDPRT>
        <SNDPFC>
          <xsl:text> </xsl:text>
        </SNDPFC>
        <SNDPRN>
          <xsl:value-of select="$var:vSoldToCode" />
        </SNDPRN>
        <SNDSAD>
          <xsl:text> </xsl:text>
        </SNDSAD>
        <SNDLAD>
          <xsl:text> </xsl:text>
        </SNDLAD>
        <RCVPOR>
          <xsl:text> </xsl:text>
        </RCVPOR>
        <RCVPRT>
          <xsl:text> </xsl:text>
        </RCVPRT>
        <RCVPFC>
          <xsl:text> </xsl:text>
        </RCVPFC>
        <RCVPRN>
          <xsl:value-of select="$var:vLionsPlantCode" />
        </RCVPRN>
        <RCVSAD>
          <xsl:text> </xsl:text>
        </RCVSAD>
        <RCVLAD>
          <xsl:text> </xsl:text>
        </RCVLAD>
        <CREDAT>
          <xsl:text>        </xsl:text>
        </CREDAT>
        <CRETIM>
          <xsl:text>      </xsl:text>
        </CRETIM>
        <REFINT>
          <xsl:text> </xsl:text>
        </REFINT>
        <REFGRP>
          <xsl:text> </xsl:text>
        </REFGRP>
        <REFMES>
          <xsl:text> </xsl:text>
        </REFMES>
        <ARCKEY>
          <xsl:text> </xsl:text>
        </ARCKEY>
        <SERIAL>
          <xsl:text> </xsl:text>
        </SERIAL>
      </EDI_DC40>

      <E2EDK01005GRP>
        <E1EDK01>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK01005</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <ACTION>
            <xsl:text />
          </ACTION>
          <BELNR>
            <xsl:value-of select="$var:PONumber" />
          </BELNR>
        </E1EDK01>
        <Z1E1EDK01>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>Z2E1EDK01000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PO_TYPE>
            <xsl:value-of select="$var:vgetPOType" />
          </PO_TYPE>
          <AP_VALUE>
            <xsl:value-of select="$var:vgetAPValue" />
          </AP_VALUE>
          <DP_VALUE>
            <xsl:value-of select="$var:vgetDPValue" />
          </DP_VALUE>
          <DP_NAME>
            <xsl:value-of select="$var:vgetDPName" />
          </DP_NAME>
          <COMP_CODE>
            <xsl:value-of select="$var:vgetCompCode" />
          </COMP_CODE>
        </Z1E1EDK01>
      </E2EDK01005GRP>

      <E1EDK14>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK14</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK14>
      <E1EDK03>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK03</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <IDDAT>
          <xsl:value-of select="'022'" />
        </IDDAT>
        <DATUM>
          <xsl:value-of select="$var:PODate" />
        </DATUM>
      </E1EDK03>
      <E1EDK04>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK04001</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <MWSKZ>
          <xsl:text />
        </MWSKZ>
      </E1EDK04>
      <E1EDK05>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK05001</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <ALCKZ>
          <xsl:text />
        </ALCKZ>
      </E1EDK05>
      <xsl:for-each select="s0:NADLoop1">
        <xsl:variable name="var:NADIdentifier" select="string(s0:NAD/NAD01/text())" />
        <xsl:variable name="var:NADID" select="string(s0:NAD/s0:C082/C08201/text())" />
        <xsl:variable name="var:NADName" select="string(s0:NAD/s0:C080/C08001/text())" />
        <xsl:variable name="var:NADStreet" select="string(s0:NAD/s0:C059/C05901/text())" />
        <xsl:variable name="var:NADCity" select="string(s0:NAD/NAD06/text())" />
        <xsl:variable name="var:NADState" select="string(s0:NAD/s0:C819/C81901/text())" />
        <xsl:variable name="var:NADZipCode" select="string(s0:NAD/NAD08/text())" />        
        <xsl:if test="string($var:NADIdentifier)='ST'">

          <E2EDKA1003GRP>
            <E1EDKA1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKA1003</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <PARVW>
                <xsl:value-of select="'WE'" />
              </PARVW>
              <PARTN>
                <xsl:value-of select="$var:vShipToCode" />
              </PARTN>
              <NAME1>
                <xsl:value-of select="$var:NADName" />
              </NAME1>
              <STRAS>
                <xsl:value-of select="$var:NADStreet" />
              </STRAS>
              <ORT01>
                <xsl:value-of select="$var:NADCity" />
              </ORT01>
              <PSTLZ>
                <xsl:value-of select="$var:NADZipCode" />
              </PSTLZ>
              <LAND1>
                <xsl:value-of select="'AU'" />
              </LAND1>
              <xsl:for-each select="s0:CTALoop1">
                <xsl:for-each select="s0:COM">
                  <xsl:variable name="var:CTAIdentifier" select="string(s0:C076/C07602/text())" />
                  <xsl:variable name="var:CTANumber" select="string(s0:C076/C07601/text())" />
                  <xsl:if test="string($var:CTAIdentifier)='TE'">
                    <TELF1>
                      <xsl:value-of select="$var:CTANumber" />
                    </TELF1>
                  </xsl:if>
                  <xsl:if test="string($var:CTAIdentifier)='FX'">
                    <TELFX>
                      <xsl:value-of select="$var:CTANumber" />
                    </TELFX>
                  </xsl:if>
                </xsl:for-each>
              </xsl:for-each>
              <REGIO>
                <xsl:value-of select="$var:NADState" />
              </REGIO>
            </E1EDKA1>
            <E1EDKA3>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKA3</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALP>
                <xsl:text />
              </QUALP>
            </E1EDKA3>
          </E2EDKA1003GRP>
        </xsl:if>
      </xsl:for-each>
      
      <E2EDKA1003GRP>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="'LF'" />
          </PARVW>
          <PARTN>
			<xsl:value-of select="$var:vLionsPlantCode" />
          </PARTN>

        </E1EDKA1>
        <E1EDKA3>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <QUALP>
            <xsl:text />
          </QUALP>
        </E1EDKA3>
      </E2EDKA1003GRP>

      <E2EDKA1003GRP>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="'AG'" />
          </PARVW>
          <PARTN>
			<xsl:value-of select="$var:vSoldToCode" />
          </PARTN>

        </E1EDKA1>
        <E1EDKA3>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <QUALP>
            <xsl:text />
          </QUALP>
        </E1EDKA3>
      </E2EDKA1003GRP>

      
      
      <E1EDK02>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK02</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:value-of select="'001'" />
        </QUALF>
        <BELNR>
          <xsl:value-of select="$var:PONumber" />
        </BELNR>
      </E1EDK02>
      <E1EDK17>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK17</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK17>
      <E1EDK18>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK18</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK18>
      <E1EDK35>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK35000</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALZ>
          <xsl:text />
        </QUALZ>
      </E1EDK35>
      <E1EDK36>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK36000</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <CCINS>
          <xsl:text />
        </CCINS>
      </E1EDK36>
      <E2EDKT1002GRP>
        <E1EDKT1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKT1002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <TDID>
            <xsl:text />
          </TDID>
        </E1EDKT1>
        <E1EDKT2>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKT2001</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <TDLINE>
            <xsl:text />
          </TDLINE>
        </E1EDKT2>
      </E2EDKT1002GRP>MENGE
      <xsl:for-each select="s0:LINLoop1">
        <xsl:variable name="var:LinLineNumber" select="number(s0:LIN/LIN01/text())" />
        <xsl:variable name="var:LinPrice" select="string(s0:PRILoop1/s0:PRI/s0:C509/C50902/text())" />
        <xsl:variable name="var:LinUnitPrice" select="string(s0:PRILoop1/s0:PRI/s0:C509/C50905/text())" />
        <xsl:variable name="var:LinUOM" select="string(s0:PRILoop1/s0:PRI/s0:C509/C50906/text())" />
        <xsl:variable name="var:LinMaterial" select="number(s0:PIA[1]/s0:C212_2/C21201/text())" />
        <xsl:variable name="var:LinMaterialDesc" select="string(s0:IMD_2/s0:C273_2/C27304/text())" />
        <xsl:variable name="var:LinDeliveryDate" select="string(s0:DTM_13/s0:C507_13/C50702/text())" />
        <xsl:variable name="var:LinLoc" select="string(s0:LOCLoop2/s0:LOC_5/s0:C517_5/C51701/text())" />
        <xsl:variable name="var:LinContractQUALF" select="string(s0:RFFLoop3/s0:RFF_6/s0:C506_6/C50601/text())" />
        <xsl:variable name="var:LinContractNo" select="string(s0:RFFLoop3/s0:RFF_6/s0:C506_6/C50602/text())" />
        <xsl:variable name="var:LinContractLineNo" select="string(s0:RFFLoop3/s0:RFF_6/s0:C506_6/C50603/text())" />
        
        <E2EDP01007GRP>
          <E1EDP01>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP01007</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />               
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <POSEX>
              <xsl:text />
            </POSEX>
            <xsl:for-each select="s0:QTY_3">
              <xsl:variable name="var:LinQTYIdentifier" select="string(s0:C186_3/C18601/text())" />
              <xsl:variable name="var:LinQTYValue" select="string(s0:C186_3/C18602/text())" />
              <xsl:variable name="var:LinQTYUOM" select="string(s0:C186_3/C18603/text())" />
              <xsl:if test="string($var:LinQTYIdentifier)='21'">
                <MENGE>
                  <xsl:value-of select="$var:LinQTYValue" />
                </MENGE>
                <MENEE>
                  <xsl:value-of select="$var:LinQTYUOM" />
                </MENEE>
              </xsl:if>
            </xsl:for-each>
            <PMENE>
              <xsl:value-of select="$var:LinUOM" />
            </PMENE>
            <VPREI>
              <xsl:value-of select="$var:LinPrice" />
            </VPREI>
            <PEINH>
              <xsl:value-of select="$var:LinUnitPrice" />
            </PEINH>
          </E1EDP01>
          <Z1E1EDP1>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>Z2E1EDP1000</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />                
              <PSGNUM />               
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <LOCATION>
              <xsl:value-of select="$var:LinLoc" />
            </LOCATION>
            <xsl:for-each select="s0:QTY_3">
              <xsl:variable name="var:LinQTYIdentifier" select="string(s0:C186_3/C18601/text())" />
              <xsl:variable name="var:LinQTYValue" select="string(s0:C186_3/C18602/text())" />
              <xsl:variable name="var:LinQTYUOM" select="string(s0:C186_3/C18603/text())" />
              <xsl:if test="string($var:LinQTYIdentifier)='59'">
                <MENGE>
                  <xsl:value-of select="$var:LinQTYValue" />
                </MENGE>
                <MENEE>
                  <xsl:value-of select="$var:LinQTYUOM" />
                </MENEE>
              </xsl:if>
            </xsl:for-each>
            <DATUM>
              <xsl:value-of select="$var:LinDeliveryDate" />
            </DATUM>

          </Z1E1EDP1>
          <xsl:if test="../s0:BGM/s0:C106/C10601">
            <E1EDP02>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDP02001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />                 
                <PSGNUM />                 
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:value-of select="'001'" />
              </QUALF>
              <BELNR>
                <xsl:value-of select="../s0:BGM/s0:C106/C10601/text()" />
              </BELNR>
              <ZEILE>
                <xsl:value-of select="$var:LinLineNumber" />
              </ZEILE>
            </E1EDP02>
          </xsl:if>
          <E1EDP02>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP02001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:value-of select="'044'" />
            </QUALF>
            <BELNR>
              <xsl:value-of select="$var:LinContractNo" />
            </BELNR>
            <ZEILE>
              <xsl:value-of select="$var:LinContractLineNo" />
            </ZEILE>
          </E1EDP02>          
          <E1CUREF>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2CUREF</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <POSEX>
              <xsl:text />
            </POSEX>
          </E1CUREF>
          <E1ADDI1>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2ADDI1001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <ADDIMATNR>
              <xsl:text />
            </ADDIMATNR>
          </E1ADDI1>
          <E1EDP03>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP03</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <IDDAT>
              <xsl:value-of select="'002'" />
            </IDDAT>
            <DATUM>
              <xsl:value-of select="$var:LinDeliveryDate" />
            </DATUM>
          </E1EDP03>
          <E1EDP04>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP04001</xsl:text>
              </SEGNAM>
              <MANDT>/IDTNR
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <MWSKZ>
              <xsl:text />
            </MWSKZ>
          </E1EDP04>
          <E2EDP05002GRP>
            <E1EDP05>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDP05002</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <ALCKZ>
                <xsl:text />
              </ALCKZ>
            </E1EDP05>
            <E1EDPS5>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPS5000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
            </E1EDPS5>
          </E2EDP05002GRP>
          <E1EDP20>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP20001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <WMENG>
              <xsl:text />
            </WMENG>
          </E1EDP20>
          <E2EDPA1003GRP>
            <E1EDPA1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPA1003</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <PARVW>
                <xsl:text />
              </PARVW>
            </E1EDPA1>
            <E1EDPA3>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPA3</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALP>
                <xsl:text />
              </QUALP>
            </E1EDPA3>
          </E2EDPA1003GRP>
          <E1EDP19>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP19001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:value-of select="'001'" />
            </QUALF>
            <IDTNR>
              <xsl:value-of select="$var:LinMaterial" />
            </IDTNR>
            <KTEXT>
              <xsl:value-of select="$var:LinMaterialDesc" />
            </KTEXT>
          </E1EDP19>
          <E2EDPAD001GRP>
            <E1EDPAD>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPAD001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDPAD>
            <E2TXTH1001GRP>
              <E1TXTH1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2TXTH1001</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM />
                  <PSGNUM />
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <FUNCTION>
                  <xsl:text />
                </FUNCTION>
              </E1TXTH1>
              <E1TXTP1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2TXTP1</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM />
                  <PSGNUM />
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <TDFORMAT>
                  <xsl:text />
                </TDFORMAT>
              </E1TXTP1>
            </E2TXTH1001GRP>
          </E2EDPAD001GRP>
          <E1EDP17>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP17001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:text />
            </QUALF>
          </E1EDP17>
          <E1EDP18>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP18001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:text />
            </QUALF>
          </E1EDP18>
          <E1EDP35>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP35000</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM />
              <PSGNUM />
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <QUALZ>
              <xsl:text />
            </QUALZ>
          </E1EDP35>
          <E2EDPT1001GRP>
            <E1EDPT1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPT1001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDID>
                <xsl:text />
              </TDID>
            </E1EDPT1>
            <E1EDPT2>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPT2001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDLINE>
                <xsl:text />
              </TDLINE>
            </E1EDPT2>
          </E2EDPT1001GRP>
          <E2EDC01GRP>
            <E1EDC01>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC01</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM />
                <PSGNUM />
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <SGTYP>
                <xsl:text />
              </SGTYP>
            </E1EDC01>
            <E1EDC02>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC02</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>              
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC02>
            <E1EDC03>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC03</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <IDDAT>
                <xsl:text />
              </IDDAT>
            </E1EDC03>
            <E1EDC04>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC04</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <MWSKZ>
                <xsl:text />
              </MWSKZ>
            </E1EDC04>
            <E1EDC05>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC05</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <ALCKZ>
                <xsl:text />
              </ALCKZ>
            </E1EDC05>
            <E1EDC06>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC06000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <FORMELNR>
                <xsl:text />
              </FORMELNR>
            </E1EDC06>
            <E1EDC07>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC07000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <USERF1_NUM>
                <xsl:text />
              </USERF1_NUM>
            </E1EDC07>
            <E1EDCA1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDCA1</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <PARVW>
                <xsl:text />
              </PARVW>
            </E1EDCA1>
            <E1EDC19>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC19</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC19>
            <E1EDC17>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC17</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC17>
            <E1EDC18>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC18</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC18>
            <E2EDCT1GRP>
              <E1EDCT1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDCT1</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text> </xsl:text>
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text> </xsl:text>
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <TDID>
                  <xsl:text />
                </TDID>
              </E1EDCT1>
              <E1EDCT2>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDCT2</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text> </xsl:text>
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text> </xsl:text>
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <TDLINE>
                  <xsl:text />
                </TDLINE>
              </E1EDCT2>
            </E2EDCT1GRP>
          </E2EDC01GRP>
        </E2EDP01007GRP>
      </xsl:for-each>
      <E2CUCFG003GRP>
        <E1CUCFG>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUCFG003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <POSEX>
            <xsl:text />
          </POSEX>
        </E1CUCFG>
        <E1CUINS>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUINS002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <INST_ID>
            <xsl:text />
          </INST_ID>
        </E1CUINS>
        <E1CUPRT>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUPRT002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARENT_ID>
            <xsl:text />
          </PARENT_ID>
        </E1CUPRT>
        <E1CUVAL>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUVAL002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <INST_ID>
            <xsl:text />
          </INST_ID>
        </E1CUVAL>
        <E1CUBLB>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUBLB000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <CONTENT>
            <xsl:text />
          </CONTENT>
        </E1CUBLB>
      </E2CUCFG003GRP>
      <E2EDL37005GRP>
        <E1EDL37>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL37004</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <EXIDV>
            <xsl:text />
          </EXIDV>
        </E1EDL37>
        <E1EDL39>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL39000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <QUALF>
            <xsl:text />
          </QUALF>
        </E1EDL39>
        <E1EDL38>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL38</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <VEGR1_BEZ>
            <xsl:text />
          </VEGR1_BEZ>
        </E1EDL38>
        <E1EDL44>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL44003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>          
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <VELIN>
            <xsl:text />
          </VELIN>
        </E1EDL44>
      </E2EDL37005GRP>
      <E1EDS01>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDS01</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <SUMID>
          <xsl:text />
        </SUMID>
      </E1EDS01>
    </ns0:Z3ORDERS05>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[

        public System.Collections.Hashtable Z3ORDERSHashTable = new System.Collections.Hashtable();
            
        public string AddListData(string key, string Valuedata)
        {
            Z3ORDERSHashTable.Add(key, Valuedata);
            return string.Empty;
        }

        public string getListData(string key)
        {
            if (Z3ORDERSHashTable.Contains(key))
            {
                string value = (string)Z3ORDERSHashTable[key];
                return value;
            }
            else
            {
                return string.Empty;
            }
       }

]]>
  </msxsl:script>

</xsl:stylesheet>