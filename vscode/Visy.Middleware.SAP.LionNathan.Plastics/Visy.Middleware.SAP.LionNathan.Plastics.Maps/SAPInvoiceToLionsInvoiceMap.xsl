<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:s0="http://Z3INVOIC01.V4" 
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Z3INVOIC01" />
  </xsl:template>
  <xsl:template match="/s0:Z3INVOIC01">
    <!-- 
<xsl:variable name="var:vZEILETEST" select="number(E1EDP02[1]/ZEILE/text())" /> 
  <xsl:if test= "string(number(E1EDP02[1]/ZEILE/text())) = 'NaN'"> 
 
    <xsl:message terminate="yes">Missing value in LIN segment.E1EDP02[1]/ZEILE value is missing in E2EDP01007GRP </xsl:message> 
  </xsl:if>

  -->
    <xsl:variable name="var:APVal" select="string(E2EDK01005GRP/Z1E1EDK01/AP_VALUE/text())" />
    <xsl:variable name="var:DPVal" select="string(E2EDK01005GRP/Z1E1EDK01/DP_VALUE/text())" />
    <xsl:variable name="var:DPName" select="string(E2EDK01005GRP/Z1E1EDK01/DP_NAME/text())" />
    <xsl:variable name="var:POType" select="string(E2EDK01005GRP/Z1E1EDK01/PO_TYPE/text())" />
    <xsl:variable name="var:CompCode" select="string(E2EDK01005GRP/Z1E1EDK01/COMP_CODE/text())" />
    <xsl:variable name="var:vWERKS" select="string(E2EDP01007GRP[1]/E1EDP01/WERKS/text())" />
    <xsl:variable name="var:vMSATZ" select="string(E2EDP01007GRP[1]/E1EDP04[1]/MSATZ/text())" />
    <xsl:variable name="var:vKUNDEUINR" select="string(E2EDK01005GRP/E1EDK01/KUNDEUINR/text())" />
    <xsl:variable name="var:vEIGENUINR" select="string(E2EDK01005GRP/E1EDK01/EIGENUINR/text())" />
    <xsl:variable name="var:vZTERM" select="string(E2EDK01005GRP/E1EDK01/ZTERM/text())" />
    <xsl:variable name="var:LineItemCount" select="count(/s0:Z3INVOIC01/E2EDP01007GRP)" />
    <ns0:EFACT_D01B_INVOIC_EAN011>
      <ns0:UNH>
        <UNH1>
          <xsl:value-of select="'UNH1'" />
        </UNH1>
        <ns0:UNH2>
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
        </ns0:UNH2>
      </ns0:UNH>
      <xsl:for-each select="E1EDK02">
        <xsl:variable name="var:BGMQUALF" select="string(QUALF/text())" />
        <xsl:if test="string($var:BGMQUALF)='009'">
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
                <xsl:variable name="var:vBELNR" select="BELNR/text()" />
                <xsl:value-of select="$var:vBELNR" />
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
                <xsl:variable name="var:vDTMDATUM" select="userCSharp:getDateWithTime(string(DATUM/text()))" />
                <xsl:value-of select="$var:vDTMDATUM" />
              </C50702>
              <C50703>
                <xsl:value-of select="'203'" />
              </C50703>
            </ns0:C507>
          </ns0:DTM>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="E1EDK02">
        <xsl:variable name="var:RFFQUALF" select="string(QUALF/text())" />
        <xsl:variable name="var:RFFBELNR" select="string(BELNR/text())" />
        <xsl:if test="string($var:RFFQUALF)='009'">
          <ns0:RFFLoop1>
            <ns0:RFF>
              <ns0:C506>
                <C50601>
                  <xsl:value-of select="'ACD'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="$var:RFFBELNR" />
                </C50602>
              </ns0:C506>
            </ns0:RFF>
          </ns0:RFFLoop1>
        </xsl:if>
        <xsl:if test="string($var:RFFQUALF)='012'">
          <ns0:RFFLoop1>
            <ns0:RFF>
              <ns0:C506>
                <C50601>
                  <xsl:value-of select="'DQ'" />
                </C50601>
                <C50602>
                  <!--<xsl:value-of select="concat($var:RFFBELNR, '-',$var:vWERKS)" />-->
                  
                  <xsl:value-of select="concat(substring($var:RFFBELNR,2+1), '-',$var:vWERKS)" />
                  <!--<xsl:value-of select="$var:RFFBELNR" />
                 
                  <xsl:value-of select="userCSharp:createRFFDQ($var:RFFBELNR, $var:vWERKS)" />-->
                  
                </C50602>
              </ns0:C506>
            </ns0:RFF>
          </ns0:RFFLoop1>
        </xsl:if>
        <xsl:if test="string($var:RFFQUALF)='001'">
          <ns0:RFFLoop1>
            <ns0:RFF>
              <ns0:C506>
                <C50601>
                  <xsl:value-of select="'ON'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="$var:RFFBELNR" />
                </C50602>
              </ns0:C506>
            </ns0:RFF>
          </ns0:RFFLoop1>
        </xsl:if>
      </xsl:for-each>
      <ns0:RFFLoop1>
        <ns0:RFF>
          <ns0:C506>
            <C50601>
              <xsl:value-of select="'ZZZ'" />
            </C50601>
            <C50602>
              <xsl:value-of select="$var:POType" />
            </C50602>
          </ns0:C506>
        </ns0:RFF>
      </ns0:RFFLoop1>
      <xsl:for-each select="E1EDKA1">
        <xsl:variable name="var:NADIdentifier" select="string(PARVW/text())" />
        <xsl:if test="string($var:NADIdentifier)='AG'">
          <xsl:variable name="var:vsetSoldToCode" select="userCSharp:SetSoldToCode(string(PARTN/text()))" />
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/s0:Z3INVOIC01/E2EDP01007GRP[1]">
        <xsl:variable name="var:NADIdentifier1" select="string(E1EDPA1/PARVW/text())" />
        <xsl:variable name="var:NADID" select="string(E1EDPA1/PARTN/text())" />
        <xsl:if test="string($var:NADIdentifier1)='WE'">
          <xsl:variable name="var:vsetShipToCode" select="userCSharp:SetShiptoCode(string(E1EDPA1/PARTN/text()))" />
        </xsl:if>
      </xsl:for-each>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'BY'" />
          </NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="$var:APVal" />
            </C08201>
            <C08202>
              <xsl:value-of select="'92'" />
            </C08202>
          </ns0:C082>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'IT'" />
              </C50601>
              <C50602>
                <xsl:value-of select="$var:DPVal" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'ZZZ'" />
              </C50601>
              <C50602>
                <xsl:value-of select="$var:CompCode" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>
      </ns0:NADLoop1>
      <xsl:variable name="var:vgetSoldToCode" select="userCSharp:getSoldToCode()" />
      <xsl:variable name="var:vgetShipToCode" select="userCSharp:getShipToCode()" />
      <xsl:if test="string($var:vgetSoldToCode)!='' and string($var:vgetShipToCode)!=''">
        <xsl:variable name="var:SupplierDetailsValues" select="ScriptNS0:GetLionathanSupplierDetailsWithPipes($var:vgetSoldToCode, $var:vgetShipToCode, $var:vWERKS)" />
        <ns0:NADLoop1>
          <ns0:NAD>
            <NAD01>
              <xsl:value-of select="'SU'" />
            </NAD01>
            <ns0:C082>
              <C08201>
                <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '0')" />
              </C08201>
              <C08202>
                <xsl:value-of select="'92'" />
              </C08202>
            </ns0:C082>
            <ns0:C080>
              <C08001>
                <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '1')" />
              </C08001>
            </ns0:C080>
            <ns0:C059>
              <C05901>
                <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '2')" />
              </C05901>
            </ns0:C059>
            <NAD06>
              <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '3')" />
            </NAD06>
            <ns0:C819>
              <C81901>
                <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '4')" />
              </C81901>
            </ns0:C819>
            <NAD08>
              <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '8')" />
            </NAD08>
            <NAD09>
              <xsl:value-of select="'AU'" />
            </NAD09>
          </ns0:NAD>
          <ns0:RFFLoop2>
            <ns0:RFF_2>
              <ns0:C506_2>
                <C50601>
                  <xsl:value-of select="'AP'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '0')" />
                </C50602>
              </ns0:C506_2>
            </ns0:RFF_2>
          </ns0:RFFLoop2>
          <ns0:RFFLoop2>
            <ns0:RFF_2>
              <ns0:C506_2>
                <C50601>
                  <xsl:value-of select="'XA'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="$var:vEIGENUINR" />
                </C50602>
              </ns0:C506_2>
            </ns0:RFF_2>
          </ns0:RFFLoop2>
          <ns0:CTALoop1>
            <ns0:CTA>
              <CTA01>
                <xsl:value-of select="'SR'" />
              </CTA01>
            </ns0:CTA>
            <ns0:COM>
              <ns0:C076>
                <C07601>
                  <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '6')" />
                </C07601>
                <C07602>
                  <xsl:value-of select="'TE'" />
                </C07602>
              </ns0:C076>
            </ns0:COM>
            <ns0:COM>
              <ns0:C076>
                <C07601>
                  <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '7')" />
                  <xsl:variable name="var:vtempLionsSiteCode" select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '12')" />
                  <xsl:variable name="var:vsetLionsSiteCode" select="userCSharp:SetLionsSiteCode($var:vtempLionsSiteCode)" />
                </C07601>
                <C07602>
                  <xsl:value-of select="'FX'" />
                </C07602>
              </ns0:C076>
            </ns0:COM>
          </ns0:CTALoop1>
        </ns0:NADLoop1>
      </xsl:if>
      <xsl:for-each select="E1EDKA1">
        <xsl:variable name="var:NADIdentifier1" select="string(PARVW/text())" />
        <xsl:variable name="var:NADID" select="string(PARTN/text())" />
        <xsl:variable name="var:NADName" select="string(NAME1/text())" />
        <xsl:variable name="var:NADStreet" select="string(STRAS/text())" />
        <xsl:variable name="var:NADCity" select="string(ORT01/text())" />
        <xsl:variable name="var:NADState" select="string(REGIO/text())" />
        <xsl:variable name="var:NADZipCode" select="string(PSTLZ/text())" />
        <xsl:variable name="var:NADTelephone1" select="string(TELF1/text())" />
        <xsl:variable name="var:NADFax1" select="string(TELFX/text())" />
        <xsl:if test="string($var:NADIdentifier1)='RE'">
          <ns0:NADLoop1>
            <ns0:NAD>
              <NAD01>
                <xsl:value-of select="'RE'" />
              </NAD01>
              <ns0:C082>
                <C08201>
                  <xsl:value-of select="$var:NADID" />
                </C08201>
                <C08202>
                  <xsl:value-of select="'92'" />
                </C08202>
              </ns0:C082>
              <ns0:C080>
                <C08001>
                  <xsl:value-of select="$var:NADName" />
                </C08001>
              </ns0:C080>
              <ns0:C059>
                <C05901>
                  <xsl:value-of select="$var:NADStreet" />
                </C05901>
              </ns0:C059>
              <NAD06>
                <xsl:value-of select="$var:NADCity" />
              </NAD06>
              <ns0:C819>
                <C81901>
                  <xsl:value-of select="$var:NADState" />
                </C81901>
              </ns0:C819>
              <NAD08>
                <xsl:value-of select="$var:NADZipCode" />
              </NAD08>
              <NAD09>
                <xsl:value-of select="'AU'" />
              </NAD09>
            </ns0:NAD>
            <ns0:RFFLoop2>
              <ns0:RFF_2>
                <ns0:C506_2>
                  <C50601>
                    <xsl:value-of select="'XA'" />
                  </C50601>
                  <C50602>
                    <xsl:value-of select="$var:vKUNDEUINR" />
                  </C50602>
                </ns0:C506_2>
              </ns0:RFF_2>
            </ns0:RFFLoop2>
            <ns0:CTALoop1>
              <ns0:CTA>
                <CTA01>
                  <xsl:value-of select="'PD'" />
                </CTA01>
              </ns0:CTA>
              <ns0:COM>
                <ns0:C076>
                  <C07601>
                    <xsl:value-of select="$var:NADTelephone1" />
                  </C07601>
                  <C07602>
                    <xsl:value-of select="'TE'" />
                  </C07602>
                </ns0:C076>
              </ns0:COM>
              <ns0:COM>
                <ns0:C076>
                  <C07601>
                    <xsl:value-of select="$var:NADFax1" />
                  </C07601>
                  <C07602>
                    <xsl:value-of select="'FX'" />
                  </C07602>
                </ns0:C076>
              </ns0:COM>
            </ns0:CTALoop1>
          </ns0:NADLoop1>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/s0:Z3INVOIC01/E2EDP01007GRP[1]">
        <xsl:variable name="var:NADIdentifier1" select="string(E1EDPA1/PARVW/text())" />
        <xsl:variable name="var:NADID" select="string(E1EDPA1/PARTN/text())" />
        <xsl:variable name="var:NADName" select="string(E1EDPA1/NAME1/text())" />
        <xsl:variable name="var:NADStreet" select="string(E1EDPA1/STRAS/text())" />
        <xsl:variable name="var:NADCity" select="string(E1EDPA1/ORT01/text())" />
        <xsl:variable name="var:NADState" select="string(E1EDPA1/REGIO/text())" />
        <xsl:variable name="var:NADZipCode" select="string(E1EDPA1/PSTLZ/text())" />
        <xsl:variable name="var:NADTelephone1" select="string(E1EDPA1/TELF1/text())" />
        <xsl:variable name="var:NADFax1" select="string(E1EDPA1/TELFX/text())" />
        <xsl:variable name="var:vgetLionsSiteCode" select="userCSharp:getLionsSiteCode()" />
        <xsl:if test="string($var:NADIdentifier1)='WE'">
          <ns0:NADLoop1>
            <ns0:NAD>
              <NAD01>
                <xsl:value-of select="'ST'" />
              </NAD01>
              <ns0:C082>
                <C08201>
                  <xsl:value-of select="$var:vgetLionsSiteCode" />
                </C08201>
                <C08202>
                  <xsl:value-of select="'92'" />
                </C08202>
              </ns0:C082>
              <ns0:C080>
                <C08001>
                  <xsl:value-of select="$var:NADName" />
                </C08001>
              </ns0:C080>
              <ns0:C059>
                <C05901>
                  <xsl:value-of select="$var:NADStreet" />
                </C05901>
              </ns0:C059>
              <NAD06>
                <xsl:value-of select="$var:NADCity" />
              </NAD06>
              <ns0:C819>
                <C81901>
                  <xsl:value-of select="$var:NADState" />
                </C81901>
              </ns0:C819>
              <NAD08>
                <xsl:value-of select="$var:NADZipCode" />
              </NAD08>
              <NAD09>
                <xsl:value-of select="'AU'" />
              </NAD09>
            </ns0:NAD>
            <ns0:CTALoop1>
              <ns0:CTA>
                <CTA01>
                  <xsl:value-of select="'GR'" />
                </CTA01>
              </ns0:CTA>
              <ns0:COM>
                <ns0:C076>
                  <C07601>
                    <xsl:value-of select="$var:NADTelephone1" />
                  </C07601>
                  <C07602>
                    <xsl:value-of select="'TE'" />
                  </C07602>
                </ns0:C076>
              </ns0:COM>
              <ns0:COM>
                <ns0:C076>
                  <C07601>
                    <xsl:value-of select="$var:NADFax1" />
                  </C07601>
                  <C07602>
                    <xsl:value-of select="'FX'" />
                  </C07602>
                </ns0:C076>
              </ns0:COM>
            </ns0:CTALoop1>
          </ns0:NADLoop1>
        </xsl:if>
      </xsl:for-each>
      <ns0:TAXLoop1>
        <ns0:TAX>
          <TAX01>
            <xsl:value-of select="'7'" />
          </TAX01>
          <ns0:C241>
            <C24101>
              <xsl:value-of select="'GST'" />
            </C24101>
          </ns0:C241>
          <ns0:C243>
            <C24304>
              <xsl:value-of select="'10.00'" />
            </C24304>
          </ns0:C243>
          <TAX06>
            <xsl:value-of select="'S'" />
          </TAX06>
        </ns0:TAX>
      </ns0:TAXLoop1>
      <xsl:variable name="var:vZTERM1" select="substring($var:vZTERM,2)" />
      <xsl:if test="substring($var:vZTERM, 1, 2)='IN'">
        <ns0:PATLoop1>
          <ns0:PAT>
            <PAT01>
              <xsl:value-of select="'1'" />
            </PAT01>
            <ns0:C112>
              <C11201>
                <xsl:value-of select="'5'" />
              </C11201>
              <C11202>
                <xsl:value-of select="'3'" />
              </C11202>
              <C11203>
                <xsl:value-of select="'D'" />
              </C11203>
              <C11204>
                <xsl:value-of select="userCSharp:IsNumberPAT($var:vZTERM)" />
              </C11204>
            </ns0:C112>
          </ns0:PAT>
        </ns0:PATLoop1>
      </xsl:if>
      <xsl:if test="substring($var:vZTERM, 1, 2)='ME'">
        <ns0:PATLoop1>
          <ns0:PAT>
            <PAT01>
              <xsl:value-of select="'1'" />
            </PAT01>
            <ns0:C112>
              <C11201>
                <xsl:value-of select="'5'" />
              </C11201>
              <C11202>
                <xsl:value-of select="'6'" />
              </C11202>
              <C11203>
                <xsl:value-of select="'D'" />
              </C11203>
              <C11204>
                <xsl:value-of select="userCSharp:IsNumberPAT($var:vZTERM)" />
              </C11204>
            </ns0:C112>
          </ns0:PAT>
        </ns0:PATLoop1>
      </xsl:if>
      <xsl:for-each select="E2EDP01007GRP">
        <xsl:if test="string(number(E1EDP02[1]/ZEILE/text()))= 'NaN'">
          <xsl:message terminate="yes">Missing value in LIN segment.E1EDP02[1]/ZEILE value is missing in E2EDP01007GRP</xsl:message>
        </xsl:if>
        <xsl:variable name="var:LINRecCount" select="position()" />
        <xsl:variable name="var:vZEILE" select="number(E1EDP02[1]/ZEILE/text())" />
        <xsl:variable name="var:LINMENGE" select="number(E1EDP01/MENGE/text())" />
        <xsl:variable name="var:LINMENEE" select="string(E1EDP01/MENEE/text())" />
        <ns0:LINLoop1>
          <xsl:for-each select="E1EDP19">
            <xsl:variable name="var:LINQUALF" select="string(QUALF/text())" />
            <xsl:variable name="var:LINIDTNR" select="string(IDTNR/text())" />
            <xsl:variable name="var:LINIDTNRwithPad" select="userCSharp:PaddingLeft(string(IDTNR/text()))" />
            <xsl:variable name="var:LINKTEXT" select="userCSharp:ReplaceKTEXT(string(KTEXT/text()))" />
            <xsl:if test="string($var:LINQUALF)='001'">
              <ns0:LIN>
                <LIN01>
                  <xsl:value-of select="$var:vZEILE" />
                </LIN01>
                <ns0:C212>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNRwithPad" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'IN'" />
                  </C21202>
                </ns0:C212>
              </ns0:LIN>
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="$var:LINRecCount" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNRwithPad" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'IN'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
            </xsl:if>
            <xsl:if test="string($var:LINQUALF)='002'">
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="$var:LINRecCount" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNR" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SA'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
              <ns0:IMD>
                <IMD01>
                  <xsl:value-of select="'F'" />
                </IMD01>
                <ns0:C273>
                  <C27302>
                    <xsl:value-of select="'DU'" />
                  </C27302>
                  <C27303>
                    <xsl:value-of select="'92'" />
                  </C27303>
                  <C27304>
                    <xsl:value-of select="$var:LINKTEXT" />
                  </C27304>
                </ns0:C273>
              </ns0:IMD>
            </xsl:if>
          </xsl:for-each>
          <ns0:QTY_2>
            <ns0:C186_2>
              <C18601>
                <xsl:value-of select="'47'" />
              </C18601>
              <C18602>
                <xsl:value-of select="$var:LINMENGE" />
              </C18602>
              <C18603>
                <xsl:value-of select="$var:LINMENEE" />
              </C18603>
            </ns0:C186_2>
          </ns0:QTY_2>
          <xsl:for-each select="E1EDP19">
            <xsl:variable name="var:LINQUALF" select="string(QUALF/text())" />
            <xsl:variable name="var:LINKTEXT" select="userCSharp:ReplaceKTEXT(string(KTEXT/text()))" />
            <xsl:if test="string($var:LINQUALF)='002'">
              <ns0:FTX_2>
                <FTX01>
                  <xsl:value-of select="'ZZZ'" />
                </FTX01>
                <FTX02>
                  <xsl:value-of select="'1'" />
                </FTX02>
                <ns0:C107_2>
                  <C10701>
                    <xsl:value-of select="'002'" />
                  </C10701>
                  <C10703>
                    <xsl:value-of select="'91'" />
                  </C10703>
                </ns0:C107_2>
                <ns0:C108_2>
                  <C10801>
                    <xsl:value-of select="$var:LINKTEXT" />
                  </C10801>
                </ns0:C108_2>
              </ns0:FTX_2>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="E1EDP26">
            <xsl:variable name="var:MOAQUALF" select="string(QUALF/text())" />
            <xsl:variable name="var:MOABETRG" select="string(BETRG/text())" />
            <xsl:if test="string($var:MOAQUALF)='003'">
              <ns0:MOALoop2>
                <ns0:MOA_5>
                  <ns0:C516_5>
                    <C51601>
                      <xsl:value-of select="'128'" />
                    </C51601>
                    <C51602>
                      <xsl:value-of select="$var:MOABETRG" />
                    </C51602>
                    <C51603>
                      <xsl:value-of select="'AUD'" />
                    </C51603>
                  </ns0:C516_5>
                </ns0:MOA_5>
              </ns0:MOALoop2>
            </xsl:if>
            <xsl:if test="string($var:MOAQUALF)='011'">
              <ns0:MOALoop2>
                <ns0:MOA_5>
                  <ns0:C516_5>
                    <C51601>
                      <xsl:value-of select="'369'" />
                    </C51601>
                    <C51602>
                      <xsl:value-of select="$var:MOABETRG" />
                    </C51602>
                    <C51603>
                      <xsl:value-of select="'AUD'" />
                    </C51603>
                  </ns0:C516_5>
                </ns0:MOA_5>
              </ns0:MOALoop2>
            </xsl:if>
            <xsl:if test="string($var:MOAQUALF)='013'">
              <ns0:MOALoop2>
                <ns0:MOA_5>
                  <ns0:C516_5>
                    <C51601>
                      <xsl:value-of select="'203'" />
                    </C51601>
                    <C51602>
                      <xsl:value-of select="$var:MOABETRG" />
                    </C51602>
                    <C51603>
                      <xsl:value-of select="'AUD'" />
                    </C51603>
                  </ns0:C516_5>
                </ns0:MOA_5>
              </ns0:MOALoop2>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="E1EDP05">
            <xsl:variable name="var:PRIKSCHL" select="string(KSCHL/text())" />
            <xsl:variable name="var:PRIKRATE" select="string(KRATE/text())" />
            <xsl:variable name="var:PRIUPRBS" select="string(UPRBS/text())" />
            <xsl:variable name="var:PRIMEAUN" select="string(MEAUN/text())" />
            <xsl:if test="string($var:PRIKSCHL)='ZR00'">
              <ns0:PRILoop1>
                <ns0:PRI>
                  <ns0:C509>
                    <C50901>
                      <xsl:value-of select="'1E'" />
                    </C50901>
                    <C50902>
                      <xsl:value-of select="$var:PRIKRATE" />
                    </C50902>
                    <C50905>
                      <xsl:value-of select="$var:PRIUPRBS" />
                    </C50905>
                    <C50906>
                      <xsl:value-of select="$var:PRIMEAUN" />
                    </C50906>
                  </ns0:C509>
                </ns0:PRI>
              </ns0:PRILoop1>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="E1EDP02">
            <xsl:variable name="var:RFFQUALF" select="string(QUALF/text())" />
            <xsl:variable name="var:RFFBELNR" select="string(BELNR/text())" />
            <xsl:if test="string(number(ZEILE/text()))= 'NaN'">
              <xsl:message terminate="yes">Missing value in LIN segment.E1EDP02[1]/ZEILE value is missing in E2EDP01007GRP</xsl:message>
            </xsl:if>
            <xsl:variable name="var:RFFEILE" select="number(ZEILE/text())" />
            <xsl:if test="string($var:RFFQUALF)='001'">
              <ns0:RFFLoop3>
                <ns0:RFF_3>
                  <ns0:C506_3>
                    <C50601>
                      <xsl:value-of select="'ON'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:RFFBELNR" />
                    </C50602>
                    <C50603>
                      <xsl:value-of select="$var:RFFEILE" />
                    </C50603>
                  </ns0:C506_3>
                </ns0:RFF_3>
              </ns0:RFFLoop3>
            </xsl:if>
          </xsl:for-each>
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
                  <xsl:value-of select="$var:vMSATZ" />
                </C24304>
              </ns0:C243_3>
              <TAX06>
                <xsl:value-of select="'S'" />
              </TAX06>
            </ns0:TAX_3>
          </ns0:TAXLoop3>
        </ns0:LINLoop1>
      </xsl:for-each>
      <!-- 
<xsl:catch> 
          <xsl:message terminate="yes">Missing value in LIN segment.E1EDP02[1]/ZEILE value is missing in E2EDP01007GRP </xsl:message> 
        </xsl:catch> 
      </xsl:try>

  -->
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
            <xsl:value-of select="$var:LineItemCount" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
      <xsl:for-each select="E1EDS01">
        <xsl:variable name="var:MOASUMID" select="string(SUMID/text())" />
        <xsl:variable name="var:MOASUMME" select="string(SUMME/text())" />
        <xsl:if test="string($var:MOASUMID)='010'">
          <ns0:MOALoop4>
            <ns0:MOA_10>
              <ns0:C516_10>
                <C51601>
                  <xsl:value-of select="'79'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:MOASUMME" />
                </C51602>
                <C51603>
                  <xsl:value-of select="'AUD'" />
                </C51603>
              </ns0:C516_10>
            </ns0:MOA_10>
          </ns0:MOALoop4>
        </xsl:if>
        <xsl:if test="string($var:MOASUMID)='005'">
          <ns0:MOALoop4>
            <ns0:MOA_10>
              <ns0:C516_10>
                <C51601>
                  <xsl:value-of select="'369'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:MOASUMME" />
                </C51602>
                <C51603>
                  <xsl:value-of select="'AUD'" />
                </C51603>
              </ns0:C516_10>
            </ns0:MOA_10>
          </ns0:MOALoop4>
        </xsl:if>
        <xsl:if test="string($var:MOASUMID)='012'">
          <ns0:MOALoop4>
            <ns0:MOA_10>
              <ns0:C516_10>
                <C51601>
                  <xsl:value-of select="'77'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:MOASUMME" />
                </C51602>
                <C51603>
                  <xsl:value-of select="'AUD'" />
                </C51603>
              </ns0:C516_10>
            </ns0:MOA_10>
          </ns0:MOALoop4>
        </xsl:if>
      </xsl:for-each>
    </ns0:EFACT_D01B_INVOIC_EAN011>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
 
 
 
public string StringConcat(string param0) 
{ 
   return param0; 
} 
 
		public string getDateWithTime(string Inputdate) 
        { 
            return Inputdate + DateTime.Now.Hour.ToString("00") + DateTime.Now.Minute.ToString("00"); 
        } 
 
 
        public string ShipToCode; 
        public string SoldToCode; 
        public string LionsSiteCode;  
        public void SetShiptoCode(string strShiptoCode) 
        { 
            ShipToCode = strShiptoCode; 
        } 
        public void SetSoldToCode(string strSoldToCode) 
        { 
            SoldToCode = strSoldToCode; 
        } 
        public string getSoldToCode() 
        { 
            return SoldToCode; 
        } 
        public string getShipToCode() 
        { 
            return ShipToCode; 
        } 
        public void SetLionsSiteCode(string strLionsSiteCode) 
        { 
            LionsSiteCode = strLionsSiteCode; 
        } 
        public string getLionsSiteCode() 
        { 
            return LionsSiteCode; 
        } 
        public string PaddingLeft(string InputNo) 
        { 
            return InputNo.PadLeft(18,'0'); 
        } 
        public string ReplaceKTEXT(string InputKTEXT) 
        { 
            InputKTEXT = InputKTEXT.Replace("/", string.Empty); 
            InputKTEXT = InputKTEXT.Replace("\\", string.Empty); 
            return InputKTEXT; 
        } 
		public string IsNumberPAT(String myString) 
        { 
                string alphabet = String.Empty; 
                string digit = String.Empty; 
 
                System.Text.RegularExpressions.Match regexMatch = System.Text.RegularExpressions.Regex.Match(myString, "\\d"); 
                if (regexMatch.Success) //Found numeric part in the coverage string 
                { 
                    int digitStartIndex = regexMatch.Index; //Get the index where the numeric digit found 
                    alphabet = myString.Substring(0, digitStartIndex); 
                    digit = myString.Substring(digitStartIndex); 
                } 
				return digit;                 
        } 
 


  ]]>
  </msxsl:script>
</xsl:stylesheet>