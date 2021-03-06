<?xml version="1.0" encoding="utf-16" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var userCSharp ScriptNS0" 
                version="1.0" 
                xmlns:ns0="http://Z3ORDERS05.V3" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:preserve-space elements="*"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/ns0:Z3ORDERS05" /> 
	</xsl:template>
	<xsl:template match="/ns0:Z3ORDERS05">
		<xsl:variable name="var:v38" select="userCSharp:StringConcat('false')" /> 
		<xsl:variable name="var:v39" select="userCSharp:LogicalEq(string($var:v38) , 'true')" /> 
		<ns0:Z3ORDERS05>
			<xsl:for-each select="EDI_DC40">
				<xsl:variable name="var:v1" select="userCSharp:StringConcat('EDI_DC40')" /> 
				<xsl:variable name="var:v3" select="userCSharp:StringConcat('2')" /> 
				<xsl:variable name="var:v4" select="userCSharp:StringConcat('ORDERS05')" /> 
				<xsl:variable name="var:v5" select="userCSharp:StringConcat('Z3ORDERS05')" /> 
				<xsl:variable name="var:v6" select="userCSharp:StringConcat('ORDERS')" /> 
				<xsl:variable name="var:v7" select="userCSharp:StringConcat('X')" /> 
				<xsl:variable name="var:v8" select="userCSharp:StringConcat('SNDPOR')" /> 
				<xsl:variable name="var:v9" select="userCSharp:StringConcat('KU')" /> 
				<xsl:variable name="var:v10" select="userCSharp:StringConcat('AG')" /> 
				<xsl:variable name="var:v12" select="userCSharp:StringConcat('LI')" /> 
				<xsl:variable name="var:v13" select="userCSharp:StringConcat('LF')" /> 
				<EDI_DC40>
					<TABNAM>
						<xsl:value-of select="$var:v1" /> 
					</TABNAM>
					<xsl:variable name="var:v2" select="ScriptNS0:GetInterfaceLookupData('MANDT' , 'SAP.Common.Z3Orders')" /> 
					<MANDT>
						<xsl:value-of select="$var:v2" /> 
					</MANDT>
					<DOCNUM>
						<xsl:value-of select="DOCNUM/text()" /> 
					</DOCNUM>
					<DOCREL>
						<xsl:value-of select="DOCREL/text()" /> 
					</DOCREL>
					<STATUS>
						<xsl:value-of select="STATUS/text()" /> 
					</STATUS>
					<DIRECT>
						<xsl:value-of select="$var:v3" /> 
					</DIRECT>
					<OUTMOD>
						<xsl:value-of select="OUTMOD/text()" /> 
					</OUTMOD>
					<EXPRSS>
						<xsl:value-of select="EXPRSS/text()" /> 
					</EXPRSS>
					<TEST>
						<xsl:value-of select="TEST/text()" /> 
					</TEST>
					<IDOCTYP>
						<xsl:value-of select="$var:v4" /> 
					</IDOCTYP>
					<CIMTYP>
						<xsl:value-of select="$var:v5" /> 
					</CIMTYP>
					<MESTYP>
						<xsl:value-of select="$var:v6" /> 
					</MESTYP>
					<MESCOD>
						<xsl:value-of select="MESCOD/text()" /> 
					</MESCOD>
					<MESFCT>
						<xsl:value-of select="MESFCT/text()" /> 
					</MESFCT>
					<STD>
						<xsl:value-of select="$var:v7" /> 
					</STD>
					<STDVRS>
						<xsl:value-of select="STDVRS/text()" /> 
					</STDVRS>
					<STDMES>
						<xsl:value-of select="STDMES/text()" /> 
					</STDMES>
					<SNDPOR>
						<xsl:value-of select="$var:v8" /> 
					</SNDPOR>
					<SNDPRT>
						<xsl:value-of select="$var:v9" /> 
					</SNDPRT>
					<SNDPFC>
						<xsl:value-of select="$var:v10" /> 
					</SNDPFC>
					<SNDPRN>
						<xsl:value-of select="SNDPRN/text()" /> 
					</SNDPRN>
					<SNDSAD>
						<xsl:value-of select="SNDSAD/text()" /> 
					</SNDSAD>
					<SNDLAD>
						<xsl:value-of select="SNDLAD/text()" /> 
					</SNDLAD>
					<xsl:variable name="var:v11" select="ScriptNS0:GetInterfaceLookupData('RCVPOR' ,'SAP.Common.Z3Orders')" /> 
					<RCVPOR>
						<xsl:value-of select="$var:v11" /> 
					</RCVPOR>
					<RCVPRT>
						<xsl:value-of select="$var:v12" /> 
					</RCVPRT>
					<RCVPFC>
						<xsl:value-of select="$var:v13" /> 
					</RCVPFC>
					<RCVPRN>
						<xsl:value-of select="RCVPRN/text()" /> 
					</RCVPRN>
					<RCVSAD>
						<xsl:value-of select="RCVSAD/text()" /> 
					</RCVSAD>
					<RCVLAD>
						<xsl:value-of select="RCVLAD/text()" /> 
					</RCVLAD>
					<CREDAT>
						<xsl:value-of select="CREDAT/text()" /> 
					</CREDAT>
					<CRETIM>
						<xsl:value-of select="CRETIM/text()" /> 
					</CRETIM>
					<REFINT>
						<xsl:value-of select="REFINT/text()" /> 
					</REFINT>
					<REFGRP>
						<xsl:value-of select="REFGRP/text()" /> 
					</REFGRP>
					<REFMES>
						<xsl:value-of select="REFMES/text()" /> 
					</REFMES>
					<ARCKEY>
						<xsl:value-of select="ARCKEY/text()" /> 
					</ARCKEY>
					<SERIAL>
						<xsl:value-of select="SERIAL/text()" /> 
					</SERIAL>
				</EDI_DC40>
			</xsl:for-each>
			<E2EDK01005GRP>
				<xsl:for-each select="E2EDK01005GRP">
					<E1EDK01>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDK01/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDK01/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDK01/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                <xsl:value-of select="E1EDK01/DATAHEADERREC/SEGNUM/text()" />
              </SEGNUM>
							<PSGNUM>
								<xsl:text /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDK01/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDK01/ACTION">
							<ACTION>
								<xsl:value-of select="E1EDK01/ACTION/text()" /> 
							</ACTION>
						</xsl:if>
						<xsl:if test="E1EDK01/KZABS">
							<KZABS>
								<xsl:value-of select="E1EDK01/KZABS/text()" /> 
							</KZABS>
						</xsl:if>
						<xsl:if test="E1EDK01/CURCY">
							<CURCY>
								<xsl:value-of select="E1EDK01/CURCY/text()" /> 
							</CURCY>
						</xsl:if>
						<xsl:if test="E1EDK01/HWAER">
							<HWAER>
								<xsl:value-of select="E1EDK01/HWAER/text()" /> 
							</HWAER>
						</xsl:if>
						<xsl:if test="E1EDK01/WKURS">
							<WKURS>
								<xsl:value-of select="E1EDK01/WKURS/text()" /> 
							</WKURS>
						</xsl:if>
						<xsl:if test="E1EDK01/ZTERM">
							<ZTERM>
								<xsl:value-of select="E1EDK01/ZTERM/text()" /> 
							</ZTERM>
						</xsl:if>
						<xsl:if test="E1EDK01/KUNDEUINR">
							<KUNDEUINR>
								<xsl:value-of select="E1EDK01/KUNDEUINR/text()" /> 
							</KUNDEUINR>
						</xsl:if>
						<xsl:if test="E1EDK01/EIGENUINR">
							<EIGENUINR>
								<xsl:value-of select="E1EDK01/EIGENUINR/text()" /> 
							</EIGENUINR>
						</xsl:if>
						<xsl:if test="E1EDK01/BSART">
							<BSART>
								<xsl:value-of select="E1EDK01/BSART/text()" /> 
							</BSART>
						</xsl:if>
						<xsl:if test="E1EDK01/BELNR">
							<BELNR>
								<xsl:value-of select="E1EDK01/BELNR/text()" /> 
							</BELNR>
						</xsl:if>
						<xsl:if test="E1EDK01/NTGEW">
							<NTGEW>
								<xsl:value-of select="E1EDK01/NTGEW/text()" /> 
							</NTGEW>
						</xsl:if>
						<xsl:if test="E1EDK01/BRGEW">
							<BRGEW>
								<xsl:value-of select="E1EDK01/BRGEW/text()" /> 
							</BRGEW>
						</xsl:if>
						<xsl:if test="E1EDK01/GEWEI">
							<GEWEI>
								<xsl:value-of select="E1EDK01/GEWEI/text()" /> 
							</GEWEI>
						</xsl:if>
						<xsl:if test="E1EDK01/FKART_RL">
							<FKART_RL>
								<xsl:value-of select="E1EDK01/FKART_RL/text()" /> 
							</FKART_RL>
						</xsl:if>
						<xsl:if test="E1EDK01/ABLAD">
							<ABLAD>
								<xsl:value-of select="E1EDK01/ABLAD/text()" /> 
							</ABLAD>
						</xsl:if>
						<xsl:if test="E1EDK01/BSTZD">
							<BSTZD>
								<xsl:value-of select="E1EDK01/BSTZD/text()" /> 
							</BSTZD>
						</xsl:if>
						<xsl:if test="E1EDK01/VSART">
							<VSART>
								<xsl:value-of select="E1EDK01/VSART/text()" /> 
							</VSART>
						</xsl:if>
						<xsl:if test="E1EDK01/VSART_BEZ">
							<VSART_BEZ>
								<xsl:value-of select="E1EDK01/VSART_BEZ/text()" /> 
							</VSART_BEZ>
						</xsl:if>
						<xsl:if test="E1EDK01/RECIPNT_NO">
							<RECIPNT_NO>
								<xsl:value-of select="E1EDK01/RECIPNT_NO/text()" /> 
							</RECIPNT_NO>
						</xsl:if>
						<xsl:if test="E1EDK01/KZAZU">
							<KZAZU>
								<xsl:value-of select="E1EDK01/KZAZU/text()" /> 
							</KZAZU>
						</xsl:if>
						<xsl:if test="E1EDK01/AUTLF">
							<AUTLF>
								<xsl:value-of select="E1EDK01/AUTLF/text()" /> 
							</AUTLF>
						</xsl:if>
						<xsl:if test="E1EDK01/AUGRU">
							<AUGRU>
								<xsl:value-of select="E1EDK01/AUGRU/text()" /> 
							</AUGRU>
						</xsl:if>
						<xsl:if test="E1EDK01/AUGRU_BEZ">
							<AUGRU_BEZ>
								<xsl:value-of select="E1EDK01/AUGRU_BEZ/text()" /> 
							</AUGRU_BEZ>
						</xsl:if>
						<xsl:if test="E1EDK01/ABRVW">
							<ABRVW>
								<xsl:value-of select="E1EDK01/ABRVW/text()" /> 
							</ABRVW>
						</xsl:if>
						<xsl:if test="E1EDK01/ABRVW_BEZ">
							<ABRVW_BEZ>
								<xsl:value-of select="E1EDK01/ABRVW_BEZ/text()" /> 
							</ABRVW_BEZ>
						</xsl:if>
						<xsl:if test="E1EDK01/FKTYP">
							<FKTYP>
								<xsl:value-of select="E1EDK01/FKTYP/text()" /> 
							</FKTYP>
						</xsl:if>
						<xsl:if test="E1EDK01/LIFSK">
							<LIFSK>
								<xsl:value-of select="E1EDK01/LIFSK/text()" /> 
							</LIFSK>
						</xsl:if>
						<xsl:if test="E1EDK01/LIFSK_BEZ">
							<LIFSK_BEZ>
								<xsl:value-of select="E1EDK01/LIFSK_BEZ/text()" /> 
							</LIFSK_BEZ>
						</xsl:if>
						<xsl:if test="E1EDK01/EMPST">
							<EMPST>
								<xsl:value-of select="E1EDK01/EMPST/text()" /> 
							</EMPST>
						</xsl:if>
						<xsl:if test="E1EDK01/ABTNR">
							<ABTNR>
								<xsl:value-of select="E1EDK01/ABTNR/text()" /> 
							</ABTNR>
						</xsl:if>
						<xsl:if test="E1EDK01/DELCO">
							<DELCO>
								<xsl:value-of select="E1EDK01/DELCO/text()" /> 
							</DELCO>
						</xsl:if>
						<xsl:if test="E1EDK01/WKURS_M">
							<WKURS_M>
								<xsl:value-of select="E1EDK01/WKURS_M/text()" /> 
							</WKURS_M>
						</xsl:if>
						<xsl:if test="E1EDK01/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDK01/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK01>
				</xsl:for-each>
				<xsl:for-each select="E2EDK01005GRP">
					<xsl:for-each select="Z1E1EDK01">
						<Z1E1EDK01>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="PO_TYPE">
								<PO_TYPE>
									<xsl:value-of select="PO_TYPE/text()" /> 
								</PO_TYPE>
							</xsl:if>
							<xsl:if test="AP_VALUE">
								<AP_VALUE>
									<xsl:value-of select="AP_VALUE/text()" /> 
								</AP_VALUE>
							</xsl:if>
							<xsl:if test="DP_VALUE">
								<DP_VALUE>
									<xsl:value-of select="DP_VALUE/text()" /> 
								</DP_VALUE>
							</xsl:if>
							<xsl:if test="DP_NAME">
								<DP_NAME>
									<xsl:value-of select="DP_NAME/text()" /> 
								</DP_NAME>
							</xsl:if>
							<xsl:if test="COMP_CODE">
								<COMP_CODE>
									<xsl:value-of select="COMP_CODE/text()" /> 
								</COMP_CODE>
							</xsl:if>
							<xsl:if test="STATUS">
								<STATUS>
									<xsl:value-of select="STATUS/text()" /> 
								</STATUS>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</Z1E1EDK01>
					</xsl:for-each>
				</xsl:for-each>
			</E2EDK01005GRP>
			<xsl:for-each select="E1EDK14">
				<E1EDK14>
					<DATAHEADERREC>
						<SEGNAM>
							<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
						</SEGNAM>
						<MANDT>
							<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
						</MANDT>
						<DOCNUM>
							<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
						</DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
						<HLEVEL>
							<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
						</HLEVEL>
					</DATAHEADERREC>
					<xsl:if test="QUALF">
						<QUALF>
							<xsl:value-of select="QUALF/text()" /> 
						</QUALF>
					</xsl:if>
					<xsl:if test="ORGID">
						<ORGID>
							<xsl:value-of select="ORGID/text()" /> 
						</ORGID>
					</xsl:if>
					<xsl:if test="SEGMENTPAD">
						<SEGMENTPAD>
							<xsl:value-of select="SEGMENTPAD/text()" /> 
						</SEGMENTPAD>
					</xsl:if>
				</E1EDK14>
			</xsl:for-each>
			<xsl:for-each select="E1EDK03">
				<E1EDK03>
					<DATAHEADERREC>
						<SEGNAM>
							<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
						</SEGNAM>
						<MANDT>
							<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
						</MANDT>
						<DOCNUM>
							<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
						</DOCNUM>
            <SEGNUM>
               <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
						<HLEVEL>
							<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
						</HLEVEL>
					</DATAHEADERREC>
					<xsl:if test="IDDAT">
						<IDDAT>
							<xsl:value-of select="IDDAT/text()" /> 
						</IDDAT>
					</xsl:if>
					<xsl:if test="DATUM">
						<DATUM>
							<xsl:value-of select="DATUM/text()" /> 
						</DATUM>
					</xsl:if>
					<xsl:if test="UZEIT">
						<UZEIT>
							<xsl:value-of select="UZEIT/text()" /> 
						</UZEIT>
					</xsl:if>
					<xsl:if test="SEGMENTPAD">
						<SEGMENTPAD>
							<xsl:value-of select="SEGMENTPAD/text()" /> 
						</SEGMENTPAD>
					</xsl:if>
				</E1EDK03>
			</xsl:for-each>
			<xsl:for-each select="E1EDK04">
				<xsl:variable name="var:v14" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v15" select="userCSharp:LogicalEq(string($var:v14) , 'true')" /> 
				<xsl:if test="$var:v15">
					<E1EDK04>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
              <SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="MWSKZ">
							<MWSKZ>
								<xsl:value-of select="MWSKZ/text()" /> 
							</MWSKZ>
						</xsl:if>
						<xsl:if test="MSATZ">
							<MSATZ>
								<xsl:value-of select="MSATZ/text()" /> 
							</MSATZ>
						</xsl:if>
						<xsl:if test="MWSBT">
							<MWSBT>
								<xsl:value-of select="MWSBT/text()" /> 
							</MWSBT>
						</xsl:if>
						<xsl:if test="TXJCD">
							<TXJCD>
								<xsl:value-of select="TXJCD/text()" /> 
							</TXJCD>
						</xsl:if>
						<xsl:if test="KTEXT">
							<KTEXT>
								<xsl:value-of select="KTEXT/text()" /> 
							</KTEXT>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK04>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="E1EDK05">
				<xsl:variable name="var:v16" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v17" select="userCSharp:LogicalEq(string($var:v16) , 'true')" /> 
				<xsl:if test="$var:v17">
					<E1EDK05>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="ALCKZ">
							<ALCKZ>
								<xsl:value-of select="ALCKZ/text()" /> 
							</ALCKZ>
						</xsl:if>
						<xsl:if test="KSCHL">
							<KSCHL>
								<xsl:value-of select="KSCHL/text()" /> 
							</KSCHL>
						</xsl:if>
						<xsl:if test="KOTXT">
							<KOTXT>
								<xsl:value-of select="KOTXT/text()" /> 
							</KOTXT>
						</xsl:if>
						<xsl:if test="BETRG">
							<BETRG>
								<xsl:value-of select="BETRG/text()" /> 
							</BETRG>
						</xsl:if>
						<xsl:if test="KPERC">
							<KPERC>
								<xsl:value-of select="KPERC/text()" /> 
							</KPERC>
						</xsl:if>
						<xsl:if test="KRATE">
							<KRATE>
								<xsl:value-of select="KRATE/text()" /> 
							</KRATE>
						</xsl:if>
						<xsl:if test="UPRBS">
							<UPRBS>
								<xsl:value-of select="UPRBS/text()" /> 
							</UPRBS>
						</xsl:if>
						<xsl:if test="MEAUN">
							<MEAUN>
								<xsl:value-of select="MEAUN/text()" /> 
							</MEAUN>
						</xsl:if>
						<xsl:if test="KOBTR">
							<KOBTR>
								<xsl:value-of select="KOBTR/text()" /> 
							</KOBTR>
						</xsl:if>
						<xsl:if test="MWSKZ">
							<MWSKZ>
								<xsl:value-of select="MWSKZ/text()" /> 
							</MWSKZ>
						</xsl:if>
						<xsl:if test="MSATZ">
							<MSATZ>
								<xsl:value-of select="MSATZ/text()" /> 
							</MSATZ>
						</xsl:if>
						<xsl:if test="KOEIN">
							<KOEIN>
								<xsl:value-of select="KOEIN/text()" /> 
							</KOEIN>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK05>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="E2EDKA1003GRP">
				<xsl:variable name="var:v18" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v19" select="userCSharp:LogicalEq(string($var:v18) , 'true')" /> 
				<E2EDKA1003GRP>
					<E1EDKA1>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDKA1/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDKA1/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDKA1/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDKA1/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDKA1/PARVW">
							<PARVW>
								<xsl:value-of select="E1EDKA1/PARVW/text()" /> 
							</PARVW>
						</xsl:if>
						<xsl:if test="E1EDKA1/PARTN">
							<PARTN>
								<xsl:value-of select="E1EDKA1/PARTN/text()" /> 
							</PARTN>
						</xsl:if>
						<xsl:if test="E1EDKA1/LIFNR">
							<LIFNR>
								<xsl:value-of select="E1EDKA1/LIFNR/text()" /> 
							</LIFNR>
						</xsl:if>
						<xsl:if test="E1EDKA1/NAME1">
							<NAME1>
								<xsl:value-of select="E1EDKA1/NAME1/text()" /> 
							</NAME1>
						</xsl:if>
						<xsl:if test="E1EDKA1/NAME2">
							<NAME2>
								<xsl:value-of select="E1EDKA1/NAME2/text()" /> 
							</NAME2>
						</xsl:if>
						<xsl:if test="E1EDKA1/NAME3">
							<NAME3>
								<xsl:value-of select="E1EDKA1/NAME3/text()" /> 
							</NAME3>
						</xsl:if>
						<xsl:if test="E1EDKA1/NAME4">
							<NAME4>
								<xsl:value-of select="E1EDKA1/NAME4/text()" /> 
							</NAME4>
						</xsl:if>
						<xsl:if test="E1EDKA1/STRAS">
							<STRAS>
								<xsl:value-of select="E1EDKA1/STRAS/text()" /> 
							</STRAS>
						</xsl:if>
						<xsl:if test="E1EDKA1/STRS2">
							<STRS2>
								<xsl:value-of select="E1EDKA1/STRS2/text()" /> 
							</STRS2>
						</xsl:if>
						<xsl:if test="E1EDKA1/PFACH">
							<PFACH>
								<xsl:value-of select="E1EDKA1/PFACH/text()" /> 
							</PFACH>
						</xsl:if>
						<xsl:if test="E1EDKA1/ORT01">
							<ORT01>
								<xsl:value-of select="E1EDKA1/ORT01/text()" /> 
							</ORT01>
						</xsl:if>
						<xsl:if test="E1EDKA1/COUNC">
							<COUNC>
								<xsl:value-of select="E1EDKA1/COUNC/text()" /> 
							</COUNC>
						</xsl:if>
						<xsl:if test="E1EDKA1/PSTLZ">
							<PSTLZ>
								<xsl:value-of select="E1EDKA1/PSTLZ/text()" /> 
							</PSTLZ>
						</xsl:if>
						<xsl:if test="E1EDKA1/PSTL2">
							<PSTL2>
								<xsl:value-of select="E1EDKA1/PSTL2/text()" /> 
							</PSTL2>
						</xsl:if>
						<xsl:if test="E1EDKA1/LAND1">
							<LAND1>
								<xsl:value-of select="E1EDKA1/LAND1/text()" /> 
							</LAND1>
						</xsl:if>
						<xsl:if test="E1EDKA1/ABLAD">
							<ABLAD>
								<xsl:value-of select="E1EDKA1/ABLAD/text()" /> 
							</ABLAD>
						</xsl:if>
						<xsl:if test="E1EDKA1/PERNR">
							<PERNR>
								<xsl:value-of select="E1EDKA1/PERNR/text()" /> 
							</PERNR>
						</xsl:if>
						<xsl:if test="E1EDKA1/PARNR">
							<PARNR>
								<xsl:value-of select="E1EDKA1/PARNR/text()" /> 
							</PARNR>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELF1">
							<TELF1>
								<xsl:value-of select="E1EDKA1/TELF1/text()" /> 
							</TELF1>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELF2">
							<TELF2>
								<xsl:value-of select="E1EDKA1/TELF2/text()" /> 
							</TELF2>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELBX">
							<TELBX>
								<xsl:value-of select="E1EDKA1/TELBX/text()" /> 
							</TELBX>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELFX">
							<TELFX>
								<xsl:value-of select="E1EDKA1/TELFX/text()" /> 
							</TELFX>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELTX">
							<TELTX>
								<xsl:value-of select="E1EDKA1/TELTX/text()" /> 
							</TELTX>
						</xsl:if>
						<xsl:if test="E1EDKA1/TELX1">
							<TELX1>
								<xsl:value-of select="E1EDKA1/TELX1/text()" /> 
							</TELX1>
						</xsl:if>
						<xsl:if test="E1EDKA1/SPRAS">
							<SPRAS>
								<xsl:value-of select="E1EDKA1/SPRAS/text()" /> 
							</SPRAS>
						</xsl:if>
						<xsl:if test="E1EDKA1/ANRED">
							<ANRED>
								<xsl:value-of select="E1EDKA1/ANRED/text()" /> 
							</ANRED>
						</xsl:if>
						<xsl:if test="E1EDKA1/ORT02">
							<ORT02>
								<xsl:value-of select="E1EDKA1/ORT02/text()" /> 
							</ORT02>
						</xsl:if>
						<xsl:if test="E1EDKA1/HAUSN">
							<HAUSN>
								<xsl:value-of select="E1EDKA1/HAUSN/text()" /> 
							</HAUSN>
						</xsl:if>
						<xsl:if test="E1EDKA1/STOCK">
							<STOCK>
								<xsl:value-of select="E1EDKA1/STOCK/text()" /> 
							</STOCK>
						</xsl:if>
						<xsl:if test="E1EDKA1/REGIO">
							<REGIO>
								<xsl:value-of select="E1EDKA1/REGIO/text()" /> 
							</REGIO>
						</xsl:if>
						<xsl:if test="E1EDKA1/PARGE">
							<PARGE>
								<xsl:value-of select="E1EDKA1/PARGE/text()" /> 
							</PARGE>
						</xsl:if>
						<xsl:if test="E1EDKA1/ISOAL">
							<ISOAL>
								<xsl:value-of select="E1EDKA1/ISOAL/text()" /> 
							</ISOAL>
						</xsl:if>
						<xsl:if test="E1EDKA1/ISONU">
							<ISONU>
								<xsl:value-of select="E1EDKA1/ISONU/text()" /> 
							</ISONU>
						</xsl:if>
						<xsl:if test="E1EDKA1/FCODE">
							<FCODE>
								<xsl:value-of select="E1EDKA1/FCODE/text()" /> 
							</FCODE>
						</xsl:if>
						<xsl:if test="E1EDKA1/IHREZ">
							<IHREZ>
								<xsl:value-of select="E1EDKA1/IHREZ/text()" /> 
							</IHREZ>
						</xsl:if>
						<xsl:if test="E1EDKA1/BNAME">
							<BNAME>
								<xsl:value-of select="E1EDKA1/BNAME/text()" /> 
							</BNAME>
						</xsl:if>
						<xsl:if test="E1EDKA1/PAORG">
							<PAORG>
								<xsl:value-of select="E1EDKA1/PAORG/text()" /> 
							</PAORG>
						</xsl:if>
						<xsl:if test="E1EDKA1/ORGTX">
							<ORGTX>
								<xsl:value-of select="E1EDKA1/ORGTX/text()" /> 
							</ORGTX>
						</xsl:if>
						<xsl:if test="E1EDKA1/PAGRU">
							<PAGRU>
								<xsl:value-of select="E1EDKA1/PAGRU/text()" /> 
							</PAGRU>
						</xsl:if>
						<xsl:if test="E1EDKA1/KNREF">
							<KNREF>
								<xsl:value-of select="E1EDKA1/KNREF/text()" /> 
							</KNREF>
						</xsl:if>
						<xsl:if test="E1EDKA1/ILNNR">
							<ILNNR>
								<xsl:value-of select="E1EDKA1/ILNNR/text()" /> 
							</ILNNR>
						</xsl:if>
						<xsl:if test="E1EDKA1/PFORT">
							<PFORT>
								<xsl:value-of select="E1EDKA1/PFORT/text()" /> 
							</PFORT>
						</xsl:if>
						<xsl:if test="E1EDKA1/SPRAS_ISO">
							<SPRAS_ISO>
								<xsl:value-of select="E1EDKA1/SPRAS_ISO/text()" /> 
							</SPRAS_ISO>
						</xsl:if>
						<xsl:if test="E1EDKA1/TITLE">
							<TITLE>
								<xsl:value-of select="E1EDKA1/TITLE/text()" /> 
							</TITLE>
						</xsl:if>
						<xsl:if test="E1EDKA1/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDKA1/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDKA1>
					<xsl:if test="$var:v19">
						<E1EDKA3>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E1EDKA3/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E1EDKA3/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E1EDKA3/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:text /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E1EDKA3/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E1EDKA3/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E1EDKA3/QUALP">
								<QUALP>
									<xsl:value-of select="E1EDKA3/QUALP/text()" /> 
								</QUALP>
							</xsl:if>
							<xsl:if test="E1EDKA3/STDPN">
								<STDPN>
									<xsl:value-of select="E1EDKA3/STDPN/text()" /> 
								</STDPN>
							</xsl:if>
							<xsl:if test="E1EDKA3/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E1EDKA3/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDKA3>
					</xsl:if>
				</E2EDKA1003GRP>
			</xsl:for-each>
			<xsl:for-each select="E1EDK02">
				<xsl:variable name="var:v20" select="userCSharp:StringConcat('001')" /> 
				<E1EDK02>
					<DATAHEADERREC>
						<SEGNAM>
							<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
						</SEGNAM>
						<MANDT>
							<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
						</MANDT>
						<DOCNUM>
							<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
						</DOCNUM>
						<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
						<HLEVEL>
							<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
						</HLEVEL>
					</DATAHEADERREC>
					<QUALF>
						<xsl:value-of select="$var:v20" /> 
					</QUALF>
					<xsl:if test="BELNR">
						<BELNR>
							<xsl:value-of select="BELNR/text()" /> 
						</BELNR>
					</xsl:if>
					<xsl:if test="POSNR">
						<POSNR>
							<xsl:value-of select="POSNR/text()" /> 
						</POSNR>
					</xsl:if>
					<xsl:if test="DATUM">
						<DATUM>
							<xsl:value-of select="DATUM/text()" /> 
						</DATUM>
					</xsl:if>
					<xsl:if test="UZEIT">
						<UZEIT>
							<xsl:value-of select="UZEIT/text()" /> 
						</UZEIT>
					</xsl:if>
					<xsl:if test="SEGMENTPAD">
						<SEGMENTPAD>
							<xsl:value-of select="SEGMENTPAD/text()" /> 
						</SEGMENTPAD>
					</xsl:if>
				</E1EDK02>
			</xsl:for-each>
			<xsl:for-each select="E1EDK17">
				<xsl:variable name="var:v21" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v22" select="userCSharp:LogicalEq(string($var:v21) , 'true')" /> 
				<xsl:if test="$var:v22">
					<E1EDK17>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
						<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="QUALF">
							<QUALF>
								<xsl:value-of select="QUALF/text()" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="LKOND">
							<LKOND>
								<xsl:value-of select="LKOND/text()" /> 
							</LKOND>
						</xsl:if>
						<xsl:if test="LKTEXT">
							<LKTEXT>
								<xsl:value-of select="LKTEXT/text()" /> 
							</LKTEXT>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK17>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="E1EDK18">
				<xsl:variable name="var:v23" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v24" select="userCSharp:LogicalEq(string($var:v23) , 'true')" /> 
				<xsl:if test="$var:v24">
					<E1EDK18>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="QUALF">
							<QUALF>
								<xsl:value-of select="QUALF/text()" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="TAGE">
							<TAGE>
								<xsl:value-of select="TAGE/text()" /> 
							</TAGE>
						</xsl:if>
						<xsl:if test="PRZNT">
							<PRZNT>
								<xsl:value-of select="PRZNT/text()" /> 
							</PRZNT>
						</xsl:if>
						<xsl:if test="ZTERM_TXT">
							<ZTERM_TXT>
								<xsl:value-of select="ZTERM_TXT/text()" /> 
							</ZTERM_TXT>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK18>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="E1EDK35">
				<xsl:variable name="var:v25" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v26" select="userCSharp:LogicalEq(string($var:v25) , 'true')" /> 
				<xsl:if test="$var:v26">
					<E1EDK35>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
						<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="QUALZ">
							<QUALZ>
								<xsl:value-of select="QUALZ/text()" /> 
							</QUALZ>
						</xsl:if>
						<xsl:if test="CUSADD">
							<CUSADD>
								<xsl:value-of select="CUSADD/text()" /> 
							</CUSADD>
						</xsl:if>
						<xsl:if test="CUSADD_BEZ">
							<CUSADD_BEZ>
								<xsl:value-of select="CUSADD_BEZ/text()" /> 
							</CUSADD_BEZ>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK35>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="E1EDK36">
				<xsl:variable name="var:v27" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v28" select="userCSharp:LogicalEq(string($var:v27) , 'true')" /> 
				<xsl:if test="$var:v28">
					<E1EDK36>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="CCINS">
							<CCINS>
								<xsl:value-of select="CCINS/text()" /> 
							</CCINS>
						</xsl:if>
						<xsl:if test="CCINS_BEZEI">
							<CCINS_BEZEI>
								<xsl:value-of select="CCINS_BEZEI/text()" /> 
							</CCINS_BEZEI>
						</xsl:if>
						<xsl:if test="CCNUM">
							<CCNUM>
								<xsl:value-of select="CCNUM/text()" /> 
							</CCNUM>
						</xsl:if>
						<xsl:if test="EXDATBI">
							<EXDATBI>
								<xsl:value-of select="EXDATBI/text()" /> 
							</EXDATBI>
						</xsl:if>
						<xsl:if test="CCNAME">
							<CCNAME>
								<xsl:value-of select="CCNAME/text()" /> 
							</CCNAME>
						</xsl:if>
						<xsl:if test="FAKWR">
							<FAKWR>
								<xsl:value-of select="FAKWR/text()" /> 
							</FAKWR>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDK36>
				</xsl:if>
			</xsl:for-each>
			<E2EDKT1002GRP>
				<xsl:for-each select="E2EDKT1002GRP">
					<E1EDKT1>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDKT1/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDKT1/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDKT1/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
                 <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDKT1/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDKT1/TDID">
							<TDID>
								<xsl:value-of select="E1EDKT1/TDID/text()" /> 
							</TDID>
						</xsl:if>
						<xsl:if test="E1EDKT1/TSSPRAS">
							<TSSPRAS>
								<xsl:value-of select="E1EDKT1/TSSPRAS/text()" /> 
							</TSSPRAS>
						</xsl:if>
						<xsl:if test="E1EDKT1/TSSPRAS_ISO">
							<TSSPRAS_ISO>
								<xsl:value-of select="E1EDKT1/TSSPRAS_ISO/text()" /> 
							</TSSPRAS_ISO>
						</xsl:if>
						<xsl:if test="E1EDKT1/TDOBJECT">
							<TDOBJECT>
								<xsl:value-of select="E1EDKT1/TDOBJECT/text()" /> 
							</TDOBJECT>
						</xsl:if>
						<xsl:if test="E1EDKT1/TDOBNAME">
							<TDOBNAME>
								<xsl:value-of select="E1EDKT1/TDOBNAME/text()" /> 
							</TDOBNAME>
						</xsl:if>
						<xsl:if test="E1EDKT1/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDKT1/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDKT1>
				</xsl:for-each>
				<xsl:for-each select="E2EDKT1002GRP">
					<xsl:for-each select="E1EDKT2">
						<E1EDKT2>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
                  <xsl:text> </xsl:text>								
								</SEGNUM>
								<PSGNUM>
									<xsl:text /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="TDLINE">
								<TDLINE>
									<xsl:value-of select="TDLINE/text()" /> 
								</TDLINE>
							</xsl:if>
							<xsl:if test="TDFORMAT">
								<TDFORMAT>
									<xsl:value-of select="TDFORMAT/text()" /> 
								</TDFORMAT>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDKT2>
					</xsl:for-each>
				</xsl:for-each>
			</E2EDKT1002GRP>
			<xsl:for-each select="E2EDP01007GRP">
				<xsl:variable name="var:v29" select="userCSharp:LogicalEq(string(E1EDP19/QUALF/text()) , '')" /> 
				<xsl:variable name="var:v31" select="userCSharp:LogicalNot(string($var:v29))" /> 
				<xsl:variable name="var:v33" select="string(E1EDP19/QUALF/text())" /> 
				<xsl:variable name="var:v34" select="userCSharp:LogicalEq($var:v33 , '001')" /> 
				<xsl:variable name="var:v35" select="userCSharp:LogicalNe('' , string(E1EDP19/IDTNR/text()))" /> 
				<xsl:variable name="var:v36" select="userCSharp:LogicalAnd(string($var:v34) , string($var:v35))" /> 
				<E2EDP01007GRP>
					<E1EDP01>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP01/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDP01/POSEX">
							<POSEX>
								<xsl:value-of select="E1EDP01/POSEX/text()" /> 
							</POSEX>
						</xsl:if>
						<xsl:if test="E1EDP01/ACTION">
							<ACTION>
								<xsl:value-of select="E1EDP01/ACTION/text()" /> 
							</ACTION>
						</xsl:if>
						<xsl:if test="E1EDP01/PSTYP">
							<PSTYP>
								<xsl:value-of select="E1EDP01/PSTYP/text()" /> 
							</PSTYP>
						</xsl:if>
						<xsl:if test="E1EDP01/KZABS">
							<KZABS>
								<xsl:value-of select="E1EDP01/KZABS/text()" /> 
							</KZABS>
						</xsl:if>
						<xsl:if test="E1EDP01/MENGE">
							<MENGE>
								<xsl:value-of select="E1EDP01/MENGE/text()" /> 
							</MENGE>
						</xsl:if>
						<xsl:if test="E1EDP01/MENEE">
							<MENEE>
								<xsl:value-of select="E1EDP01/MENEE/text()" /> 
							</MENEE>
						</xsl:if>
						<xsl:if test="E1EDP01/BMNG2">
							<BMNG2>
								<xsl:value-of select="E1EDP01/BMNG2/text()" /> 
							</BMNG2>
						</xsl:if>
						<xsl:if test="E1EDP01/PMENE">
							<PMENE>
								<xsl:value-of select="E1EDP01/PMENE/text()" /> 
							</PMENE>
						</xsl:if>
						<xsl:if test="E1EDP01/ABFTZ">
							<ABFTZ>
								<xsl:value-of select="E1EDP01/ABFTZ/text()" /> 
							</ABFTZ>
						</xsl:if>
						<xsl:if test="E1EDP01/VPREI">
							<VPREI>
								<xsl:value-of select="E1EDP01/VPREI/text()" /> 
							</VPREI>
						</xsl:if>
						<xsl:if test="E1EDP01/PEINH">
							<PEINH>
								<xsl:value-of select="E1EDP01/PEINH/text()" /> 
							</PEINH>
						</xsl:if>
						<xsl:if test="E1EDP01/NETWR">
							<NETWR>
								<xsl:value-of select="E1EDP01/NETWR/text()" /> 
							</NETWR>
						</xsl:if>
						<xsl:if test="E1EDP01/ANETW">
							<ANETW>
								<xsl:value-of select="E1EDP01/ANETW/text()" /> 
							</ANETW>
						</xsl:if>
						<xsl:if test="E1EDP01/SKFBP">
							<SKFBP>
								<xsl:value-of select="E1EDP01/SKFBP/text()" /> 
							</SKFBP>
						</xsl:if>
						<xsl:if test="E1EDP01/NTGEW">
							<NTGEW>
								<xsl:value-of select="E1EDP01/NTGEW/text()" /> 
							</NTGEW>
						</xsl:if>
						<xsl:if test="E1EDP01/GEWEI">
							<GEWEI>
								<xsl:value-of select="E1EDP01/GEWEI/text()" /> 
							</GEWEI>
						</xsl:if>
						<xsl:if test="E1EDP01/EINKZ">
							<EINKZ>
								<xsl:value-of select="E1EDP01/EINKZ/text()" /> 
							</EINKZ>
						</xsl:if>
						<xsl:if test="E1EDP01/CURCY">
							<CURCY>
								<xsl:value-of select="E1EDP01/CURCY/text()" /> 
							</CURCY>
						</xsl:if>
						<xsl:if test="E1EDP01/PREIS">
							<PREIS>
								<xsl:value-of select="E1EDP01/PREIS/text()" /> 
							</PREIS>
						</xsl:if>
						<xsl:if test="E1EDP01/MATKL">
							<MATKL>
								<xsl:value-of select="E1EDP01/MATKL/text()" /> 
							</MATKL>
						</xsl:if>
						<xsl:if test="E1EDP01/UEPOS">
							<UEPOS>
								<xsl:value-of select="E1EDP01/UEPOS/text()" /> 
							</UEPOS>
						</xsl:if>
						<xsl:if test="E1EDP01/GRKOR">
							<GRKOR>
								<xsl:value-of select="E1EDP01/GRKOR/text()" /> 
							</GRKOR>
						</xsl:if>
						<xsl:if test="E1EDP01/EVERS">
							<EVERS>
								<xsl:value-of select="E1EDP01/EVERS/text()" /> 
							</EVERS>
						</xsl:if>
						<xsl:if test="E1EDP01/BPUMN">
							<BPUMN>
								<xsl:value-of select="E1EDP01/BPUMN/text()" /> 
							</BPUMN>
						</xsl:if>
						<xsl:if test="E1EDP01/BPUMZ">
							<BPUMZ>
								<xsl:value-of select="E1EDP01/BPUMZ/text()" /> 
							</BPUMZ>
						</xsl:if>
						<xsl:if test="E1EDP01/ABGRU">
							<ABGRU>
								<xsl:value-of select="E1EDP01/ABGRU/text()" /> 
							</ABGRU>
						</xsl:if>
						<xsl:if test="E1EDP01/ABGRT">
							<ABGRT>
								<xsl:value-of select="E1EDP01/ABGRT/text()" /> 
							</ABGRT>
						</xsl:if>
						<xsl:if test="E1EDP01/ANTLF">
							<ANTLF>
								<xsl:value-of select="E1EDP01/ANTLF/text()" /> 
							</ANTLF>
						</xsl:if>
						<xsl:if test="E1EDP01/FIXMG">
							<FIXMG>
								<xsl:value-of select="E1EDP01/FIXMG/text()" /> 
							</FIXMG>
						</xsl:if>
						<xsl:if test="E1EDP01/KZAZU">
							<KZAZU>
								<xsl:value-of select="E1EDP01/KZAZU/text()" /> 
							</KZAZU>
						</xsl:if>
						<xsl:if test="E1EDP01/BRGEW">
							<BRGEW>
								<xsl:value-of select="E1EDP01/BRGEW/text()" /> 
							</BRGEW>
						</xsl:if>
						<xsl:if test="E1EDP01/PSTYV">
							<PSTYV>
								<xsl:value-of select="E1EDP01/PSTYV/text()" /> 
							</PSTYV>
						</xsl:if>
						<xsl:if test="E1EDP01/EMPST">
							<EMPST>
								<xsl:value-of select="E1EDP01/EMPST/text()" /> 
							</EMPST>
						</xsl:if>
						<xsl:if test="E1EDP01/ABTNR">
							<ABTNR>
								<xsl:value-of select="E1EDP01/ABTNR/text()" /> 
							</ABTNR>
						</xsl:if>
						<xsl:if test="E1EDP01/ABRVW">
							<ABRVW>
								<xsl:value-of select="E1EDP01/ABRVW/text()" /> 
							</ABRVW>
						</xsl:if>
						<xsl:if test="E1EDP01/WERKS">
							<WERKS>
								<xsl:value-of select="E1EDP01/WERKS/text()" /> 
							</WERKS>
						</xsl:if>
						<xsl:if test="E1EDP01/LPRIO">
							<LPRIO>
								<xsl:value-of select="E1EDP01/LPRIO/text()" /> 
							</LPRIO>
						</xsl:if>
						<xsl:if test="E1EDP01/LPRIO_BEZ">
							<LPRIO_BEZ>
								<xsl:value-of select="E1EDP01/LPRIO_BEZ/text()" /> 
							</LPRIO_BEZ>
						</xsl:if>
						<xsl:if test="E1EDP01/ROUTE">
							<ROUTE>
								<xsl:value-of select="E1EDP01/ROUTE/text()" /> 
							</ROUTE>
						</xsl:if>
						<xsl:if test="E1EDP01/ROUTE_BEZ">
							<ROUTE_BEZ>
								<xsl:value-of select="E1EDP01/ROUTE_BEZ/text()" /> 
							</ROUTE_BEZ>
						</xsl:if>
						<xsl:if test="E1EDP01/LGORT">
							<LGORT>
								<xsl:value-of select="E1EDP01/LGORT/text()" /> 
							</LGORT>
						</xsl:if>
						<xsl:if test="E1EDP01/VSTEL">
							<VSTEL>
								<xsl:value-of select="E1EDP01/VSTEL/text()" /> 
							</VSTEL>
						</xsl:if>
						<xsl:if test="E1EDP01/DELCO">
							<DELCO>
								<xsl:value-of select="E1EDP01/DELCO/text()" /> 
							</DELCO>
						</xsl:if>
						<xsl:if test="E1EDP01/MATNR">
							<MATNR>
								<xsl:value-of select="E1EDP01/MATNR/text()" /> 
							</MATNR>
						</xsl:if>
						<xsl:if test="E1EDP01/VALTG">
							<VALTG>
								<xsl:value-of select="E1EDP01/VALTG/text()" /> 
							</VALTG>
						</xsl:if>
						<xsl:if test="E1EDP01/HIPOS">
							<HIPOS>
								<xsl:value-of select="E1EDP01/HIPOS/text()" /> 
							</HIPOS>
						</xsl:if>
						<xsl:if test="E1EDP01/HIEVW">
							<HIEVW>
								<xsl:value-of select="E1EDP01/HIEVW/text()" /> 
							</HIEVW>
						</xsl:if>
						<xsl:if test="E1EDP01/POSGUID">
							<POSGUID>
								<xsl:value-of select="E1EDP01/POSGUID/text()" /> 
							</POSGUID>
						</xsl:if>
						<xsl:if test="E1EDP01/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP01/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP01>
					<Z1E1EDP1>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="Z1E1EDP1/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="Z1E1EDP1/LOCATION">
							<LOCATION>
								<xsl:value-of select="Z1E1EDP1/LOCATION/text()" /> 
							</LOCATION>
						</xsl:if>
						<xsl:if test="Z1E1EDP1/MENGE">
							<MENGE>
								<xsl:value-of select="Z1E1EDP1/MENGE/text()" /> 
							</MENGE>
						</xsl:if>
						<xsl:if test="Z1E1EDP1/MENEE">
							<MENEE>
								<xsl:value-of select="Z1E1EDP1/MENEE/text()" /> 
							</MENEE>
						</xsl:if>
						<xsl:if test="Z1E1EDP1/DATUM">
							<DATUM>
								<xsl:value-of select="Z1E1EDP1/DATUM/text()" /> 
							</DATUM>
						</xsl:if>
						<xsl:if test="Z1E1EDP1/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="Z1E1EDP1/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</Z1E1EDP1>
					<xsl:for-each select="E1EDP02">
						<E1EDP02>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="QUALF">
								<QUALF>
									<xsl:value-of select="QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="BELNR">
								<BELNR>
									<xsl:value-of select="BELNR/text()" /> 
								</BELNR>
							</xsl:if>
							<xsl:if test="ZEILE">
								<ZEILE>
									<xsl:value-of select="ZEILE/text()" /> 
								</ZEILE>
							</xsl:if>
							<xsl:if test="DATUM">
								<DATUM>
									<xsl:value-of select="DATUM/text()" /> 
								</DATUM>
							</xsl:if>
							<xsl:if test="UZEIT">
								<UZEIT>
									<xsl:value-of select="UZEIT/text()" /> 
								</UZEIT>
							</xsl:if>
							<xsl:if test="BSARK">
								<BSARK>
									<xsl:value-of select="BSARK/text()" /> 
								</BSARK>
							</xsl:if>
							<xsl:if test="IHREZ">
								<IHREZ>
									<xsl:value-of select="IHREZ/text()" /> 
								</IHREZ>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDP02>
					</xsl:for-each>
					<E1CUREF>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1CUREF/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1CUREF/POSEX">
							<POSEX>
								<xsl:value-of select="E1CUREF/POSEX/text()" /> 
							</POSEX>
						</xsl:if>
						<xsl:if test="E1CUREF/CONFIG_ID">
							<CONFIG_ID>
								<xsl:value-of select="E1CUREF/CONFIG_ID/text()" /> 
							</CONFIG_ID>
						</xsl:if>
						<xsl:if test="E1CUREF/INST_ID">
							<INST_ID>
								<xsl:value-of select="E1CUREF/INST_ID/text()" /> 
							</INST_ID>
						</xsl:if>
						<xsl:if test="E1CUREF/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1CUREF/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1CUREF>
					<E1ADDI1>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1ADDI1/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1ADDI1/ADDIMATNR">
							<ADDIMATNR>
								<xsl:value-of select="E1ADDI1/ADDIMATNR/text()" /> 
							</ADDIMATNR>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDINUMBER">
							<ADDINUMBER>
								<xsl:value-of select="E1ADDI1/ADDINUMBER/text()" /> 
							</ADDINUMBER>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIVKME">
							<ADDIVKME>
								<xsl:value-of select="E1ADDI1/ADDIVKME/text()" /> 
							</ADDIVKME>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIFM">
							<ADDIFM>
								<xsl:value-of select="E1ADDI1/ADDIFM/text()" /> 
							</ADDIFM>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIFM_TXT">
							<ADDIFM_TXT>
								<xsl:value-of select="E1ADDI1/ADDIFM_TXT/text()" /> 
							</ADDIFM_TXT>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIKLART">
							<ADDIKLART>
								<xsl:value-of select="E1ADDI1/ADDIKLART/text()" /> 
							</ADDIKLART>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIKLART_TXT">
							<ADDIKLART_TXT>
								<xsl:value-of select="E1ADDI1/ADDIKLART_TXT/text()" /> 
							</ADDIKLART_TXT>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDICLASS">
							<ADDICLASS>
								<xsl:value-of select="E1ADDI1/ADDICLASS/text()" /> 
							</ADDICLASS>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDICLASS_TXT">
							<ADDICLASS_TXT>
								<xsl:value-of select="E1ADDI1/ADDICLASS_TXT/text()" /> 
							</ADDICLASS_TXT>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIIDOC">
							<ADDIIDOC>
								<xsl:value-of select="E1ADDI1/ADDIIDOC/text()" /> 
							</ADDIIDOC>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIMATNR_EXTERNAL">
							<ADDIMATNR_EXTERNAL>
								<xsl:value-of select="E1ADDI1/ADDIMATNR_EXTERNAL/text()" /> 
							</ADDIMATNR_EXTERNAL>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIMATNR_VERSION">
							<ADDIMATNR_VERSION>
								<xsl:value-of select="E1ADDI1/ADDIMATNR_VERSION/text()" /> 
							</ADDIMATNR_VERSION>
						</xsl:if>
						<xsl:if test="E1ADDI1/ADDIMATNR_GUID">
							<ADDIMATNR_GUID>
								<xsl:value-of select="E1ADDI1/ADDIMATNR_GUID/text()" /> 
							</ADDIMATNR_GUID>
						</xsl:if>
						<xsl:if test="E1ADDI1/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1ADDI1/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1ADDI1>
					<E1EDP03>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP03/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
							<xsl:value-of select="E1EDP03/DATAHEADERREC/text()" /> 
						</DATAHEADERREC>
						<xsl:if test="E1EDP03/IDDAT">
							<IDDAT>
								<xsl:value-of select="E1EDP03/IDDAT/text()" /> 
							</IDDAT>
						</xsl:if>
						<xsl:if test="E1EDP03/DATUM">
							<DATUM>
								<xsl:value-of select="E1EDP03/DATUM/text()" /> 
							</DATUM>
						</xsl:if>
						<xsl:if test="E1EDP03/UZEIT">
							<UZEIT>
								<xsl:value-of select="E1EDP03/UZEIT/text()" /> 
							</UZEIT>
						</xsl:if>
						<xsl:if test="E1EDP03/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP03/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP03>
					<E1EDP04>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP04/DATAHEADERREC/HLEVEL/text()" /> 
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
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDP05002GRP/E1EDP05/ALCKZ">
								<ALCKZ>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/ALCKZ/text()" /> 
								</ALCKZ>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KSCHL">
								<KSCHL>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KSCHL/text()" /> 
								</KSCHL>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KOTXT">
								<KOTXT>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KOTXT/text()" /> 
								</KOTXT>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/BETRG">
								<BETRG>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/BETRG/text()" /> 
								</BETRG>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KPERC">
								<KPERC>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KPERC/text()" /> 
								</KPERC>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KRATE">
								<KRATE>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KRATE/text()" /> 
								</KRATE>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/UPRBS">
								<UPRBS>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/UPRBS/text()" /> 
								</UPRBS>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/MEAUN">
								<MEAUN>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/MEAUN/text()" /> 
								</MEAUN>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KOBTR">
								<KOBTR>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KOBTR/text()" /> 
								</KOBTR>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/MENGE">
								<MENGE>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/MENGE/text()" /> 
								</MENGE>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/PREIS">
								<PREIS>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/PREIS/text()" /> 
								</PREIS>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/MWSKZ">
								<MWSKZ>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/MWSKZ/text()" /> 
								</MWSKZ>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/MSATZ">
								<MSATZ>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/MSATZ/text()" /> 
								</MSATZ>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KOEIN">
								<KOEIN>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KOEIN/text()" /> 
								</KOEIN>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/CURTP">
								<CURTP>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/CURTP/text()" /> 
								</CURTP>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/KOBAS">
								<KOBAS>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/KOBAS/text()" /> 
								</KOBAS>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDP05/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDP05002GRP/E1EDP05/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDP05>
						<E1EDPS5>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDP05002GRP/E1EDPS5/KSTBM">
								<KSTBM>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/KSTBM/text()" /> 
								</KSTBM>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDPS5/KBETR">
								<KBETR>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/KBETR/text()" /> 
								</KBETR>
							</xsl:if>
							<xsl:if test="E2EDP05002GRP/E1EDPS5/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDP05002GRP/E1EDPS5/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPS5>
					</E2EDP05002GRP>
					<xsl:for-each select="E1EDP20">
						<E1EDP20>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="WMENG">
								<WMENG>
									<xsl:value-of select="WMENG/text()" /> 
								</WMENG>
							</xsl:if>
							<xsl:if test="AMENG">
								<AMENG>
									<xsl:value-of select="AMENG/text()" /> 
								</AMENG>
							</xsl:if>
							<xsl:if test="EDATU">
								<EDATU>
									<xsl:value-of select="EDATU/text()" /> 
								</EDATU>
							</xsl:if>
							<xsl:if test="EZEIT">
								<EZEIT>
									<xsl:value-of select="EZEIT/text()" /> 
								</EZEIT>
							</xsl:if>
							<xsl:if test="EDATU_OLD">
								<EDATU_OLD>
									<xsl:value-of select="EDATU_OLD/text()" /> 
								</EDATU_OLD>
							</xsl:if>
							<xsl:if test="EZEIT_OLD">
								<EZEIT_OLD>
									<xsl:value-of select="EZEIT_OLD/text()" /> 
								</EZEIT_OLD>
							</xsl:if>
							<xsl:if test="ACTION">
								<ACTION>
									<xsl:value-of select="ACTION/text()" /> 
								</ACTION>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDP20>
					</xsl:for-each>
					<E2EDPA1003GRP>
						<E1EDPA1>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PARVW">
								<PARVW>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PARVW/text()" /> 
								</PARVW>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PARTN">
								<PARTN>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PARTN/text()" /> 
								</PARTN>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/LIFNR">
								<LIFNR>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/LIFNR/text()" /> 
								</LIFNR>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/NAME1">
								<NAME1>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/NAME1/text()" /> 
								</NAME1>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/NAME2">
								<NAME2>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/NAME2/text()" /> 
								</NAME2>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/NAME3">
								<NAME3>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/NAME3/text()" /> 
								</NAME3>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/NAME4">
								<NAME4>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/NAME4/text()" /> 
								</NAME4>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/STRAS">
								<STRAS>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/STRAS/text()" /> 
								</STRAS>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/STRS2">
								<STRS2>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/STRS2/text()" /> 
								</STRS2>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PFACH">
								<PFACH>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PFACH/text()" /> 
								</PFACH>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ORT01">
								<ORT01>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ORT01/text()" /> 
								</ORT01>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/COUNC">
								<COUNC>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/COUNC/text()" /> 
								</COUNC>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PSTLZ">
								<PSTLZ>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PSTLZ/text()" /> 
								</PSTLZ>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PSTL2">
								<PSTL2>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PSTL2/text()" /> 
								</PSTL2>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/LAND1">
								<LAND1>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/LAND1/text()" /> 
								</LAND1>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ABLAD">
								<ABLAD>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ABLAD/text()" /> 
								</ABLAD>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PERNR">
								<PERNR>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PERNR/text()" /> 
								</PERNR>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PARNR">
								<PARNR>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PARNR/text()" /> 
								</PARNR>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELF1">
								<TELF1>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELF1/text()" /> 
								</TELF1>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELF2">
								<TELF2>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELF2/text()" /> 
								</TELF2>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELBX">
								<TELBX>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELBX/text()" /> 
								</TELBX>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELFX">
								<TELFX>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELFX/text()" /> 
								</TELFX>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELTX">
								<TELTX>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELTX/text()" /> 
								</TELTX>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TELX1">
								<TELX1>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TELX1/text()" /> 
								</TELX1>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/SPRAS">
								<SPRAS>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/SPRAS/text()" /> 
								</SPRAS>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ANRED">
								<ANRED>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ANRED/text()" /> 
								</ANRED>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ORT02">
								<ORT02>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ORT02/text()" /> 
								</ORT02>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/HAUSN">
								<HAUSN>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/HAUSN/text()" /> 
								</HAUSN>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/STOCK">
								<STOCK>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/STOCK/text()" /> 
								</STOCK>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/REGIO">
								<REGIO>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/REGIO/text()" /> 
								</REGIO>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PARGE">
								<PARGE>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PARGE/text()" /> 
								</PARGE>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ISOAL">
								<ISOAL>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ISOAL/text()" /> 
								</ISOAL>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ISONU">
								<ISONU>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ISONU/text()" /> 
								</ISONU>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/FCODE">
								<FCODE>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/FCODE/text()" /> 
								</FCODE>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/IHREZ">
								<IHREZ>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/IHREZ/text()" /> 
								</IHREZ>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/BNAME">
								<BNAME>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/BNAME/text()" /> 
								</BNAME>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PAORG">
								<PAORG>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PAORG/text()" /> 
								</PAORG>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ORGTX">
								<ORGTX>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ORGTX/text()" /> 
								</ORGTX>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PAGRU">
								<PAGRU>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PAGRU/text()" /> 
								</PAGRU>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/KNREF">
								<KNREF>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/KNREF/text()" /> 
								</KNREF>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/ILNNR">
								<ILNNR>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/ILNNR/text()" /> 
								</ILNNR>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/PFORT">
								<PFORT>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/PFORT/text()" /> 
								</PFORT>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/SPRAS_ISO">
								<SPRAS_ISO>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/SPRAS_ISO/text()" /> 
								</SPRAS_ISO>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/TITLE">
								<TITLE>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/TITLE/text()" /> 
								</TITLE>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA1/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA1/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPA1>
						<E1EDPA3>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDPA1003GRP/E1EDPA3/QUALP">
								<QUALP>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/QUALP/text()" /> 
								</QUALP>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA3/STDPN">
								<STDPN>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/STDPN/text()" /> 
								</STDPN>
							</xsl:if>
							<xsl:if test="E2EDPA1003GRP/E1EDPA3/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDPA1003GRP/E1EDPA3/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPA3>
					</E2EDPA1003GRP>
					<E1EDP19>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP19/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="string($var:v29)='true'">
							<xsl:variable name="var:v30" select="'003'" /> 
							<QUALF>
								<xsl:value-of select="$var:v30" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="string($var:v31)='true'">
							<xsl:variable name="var:v32" select="E1EDP19/QUALF/text()" /> 
							<QUALF>
								<xsl:value-of select="$var:v32" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="string($var:v36)='true'">
							<xsl:variable name="var:v37" select="E1EDP19/IDTNR/text()" /> 
							<IDTNR>
								<xsl:value-of select="$var:v37" /> 
							</IDTNR>
						</xsl:if>
						<xsl:if test="E1EDP19/KTEXT">
							<KTEXT>
								<xsl:value-of select="E1EDP19/KTEXT/text()" /> 
							</KTEXT>
						</xsl:if>
						<xsl:if test="E1EDP19/MFRPN">
							<MFRPN>
								<xsl:value-of select="E1EDP19/MFRPN/text()" /> 
							</MFRPN>
						</xsl:if>
						<xsl:if test="E1EDP19/MFRNR">
							<MFRNR>
								<xsl:value-of select="E1EDP19/MFRNR/text()" /> 
							</MFRNR>
						</xsl:if>
						<xsl:if test="E1EDP19/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP19/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP19>
					<E2EDPAD001GRP>
						<E1EDPAD>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/QUALF">
								<QUALF>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/ICC">
								<ICC>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/ICC/text()" /> 
								</ICC>
							</xsl:if>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/MOI">
								<MOI>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/MOI/text()" /> 
								</MOI>
							</xsl:if>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/PRI">
								<PRI>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/PRI/text()" /> 
								</PRI>
							</xsl:if>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/ACN">
								<ACN>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/ACN/text()" /> 
								</ACN>
							</xsl:if>
							<xsl:if test="E2EDPAD001GRP/E1EDPAD/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDPAD001GRP/E1EDPAD/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPAD>
						<E2TXTH1001GRP>
							<E1TXTH1>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/SEGNUM/text()" /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/FUNCTION">
									<FUNCTION>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/FUNCTION/text()" /> 
									</FUNCTION>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDOBJECT">
									<TDOBJECT>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDOBJECT/text()" /> 
									</TDOBJECT>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDOBNAME">
									<TDOBNAME>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDOBNAME/text()" /> 
									</TDOBNAME>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDID">
									<TDID>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDID/text()" /> 
									</TDID>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDSPRAS">
									<TDSPRAS>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDSPRAS/text()" /> 
									</TDSPRAS>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDTEXTTYPE">
									<TDTEXTTYPE>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/TDTEXTTYPE/text()" /> 
									</TDTEXTTYPE>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/LANGUA_ISO">
									<LANGUA_ISO>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/LANGUA_ISO/text()" /> 
									</LANGUA_ISO>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTH1/SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1TXTH1>
							<E1TXTP1>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/SEGNUM/text()" /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/TDFORMAT">
									<TDFORMAT>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/TDFORMAT/text()" /> 
									</TDFORMAT>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/TDLINE">
									<TDLINE>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/TDLINE/text()" /> 
									</TDLINE>
								</xsl:if>
								<xsl:if test="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="E2EDPAD001GRP/E2TXTH1001GRP/E1TXTP1/SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1TXTP1>
						</E2TXTH1001GRP>
					</E2EDPAD001GRP>
					<E1EDP17>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP17/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDP17/QUALF">
							<QUALF>
								<xsl:value-of select="E1EDP17/QUALF/text()" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="E1EDP17/LKOND">
							<LKOND>
								<xsl:value-of select="E1EDP17/LKOND/text()" /> 
							</LKOND>
						</xsl:if>
						<xsl:if test="E1EDP17/LKTEXT">
							<LKTEXT>
								<xsl:value-of select="E1EDP17/LKTEXT/text()" /> 
							</LKTEXT>
						</xsl:if>
						<xsl:if test="E1EDP17/LPRIO">
							<LPRIO>
								<xsl:value-of select="E1EDP17/LPRIO/text()" /> 
							</LPRIO>
						</xsl:if>
						<xsl:if test="E1EDP17/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP17/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP17>
					<E1EDP18>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP18/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDP18/QUALF">
							<QUALF>
								<xsl:value-of select="E1EDP18/QUALF/text()" /> 
							</QUALF>
						</xsl:if>
						<xsl:if test="E1EDP18/TAGE">
							<TAGE>
								<xsl:value-of select="E1EDP18/TAGE/text()" /> 
							</TAGE>
						</xsl:if>
						<xsl:if test="E1EDP18/PRZNT">
							<PRZNT>
								<xsl:value-of select="E1EDP18/PRZNT/text()" /> 
							</PRZNT>
						</xsl:if>
						<xsl:if test="E1EDP18/ZTERM_TXT">
							<ZTERM_TXT>
								<xsl:value-of select="E1EDP18/ZTERM_TXT/text()" /> 
							</ZTERM_TXT>
						</xsl:if>
						<xsl:if test="E1EDP18/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP18/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP18>
					<E1EDP35>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDP35/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDP35/QUALZ">
							<QUALZ>
								<xsl:value-of select="E1EDP35/QUALZ/text()" /> 
							</QUALZ>
						</xsl:if>
						<xsl:if test="E1EDP35/CUSADD">
							<CUSADD>
								<xsl:value-of select="E1EDP35/CUSADD/text()" /> 
							</CUSADD>
						</xsl:if>
						<xsl:if test="E1EDP35/CUSADD_BEZ">
							<CUSADD_BEZ>
								<xsl:value-of select="E1EDP35/CUSADD_BEZ/text()" /> 
							</CUSADD_BEZ>
						</xsl:if>
						<xsl:if test="E1EDP35/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDP35/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDP35>
					<E2EDPT1001GRP>
						<E1EDPT1>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDPT1001GRP/E1EDPT1/TDID">
								<TDID>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/TDID/text()" /> 
								</TDID>
							</xsl:if>
							<xsl:if test="E2EDPT1001GRP/E1EDPT1/TSSPRAS">
								<TSSPRAS>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/TSSPRAS/text()" /> 
								</TSSPRAS>
							</xsl:if>
							<xsl:if test="E2EDPT1001GRP/E1EDPT1/TSSPRAS_ISO">
								<TSSPRAS_ISO>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/TSSPRAS_ISO/text()" /> 
								</TSSPRAS_ISO>
							</xsl:if>
							<xsl:if test="E2EDPT1001GRP/E1EDPT1/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT1/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPT1>
						<E1EDPT2>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDPT1001GRP/E1EDPT2/TDLINE">
								<TDLINE>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/TDLINE/text()" /> 
								</TDLINE>
							</xsl:if>
							<xsl:if test="E2EDPT1001GRP/E1EDPT2/TDFORMAT">
								<TDFORMAT>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/TDFORMAT/text()" /> 
								</TDFORMAT>
							</xsl:if>
							<xsl:if test="E2EDPT1001GRP/E1EDPT2/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDPT1001GRP/E1EDPT2/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDPT2>
					</E2EDPT1001GRP>
					<E2EDC01GRP>
						<E1EDC01>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC01/SGTYP">
								<SGTYP>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/SGTYP/text()" /> 
								</SGTYP>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ZLTYP">
								<ZLTYP>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ZLTYP/text()" /> 
								</ZLTYP>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/LVALT">
								<LVALT>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/LVALT/text()" /> 
								</LVALT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ALTNO">
								<ALTNO>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ALTNO/text()" /> 
								</ALTNO>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ALREF">
								<ALREF>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ALREF/text()" /> 
								</ALREF>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ZLART">
								<ZLART>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ZLART/text()" /> 
								</ZLART>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/POSEX">
								<POSEX>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/POSEX/text()" /> 
								</POSEX>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/RANG">
								<RANG>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/RANG/text()" /> 
								</RANG>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/EXGRP">
								<EXGRP>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/EXGRP/text()" /> 
								</EXGRP>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/UEPOS">
								<UEPOS>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/UEPOS/text()" /> 
								</UEPOS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/MATKL">
								<MATKL>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/MATKL/text()" /> 
								</MATKL>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/MENGE">
								<MENGE>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/MENGE/text()" /> 
								</MENGE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/MENEE">
								<MENEE>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/MENEE/text()" /> 
								</MENEE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/BMNG2">
								<BMNG2>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/BMNG2/text()" /> 
								</BMNG2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/PMENE">
								<PMENE>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/PMENE/text()" /> 
								</PMENE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/BPUMN">
								<BPUMN>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/BPUMN/text()" /> 
								</BPUMN>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/BPUMZ">
								<BPUMZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/BPUMZ/text()" /> 
								</BPUMZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/VPREI">
								<VPREI>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/VPREI/text()" /> 
								</VPREI>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/PEINH">
								<PEINH>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/PEINH/text()" /> 
								</PEINH>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/NETWR">
								<NETWR>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/NETWR/text()" /> 
								</NETWR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ANETW">
								<ANETW>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ANETW/text()" /> 
								</ANETW>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/SKFBP">
								<SKFBP>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/SKFBP/text()" /> 
								</SKFBP>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/CURCY">
								<CURCY>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/CURCY/text()" /> 
								</CURCY>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/PREIS">
								<PREIS>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/PREIS/text()" /> 
								</PREIS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ACTION">
								<ACTION>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ACTION/text()" /> 
								</ACTION>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/KZABS">
								<KZABS>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/KZABS/text()" /> 
								</KZABS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/UEBTO">
								<UEBTO>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/UEBTO/text()" /> 
								</UEBTO>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/UEBTK">
								<UEBTK>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/UEBTK/text()" /> 
								</UEBTK>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/LBNUM">
								<LBNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/LBNUM/text()" /> 
								</LBNUM>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/AUSGB">
								<AUSGB>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/AUSGB/text()" /> 
								</AUSGB>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/FRPOS">
								<FRPOS>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/FRPOS/text()" /> 
								</FRPOS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/TOPOS">
								<TOPOS>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/TOPOS/text()" /> 
								</TOPOS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/KTXT1">
								<KTXT1>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/KTXT1/text()" /> 
								</KTXT1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/KTXT2">
								<KTXT2>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/KTXT2/text()" /> 
								</KTXT2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/PERNR">
								<PERNR>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/PERNR/text()" /> 
								</PERNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/LGART">
								<LGART>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/LGART/text()" /> 
								</LGART>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/STELL">
								<STELL>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/STELL/text()" /> 
								</STELL>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/ZWERT">
								<ZWERT>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/ZWERT/text()" /> 
								</ZWERT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC01/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC01/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC01>
						<E1EDC02>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC02/QUALF">
								<QUALF>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC02/BELNR">
								<BELNR>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/BELNR/text()" /> 
								</BELNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC02/XLINE">
								<XLINE>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/XLINE/text()" /> 
								</XLINE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC02/DATUM">
								<DATUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/DATUM/text()" /> 
								</DATUM>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC02/UZEIT">
								<UZEIT>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/UZEIT/text()" /> 
								</UZEIT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC02/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC02/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC02>
						<E1EDC03>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC03/IDDAT">
								<IDDAT>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/IDDAT/text()" /> 
								</IDDAT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC03/DATUM">
								<DATUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/DATUM/text()" /> 
								</DATUM>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC03/UZEIT">
								<UZEIT>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/UZEIT/text()" /> 
								</UZEIT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC03/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC03/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC03>
						<E1EDC04>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC04/MWSKZ">
								<MWSKZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/MWSKZ/text()" /> 
								</MWSKZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC04/MSATZ">
								<MSATZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/MSATZ/text()" /> 
								</MSATZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC04/MWSBT">
								<MWSBT>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/MWSBT/text()" /> 
								</MWSBT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC04/TXJCD">
								<TXJCD>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/TXJCD/text()" /> 
								</TXJCD>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC04/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC04/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC04>
						<E1EDC05>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC05/ALCKZ">
								<ALCKZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/ALCKZ/text()" /> 
								</ALCKZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/KSCHL">
								<KSCHL>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/KSCHL/text()" /> 
								</KSCHL>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/KOTXT">
								<KOTXT>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/KOTXT/text()" /> 
								</KOTXT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/BETRG">
								<BETRG>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/BETRG/text()" /> 
								</BETRG>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/KPERC">
								<KPERC>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/KPERC/text()" /> 
								</KPERC>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/KRATE">
								<KRATE>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/KRATE/text()" /> 
								</KRATE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/UPRBS">
								<UPRBS>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/UPRBS/text()" /> 
								</UPRBS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/MEAUN">
								<MEAUN>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/MEAUN/text()" /> 
								</MEAUN>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/KOBTR">
								<KOBTR>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/KOBTR/text()" /> 
								</KOBTR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/MENGE">
								<MENGE>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/MENGE/text()" /> 
								</MENGE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/PREIS">
								<PREIS>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/PREIS/text()" /> 
								</PREIS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/MWSKZ">
								<MWSKZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/MWSKZ/text()" /> 
								</MWSKZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/MSATZ">
								<MSATZ>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/MSATZ/text()" /> 
								</MSATZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC05/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC05/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC05>
						<E1EDC06>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC06/FORMELNR">
								<FORMELNR>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FORMELNR/text()" /> 
								</FORMELNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/FRMVAL1">
								<FRMVAL1>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FRMVAL1/text()" /> 
								</FRMVAL1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/FRMVAL2">
								<FRMVAL2>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FRMVAL2/text()" /> 
								</FRMVAL2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/FRMVAL3">
								<FRMVAL3>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FRMVAL3/text()" /> 
								</FRMVAL3>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/FRMVAL4">
								<FRMVAL4>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FRMVAL4/text()" /> 
								</FRMVAL4>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/FRMVAL5">
								<FRMVAL5>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/FRMVAL5/text()" /> 
								</FRMVAL5>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC06/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC06/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC06>
						<E1EDC07>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC07/USERF1_NUM">
								<USERF1_NUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/USERF1_NUM/text()" /> 
								</USERF1_NUM>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC07/USERF2_NUM">
								<USERF2_NUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/USERF2_NUM/text()" /> 
								</USERF2_NUM>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC07/USERF1_TXT">
								<USERF1_TXT>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/USERF1_TXT/text()" /> 
								</USERF1_TXT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC07/USERF2_TXT">
								<USERF2_TXT>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/USERF2_TXT/text()" /> 
								</USERF2_TXT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC07/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC07/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC07>
						<E1EDCA1>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PARVW">
								<PARVW>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PARVW/text()" /> 
								</PARVW>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PARTN">
								<PARTN>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PARTN/text()" /> 
								</PARTN>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/LIFNR">
								<LIFNR>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/LIFNR/text()" /> 
								</LIFNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/NAME1">
								<NAME1>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/NAME1/text()" /> 
								</NAME1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/NAME2">
								<NAME2>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/NAME2/text()" /> 
								</NAME2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/NAME3">
								<NAME3>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/NAME3/text()" /> 
								</NAME3>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/NAME4">
								<NAME4>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/NAME4/text()" /> 
								</NAME4>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/STRAS">
								<STRAS>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/STRAS/text()" /> 
								</STRAS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/STRS2">
								<STRS2>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/STRS2/text()" /> 
								</STRS2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PFACH">
								<PFACH>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PFACH/text()" /> 
								</PFACH>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ORT01">
								<ORT01>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ORT01/text()" /> 
								</ORT01>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/COUNC">
								<COUNC>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/COUNC/text()" /> 
								</COUNC>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PSTLZ">
								<PSTLZ>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PSTLZ/text()" /> 
								</PSTLZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PSTL2">
								<PSTL2>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PSTL2/text()" /> 
								</PSTL2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/LAND1">
								<LAND1>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/LAND1/text()" /> 
								</LAND1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ABLAD">
								<ABLAD>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ABLAD/text()" /> 
								</ABLAD>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PERNR">
								<PERNR>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PERNR/text()" /> 
								</PERNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PARNR">
								<PARNR>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PARNR/text()" /> 
								</PARNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELF1">
								<TELF1>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELF1/text()" /> 
								</TELF1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELF2">
								<TELF2>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELF2/text()" /> 
								</TELF2>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELBX">
								<TELBX>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELBX/text()" /> 
								</TELBX>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELFX">
								<TELFX>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELFX/text()" /> 
								</TELFX>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELTX">
								<TELTX>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELTX/text()" /> 
								</TELTX>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/TELX1">
								<TELX1>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/TELX1/text()" /> 
								</TELX1>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/SPRAS">
								<SPRAS>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/SPRAS/text()" /> 
								</SPRAS>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ANRED">
								<ANRED>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ANRED/text()" /> 
								</ANRED>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ORT02">
								<ORT02>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ORT02/text()" /> 
								</ORT02>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/HAUSN">
								<HAUSN>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/HAUSN/text()" /> 
								</HAUSN>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/STOCK">
								<STOCK>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/STOCK/text()" /> 
								</STOCK>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/REGIO">
								<REGIO>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/REGIO/text()" /> 
								</REGIO>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PARGE">
								<PARGE>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PARGE/text()" /> 
								</PARGE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ISOAL">
								<ISOAL>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ISOAL/text()" /> 
								</ISOAL>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ISONU">
								<ISONU>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ISONU/text()" /> 
								</ISONU>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/FCODE">
								<FCODE>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/FCODE/text()" /> 
								</FCODE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/IHREZ">
								<IHREZ>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/IHREZ/text()" /> 
								</IHREZ>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/BNAME">
								<BNAME>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/BNAME/text()" /> 
								</BNAME>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PAORG">
								<PAORG>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PAORG/text()" /> 
								</PAORG>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/ORGTX">
								<ORGTX>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/ORGTX/text()" /> 
								</ORGTX>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/PAGRU">
								<PAGRU>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/PAGRU/text()" /> 
								</PAGRU>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDCA1/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDCA1/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDCA1>
						<E1EDC19>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC19/QUALF">
								<QUALF>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC19/IDTNR">
								<IDTNR>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/IDTNR/text()" /> 
								</IDTNR>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC19/KTEXT">
								<KTEXT>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/KTEXT/text()" /> 
								</KTEXT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC19/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC19/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC19>
						<E1EDC17>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC17/QUALF">
								<QUALF>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC17/LKOND">
								<LKOND>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/LKOND/text()" /> 
								</LKOND>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC17/LKTEXT">
								<LKTEXT>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/LKTEXT/text()" /> 
								</LKTEXT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC17/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC17/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC17>
						<E1EDC18>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E2EDC01GRP/E1EDC18/QUALF">
								<QUALF>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC18/TAGE">
								<TAGE>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/TAGE/text()" /> 
								</TAGE>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC18/PRZNT">
								<PRZNT>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/PRZNT/text()" /> 
								</PRZNT>
							</xsl:if>
							<xsl:if test="E2EDC01GRP/E1EDC18/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E2EDC01GRP/E1EDC18/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDC18>
						<E2EDCT1GRP>
							<E1EDCT1>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/SEGNUM/text()" /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/TDID">
									<TDID>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/TDID/text()" /> 
									</TDID>
								</xsl:if>
								<xsl:if test="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/TSSPRAS">
									<TSSPRAS>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/TSSPRAS/text()" /> 
									</TSSPRAS>
								</xsl:if>
								<xsl:if test="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT1/SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1EDCT1>
							<E1EDCT2>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/SEGNUM/text()" /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/TDLINE">
									<TDLINE>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/TDLINE/text()" /> 
									</TDLINE>
								</xsl:if>
								<xsl:if test="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="E2EDC01GRP/E2EDCT1GRP/E1EDCT2/SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1EDCT2>
						</E2EDCT1GRP>
					</E2EDC01GRP>
				</E2EDP01007GRP>
			</xsl:for-each>
			<xsl:if test="$var:v39">
				<E2CUCFG003GRP>
					<xsl:for-each select="E2CUCFG003GRP">
						<E1CUCFG>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="E1CUCFG/DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="E1CUCFG/DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="E1CUCFG/DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:text /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="E1CUCFG/DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="E1CUCFG/DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="E1CUCFG/POSEX">
								<POSEX>
									<xsl:value-of select="E1CUCFG/POSEX/text()" /> 
								</POSEX>
							</xsl:if>
							<xsl:if test="E1CUCFG/CONFIG_ID">
								<CONFIG_ID>
									<xsl:value-of select="E1CUCFG/CONFIG_ID/text()" /> 
								</CONFIG_ID>
							</xsl:if>
							<xsl:if test="E1CUCFG/ROOT_ID">
								<ROOT_ID>
									<xsl:value-of select="E1CUCFG/ROOT_ID/text()" /> 
								</ROOT_ID>
							</xsl:if>
							<xsl:if test="E1CUCFG/SCE">
								<SCE>
									<xsl:value-of select="E1CUCFG/SCE/text()" /> 
								</SCE>
							</xsl:if>
							<xsl:if test="E1CUCFG/KBNAME">
								<KBNAME>
									<xsl:value-of select="E1CUCFG/KBNAME/text()" /> 
								</KBNAME>
							</xsl:if>
							<xsl:if test="E1CUCFG/KBVERSION">
								<KBVERSION>
									<xsl:value-of select="E1CUCFG/KBVERSION/text()" /> 
								</KBVERSION>
							</xsl:if>
							<xsl:if test="E1CUCFG/COMPLETE">
								<COMPLETE>
									<xsl:value-of select="E1CUCFG/COMPLETE/text()" /> 
								</COMPLETE>
							</xsl:if>
							<xsl:if test="E1CUCFG/CONSISTENT">
								<CONSISTENT>
									<xsl:value-of select="E1CUCFG/CONSISTENT/text()" /> 
								</CONSISTENT>
							</xsl:if>
							<xsl:if test="E1CUCFG/CFGINFO">
								<CFGINFO>
									<xsl:value-of select="E1CUCFG/CFGINFO/text()" /> 
								</CFGINFO>
							</xsl:if>
							<xsl:if test="E1CUCFG/KBPROFILE">
								<KBPROFILE>
									<xsl:value-of select="E1CUCFG/KBPROFILE/text()" /> 
								</KBPROFILE>
							</xsl:if>
							<xsl:if test="E1CUCFG/KBLANGUAGE">
								<KBLANGUAGE>
									<xsl:value-of select="E1CUCFG/KBLANGUAGE/text()" /> 
								</KBLANGUAGE>
							</xsl:if>
							<xsl:if test="E1CUCFG/CBASE_ID">
								<CBASE_ID>
									<xsl:value-of select="E1CUCFG/CBASE_ID/text()" /> 
								</CBASE_ID>
							</xsl:if>
							<xsl:if test="E1CUCFG/CBASE_ID_TYPE">
								<CBASE_ID_TYPE>
									<xsl:value-of select="E1CUCFG/CBASE_ID_TYPE/text()" /> 
								</CBASE_ID_TYPE>
							</xsl:if>
							<xsl:if test="E1CUCFG/SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="E1CUCFG/SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1CUCFG>
					</xsl:for-each>
					<xsl:for-each select="E2CUCFG003GRP">
						<xsl:for-each select="E1CUINS">
							<E1CUINS>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:text /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="INST_ID">
									<INST_ID>
										<xsl:value-of select="INST_ID/text()" /> 
									</INST_ID>
								</xsl:if>
								<xsl:if test="OBJ_TYPE">
									<OBJ_TYPE>
										<xsl:value-of select="OBJ_TYPE/text()" /> 
									</OBJ_TYPE>
								</xsl:if>
								<xsl:if test="CLASS_TYPE">
									<CLASS_TYPE>
										<xsl:value-of select="CLASS_TYPE/text()" /> 
									</CLASS_TYPE>
								</xsl:if>
								<xsl:if test="OBJ_KEY">
									<OBJ_KEY>
										<xsl:value-of select="OBJ_KEY/text()" /> 
									</OBJ_KEY>
								</xsl:if>
								<xsl:if test="OBJ_TXT">
									<OBJ_TXT>
										<xsl:value-of select="OBJ_TXT/text()" /> 
									</OBJ_TXT>
								</xsl:if>
								<xsl:if test="QUANTITY">
									<QUANTITY>
										<xsl:value-of select="QUANTITY/text()" /> 
									</QUANTITY>
								</xsl:if>
								<xsl:if test="AUTHOR">
									<AUTHOR>
										<xsl:value-of select="AUTHOR/text()" /> 
									</AUTHOR>
								</xsl:if>
								<xsl:if test="QUANTITY_UNIT">
									<QUANTITY_UNIT>
										<xsl:value-of select="QUANTITY_UNIT/text()" /> 
									</QUANTITY_UNIT>
								</xsl:if>
								<xsl:if test="COMPLETE">
									<COMPLETE>
										<xsl:value-of select="COMPLETE/text()" /> 
									</COMPLETE>
								</xsl:if>
								<xsl:if test="CONSISTENT">
									<CONSISTENT>
										<xsl:value-of select="CONSISTENT/text()" /> 
									</CONSISTENT>
								</xsl:if>
								<xsl:if test="OBJECT_GUID">
									<OBJECT_GUID>
										<xsl:value-of select="OBJECT_GUID/text()" /> 
									</OBJECT_GUID>
								</xsl:if>
								<xsl:if test="PERSIST_ID">
									<PERSIST_ID>
										<xsl:value-of select="PERSIST_ID/text()" /> 
									</PERSIST_ID>
								</xsl:if>
								<xsl:if test="PERSIST_ID_TYPE">
									<PERSIST_ID_TYPE>
										<xsl:value-of select="PERSIST_ID_TYPE/text()" /> 
									</PERSIST_ID_TYPE>
								</xsl:if>
								<xsl:if test="SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1CUINS>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="E2CUCFG003GRP">
						<xsl:for-each select="E1CUPRT">
							<E1CUPRT>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:text /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="PARENT_ID">
									<PARENT_ID>
										<xsl:value-of select="PARENT_ID/text()" /> 
									</PARENT_ID>
								</xsl:if>
								<xsl:if test="INST_ID">
									<INST_ID>
										<xsl:value-of select="INST_ID/text()" /> 
									</INST_ID>
								</xsl:if>
								<xsl:if test="PART_OF_NO">
									<PART_OF_NO>
										<xsl:value-of select="PART_OF_NO/text()" /> 
									</PART_OF_NO>
								</xsl:if>
								<xsl:if test="OBJ_TYPE">
									<OBJ_TYPE>
										<xsl:value-of select="OBJ_TYPE/text()" /> 
									</OBJ_TYPE>
								</xsl:if>
								<xsl:if test="CLASS_TYPE">
									<CLASS_TYPE>
										<xsl:value-of select="CLASS_TYPE/text()" /> 
									</CLASS_TYPE>
								</xsl:if>
								<xsl:if test="OBJ_KEY">
									<OBJ_KEY>
										<xsl:value-of select="OBJ_KEY/text()" /> 
									</OBJ_KEY>
								</xsl:if>
								<xsl:if test="AUTHOR">
									<AUTHOR>
										<xsl:value-of select="AUTHOR/text()" /> 
									</AUTHOR>
								</xsl:if>
								<xsl:if test="SALES_RELEVANT">
									<SALES_RELEVANT>
										<xsl:value-of select="SALES_RELEVANT/text()" /> 
									</SALES_RELEVANT>
								</xsl:if>
								<xsl:if test="PART_OF_GUID">
									<PART_OF_GUID>
										<xsl:value-of select="PART_OF_GUID/text()" /> 
									</PART_OF_GUID>
								</xsl:if>
								<xsl:if test="SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1CUPRT>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="E2CUCFG003GRP">
						<xsl:for-each select="E1CUVAL">
							<E1CUVAL>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:text /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="INST_ID">
									<INST_ID>
										<xsl:value-of select="INST_ID/text()" /> 
									</INST_ID>
								</xsl:if>
								<xsl:if test="CHARC">
									<CHARC>
										<xsl:value-of select="CHARC/text()" /> 
									</CHARC>
								</xsl:if>
								<xsl:if test="CHARC_TXT">
									<CHARC_TXT>
										<xsl:value-of select="CHARC_TXT/text()" /> 
									</CHARC_TXT>
								</xsl:if>
								<xsl:if test="VALUE">
									<VALUE>
										<xsl:value-of select="VALUE/text()" /> 
									</VALUE>
								</xsl:if>
								<xsl:if test="VALUE_TXT">
									<VALUE_TXT>
										<xsl:value-of select="VALUE_TXT/text()" /> 
									</VALUE_TXT>
								</xsl:if>
								<xsl:if test="AUTHOR">
									<AUTHOR>
										<xsl:value-of select="AUTHOR/text()" /> 
									</AUTHOR>
								</xsl:if>
								<xsl:if test="VALUE_TO">
									<VALUE_TO>
										<xsl:value-of select="VALUE_TO/text()" /> 
									</VALUE_TO>
								</xsl:if>
								<xsl:if test="VALCODE">
									<VALCODE>
										<xsl:value-of select="VALCODE/text()" /> 
									</VALCODE>
								</xsl:if>
								<xsl:if test="SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1CUVAL>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="E2CUCFG003GRP">
						<xsl:for-each select="E1CUBLB">
							<E1CUBLB>
								<DATAHEADERREC>
									<SEGNAM>
										<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
									</SEGNAM>
									<MANDT>
										<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
									</MANDT>
									<DOCNUM>
										<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
									</DOCNUM>
									<SEGNUM>
										<xsl:text /> 
									</SEGNUM>
									<PSGNUM>
										<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
									</PSGNUM>
									<HLEVEL>
										<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
									</HLEVEL>
								</DATAHEADERREC>
								<xsl:if test="CONTENT">
									<CONTENT>
										<xsl:value-of select="CONTENT/text()" /> 
									</CONTENT>
								</xsl:if>
								<xsl:if test="SEGMENTPAD">
									<SEGMENTPAD>
										<xsl:value-of select="SEGMENTPAD/text()" /> 
									</SEGMENTPAD>
								</xsl:if>
							</E1CUBLB>
						</xsl:for-each>
					</xsl:for-each>
				</E2CUCFG003GRP>
			</xsl:if>
			<E2EDL37005GRP>
				<xsl:for-each select="E2EDL37005GRP">
					<E1EDL37>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/SEGNUM/text()" /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="E1EDL37/DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="E1EDL37/EXIDV">
							<EXIDV>
								<xsl:value-of select="E1EDL37/EXIDV/text()" /> 
							</EXIDV>
						</xsl:if>
						<xsl:if test="E1EDL37/TARAG">
							<TARAG>
								<xsl:value-of select="E1EDL37/TARAG/text()" /> 
							</TARAG>
						</xsl:if>
						<xsl:if test="E1EDL37/GWEIT">
							<GWEIT>
								<xsl:value-of select="E1EDL37/GWEIT/text()" /> 
							</GWEIT>
						</xsl:if>
						<xsl:if test="E1EDL37/BRGEW">
							<BRGEW>
								<xsl:value-of select="E1EDL37/BRGEW/text()" /> 
							</BRGEW>
						</xsl:if>
						<xsl:if test="E1EDL37/NTGEW">
							<NTGEW>
								<xsl:value-of select="E1EDL37/NTGEW/text()" /> 
							</NTGEW>
						</xsl:if>
						<xsl:if test="E1EDL37/MAGEW">
							<MAGEW>
								<xsl:value-of select="E1EDL37/MAGEW/text()" /> 
							</MAGEW>
						</xsl:if>
						<xsl:if test="E1EDL37/GWEIM">
							<GWEIM>
								<xsl:value-of select="E1EDL37/GWEIM/text()" /> 
							</GWEIM>
						</xsl:if>
						<xsl:if test="E1EDL37/BTVOL">
							<BTVOL>
								<xsl:value-of select="E1EDL37/BTVOL/text()" /> 
							</BTVOL>
						</xsl:if>
						<xsl:if test="E1EDL37/NTVOL">
							<NTVOL>
								<xsl:value-of select="E1EDL37/NTVOL/text()" /> 
							</NTVOL>
						</xsl:if>
						<xsl:if test="E1EDL37/MAVOL">
							<MAVOL>
								<xsl:value-of select="E1EDL37/MAVOL/text()" /> 
							</MAVOL>
						</xsl:if>
						<xsl:if test="E1EDL37/VOLEM">
							<VOLEM>
								<xsl:value-of select="E1EDL37/VOLEM/text()" /> 
							</VOLEM>
						</xsl:if>
						<xsl:if test="E1EDL37/TAVOL">
							<TAVOL>
								<xsl:value-of select="E1EDL37/TAVOL/text()" /> 
							</TAVOL>
						</xsl:if>
						<xsl:if test="E1EDL37/VOLET">
							<VOLET>
								<xsl:value-of select="E1EDL37/VOLET/text()" /> 
							</VOLET>
						</xsl:if>
						<xsl:if test="E1EDL37/VEGR2">
							<VEGR2>
								<xsl:value-of select="E1EDL37/VEGR2/text()" /> 
							</VEGR2>
						</xsl:if>
						<xsl:if test="E1EDL37/VEGR1">
							<VEGR1>
								<xsl:value-of select="E1EDL37/VEGR1/text()" /> 
							</VEGR1>
						</xsl:if>
						<xsl:if test="E1EDL37/VEGR3">
							<VEGR3>
								<xsl:value-of select="E1EDL37/VEGR3/text()" /> 
							</VEGR3>
						</xsl:if>
						<xsl:if test="E1EDL37/VHILM">
							<VHILM>
								<xsl:value-of select="E1EDL37/VHILM/text()" /> 
							</VHILM>
						</xsl:if>
						<xsl:if test="E1EDL37/VEGR4">
							<VEGR4>
								<xsl:value-of select="E1EDL37/VEGR4/text()" /> 
							</VEGR4>
						</xsl:if>
						<xsl:if test="E1EDL37/LAENG">
							<LAENG>
								<xsl:value-of select="E1EDL37/LAENG/text()" /> 
							</LAENG>
						</xsl:if>
						<xsl:if test="E1EDL37/VEGR5">
							<VEGR5>
								<xsl:value-of select="E1EDL37/VEGR5/text()" /> 
							</VEGR5>
						</xsl:if>
						<xsl:if test="E1EDL37/BREIT">
							<BREIT>
								<xsl:value-of select="E1EDL37/BREIT/text()" /> 
							</BREIT>
						</xsl:if>
						<xsl:if test="E1EDL37/HOEHE">
							<HOEHE>
								<xsl:value-of select="E1EDL37/HOEHE/text()" /> 
							</HOEHE>
						</xsl:if>
						<xsl:if test="E1EDL37/MEABM">
							<MEABM>
								<xsl:value-of select="E1EDL37/MEABM/text()" /> 
							</MEABM>
						</xsl:if>
						<xsl:if test="E1EDL37/INHALT">
							<INHALT>
								<xsl:value-of select="E1EDL37/INHALT/text()" /> 
							</INHALT>
						</xsl:if>
						<xsl:if test="E1EDL37/VHART">
							<VHART>
								<xsl:value-of select="E1EDL37/VHART/text()" /> 
							</VHART>
						</xsl:if>
						<xsl:if test="E1EDL37/MAGRV">
							<MAGRV>
								<xsl:value-of select="E1EDL37/MAGRV/text()" /> 
							</MAGRV>
						</xsl:if>
						<xsl:if test="E1EDL37/LADLG">
							<LADLG>
								<xsl:value-of select="E1EDL37/LADLG/text()" /> 
							</LADLG>
						</xsl:if>
						<xsl:if test="E1EDL37/LADEH">
							<LADEH>
								<xsl:value-of select="E1EDL37/LADEH/text()" /> 
							</LADEH>
						</xsl:if>
						<xsl:if test="E1EDL37/FARZT">
							<FARZT>
								<xsl:value-of select="E1EDL37/FARZT/text()" /> 
							</FARZT>
						</xsl:if>
						<xsl:if test="E1EDL37/FAREH">
							<FAREH>
								<xsl:value-of select="E1EDL37/FAREH/text()" /> 
							</FAREH>
						</xsl:if>
						<xsl:if test="E1EDL37/ENTFE">
							<ENTFE>
								<xsl:value-of select="E1EDL37/ENTFE/text()" /> 
							</ENTFE>
						</xsl:if>
						<xsl:if test="E1EDL37/EHENT">
							<EHENT>
								<xsl:value-of select="E1EDL37/EHENT/text()" /> 
							</EHENT>
						</xsl:if>
						<xsl:if test="E1EDL37/VELTP">
							<VELTP>
								<xsl:value-of select="E1EDL37/VELTP/text()" /> 
							</VELTP>
						</xsl:if>
						<xsl:if test="E1EDL37/EXIDV2">
							<EXIDV2>
								<xsl:value-of select="E1EDL37/EXIDV2/text()" /> 
							</EXIDV2>
						</xsl:if>
						<xsl:if test="E1EDL37/LANDT">
							<LANDT>
								<xsl:value-of select="E1EDL37/LANDT/text()" /> 
							</LANDT>
						</xsl:if>
						<xsl:if test="E1EDL37/LANDF">
							<LANDF>
								<xsl:value-of select="E1EDL37/LANDF/text()" /> 
							</LANDF>
						</xsl:if>
						<xsl:if test="E1EDL37/NAMEF">
							<NAMEF>
								<xsl:value-of select="E1EDL37/NAMEF/text()" /> 
							</NAMEF>
						</xsl:if>
						<xsl:if test="E1EDL37/NAMBE">
							<NAMBE>
								<xsl:value-of select="E1EDL37/NAMBE/text()" /> 
							</NAMBE>
						</xsl:if>
						<xsl:if test="E1EDL37/VHILM_KU">
							<VHILM_KU>
								<xsl:value-of select="E1EDL37/VHILM_KU/text()" /> 
							</VHILM_KU>
						</xsl:if>
						<xsl:if test="E1EDL37/VEBEZ">
							<VEBEZ>
								<xsl:value-of select="E1EDL37/VEBEZ/text()" /> 
							</VEBEZ>
						</xsl:if>
						<xsl:if test="E1EDL37/SMGKN">
							<SMGKN>
								<xsl:value-of select="E1EDL37/SMGKN/text()" /> 
							</SMGKN>
						</xsl:if>
						<xsl:if test="E1EDL37/KDMAT35">
							<KDMAT35>
								<xsl:value-of select="E1EDL37/KDMAT35/text()" /> 
							</KDMAT35>
						</xsl:if>
						<xsl:if test="E1EDL37/SORTL">
							<SORTL>
								<xsl:value-of select="E1EDL37/SORTL/text()" /> 
							</SORTL>
						</xsl:if>
						<xsl:if test="E1EDL37/ERNAM">
							<ERNAM>
								<xsl:value-of select="E1EDL37/ERNAM/text()" /> 
							</ERNAM>
						</xsl:if>
						<xsl:if test="E1EDL37/GEWFX">
							<GEWFX>
								<xsl:value-of select="E1EDL37/GEWFX/text()" /> 
							</GEWFX>
						</xsl:if>
						<xsl:if test="E1EDL37/ERLKZ">
							<ERLKZ>
								<xsl:value-of select="E1EDL37/ERLKZ/text()" /> 
							</ERLKZ>
						</xsl:if>
						<xsl:if test="E1EDL37/EXIDA">
							<EXIDA>
								<xsl:value-of select="E1EDL37/EXIDA/text()" /> 
							</EXIDA>
						</xsl:if>
						<xsl:if test="E1EDL37/MOVE_STATUS">
							<MOVE_STATUS>
								<xsl:value-of select="E1EDL37/MOVE_STATUS/text()" /> 
							</MOVE_STATUS>
						</xsl:if>
						<xsl:if test="E1EDL37/PACKVORSCHR">
							<PACKVORSCHR>
								<xsl:value-of select="E1EDL37/PACKVORSCHR/text()" /> 
							</PACKVORSCHR>
						</xsl:if>
						<xsl:if test="E1EDL37/PACKVORSCHR_ST">
							<PACKVORSCHR_ST>
								<xsl:value-of select="E1EDL37/PACKVORSCHR_ST/text()" /> 
							</PACKVORSCHR_ST>
						</xsl:if>
						<xsl:if test="E1EDL37/LABELTYP">
							<LABELTYP>
								<xsl:value-of select="E1EDL37/LABELTYP/text()" /> 
							</LABELTYP>
						</xsl:if>
						<xsl:if test="E1EDL37/ZUL_AUFL">
							<ZUL_AUFL>
								<xsl:value-of select="E1EDL37/ZUL_AUFL/text()" /> 
							</ZUL_AUFL>
						</xsl:if>
						<xsl:if test="E1EDL37/VHILM_EXTERNAL">
							<VHILM_EXTERNAL>
								<xsl:value-of select="E1EDL37/VHILM_EXTERNAL/text()" /> 
							</VHILM_EXTERNAL>
						</xsl:if>
						<xsl:if test="E1EDL37/VHILM_VERSION">
							<VHILM_VERSION>
								<xsl:value-of select="E1EDL37/VHILM_VERSION/text()" /> 
							</VHILM_VERSION>
						</xsl:if>
						<xsl:if test="E1EDL37/VHILM_GUID">
							<VHILM_GUID>
								<xsl:value-of select="E1EDL37/VHILM_GUID/text()" /> 
							</VHILM_GUID>
						</xsl:if>
						<xsl:if test="E1EDL37/SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="E1EDL37/SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDL37>
				</xsl:for-each>
				<xsl:for-each select="E2EDL37005GRP">
					<xsl:for-each select="E1EDL39">
						<E1EDL39>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="QUALF">
								<QUALF>
									<xsl:value-of select="QUALF/text()" /> 
								</QUALF>
							</xsl:if>
							<xsl:if test="PARAM">
								<PARAM>
									<xsl:value-of select="PARAM/text()" /> 
								</PARAM>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDL39>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="E2EDL37005GRP">
					<xsl:for-each select="E1EDL38">
						<E1EDL38>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="VEGR1_BEZ">
								<VEGR1_BEZ>
									<xsl:value-of select="VEGR1_BEZ/text()" /> 
								</VEGR1_BEZ>
							</xsl:if>
							<xsl:if test="VEGR2_BEZ">
								<VEGR2_BEZ>
									<xsl:value-of select="VEGR2_BEZ/text()" /> 
								</VEGR2_BEZ>
							</xsl:if>
							<xsl:if test="VEGR3_BEZ">
								<VEGR3_BEZ>
									<xsl:value-of select="VEGR3_BEZ/text()" /> 
								</VEGR3_BEZ>
							</xsl:if>
							<xsl:if test="VEGR4_BEZ">
								<VEGR4_BEZ>
									<xsl:value-of select="VEGR4_BEZ/text()" /> 
								</VEGR4_BEZ>
							</xsl:if>
							<xsl:if test="VEGR5_BEZ">
								<VEGR5_BEZ>
									<xsl:value-of select="VEGR5_BEZ/text()" /> 
								</VEGR5_BEZ>
							</xsl:if>
							<xsl:if test="VHART_BEZ">
								<VHART_BEZ>
									<xsl:value-of select="VHART_BEZ/text()" /> 
								</VHART_BEZ>
							</xsl:if>
							<xsl:if test="MAGRV_BEZ">
								<MAGRV_BEZ>
									<xsl:value-of select="MAGRV_BEZ/text()" /> 
								</MAGRV_BEZ>
							</xsl:if>
							<xsl:if test="VEBEZ">
								<VEBEZ>
									<xsl:value-of select="VEBEZ/text()" /> 
								</VEBEZ>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDL38>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="E2EDL37005GRP">
					<xsl:for-each select="E1EDL44">
						<E1EDL44>
							<DATAHEADERREC>
								<SEGNAM>
									<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
								</SEGNAM>
								<MANDT>
									<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
								</MANDT>
								<DOCNUM>
									<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
								</DOCNUM>
								<SEGNUM>
									<xsl:value-of select="DATAHEADERREC/SEGNUM/text()" /> 
								</SEGNUM>
								<PSGNUM>
									<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
								</PSGNUM>
								<HLEVEL>
									<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
								</HLEVEL>
							</DATAHEADERREC>
							<xsl:if test="VELIN">
								<VELIN>
									<xsl:value-of select="VELIN/text()" /> 
								</VELIN>
							</xsl:if>
							<xsl:if test="VBELN">
								<VBELN>
									<xsl:value-of select="VBELN/text()" /> 
								</VBELN>
							</xsl:if>
							<xsl:if test="POSNR">
								<POSNR>
									<xsl:value-of select="POSNR/text()" /> 
								</POSNR>
							</xsl:if>
							<xsl:if test="EXIDV">
								<EXIDV>
									<xsl:value-of select="EXIDV/text()" /> 
								</EXIDV>
							</xsl:if>
							<xsl:if test="VEMNG">
								<VEMNG>
									<xsl:value-of select="VEMNG/text()" /> 
								</VEMNG>
							</xsl:if>
							<xsl:if test="VEMEH">
								<VEMEH>
									<xsl:value-of select="VEMEH/text()" /> 
								</VEMEH>
							</xsl:if>
							<xsl:if test="MATNR">
								<MATNR>
									<xsl:value-of select="MATNR/text()" /> 
								</MATNR>
							</xsl:if>
							<xsl:if test="KDMAT">
								<KDMAT>
									<xsl:value-of select="KDMAT/text()" /> 
								</KDMAT>
							</xsl:if>
							<xsl:if test="CHARG">
								<CHARG>
									<xsl:value-of select="CHARG/text()" /> 
								</CHARG>
							</xsl:if>
							<xsl:if test="WERKS">
								<WERKS>
									<xsl:value-of select="WERKS/text()" /> 
								</WERKS>
							</xsl:if>
							<xsl:if test="LGORT">
								<LGORT>
									<xsl:value-of select="LGORT/text()" /> 
								</LGORT>
							</xsl:if>
							<xsl:if test="CUOBJ">
								<CUOBJ>
									<xsl:value-of select="CUOBJ/text()" /> 
								</CUOBJ>
							</xsl:if>
							<xsl:if test="BESTQ">
								<BESTQ>
									<xsl:value-of select="BESTQ/text()" /> 
								</BESTQ>
							</xsl:if>
							<xsl:if test="SOBKZ">
								<SOBKZ>
									<xsl:value-of select="SOBKZ/text()" /> 
								</SOBKZ>
							</xsl:if>
							<xsl:if test="SONUM">
								<SONUM>
									<xsl:value-of select="SONUM/text()" /> 
								</SONUM>
							</xsl:if>
							<xsl:if test="ANZSN">
								<ANZSN>
									<xsl:value-of select="ANZSN/text()" /> 
								</ANZSN>
							</xsl:if>
							<xsl:if test="WDATU">
								<WDATU>
									<xsl:value-of select="WDATU/text()" /> 
								</WDATU>
							</xsl:if>
							<xsl:if test="PARID">
								<PARID>
									<xsl:value-of select="PARID/text()" /> 
								</PARID>
							</xsl:if>
							<xsl:if test="MATNR_EXTERNAL">
								<MATNR_EXTERNAL>
									<xsl:value-of select="MATNR_EXTERNAL/text()" /> 
								</MATNR_EXTERNAL>
							</xsl:if>
							<xsl:if test="MATNR_VERSION">
								<MATNR_VERSION>
									<xsl:value-of select="MATNR_VERSION/text()" /> 
								</MATNR_VERSION>
							</xsl:if>
							<xsl:if test="MATNR_GUID">
								<MATNR_GUID>
									<xsl:value-of select="MATNR_GUID/text()" /> 
								</MATNR_GUID>
							</xsl:if>
							<xsl:if test="SEGMENTPAD">
								<SEGMENTPAD>
									<xsl:value-of select="SEGMENTPAD/text()" /> 
								</SEGMENTPAD>
							</xsl:if>
						</E1EDL44>
					</xsl:for-each>
				</xsl:for-each>
			</E2EDL37005GRP>
			<xsl:for-each select="E1EDS01">
				<xsl:variable name="var:v40" select="userCSharp:StringConcat('false')" /> 
				<xsl:variable name="var:v41" select="userCSharp:LogicalEq(string($var:v40) , 'true')" /> 
				<xsl:if test="$var:v41">
					<E1EDS01>
						<DATAHEADERREC>
							<SEGNAM>
								<xsl:value-of select="DATAHEADERREC/SEGNAM/text()" /> 
							</SEGNAM>
							<MANDT>
								<xsl:value-of select="DATAHEADERREC/MANDT/text()" /> 
							</MANDT>
							<DOCNUM>
								<xsl:value-of select="DATAHEADERREC/DOCNUM/text()" /> 
							</DOCNUM>
							<SEGNUM>
								<xsl:text /> 
							</SEGNUM>
							<PSGNUM>
								<xsl:value-of select="DATAHEADERREC/PSGNUM/text()" /> 
							</PSGNUM>
							<HLEVEL>
								<xsl:value-of select="DATAHEADERREC/HLEVEL/text()" /> 
							</HLEVEL>
						</DATAHEADERREC>
						<xsl:if test="SUMID">
							<SUMID>
								<xsl:value-of select="SUMID/text()" /> 
							</SUMID>
						</xsl:if>
						<xsl:if test="SUMME">
							<SUMME>
								<xsl:value-of select="SUMME/text()" /> 
							</SUMME>
						</xsl:if>
						<xsl:if test="SUNIT">
							<SUNIT>
								<xsl:value-of select="SUNIT/text()" /> 
							</SUNIT>
						</xsl:if>
						<xsl:if test="WAERQ">
							<WAERQ>
								<xsl:value-of select="WAERQ/text()" /> 
							</WAERQ>
						</xsl:if>
						<xsl:if test="SEGMENTPAD">
							<SEGMENTPAD>
								<xsl:value-of select="SEGMENTPAD/text()" /> 
							</SEGMENTPAD>
						</xsl:if>
					</E1EDS01>
				</xsl:if>
			</xsl:for-each>
		</ns0:Z3ORDERS05>
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
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
}


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
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




  ]]> 
	</msxsl:script>
</xsl:stylesheet>