<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" 
                version="1.0" 
                xmlns:s0="http://Z3ORDERS05.V4" 
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Z3ORDERS05" />
  </xsl:template>
  <xsl:template match="/s0:Z3ORDERS05">
    <xsl:variable name="var:APVal" select="string(E2EDK01005GRP/Z1E1EDK01/AP_VALUE/text())" />
    <xsl:variable name="var:DPVal" select="string(E2EDK01005GRP/Z1E1EDK01/DP_VALUE/text())" />
    <xsl:variable name="var:DPName" select="string(E2EDK01005GRP/Z1E1EDK01/DP_NAME/text())" />
    <xsl:variable name="var:POType" select="string(E2EDK01005GRP/Z1E1EDK01/PO_TYPE/text())" />
    <xsl:variable name="var:CompCode" select="string(E2EDK01005GRP/Z1E1EDK01/COMP_CODE/text())" />
    <xsl:variable name="var:vZTERM" select="string(E2EDK01005GRP/E1EDK01/ZTERM/text())" />
    <xsl:variable name="var:SalesOrderNo" select="number(E2EDK01005GRP/E1EDK01/BELNR/text())" />    
    <xsl:variable name="var:LineOrderStatus" select="string(E2EDK01005GRP/Z1E1EDK01/STATUS/text())" />
    <xsl:variable name="var:LineItemCount" select="count(/s0:Z3ORDERS05/E2EDP01007GRP)" />
    <xsl:variable name="var:vWERKS" select="string(E2EDP01007GRP[1]/E1EDP01/WERKS/text())" />
    <ns0:EFACT_D01B_ORDRSP>
      <UNH>
        <UNH1>
          <xsl:value-of select="'1'" />
        </UNH1>
         <UNH2>
          <UNH2.1>
            <xsl:value-of select="'ORDRSP'" />
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
             <xsl:value-of select="'EAN007'" />
           </UNH2.5>
         </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'231'" />
          </C00201>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="$var:SalesOrderNo" />
          </C10601>
        </ns0:C106>
        <BGM03>
          <xsl:variable name="var:StatusIdentifier" select="string(E2EDK01005GRP/Z1E1EDK01/STATUS/text())" />
          <xsl:if test="string($var:StatusIdentifier)='FULL'">
          <xsl:value-of select="'29'" />
          </xsl:if>
          <xsl:if test="string($var:StatusIdentifier)='REJ'">
            <xsl:value-of select="'27'" />
          </xsl:if>
          <xsl:if test="string($var:StatusIdentifier)='CHG'">
            <xsl:value-of select="'4'" />
          </xsl:if>
        </BGM03>
      </ns0:BGM>
      <xsl:for-each select="E1EDK03">
        <xsl:variable name="var:DTMIDDAT" select="string(IDDAT/text())" />
        <xsl:if test="string($var:DTMIDDAT)='012'">
          <ns0:DTM>            
              <ns0:C507>
              <xsl:variable name="var:vDTMDATUM" select="DATUM/text()" />
                <C50701>
                  <xsl:value-of select="'137'" />
                </C50701>
                <C50702>
                  <xsl:value-of select="$var:vDTMDATUM" />
                </C50702>
                <C50703>
                <xsl:value-of select="'102'" />
              </C50703>
              </ns0:C507>
          </ns0:DTM>
        </xsl:if>
      </xsl:for-each>
      
      <ns0:RFFLoop1>
        <xsl:for-each select="E1EDK02">
          <xsl:variable name="var:RFFQUALF1" select="string(QUALF/text())" />
          <xsl:if test="string($var:RFFQUALF1)='001'">
            <ns0:RFF>
              <ns0:C506>
                <xsl:variable name="var:RFFBELNR" select="BELNR/text()" />
                <C50601>
                  <xsl:value-of select="'ON'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="$var:RFFBELNR" />
                </C50602>
              </ns0:C506>
            </ns0:RFF>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="E1EDK02">
          <xsl:variable name="var:RFFQUALF2" select="string(QUALF/text())" />
          <xsl:if test="string($var:RFFQUALF2)='002'">
            <ns0:DTM_2>
              <xsl:variable name="var:RFFDATUM" select="DATUM/text()" />
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="'171'" />
                </C50701>
                <C50702>
                  <xsl:value-of select="userCSharp:StringConcat($var:RFFDATUM, '0000')" />
                </C50702>
                <C50703>
                  <xsl:value-of select="'203'" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
          </xsl:if>
        </xsl:for-each>
      </ns0:RFFLoop1>

      <ns0:RFFLoop1>
             <ns0:RFF>
              <ns0:C506>
                <C50601>
                  <xsl:value-of select="'ZZZ'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="'LION'" />
                </C50602>
              </ns0:C506>
            </ns0:RFF>
      </ns0:RFFLoop1>
      
      
      <xsl:for-each select="E2EDKA1003GRP">
        <xsl:variable name="var:NADIdentifier" select="string(E1EDKA1/PARVW/text())" />
        <xsl:variable name="var:NADID" select="string(E1EDKA1/PARTN/text())" />
        <xsl:variable name="var:NADTelephone" select="string(E1EDKA1/TELF1/text())" />
        <xsl:variable name="var:NADFax" select="string(E1EDKA1/TELFX/text())" />

        <xsl:if test="string($var:NADIdentifier)='AG' or 'WE'">


          <xsl:if test="string($var:NADIdentifier)='AG'">
            <ns0:NADLoop1>
              <ns0:NAD>
                <NAD01>
                  <xsl:value-of select="'BY'" />
                </NAD01>
                <ns0:C082>
                  <C08201>
                    <xsl:value-of select="$var:APVal" />
                    <xsl:variable name="var:vsetSoldToCode" select="userCSharp:SetSoldToCode(string(E1EDKA1/PARTN/text()))" />
                  </C08201>
                  <C08202>
                    <xsl:value-of select="'9'" />
                  </C08202>
                </ns0:C082>
              </ns0:NAD>
              <ns0:FII>
                <FII01>
                  <xsl:value-of select="'AP'" />
                </FII01>
                <ns0:C078>
                  <C07801>
                    <xsl:value-of select="$var:APVal" />
                  </C07801>
                </ns0:C078>
              </ns0:FII>
              <ns0:FII>
                <FII01>
                  <xsl:value-of select="'DP'" />
                </FII01>
                <ns0:C078>
                  <C07801>
                    <xsl:value-of select="$var:DPVal" />
                  </C07801>
                  <C07802>
                    <xsl:value-of select="$var:DPName" />
                  </C07802>
                </ns0:C078>
              </ns0:FII>
              <ns0:RFFLoop2>
                <ns0:RFF_2>
                  <ns0:C506_2>
                    <C50601>
                      <xsl:value-of select="'IT'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:POType" />
                    </C50602>
                  </ns0:C506_2>
                </ns0:RFF_2>
              </ns0:RFFLoop2>
              <ns0:RFFLoop2>
                <ns0:RFF_2>
                  <ns0:C506_2>
                    <C50601>
                      <xsl:value-of select="'VA'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:CompCode" />
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
                      <xsl:value-of select="$var:NADTelephone" />
                    </C07601>
                    <C07602>
                      <xsl:value-of select="'TE'" />
                    </C07602>
                  </ns0:C076>
                </ns0:COM>
                <ns0:COM>
                  <ns0:C076>
                    <C07601>
                      <xsl:value-of select="$var:NADFax" />
                    </C07601>
                    <C07602>
                      <xsl:value-of select="'FX'" />
                    </C07602>
                  </ns0:C076>
                </ns0:COM>
              </ns0:CTALoop1>
            </ns0:NADLoop1>
          </xsl:if>
          
          
          <xsl:if test="string($var:NADIdentifier)='WE'">
               <xsl:variable name="var:vsetSoldToCode" select="userCSharp:SetShiptoCode(string(E1EDKA1/PARTN/text()))" />
          </xsl:if>
          
        </xsl:if>
      </xsl:for-each>
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
                    <xsl:value-of select="'9'" />
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
              <ns0:CTALoop1>
                <ns0:CTA>
                  <CTA01>
                    <xsl:value-of select="'PD'" />
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
      
      
      <xsl:for-each select="E2EDKA1003GRP">
        <xsl:variable name="var:NADIdentifier1" select="string(E1EDKA1/PARVW/text())" />
        <xsl:variable name="var:NADID" select="string(E1EDKA1/PARTN/text())" />
        <xsl:variable name="var:NADName" select="string(E1EDKA1/NAME1/text())" />
        <xsl:variable name="var:NADStreet" select="string(E1EDKA1/STRAS/text())" />
        <xsl:variable name="var:NADCity" select="string(E1EDKA1/ORT01/text())" />
        <xsl:variable name="var:NADState" select="string(E1EDKA1/REGIO/text())" />
        <xsl:variable name="var:NADZipCode" select="string(E1EDKA1/PSTLZ/text())" />
        <xsl:variable name="var:NADTelephone1" select="string(E1EDKA1/TELF1/text())" />
        <xsl:variable name="var:NADFax1" select="string(E1EDKA1/TELFX/text())" />

      <xsl:variable name="var:vgetLionsSiteCode" select="userCSharp:getLionsSiteCode()" />
      <xsl:if test="string($var:vgetLionsSiteCode)!='' and string($var:NADIdentifier1)='WE'">
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
				<xsl:value-of select="'9'" />
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
         </xsl:for-each> 
         <xsl:variable name="var:vZTERM1" select="substring($var:vZTERM,2)" />
         <xsl:if test="substring($var:vZTERM, 1, 2)='IN'">
         <ns0:PATLoop1>
			 <ns0:PAT>
				<PAT01>
					<xsl:value-of select="'ZZZ'" />
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
					<xsl:value-of select="'ZZZ'" />
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
        <xsl:variable name="var:LINRecCount" select="position()" />
        <ns0:LINLoop1>
          <ns0:LIN>
            <xsl:for-each select="E1EDP02">
              <xsl:variable name="var:LINQUALF" select="string(QUALF/text())" />
              <xsl:variable name="var:vZEILE" select="string(ZEILE/text())" />
              <xsl:if test="string($var:LINQUALF)='001'">
               <xsl:if test="string($var:vZEILE)=''">
					<LIN01>
					  <xsl:value-of select="number($var:LINRecCount) * 10" />
					</LIN01>
                </xsl:if>              
                <xsl:if test="string($var:vZEILE)!=''">
					<LIN01>
					  <xsl:value-of select="number($var:vZEILE)" />
					</LIN01>
                </xsl:if>
              </xsl:if>
            </xsl:for-each>

            
           <!--Line Item Status Code Value--> 
            <xsl:for-each select="E1EDP01">
              <xsl:variable name="var:LINABGRU" select="string(ABGRU/text())" />
              
              <xsl:if test="string($var:LINABGRU)=''">
                  <LIN02>
                    <xsl:value-of select="5" />
                  </LIN02>
                </xsl:if>
                <xsl:if test="string($var:LINABGRU)!=''">
                  <LIN02>
                    <xsl:value-of select="7" />
                  </LIN02>
                </xsl:if>
              
            </xsl:for-each>
                        
            <!--<LIN02>
              
              <xsl:value-of select="userCSharp:CheckLineOrderStatus($var:LineOrderStatus)" />
            </LIN02>-->
            <xsl:for-each select="E1EDP19">
              <xsl:variable name="var:LINQUALF1" select="string(QUALF/text())" />
              <xsl:variable name="var:LINIDTNR" select="string(IDTNR/text())" />
              <xsl:if test="string($var:LINQUALF1)='001'">
                <ns0:C212>
                  <C21201>
                    <xsl:value-of select="userCSharp:PaddingLeft($var:LINIDTNR)" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SRV'" />
                  </C21202>
                </ns0:C212>
              </xsl:if>
            </xsl:for-each>
          </ns0:LIN>
          <xsl:for-each select="E1EDP19">
            <xsl:variable name="var:LINQUALF2" select="string(QUALF/text())" />
            <xsl:variable name="var:LINIDTNR1" select="string(IDTNR/text())" />
            <xsl:if test="string($var:LINQUALF2)='001'">
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="$var:LINRecCount" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="userCSharp:PaddingLeft($var:LINIDTNR1)" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'IN'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
            </xsl:if>
            <xsl:if test="string($var:LINQUALF2)='002'">
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="$var:LINRecCount" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNR1" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SA'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
              </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="E1EDP19">
            <xsl:variable name="var:LINQUALF3" select="string(QUALF/text())" />
            <xsl:variable name="var:LINKTEXT" select="string(KTEXT/text())" />
            <xsl:if test="string($var:LINQUALF3)='002'">
              <ns0:IMD_2>
                <IMD01>
                  <xsl:value-of select="'F'" />
                </IMD01>

                <ns0:C273_2>
                  <C27304>
                    <xsl:value-of select="userCSharp:ReplaceKTEXT($var:LINKTEXT)" />
                  </C27304>
                </ns0:C273_2>
              </ns0:IMD_2>
            </xsl:if>
          </xsl:for-each>

          <xsl:variable name="var:Z1QTYMENGE" select="string(Z1E1EDP1[1]/MENGE/text())" />
          <xsl:variable name="var:Z1QTYMENEE" select="string(Z1E1EDP1[1]/MENEE/text())" />
          <xsl:variable name="var:QTYMENGE" select="string(E1EDP01/MENGE/text())" />
          <xsl:variable name="var:QTYMENEE" select="string(E1EDP01/MENEE/text())" />

          <ns0:QTY_3>
            <ns0:C186_3>
              <C18601>
                <xsl:value-of select="'21'" />
              </C18601>
              <C18602>
                <xsl:value-of select="$var:Z1QTYMENGE" />
              </C18602>
              <C18603>
                <xsl:value-of select="$var:Z1QTYMENEE" />
              </C18603>
            </ns0:C186_3>
          </ns0:QTY_3>
          <ns0:QTY_3>
            <ns0:C186_3>
              <C18601>
                <xsl:value-of select="'113'" />
              </C18601>
              <C18602>
                <xsl:value-of select="$var:QTYMENGE" />
              </C18602>
              <C18603>
                <xsl:value-of select="$var:QTYMENEE" />
              </C18603>
            </ns0:C186_3>
          </ns0:QTY_3>
          <ns0:QTY_3>
            <ns0:C186_3>
              <C18601>
                <xsl:value-of select="'59'" />
              </C18601>
              <C18602>
                <xsl:value-of select="$var:Z1QTYMENGE" />
              </C18602>
              <C18603>
                <xsl:value-of select="$var:Z1QTYMENEE" />
              </C18603>
            </ns0:C186_3>
          </ns0:QTY_3>

          <xsl:variable name="var:Z1DTMDATUM" select="string(Z1E1EDP1[1]/DATUM/text())" />
          <xsl:variable name="var:DTMEDATU" select="string(E1EDP20[1]/EDATU/text())" />

          <ns0:DTM_13>
            <ns0:C507_13>
              <C50701>
                <xsl:value-of select="'2'" />
              </C50701>
              <C50702>
                <xsl:value-of select="userCSharp:StringConcat($var:Z1DTMDATUM, '0000')" />
              </C50702>
              <C50703>
                <xsl:value-of select="'203'" />
              </C50703>
            </ns0:C507_13>
          </ns0:DTM_13>

          <ns0:DTM_13>
            <ns0:C507_13>
              <C50701>
                <xsl:value-of select="'76'" />
              </C50701>
              <C50702>
                <xsl:value-of select="userCSharp:StringConcat($var:DTMEDATU,'0000')" />
              </C50702>
              <C50703>
                <xsl:value-of select="'203'" />
              </C50703>
            </ns0:C507_13>
          </ns0:DTM_13>
          <!--<xsl:for-each select="E2EDP05002GRP">-->
            <xsl:variable name="var:v1MAOKSCHL" select="string(E2EDP05002GRP[1]/E1EDP05[1]/KSCHL/text())" />
            <xsl:variable name="var:v2MAOKSCHL" select="string(E2EDP05002GRP[2]/E1EDP05[1]/KSCHL/text())" />
            <xsl:variable name="var:v1MAOBETRG" select="string(E2EDP05002GRP[1]/E1EDP05[1]/BETRG/text())" />
            <xsl:variable name="var:v2MAOBETRG" select="string(E2EDP05002GRP[2]/E1EDP05[1]/BETRG/text())" />
            <xsl:if test="string($var:v1MAOKSCHL)='ZR00'">
              <ns0:MOA_5>
                <ns0:C516_5>
                  <C51601>
                    <xsl:value-of select="'128'" />
                  </C51601>
                  <C51602>
                    <xsl:value-of select="$var:v1MAOBETRG" />
                  </C51602>
                  <C51603>
                    <xsl:value-of select="'AUD'" />
                  </C51603>
                </ns0:C516_5>
              </ns0:MOA_5>
            </xsl:if>
            <ns0:MOA_5>
              <ns0:C516_5>
                <C51601>
                  <xsl:value-of select="'203'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="userCSharp:TotalMOAValue($var:v1MAOBETRG,$var:v2MAOBETRG)" />
                </C51602>
                <C51603>
                  <xsl:value-of select="'AUD'" />
                </C51603>
              </ns0:C516_5>
            </ns0:MOA_5>
            <xsl:if test="string($var:v2MAOKSCHL)='ZGST'">
              <ns0:MOA_5>
                <ns0:C516_5>
                  <C51601>
                    <xsl:value-of select="'369'" />
                  </C51601>
                  <C51602>
                    <xsl:value-of select="$var:v2MAOBETRG" />
                    <xsl:variable name="var:v2setBETRG" select="userCSharp:SetTotalTax($var:v2MAOBETRG)" />                    
                  </C51602>
                  <C51603>
                    <xsl:value-of select="'AUD'" />
                  </C51603>
                </ns0:C516_5>
              </ns0:MOA_5>
            </xsl:if>
          <!--</xsl:for-each>-->

          <xsl:variable name="var:FTXABGRU" select="string(E1EDP01/ABGRU/text())" />
          <xsl:if test="string($var:FTXABGRU)!=''">
            <FTX_6>
              <FTX01>
                <xsl:value-of select="'ZZZ'" />
              </FTX01>
              <FTX02>
                <xsl:value-of select="'1'" />
              </FTX02>
              <C107_6>
                <C10701>
                  <xsl:value-of select="'Rejected'" />
                </C10701>
                <C10703>
                  <xsl:value-of select="$var:FTXABGRU" />
                </C10703>
              </C107_6>
              <C108_6>
                <C10801>
                  <xsl:variable name="var:LINKTEXT" select="string(E1EDP01/ABGRT/text())" />
                </C10801>
              </C108_6>
            </FTX_6>
          </xsl:if>

          <ns0:PRILoop1>
            <ns0:PRI>
              <ns0:C509>
                <C50901>
                  <xsl:value-of select="'1E'" />
                </C50901>
                <C50902>
                  <xsl:value-of select="string(E1EDP01/VPREI/text())" />
                </C50902>
                <C50905>
                  <xsl:value-of select="string(E1EDP01/PEINH/text())" />
                </C50905>
                <C50906>
                  <xsl:value-of select="string(E1EDP01/PMENE/text())" />
                </C50906>
              </ns0:C509>
            </ns0:PRI>
            <xsl:for-each select="E1EDP03">
              <xsl:variable name="var:PRIDTMIDDAT" select="string(IDDAT/text())" />
              <xsl:variable name="var:PRIDTMDATUM" select="string(DATUM/text())" />
              <xsl:if test="string($var:PRIDTMIDDAT)='023'">
                <DTM_15>
                  <C507_15>
                    <C50701>
                      <xsl:value-of select="'7'" />
                    </C50701>
                    <C50702>
                      <xsl:value-of select="$var:PRIDTMDATUM" />
                    </C50702>
                    <C50703>
                      <xsl:value-of select="'102'" />
                    </C50703>
                  </C507_15>
                </DTM_15>
              </xsl:if>
            </xsl:for-each>
          </ns0:PRILoop1>

          <xsl:for-each select="E1EDP02">
            <xsl:variable name="var:LINRFFQUALF" select="string(QUALF/text())" />
            <xsl:variable name="var:LINRFFBELNR" select="string(BELNR/text())" />
            <xsl:variable name="var:LINRFFZEILE" select="string(ZEILE/text())" />
            <xsl:if test="string($var:LINRFFQUALF)='001'">
              <RFFLoop3>
                <RFF_6>
                  <C506_6>
                    <C50601>
                      <xsl:value-of select="'ON'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:LINRFFBELNR" />
                    </C50602>
                    <C50603>
                      <xsl:value-of select="number($var:LINRFFZEILE)" />
                    </C50603>
                  </C506_6>
                </RFF_6>
              </RFFLoop3>
            </xsl:if>
            <xsl:if test="string($var:LINRFFQUALF)='044'">
              <RFFLoop3>
                <RFF_6>
                  <C506_6>
                    <C50601>
                      <xsl:value-of select="'CT'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:LINRFFBELNR" />
                    </C50602>
                    <C50603>
                      <xsl:value-of select="$var:LINRFFZEILE" />
                    </C50603>
                  </C506_6>
                </RFF_6>
              </RFFLoop3>
            </xsl:if>
          </xsl:for-each>
          <xsl:variable name="var:LOCLOC" select="string(Z1E1EDP1[1]/LOCATION/text())" />
          <ns0:LOCLoop2>
            <ns0:LOC_5>
              <LOC01>
                <xsl:value-of select="'7'" />
              </LOC01>
              <ns0:C517_5>
                <C51701>
                  <xsl:value-of select="$var:LOCLOC" />
                </C51701>
                <C51703>
                  <xsl:value-of select="'92'" />
                </C51703>
              </ns0:C517_5>
            </ns0:LOC_5>
          </ns0:LOCLoop2>
        </ns0:LINLoop1>
      </xsl:for-each>

      <ns0:UNS>
        <UNS01>
          <xsl:value-of select="'S'" />
        </UNS01>
      </ns0:UNS>
     
      <xsl:variable name="var:FooterMOATotTax" select="userCSharp:getTotalTax()" />
      <xsl:for-each select="E1EDS01">
        <xsl:variable name="var:FooterSUMID" select="string(SUMID/text())" />
        <xsl:variable name="var:FooterSUMME" select="string(SUMME/text())" />
        <xsl:if test="string($var:FooterSUMID)='002'">
          <ns0:MOA_11>
            <ns0:C516_11>
              <C51601>
                <xsl:value-of select="'77'" />
              </C51601>
              <C51602>
                <xsl:value-of select="$var:FooterSUMME" />
              </C51602>
              <C51603>
                <xsl:value-of select="'AUD'" />
              </C51603>
            </ns0:C516_11>
          </ns0:MOA_11>
        
        <xsl:if test="string($var:FooterSUMME)!=''">
      <ns0:MOA_11>
        <ns0:C516_11>
          <C51601>
            <xsl:value-of select="'79'" />
          </C51601>
          <C51602>
            <xsl:variable name="var:FooterMOATotal" select="userCSharp:TotalMOAValue($var:FooterSUMME, $var:FooterMOATotTax)" />
            <xsl:value-of select="$var:FooterMOATotal" />
          </C51602>
          <C51603>
            <xsl:value-of select="'AUD'" />
          </C51603>
        </ns0:C516_11>
      </ns0:MOA_11>
        </xsl:if>
      <ns0:MOA_11>
        <ns0:C516_11>
          <C51601>
            <xsl:value-of select="'369'" />
          </C51601>
          <C51602>
            <xsl:value-of select="$var:FooterMOATotTax" />
          </C51602>
          <C51603>
            <xsl:value-of select="'AUD'" />
          </C51603>
        </ns0:C516_11>
      </ns0:MOA_11>
        </xsl:if>
        </xsl:for-each>

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


         
    </ns0:EFACT_D01B_ORDRSP>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
		
		public string StringConcat(string param0, string param1)
        {
          return param0 + param1;
        }
		public System.Collections.ArrayList TotalTax = new System.Collections.ArrayList();
        public string ShipToCode;
        public string SoldToCode;
        public string LionsSiteCode;  
        
        public string getTotalTax()
        {
            double sumData = 0.0;
            foreach (double i in TotalTax)
            {
                sumData = sumData + i;
            }
            return sumData.ToString();
        }

        public string SetTotalTax(string Inputval)
        {
            if (Inputval != null && Inputval != string.Empty)
            {
                TotalTax.Add(Convert.ToDouble(Inputval));
            }
            return string.Empty;
        }
              
        public void SetLionsSiteCode(string strLionsSiteCode)
        {
            LionsSiteCode = strLionsSiteCode;
        }
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
        public string getLionsSiteCode()
        {
            return LionsSiteCode;
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
        
        public string CheckLineOrderStatus(string inputStatus)
        {
            string retStatus = string.Empty;
            if (inputStatus.ToUpper() == "FULL")
            {
                retStatus = "5";
            }
            else if (inputStatus.ToUpper() == "REJ")
            {
                retStatus = "7";
            }
            else if (inputStatus.ToUpper() == "CHG")
            {
                retStatus = "3";
            }
            else
            {
                retStatus = "5";
            }
            return retStatus;
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
        
        public string TotalMOAValue(string strMOA1, string strMOA2)
        {
            double dblMOA;
            if (strMOA1 == string.Empty && strMOA2 != string.Empty)
            {
                dblMOA = Convert.ToDouble(strMOA2);
            }
            else if (strMOA1 != string.Empty && strMOA2 == string.Empty)
            {
                dblMOA = Convert.ToDouble(strMOA1);
            }
            else if (strMOA1 != string.Empty && strMOA2 != string.Empty)
            {
                dblMOA = Convert.ToDouble(strMOA1) + Convert.ToDouble(strMOA2); ;
            }
            else
            {
                dblMOA = 0.0;
            }
            return dblMOA.ToString();
        }


]]></msxsl:script>
</xsl:stylesheet>