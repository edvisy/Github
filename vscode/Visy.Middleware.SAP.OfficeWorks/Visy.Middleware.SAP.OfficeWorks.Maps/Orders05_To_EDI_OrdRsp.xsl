<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0"
                version="1.0"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:s0="http://Z3ORDERS05.V4"
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
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
		<ns0:EFACT_D96A_ORDRSP>
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
						<xsl:value-of select="'96A'" />
					</UNH2.3>
					<UNH2.4>
						<xsl:value-of select="'UN'" />
					</UNH2.4>
					<UNH2.5>
						<xsl:value-of select="'EAN005'" />
					</UNH2.5>
				</UNH2>
			</UNH>
			<ns0:BGM>
				<ns0:C002>
					<C00201>
						<xsl:value-of select="'231'" />
					</C00201>
				</ns0:C002>
				<BGM02>				
					<xsl:value-of select="$var:SalesOrderNo" />				
				</BGM02>
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

			<ns0:DTM>
				<ns0:C507>					
					<C50701>
						<xsl:value-of select="'137'" />
					</C50701>
					<C50702>
						<xsl:value-of select="E1EDK03[IDDAT/text()='012']/DATUM/text()" />
					</C50702>
					<C50703>
						<xsl:value-of select="'102'" />
					</C50703>
				</ns0:C507>
			</ns0:DTM>


			<ns0:DTM>
				<ns0:C507>						
					<C50701>
						<xsl:value-of select="'2'" />
					</C50701>
					<C50702>
						<xsl:value-of select="E1EDK03[IDDAT/text()='002']/DATUM/text()" />
					</C50702>
					<C50703>
						<xsl:value-of select="'102'" />
					</C50703>
				</ns0:C507>
			</ns0:DTM>



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
			</ns0:RFFLoop1>

			<ns0:NADLoop1>
				<ns0:NAD>
					<NAD01>
						<xsl:value-of select="'ST'" />
					</NAD01>
					<ns0:C082>
						<C08201>
							<xsl:value-of select='"930"' />
						</C08201>
						<C08202>
							<xsl:value-of select="'92'" />
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
							<xsl:value-of select="'9312952000009'" />
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
								<xsl:value-of select="'IA'" />
							</C50601>
							<C50602>
								<xsl:value-of select="'02901071'" />
							</C50602>
						</ns0:C506_2>
					</ns0:RFF_2>
				</ns0:RFFLoop2>
			</ns0:NADLoop1>

			<ns0:PACLoop1>
				<ns0:PAC>
					<ns0:C202>
						<C20201>
							<xsl:value-of select="'CS'" />
						</C20201>
					</ns0:C202>
				</ns0:PAC>
				<ns0:PCILoop1>
					<ns0:PCI>
						<PCI01>16</PCI01>
						<ns0:C210>
							<C21001>
								<xsl:value-of select="'NL'" />
							</C21001>
						</ns0:C210>
					</ns0:PCI>
				</ns0:PCILoop1>
			</ns0:PACLoop1>


			<xsl:variable name="var:vZTERM1" select="substring($var:vZTERM,2)" />

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
						<xsl:for-each select="E1EDP19">
							<xsl:variable name="var:LINQUALF1" select="string(QUALF/text())" />
							<xsl:variable name="var:LINIDTNR" select="string(IDTNR/text())" />
							<xsl:if test="string($var:LINQUALF1)='001'">
								<ns0:C212>
									<C21201>
										<xsl:value-of select="userCSharp:PaddingLeft($var:LINIDTNR)" />
									</C21201>
									<C21202>
										<xsl:value-of select="'EN'" />
									</C21202>
								</ns0:C212>
							</xsl:if>
						</xsl:for-each>
					</ns0:LIN>         

					<xsl:variable name="var:Z1QTYMENGE" select="string(Z1E1EDP1[1]/MENGE/text())" />  
					<ns0:QTY_3>
						<ns0:C186_3>
							<C18601>
								<xsl:value-of select="'21'" />
							</C18601>
							<C18602>
								<xsl:value-of select="$var:Z1QTYMENGE" />
							</C18602>            
						</ns0:C186_3>
					</ns0:QTY_3>        


					<ns0:PRILoop1>
						<ns0:PRI>
							<ns0:C509>
								<C50901>
									<xsl:value-of select="'NTP'" />
								</C50901>
								<C50902>
									<xsl:value-of select="string(E1EDP01/VPREI/text())" />
								</C50902>               
							</ns0:C509>
						</ns0:PRI>           
					</ns0:PRILoop1>

					<!--Packaging Details temporary-->
					<ns0:PACLoop2>
						<ns0:PAC_2>
							<PAC01>
								<xsl:value-of select="'2'" />
							</PAC01> 
							<ns0:C531_2>
								<C53101>
									<xsl:value-of select="'3'" />
								</C53101>
							</ns0:C531_2>
						</ns0:PAC_2>          
					</ns0:PACLoop2>
					<!--Location Details temporary-->
					<ns0:LOCLoop2>
						<ns0:LOC_5>
							<LOC01>
								<xsl:value-of select="'7'" />
							</LOC01> 
							<ns0:C517_5>
								<C51701>
									<xsl:value-of select="'306'" />
								</C51701>
								<C51703>
									<xsl:value-of select="'92'" />
								</C51703>
							</ns0:C517_5>
						</ns0:LOC_5>          
					</ns0:LOCLoop2>
					<!--To be filled up-->
					<ns0:TAXLoop3>
						<ns0:TAX_3>
							<TAX01>
								<xsl:value-of select="'7'" />
							</TAX01>  
							<ns0:C243_3>
								<C24304>10</C24304>
								<!--temp-->              
							</ns0:C243_3>
						</ns0:TAX_3>
					</ns0:TAXLoop3>
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
		</ns0:EFACT_D96A_ORDRSP>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
		
		public string StringConcat(string param0, string param1)
        {
          return param0 + param1;
        }
		    public System.Collections.ArrayList TotalTax = new System.Collections.ArrayList();
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


]]>
	</msxsl:script>
</xsl:stylesheet>