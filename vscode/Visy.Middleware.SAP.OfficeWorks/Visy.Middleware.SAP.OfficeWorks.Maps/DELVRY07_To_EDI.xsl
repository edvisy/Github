<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var s1 s0 s2" 
  version="1.0" 
  xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DELVRY07//740/Receive" 
  xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DELVRY07//740" 
  xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
  xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/s1:Receive" />
	</xsl:template>
 
	<xsl:template match="/s1:Receive"> 	
      <xsl:variable name="var:poNumber" select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP/s0:E2EDL41000GRP/s0:E2EDL41000/s0:BSTNR[1]/text())" />
      <xsl:variable name="var:deliveryDate" select="string(s1:idocData/s0:E2EDL20003GRP[s0:E2EDT13001GRP/s0:E2EDT13001/s0:QUALF/text()='001']/s0:E2EDT13001GRP/s0:E2EDT13001/s0:NTANF/text())" />
      <xsl:variable name="var:pgiDate" select="string(s1:idocData/s0:E2EDL20003GRP[s0:E2EDT13001GRP/s0:E2EDT13001/s0:QUALF/text()='006']/s0:E2EDT13001GRP/s0:E2EDT13001/s0:ISDD/text())" />
      <xsl:variable name="var:poDateTime" select="string(concat(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:PODAT/text(), s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:POTIM/text()))" />
      <xsl:variable name="var:itemCount" select="count(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL37005GRP)" />      
			<ns0:EFACT_D96A_DESADV>
				<UNH>
					<UNH1>17614</UNH1>
					<UNH2>
						<UNH2.1>DESADV</UNH2.1>
						<UNH2.2>D</UNH2.2>
						<UNH2.3>96A</UNH2.3>
						<UNH2.4>UN</UNH2.4>
						<UNH2.5>EAN005</UNH2.5>
					</UNH2>
				</UNH>
				<ns0:BGM>
					<ns0:C002>
						<C00201>YA5</C00201>
						<C00203>9</C00203>
					</ns0:C002>
					<xsl:if test="$var:poNumber">
						<BGM02>
							<xsl:value-of select="$var:poNumber" />
						</BGM02>
					</xsl:if>
					<BGM03>9</BGM03>
				</ns0:BGM>
        <xsl:if test="$var:poDateTime">
				<ns0:DTM>        
            <ns0:C507>
						  <C50701>137</C50701>
						  <C50702><xsl:value-of select="$var:poDateTime" /></C50702>
						  <C50703>203</C50703>
					  </ns0:C507>
				</ns0:DTM>
        </xsl:if>	
        <xsl:if test="$var:deliveryDate">
				<ns0:DTM>
					<ns0:C507>
						<C50701>11</C50701>           
						  <C50702>
							  <xsl:value-of select="$var:deliveryDate" />
						  </C50702>					 			
						<C50703>102</C50703>
					</ns0:C507>
				</ns0:DTM>
        </xsl:if>			
				<xsl:if test="$var:pgiDate">
				<ns0:DTM>
					<ns0:C507>
						<C50701>14</C50701>           
						  <C50702>
							  <xsl:value-of select="$var:pgiDate" />
						  </C50702>					 			
						<C50703>102</C50703>
					</ns0:C507>
				</ns0:DTM>
        </xsl:if>			
				<ns0:ALI>
					<ALI03>X7</ALI03>
					<ALI04>164</ALI04>
				</ns0:ALI>
				<ns0:RFFLoop1>
					<ns0:RFF>
						<ns0:C506>
							<C50601>ON</C50601>
              <xsl:if test="$var:poNumber">
						    <C50602>
							    <xsl:value-of select="$var:poNumber" />
						    </C50602>
					    </xsl:if>						
						</ns0:C506>
					</ns0:RFF>
					<ns0:DTM_2>
						<ns0:C507_2>
							<C50701>171</C50701>
							<C50702>20190117</C50702>
							<C50703>102</C50703>
						</ns0:C507_2>
					</ns0:DTM_2>
				</ns0:RFFLoop1>
				<ns0:NADLoop1>
					<ns0:NAD>
						<NAD01>SU</NAD01>
						<ns0:C082>
							<C08201>
                <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP[s0:E2ADRM1001GRP/s0:E2ADRE1000/s0:EXTEND_Q/text()='300']/s0:E2ADRM1001GRP/s0:E2ADRE1000/s0:EXTEND_D/text())" />
              </C08201>
							<C08203>92</C08203>
						</ns0:C082>
					</ns0:NAD>
				</ns0:NADLoop1>
				<ns0:NADLoop1>
					<ns0:NAD>
						<NAD01>ST</NAD01>
						<ns0:C082>
							<C08201>
                <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP[1]/s0:E2EDL20003/s0:PARID/text())" />
              </C08201>
							<C08203>92</C08203>
						</ns0:C082>
					</ns0:NAD>
				</ns0:NADLoop1>       
        <ns0:CPSLoop1>
            <ns0:CPS>
              <CPS01>1</CPS01>
              <CPS03>1E</CPS03>
            </ns0:CPS>
            <ns0:PACLoop1>
              <ns0:PAC>
                <PAC01><xsl:value-of select="$var:itemCount" /></PAC01>
                <ns0:C202>
                  <C20201>CT</C20201>
                </ns0:C202>
              </ns0:PAC>
            </ns0:PACLoop1>
          </ns0:CPSLoop1>
          <ns0:CPSLoop1>
            <ns0:CPS>
              <CPS01>2</CPS01>
              <CPS02>1</CPS02>
              <CPS03>3</CPS03>
            </ns0:CPS>
            <ns0:LINLoop1>
              <ns0:LIN>
                <LIN01>0</LIN01>
              </ns0:LIN>
              <ns0:LOCLoop2>
                <ns0:LOC_4>
                  <LOC01>8</LOC01>
                  <ns0:C517_4>
                    <C51701>601</C51701>
                    <C51703>92</C51703>
                  </ns0:C517_4>
                </ns0:LOC_4>
              </ns0:LOCLoop2>
            </ns0:LINLoop1>
        </ns0:CPSLoop1>
        <xsl:for-each select="s1:idocData/s0:E2EDL20003GRP/s0:E2EDL37005GRP">
          <xsl:call-template name="lineItemsTemplate" />
          <!--<ns0:CPSLoop1>
            <ns0:CPS>
              <CPS01>4</CPS01>
              <CPS02>2</CPS02>
              <CPS03>1</CPS03>
            </ns0:CPS>
            <ns0:PACLoop1>
              <ns0:PAC>
                <PAC01>1</PAC01>
                <ns0:C202>
                  <C20201>CT</C20201>
                </ns0:C202>
              </ns0:PAC>
              <ns0:PCILoop1>
                <ns0:PCI>
                  <PCI01>33E</PCI01>
                </ns0:PCI>
                <ns0:GINLoop1>
                  <ns0:GIN>
                    <GIN01>BJ</GIN01>
                    <ns0:C208>
                      <C20801>00393255570102150329</C20801>
                    </ns0:C208>
                  </ns0:GIN>
                </ns0:GINLoop1>
              </ns0:PCILoop1>
            </ns0:PACLoop1>
            <ns0:LINLoop1>
              <ns0:LIN>
                <LIN01>2</LIN01>
                <ns0:C212>
                  <C21201>9341694150161</C21201>
                  <C21202>EN</C21202>
                </ns0:C212>
              </ns0:LIN>
              <ns0:QTY_2>
                <ns0:C186_2>
                  <C18601>12</C18601>
                  <C18602>12</C18602>
                </ns0:C186_2>
              </ns0:QTY_2>
            </ns0:LINLoop1>
          </ns0:CPSLoop1>-->
        </xsl:for-each>
				<ns0:CNT>
					<ns0:C270>
						<C27001>2</C27001>
						<C27002>54</C27002>
					</ns0:C270>
				</ns0:CNT>
				<ns0:CNT>
					<ns0:C270>
						<C27001>1</C27001>
						<C27002>864</C27002>
					</ns0:C270>
				</ns0:CNT>
				<UNT>
					<UNT1>372</UNT1>
					<UNT2>17614</UNT2>
				</UNT>
			</ns0:EFACT_D96A_DESADV>
	</xsl:template>

  <xsl:template name="lineItemsTemplate">
	  <ns0:CPSLoop1>
		  <ns0:CPS>
			  <CPS01>3</CPS01>
			  <CPS02>2</CPS02>
			  <CPS03>1</CPS03>
		  </ns0:CPS>
		  <ns0:PACLoop1>
			  <ns0:PAC>
				  <PAC01>1</PAC01>
				  <ns0:C202>
					  <C20201>CT</C20201>
				  </ns0:C202>
			  </ns0:PAC>
			  <ns0:PCILoop1>
				  <ns0:PCI>
					  <PCI01>33E</PCI01>
				  </ns0:PCI>
				  <ns0:GINLoop1>
					  <ns0:GIN>
						  <GIN01>BJ</GIN01>
						  <ns0:C208>
							  <C20801>
								  <xsl:value-of select="s0:E2EDL37005/s0:EXIDV/text()" />
							  </C20801>
						  </ns0:C208>
					  </ns0:GIN>
				  </ns0:GINLoop1>
			  </ns0:PCILoop1>
		  </ns0:PACLoop1>
		  <ns0:LINLoop1>
			  <ns0:LIN>
				  <LIN01>1</LIN01>
				  <ns0:C212>
					  <C21201>
						  <xsl:value-of select="s0:E2EDL44004GRP/s0:E2EDL44004/s0:MATNR[1]/text()"/>
					  </C21201>
					  <C21202>EN</C21202>
				  </ns0:C212>
			  </ns0:LIN>
			  <ns0:QTY_2>
				  <ns0:C186_2>
					  <C18601>12</C18601>
					  <C18602>12</C18602>
				  </ns0:C186_2>
			  </ns0:QTY_2>
		  </ns0:LINLoop1>
	  </ns0:CPSLoop1>
  </xsl:template>
</xsl:stylesheet>