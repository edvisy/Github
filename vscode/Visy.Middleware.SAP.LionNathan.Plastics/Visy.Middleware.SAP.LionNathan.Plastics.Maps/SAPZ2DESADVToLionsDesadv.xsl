<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://Z2DESADV.V3" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Z2DESADV" />
  </xsl:template>
  <xsl:template match="/s0:Z2DESADV">
    <xsl:variable name="var:BGMDeliveryNo" select="string(E2EDK07001GRP/E1EDK07/VBELN/text())" />
    <xsl:variable name="var:vCustomerID" select="string(EDI_DC40/RCVPRN/text())" />
    <xsl:variable name="var:vBizTalkID" select="string(EDI_DC40/ARCKEY/text())" />
    <xsl:variable name="var:vTransportName" select="string(E2EDK07001GRP/E1EDK07/TRAID/text())" />
    <xsl:variable name="var:vPlant" select="string(E2EDK07001GRP/E1EDK07/VSTEL/text())" />
    <xsl:variable name="var:vPlantDesc" select="string(E2EDK07001GRP/E1EDK07/VSTEL_BEZ/text())" />
    <xsl:variable name="var:vPurchaseOrder" select="string(E2EDK08001GRP[1]/E2EDP07GRP[1]/E1EDP07/BSTNK/text())" />
    <xsl:variable name="var:vLineItemCount" select="count(E2EDK08001GRP[1]/E2EDP07GRP)" />
    <ns0:EFACT_D01B_DESADV>
      <ns0:UNH>
        <UNH1>
          <xsl:value-of select="'1'" />
        </UNH1>
        <ns0:UNH2>
          <UNH2.1>
            <xsl:value-of select="'DESADV'" />
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
        </ns0:UNH2>
      </ns0:UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'351'" />
          </C00201>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="$var:BGMDeliveryNo" />
          </C10601>          
        </ns0:C106>
        <BGM03>
            <xsl:value-of select="'9'" />
         </BGM03>
      </ns0:BGM>
      <xsl:for-each select="E2EDK08001GRP">
        <xsl:for-each select="E1EDK06">
          <xsl:variable name="var:vDTMIDDAT" select="string(IDDAT/text())" />
          <xsl:variable name="var:vDTMDATUM" select="string(DATUM/text())" />
          <xsl:if test="string($var:vDTMIDDAT)='001'">
            <ns0:DTM>
              <ns0:C507>
                <C50701>
                  <xsl:value-of select="'137'" />
                </C50701>
                <C50702>
                  <xsl:variable name="var:vsetDeliveryDate" select="userCSharp:AddListData('vsetDeliveryDate', string($var:vDTMDATUM))" />
                  <xsl:value-of select="$var:vDTMDATUM" />
                </C50702>
                <C50703>
                  <xsl:value-of select="'203'" />
                </C50703>
              </ns0:C507>
            </ns0:DTM>
          </xsl:if>
          <xsl:if test="string($var:vDTMIDDAT)='035'">
            <ns0:DTM>
              <ns0:C507>
                <C50701>
                  <xsl:value-of select="'11'" />
                </C50701>
                <C50702>
                  <xsl:variable name="var:vsetPODate" select="userCSharp:AddListData('vsetPODate', string($var:vDTMDATUM))" />
                  <xsl:value-of select="$var:vDTMDATUM" />
                </C50702>
                <C50703>
                  <xsl:value-of select="'203'" />
                </C50703>
              </ns0:C507>
            </ns0:DTM>
          </xsl:if>
          <!--<xsl:if test="string($var:vDTMIDDAT)='035'">
          <ns0:DTM>
            <ns0:C507>
              <C50701>
                <xsl:value-of select="'351'" />
              </C50701>
              <C50702>
                <xsl:value-of select="$var:vDTMDATUM" />
              </C50702>
              <C50703>
                <xsl:value-of select="'203'" />
              </C50703>
            </ns0:C507>
          </ns0:DTM>
        </xsl:if>-->
        </xsl:for-each>
      </xsl:for-each>

      <ns0:RFFLoop1>
        <ns0:RFF>
          <ns0:C506>
            <C50601>
              <xsl:value-of select="'ON'" />
            </C50601>
            <C50602>
              <xsl:value-of select="$var:vPurchaseOrder" />
            </C50602>
          </ns0:C506>
        </ns0:RFF>
        <ns0:DTM_2>
          <ns0:C507_2>
            <C50701>
              <xsl:value-of select="'171'" />
            </C50701>
            <C50702>
              <xsl:value-of select="userCSharp:getListData('vsetPODate')" />
            </C50702>
            <C50703>
              <xsl:value-of select="'203'" />
            </C50703>
          </ns0:C507_2>
        </ns0:DTM_2>
      </ns0:RFFLoop1>

      <ns0:RFFLoop1>
        <ns0:RFF>
          <ns0:C506>
            <C50601>
              <xsl:value-of select="'AAU'" />
            </C50601>
            <C50602>
              <xsl:value-of select="$var:BGMDeliveryNo" />
            </C50602>
          </ns0:C506>
        </ns0:RFF>
        <!--<ns0:DTM_2>
          <ns0:C507_2>
            <C50701>
              <xsl:value-of select="'171'" />
            </C50701>
            <C50702>
              <xsl:value-of select="userCSharp:getListData('vsetDeliveryDate')" />              
            </C50702>
            <C50703>
              <xsl:value-of select="'203'" />
            </C50703>
          </ns0:C507_2>
        </ns0:DTM_2>-->
      </ns0:RFFLoop1>
      <xsl:for-each select="E2EDK08001GRP">
        <xsl:for-each select="E1EDKA2">
          <xsl:variable name="var:NADIdentifier" select="string(PARVW/text())" />
          <xsl:if test="string($var:NADIdentifier)='AG'">
            <xsl:variable name="var:vsetSoldToCode" select="userCSharp:AddListData('vsetSoldToCode', string(PARTN/text()))" />
          </xsl:if>
          <xsl:if test="string($var:NADIdentifier)='WE'">
            <xsl:variable name="var:vsetShiptoCode" select="userCSharp:AddListData('vsetShiptoCode', string(PARTN/text()))" />
          </xsl:if>

        </xsl:for-each>
      </xsl:for-each>


      <xsl:variable name="var:vgetDesaSoldToCode" select="userCSharp:getListData('vsetSoldToCode')" />
      <xsl:variable name="var:vgetDesaShiptoCode" select="userCSharp:getListData('vsetShiptoCode')" />
      <xsl:if test="string($var:vgetDesaShiptoCode)!='' and string($var:vgetDesaSoldToCode)!=''">
      <xsl:variable name="var:SupplierDetailsValues" select="ScriptNS0:GetLionathanSupplierDetailsWithPipes($var:vgetDesaSoldToCode, $var:vgetDesaShiptoCode, $var:vPlant)" />
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'BY'" />
          </NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="$var:vgetDesaSoldToCode" />
            </C08201>
            <C08202>
              <xsl:value-of select="'9'" />
            </C08202>
          </ns0:C082>
        </ns0:NAD>
      </ns0:NADLoop1>

      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'ST'" />
          </NAD01>
          <ns0:C082>
            <C08201>
            <!--<xsl:value-of select="$var:vgetSoldToCode" />-->
            <xsl:value-of select="ScriptNS0:GetValueFromDelimeteredList($var:SupplierDetailsValues, '|', '12')" />
            </C08201>
            <C08202>
              <xsl:value-of select="'9'" />
            </C08202>
          </ns0:C082>
        </ns0:NAD>
      </ns0:NADLoop1>

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
        </ns0:NAD>
      </ns0:NADLoop1>
	  </xsl:if>
      <xsl:for-each select="E2EDK08001GRP">
        <xsl:for-each select="E2EDP07GRP">
          <xsl:variable name="var:vCPSRecCount" select="position()" />
          <xsl:variable name="var:vZEILE" select="number(E1EDP07/POSEX/text())" />
          <xsl:variable name="var:vBTGEW" select="string(E2EDP09001GRP/E1EDP09/BTGEW/text())" />          
          <xsl:variable name="var:vVendorMaterial" select="string(E2EDP09001GRP[1]/E1EDP09/MATNR/text())" />
          <xsl:variable name="var:vCustomermaterial" select="string(E2EDP09001GRP[1]/E1EDP09/KDMAT/text())" />
          <xsl:variable name="var:vMaterialDesc" select="string(E2EDP09001GRP[1]/E1EDP09/ARKTX/text())" />
          <xsl:variable name="var:vQTYValue" select="string(E2EDP09001GRP[2]/E1EDP09/LFIMG/text())" />
          <xsl:variable name="var:vUOMValue" select="string(E2EDP09001GRP[2]/E1EDP09/VRKME/text())" />
          <ns0:CPSLoop1>
            <ns0:CPS>
              <CPS01>
                <xsl:value-of select="$var:vCPSRecCount" />
              </CPS01>
              <CPS03>
                <xsl:value-of select="'1E'" />
              </CPS03>
            </ns0:CPS>
            <ns0:PACLoop1>
              <ns0:PAC>
                <PAC01>
                  <xsl:value-of select="'1'" />
                </PAC01>
                <ns0:C202>
                  <C20201>
                    <xsl:value-of select="'201'" />
                  </C20201>
                  <C20203>
                    <xsl:value-of select="'9'" />
                  </C20203>
                </ns0:C202>
              </ns0:PAC>
              <ns0:MEA_3>
				<MEA01>
					<xsl:value-of select="'PD'" />
				</MEA01>
				<ns0:C502_3>
					<C50201>
						<xsl:value-of select="'AAA'" />					
					</C50201>
					<!--<C50202>
						<xsl:value-of select="'KGM'" />					
					</C50202>-->
				</ns0:C502_3>
				<ns0:C174_3>
				  <C17401>
					<xsl:value-of select="'KGM'" />	
				   </C17401>
   				  <C17402>
					<xsl:value-of select="userCSharp:getKGWeight($var:vBTGEW)" />
     			  </C17402>
				</ns0:C174_3>
				<!--<MEA04>
	                <xsl:value-of select="userCSharp:getKGWeight($var:vBTGEW)" />							
				</MEA04>-->
              </ns0:MEA_3>
              <ns0:PCILoop1>
                <ns0:PCI>
                  <PCI01>
                    <xsl:value-of select="'33E'" />
                  </PCI01>
                </ns0:PCI>
               <xsl:if test="string(E2EDP09001GRP/Z1EDP09_2/SSCC_NUM)!=''">
               <!--<xsl:if test="E2EDP09001GRP/Z1EDP09_2/SSCC_NUM">-->
                <ns0:GINLoop1>
                  <ns0:GIN>
                    <GIN01>
                    </GIN01>
                    <ns0:C208_2>
                        <C20801>
                          <xsl:value-of select="string(E2EDP09001GRP/Z1EDP09_2/SSCC_NUM/text())" />
                        </C20801>
                    </ns0:C208_2>
                  </ns0:GIN>
                </ns0:GINLoop1>
               </xsl:if>
              </ns0:PCILoop1>
            </ns0:PACLoop1>
            <ns0:LINLoop1>
              <ns0:LIN>
                <LIN01>
                  <xsl:value-of select="$var:vZEILE" />
                </LIN01>
                <ns0:C212>
                  <C21201>
                    <xsl:value-of select="$var:vCustomermaterial" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SRV'" />
                  </C21202>
                </ns0:C212>
              </ns0:LIN>
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="'1'" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:vCustomermaterial" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'IN'" />
                  </C21202>
                  <C21204>
                    <xsl:value-of select="'92'" />
                  </C21204>
                </ns0:C212_2>
              </ns0:PIA>
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="'1'" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:vVendorMaterial" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SA'" />
                  </C21202>
                  <C21204>
                    <xsl:value-of select="'91'" />
                  </C21204>
                </ns0:C212_2>
              </ns0:PIA>
              <ns0:IMD>
                <IMD01>
                  <xsl:value-of select="'F'" />
                </IMD01>
                <ns0:C273>
                  <C27301>
                    <xsl:value-of select="'DU'" />
                  </C27301>
                  <C27303>
                    <xsl:value-of select="$var:vMaterialDesc" />
                  </C27303>
                  <C27304>
                    <xsl:value-of select="'91'" />
                  </C27304>
                </ns0:C273>
              </ns0:IMD>
              <ns0:QTY_3>
                <ns0:C186_3>
                  <C18601>
                    <xsl:value-of select="'12'" />
                  </C18601>
                  <C18602>
                    <xsl:value-of select="'EA'" />
                  </C18602>
                  <C18603>
                    <xsl:value-of select="userCSharp:getQTYValue($var:vQTYValue, $var:vUOMValue)" />
                  </C18603>
                </ns0:C186_3>
              </ns0:QTY_3>

              <ns0:RFFLoop3>
                <ns0:RFF_4>
                  <ns0:C506_4>
                    <C50601>
                      <xsl:value-of select="'ON'" />
                    </C50601>
                    <C50602>
                      <xsl:value-of select="$var:vPurchaseOrder" />
                    </C50602>
                    <C50603>
                      <xsl:value-of select="$var:vZEILE" />
                    </C50603>
                  </ns0:C506_4>
                </ns0:RFF_4>
              </ns0:RFFLoop3>
            </ns0:LINLoop1>
          </ns0:CPSLoop1>
        </xsl:for-each>
      </xsl:for-each>
      <ns0:CNT>
        <ns0:C270>
          <C27001>
            <xsl:value-of select="'2'" />
          </C27001>
          <C27002>
            <xsl:value-of select="$var:vLineItemCount" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
    </ns0:EFACT_D01B_DESADV>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[

        public System.Collections.Hashtable Z2DESADVHashTable = new System.Collections.Hashtable();
        
        public string AddListData(string key, string Valuedata)
        {
            Z2DESADVHashTable.Add(key, Valuedata);
            return string.Empty;
        }

        public string getListData(string key)
        {
            if (Z2DESADVHashTable.Contains(key))
            {
                string value = (string)Z2DESADVHashTable[key];
                return value;
            }
            else
            {
                return string.Empty;
            }
       }   
       
      public string getKGWeight(string inputVal)
      {
            decimal d;
            if (decimal.TryParse(inputVal, out d))
            {
                d = d / 1000;
                return d.ToString("0.00");
            }
            else
            {
                return "0";
            }
      }
      
       public string getQTYValue(string QTYValue, string UOMValue)
        {
            string RetValue = string.Empty;
            if (UOMValue.ToUpper() == "TH")
            {
                double dblRet = 0;
                dblRet = Convert.ToDouble(QTYValue) * 1000;
                RetValue = dblRet.ToString();
            }
            else
            {
                RetValue = QTYValue;
            }
            return RetValue;
        }
  
]]>
  </msxsl:script>
</xsl:stylesheet>