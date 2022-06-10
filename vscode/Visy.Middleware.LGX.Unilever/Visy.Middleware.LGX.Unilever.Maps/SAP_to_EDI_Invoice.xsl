<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s1 s2 s0 ScriptNS0"
                version="1.0"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/INVOIC01//740/Receive"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/INVOIC01//740"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/s1:Receive" />
	</xsl:template>
	<xsl:template match="/s1:Receive">
    <xsl:variable name="var:currency" select="string(s1:idocData/s0:E2EDK01005/s0:CURCY/text())" />
		<xsl:variable name="var:APVal" select="'13095313723'" />
		<xsl:variable name="var:DPVal" select="'77000011316'" />
		<xsl:variable name="var:DPName" select="'NESTLE'" />
		<!--<xsl:variable name="var:POType" select="'BBBB'" />-->
		<xsl:variable name="var:CompCode" select="'VISY'" />
		<xsl:variable name="var:vWERKS" select="string(s1:idocData/s0:E2EDP01010GRP[1]/s0:E2EDP01010/s0:WERKS/text())" />
		<xsl:variable name="var:vMSATZ" select="string(s1:idocData/s0:E2EDP01010GRP[1]/s0:E2EDP04001[1]/s0:MSATZ/text())" />

		<xsl:variable name="var:vSupplierRefId" select="'100280399'" />
		<!--<xsl:variable name="var:vSupplierRefId" select="ScriptNS0:GetVendorCodeFromSAP($var:vWERKS, string(s1:idocData/s0:EDI_DC40/s2:RCVPRN/text()))" />
    <xsl:if test="string($var:vSupplierRefId)=''">
          <xsl:message terminate="yes">No valid mapping for given plant code and customer code</xsl:message>
    </xsl:if>-->
		<xsl:variable name="var:vZTERM" select="string(s1:idocData/s0:E2EDK01005/s0:ZTERM/text())" />
		<xsl:variable name="var:vVisyABN" select="string(s1:idocData/s0:E2EDK01005/s0:EIGENUINR/text())" />
		<xsl:variable name="var:LineItemCount" select="count(/s0:idocData/E2EDP01010GRP)" />
		<ns0:EFACT_D01B_INVOIC_EAN011_V2>
			<UNH>
				<UNH1>
					<xsl:value-of select="'UNH1'" />
				</UNH1>
				<UNH2>
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
						<xsl:value-of select="'EAN011'" />
					</UNH2.5>
				</UNH2>
			</UNH>
			<xsl:for-each select="s1:idocData/s0:E2EDK02">
				<xsl:variable name="var:BGMQUALF" select="string(s0:QUALF/text())" />
				<xsl:if test="string($var:BGMQUALF)='009'">
					<ns0:BGM>
						<ns0:C002>
							<C00201>
								<xsl:value-of select="'380'" />
							</C00201>
							<!--<C00203>
								<xsl:value-of select="'9'" />
							</C00203>
							<C00204>
								<xsl:value-of select="'TAX INVOICE'" />
							</C00204>-->
						</ns0:C002>
						<ns0:C106>
							<C10601>
								<xsl:variable name="var:vBELNR" select="s0:BELNR/text()" />
								<xsl:value-of select="$var:vBELNR" />
							</C10601>
						</ns0:C106>
						<!--<BGM03>
							<xsl:value-of select="'9'" />
						</BGM03>-->
					</ns0:BGM>
					<ns0:DTM>
						<ns0:C507>
							<C50701>
								<xsl:value-of select="'171'" />
							</C50701>
							<C50702>
								<xsl:variable name="var:vDTMDATUM" select="userCSharp:getDateWithTime(string(s0:DATUM/text()))" />
								<xsl:value-of select="$var:vDTMDATUM" />
							</C50702>
							<C50703>
								<xsl:value-of select="'102'" />
							</C50703>
						</ns0:C507>
					</ns0:DTM>
				</xsl:if>
			</xsl:for-each>
			<ns0:PAI>
				<ns0:C534>
					<C53403>
						<xsl:value-of select="'42'" />
					</C53403>
				</ns0:C534>
			</ns0:PAI>
			<xsl:for-each select="s1:idocData/s0:E2EDK02">
				<xsl:variable name="var:RFFQUALF" select="string(s0:QUALF/text())" />
				<xsl:variable name="var:RFFBELNR" select="string(s0:BELNR/text())" />
				<!--<xsl:if test="string($var:RFFQUALF)='009'">
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
				</xsl:if>-->
				<xsl:if test="string($var:RFFQUALF)='012'">
					<ns0:RFFLoop1>
						<ns0:RFF>
							<ns0:C506>
								<C50601>
									<xsl:value-of select="'DQ'" />
								</C50601>
								<C50602>
									<xsl:value-of select="concat(substring($var:RFFBELNR,2+1), '-',$var:vWERKS)" />
								</C50602>
							</ns0:C506>
						</ns0:RFF>
           <ns0:DTM_2>
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="'171'" />
                </C50701>
                <C50702>
                  <xsl:value-of select="s0:DATUM/text()" />
                </C50702>
                <C50703>
                  <xsl:value-of select="'102'" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
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
			<!--<ns0:RFFLoop1>
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
      </ns0:RFFLoop1>-->
			<xsl:for-each select="s1:idocData/s0:E2EDKA1003">
				<xsl:variable name="var:NADIdentifier" select="string(s0:PARVW/text())" />
				<xsl:if test="string($var:NADIdentifier)='AG'">
					<xsl:variable name="var:vsetSoldToCode" select="string(s0:PARTN/text())" />
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="s1:idocData/s0:E2EDP01010GRP[1]">
				<xsl:variable name="var:NADIdentifier1" select="string(s0:E2EDPA1003/s0:PARVW/text())" />
				<xsl:variable name="var:NADID" select="string(s0:E2EDPA1003/s0:PARTN/text())" />
				<xsl:if test="string($var:NADIdentifier1)='WE'">
					<xsl:variable name="var:vsetShipToCode" select="string(s0:E2EDPA1003/s0:PARTN/text())" />
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
						<C08203>
							<xsl:value-of select="'9'" />
						</C08203>
					</ns0:C082>
					<ns0:C058>
						<C05801>
							<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:PARTN/text())" />
						</C05801>
						<C05802>
							<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:NAME1/text())" />
						</C05802>
					</ns0:C058>
				</ns0:NAD>
				<ns0:RFFLoop2>
					<ns0:RFF_2>
						<ns0:C506_2>
							<C50601>
								<xsl:value-of select="'VA'" />
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
			<xsl:variable name="var:vgetSoldToCode" select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RS']/s0:NAME1/text())" />

			<xsl:if test="string($var:vgetSoldToCode)!=''">      
				<ns0:NADLoop1>
					<ns0:NAD>
						<NAD01>
							<xsl:value-of select="'SU'" />
						</NAD01>
						<ns0:C082>
							<C08201>
								<xsl:value-of select="$var:vgetSoldToCode" />
							</C08201>
							<C08203>
								<xsl:value-of select="'ZZZ'" />
							</C08203>
						</ns0:C082>          
						<ns0:C058>
							<C05801>
								<xsl:value-of select="$var:vgetSoldToCode" />
							</C05801>
							<C05802>
								<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RS']/s0:STRAS/text())" />
							</C05802>
						</ns0:C058>
						<NAD06>
							<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RS']/s0:ORT01/text())" />
						</NAD06>
						<NAD08>
							<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RS']/s0:PSTLZ/text())" />
						</NAD08>
						<NAD09>
							<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RS']/s0:LAND1/text())" />
						</NAD09>
					</ns0:NAD>
					<ns0:RFFLoop2>
						<ns0:RFF_2>
							<ns0:C506_2>
								<C50601>
									<xsl:value-of select="'VA'" />
								</C50601>
								<C50602>
									<xsl:value-of select="$var:vVisyABN" />
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
									<xsl:value-of select="$var:vSupplierRefId" />
								</C50602>
							</ns0:C506_2>
						</ns0:RFF_2>
					</ns0:RFFLoop2>         
				</ns0:NADLoop1>
			</xsl:if>
			<!--<xsl:for-each select="s1:idocData/s0:E2EDKA1003 ">
				<xsl:variable name="var:NADIdentifier1" select="string(s0:PARVW/text())" />
				<xsl:variable name="var:NADID" select="string(s0:PARTN/text())" />
				<xsl:variable name="var:NADName" select="string(s0:NAME1/text())" />
				<xsl:variable name="var:NADStreet" select="string(s0:STRAS/text())" />
				<xsl:variable name="var:NADCity" select="string(s0:ORT01/text())" />
				<xsl:variable name="var:NADState" select="string(s0:REGIO/text())" />
				<xsl:variable name="var:NADZipCode" select="string(s0:PSTLZ/text())" />
				<xsl:variable name="var:NADTelephone1" select="string(s0:TELF1/text())" />
				<xsl:variable name="var:NADFax1" select="string(s0:TELFX/text())" />
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
									<xsl:value-of select="'106'" />
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
			</xsl:for-each>-->
			<!--WE SEGMENT-->			
			<xsl:variable name="var:NADName" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:NAME1/text())" />
			<xsl:variable name="var:NADStreet" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:STRAS/text())" />
			<xsl:variable name="var:NADCity" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:ORT01/text())" />
			<xsl:variable name="var:NADState" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:REGIO/text())" />
			<xsl:variable name="var:NADZipCode" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:PSTLZ/text())" />
			<xsl:variable name="var:NADTelephone1" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:TELF1/text())" />
			<xsl:variable name="var:NADFax1" select="string(s1:idocData/s0:E2EDP01010GRP[s0:E2EDPA1003/s0:PARVW/text()='WE']/s0:E2EDPA1003/s0:TELFX/text())" />

			<ns0:NADLoop1>
				<ns0:NAD>
					<NAD01>
						<xsl:value-of select="'ST'" />
					</NAD01>
					<ns0:C082>
						<C08201>
							<xsl:value-of select="'WE'" />
						</C08201>
						<C08202>
							<xsl:value-of select="'106'" />
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
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='WE']/s0:LAND1/text())" />
					</NAD09>
				</ns0:NAD>
				<!--<ns0:CTALoop1>
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
				</ns0:CTALoop1>-->
			</ns0:NADLoop1>      
			<ns0:CUXLoop1>
				<ns0:CUX>
					<ns0:C504>
						<C50401>2</C50401>
						<C50402>
              <xsl:value-of select="$var:currency" />
            </C50402>
						<C50403>4</C50403>
					</ns0:C504>
				</ns0:CUX>
			</ns0:CUXLoop1>
			<!--ns0:TAXLoop1>
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
			</ns0:TAXLoop1-->
			<xsl:variable name="var:vZTERM1" select="userCSharp:IsNumberPAT(string($var:vZTERM))" />
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
								<xsl:value-of select="$var:vZTERM1" />
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
								<xsl:value-of select="$var:vZTERM1" />
							</C11204>
						</ns0:C112>
					</ns0:PAT>
				</ns0:PATLoop1>
			</xsl:if>
			<xsl:for-each select="s1:idocData/s0:E2EDP01010GRP">
				<!--<xsl:if test="string(number(s0:E2EDP02001[1]/s0:ZEILE/text()))= 'NaN'">
          <xsl:message terminate="yes">Missing value in LIN segment.E1EDP02[1]/ZEILE value is missing in E2EDP01007GRP</xsl:message>
        </xsl:if>-->
				<xsl:variable name="var:LINRecCount" select="position()" />
				<xsl:variable name="var:vZEILE" select="number(s0:E2EDP02001[s0:QUALF/text()='002']/s0:ZEILE/text())" />
				<xsl:variable name="var:LINMENGE" select="number(s0:E2EDP01010/s0:MENGE/text())" />
				<xsl:variable name="var:LINMENEE" select="string(s0:E2EDP01010/s0:MENEE/text())" />
				<ns0:LINLoop1>
					<ns0:LIN>
						<LIN01>
							<xsl:value-of select="$var:vZEILE" />
						</LIN01>
						<ns0:C212>
							<C21201>
								<xsl:value-of select="string(s0:E2EDP19002[s0:QUALF/text()='002']/s0:IDTNR/text())" />
							</C21201>
							<C21202>
								<xsl:value-of select="'IN'" />
							</C21202>
						</ns0:C212>
					</ns0:LIN>
					<xsl:for-each select="s0:E2EDP19002">           
						<xsl:variable name="var:LINQUALF" select="string(s0:QUALF/text())" />
						<xsl:variable name="var:LINIDTNR" select="string(s0:IDTNR/text())" />
						<xsl:variable name="var:LINIDTNRwithPad" select="string(s0:IDTNR/text())" />
						<xsl:variable name="var:LINKTEXT" select="string(s0:KTEXT/text())" />
						<xsl:if test="string($var:LINQUALF)='001'">             
							<ns0:PIA>
								<PIA01>
									<xsl:value-of select="'1'" />
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
									<xsl:value-of select="'1'" />
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
										<xsl:value-of select="'ZZZ'" />
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
					<xsl:for-each select="s0:E2EDP19002">
						<xsl:variable name="var:LINQUALF" select="string(s0:QUALF/text())" />
						<xsl:variable name="var:LINKTEXT" select="string(s0:KTEXT/text())" />
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
					<xsl:for-each select="s0:E2EDP26">
						<xsl:variable name="var:MOAQUALF" select="string(s0:QUALF/text())" />
						<xsl:variable name="var:MOABETRG" select="string(s0:BETRG/text())" />
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
                      <xsl:value-of select="$var:currency" />
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
                      <xsl:value-of select="$var:currency" />
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
                      <xsl:value-of select="$var:currency" />
										</C51603>
									</ns0:C516_5>
								</ns0:MOA_5>
							</ns0:MOALoop2>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="s0:E2EDP05002">
						<xsl:variable name="var:PRIKSCHL" select="string(s0:KSCHL/text())" />
						<xsl:variable name="var:PRIKRATE" select="string(s0:KRATE/text())" />
						<xsl:variable name="var:PRIUPRBS" select="string(s0:UPRBS/text())" />
						<xsl:variable name="var:PRIMEAUN" select="string(s0:MEAUN/text())" />
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
					<ns0:RFFLoop3>
						<ns0:RFF_3>
							<ns0:C506_3>
								<C50601>
									<xsl:value-of select="'ON'" />
								</C50601>
								<C50602>
									<xsl:value-of select="s0:E2EDP02001[s0:QUALF/text()='002']/s0:BELNR" />
								</C50602>
								<C50603>
									<xsl:value-of select="s0:E2EDP02001[s0:QUALF/text()='002']/s0:ZEILE" />
								</C50603>
							</ns0:C506_3>
						</ns0:RFF_3>
					</ns0:RFFLoop3>
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
			<xsl:for-each select="s1:idocData/s0:E2EDS01 ">
				<xsl:variable name="var:MOASUMID" select="string(s0:SUMID/text())" />
				<xsl:variable name="var:MOASUMME" select="string(s0:SUMME/text())" />
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
                  <xsl:value-of select="$var:currency" />
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
                  <xsl:value-of select="$var:currency" />
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
                  <xsl:value-of select="$var:currency" />
								</C51603>
							</ns0:C516_10>
						</ns0:MOA_10>
					</ns0:MOALoop4>
				</xsl:if>
			</xsl:for-each>
		</ns0:EFACT_D01B_INVOIC_EAN011_V2>
	</xsl:template>

	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[ 
 
 
 
        public string StringConcat(string param0) 
        { 
            return param0; 
        } 
 
		    public string getDateWithTime(string Inputdate) 
        { 
            return Inputdate; 
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