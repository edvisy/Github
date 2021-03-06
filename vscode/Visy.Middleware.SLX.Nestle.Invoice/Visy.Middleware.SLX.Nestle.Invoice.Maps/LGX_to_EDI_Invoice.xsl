<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
				xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
				exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0"
				version="1.0" xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE" 
				xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
				xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
				xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;0001&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;INVOIC&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;D&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;01B&quot;)" />
    <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;UN&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;EAN011&quot;)" />
    <xsl:variable name="var:v7" select="userCSharp:StringConcat(&quot;380&quot;)" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;171&quot;)" />
    <xsl:variable name="var:v9" select="userCSharp:StringConcat(&quot;102&quot;)" />
    <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;42&quot;)" />
    <xsl:variable name="var:v12" select="./Detail[1]/DeliveryID/text()" />
    <xsl:variable name="var:v13" select="./Detail[1]/DeliveryDate/text()" />
    <xsl:variable name="var:v26" select="userCSharp:StringLeft(string(Header/CompanyName/text()) , &quot;35&quot;)" />
    <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;0605100004745&quot;)" />
    <xsl:variable name="var:v28" select="userCSharp:StringLeft(string(Header/SupplierStreet1/text()) , &quot;35&quot;)" />
    <xsl:variable name="var:v29" select="userCSharp:StringLeft(string(Header/SupplierAddressee/text()) , &quot;35&quot;)" />
    <xsl:variable name="var:v32" select="string(Header/CompanyName/text())" />
    <xsl:variable name="var:v33" select="userCSharp:StringLeft($var:v32 , &quot;35&quot;)" />
    <xsl:variable name="var:v34" select="string(Header/SupplierStreet1/text())" />
    <xsl:variable name="var:v35" select="userCSharp:StringLeft($var:v34 , &quot;35&quot;)" />
    <xsl:variable name="var:v36" select="string(Header/SupplierAddressee/text())" />
    <xsl:variable name="var:v37" select="userCSharp:StringLeft($var:v36 , &quot;35&quot;)" />
    <xsl:variable name="var:v38" select="string(Header/SAPCustomerCode/text())" />
    <xsl:variable name="var:v89" select="userCSharp:StringConcat(&quot;2&quot;)" />
    <xsl:variable name="var:v90" select="userCSharp:StringConcat(&quot;AUD&quot;)" />
    <xsl:variable name="var:v91" select="userCSharp:StringConcat(&quot;4&quot;)" />
    <xsl:variable name="var:v92" select="userCSharp:StringConcat(&quot;1&quot;)" />
    <xsl:variable name="var:v93" select="userCSharp:StringConcat(&quot;5&quot;)" />
    <xsl:variable name="var:v94" select="userCSharp:StringConcat(&quot;3&quot;)" />
    <xsl:variable name="var:v95" select="userCSharp:StringConcat(&quot;M&quot;)" />
    <xsl:variable name="var:v132" select="userCSharp:StringConcat(&quot;S&quot;)" />
    <xsl:variable name="var:v133" select="count(/s0:INVOICE/Detail)" />
    <xsl:variable name="var:v134" select="'79'" />
    <xsl:variable name="var:v135" select="userCSharp:MathRound(string($var:v134) , &quot;2&quot;)" />
    <xsl:variable name="var:v137" select="Header/InvoiceAmount" />
    <xsl:variable name="var:v138" select="userCSharp:MathRound(string($var:v137) , &quot;2&quot;)" />
    <xsl:variable name="var:v139" select="'128'" />
    <xsl:variable name="var:v140" select="userCSharp:MathRound(string($var:v139) , &quot;2&quot;)" />
    <xsl:variable name="var:v142" select="Header/InvoiceTotal" />
    <xsl:variable name="var:v143" select="userCSharp:MathRound(string($var:v142) , &quot;2&quot;)" />
    <xsl:variable name="var:v144" select="'176'" />
    <xsl:variable name="var:v145" select="userCSharp:MathRound(string($var:v144) , &quot;2&quot;)" />
    <xsl:variable name="var:v147" select="Header/InvoiceGST" />
    <xsl:variable name="var:v148" select="userCSharp:MathRound(string($var:v147) , &quot;2&quot;)" />
    <xsl:variable name="var:vPONumber" select="userCSharp:GetPONumberRFF(string(Detail/PurchaseOrderNumber[1]/text()))" />
    <ns0:EFACT_D01B_INVOIC_EAN011_V2>
      <UNH>
        <UNH1>
          <xsl:value-of select="$var:v1" />
        </UNH1>
        <UNH2>
          <UNH2.1>
            <xsl:value-of select="$var:v2" />
          </UNH2.1>
          <UNH2.2>
            <xsl:value-of select="$var:v3" />
          </UNH2.2>
          <UNH2.3>
            <xsl:value-of select="$var:v4" />
          </UNH2.3>
          <UNH2.4>
            <xsl:value-of select="$var:v5" />
          </UNH2.4>
          <UNH2.5>
            <xsl:value-of select="$var:v6" />
          </UNH2.5>
        </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="$var:v7" />
          </C00201>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="Header/InvoiceNumber/text()" />
          </C10601>
        </ns0:C106>
      </ns0:BGM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="$var:v8" />
          </C50701>
          <C50702>
            <xsl:value-of select="Header/InvoiceDate/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="$var:v9" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>
      <ns0:PAI>
        <ns0:C534>
          <C53403>
            <xsl:value-of select="$var:v10" />
          </C53403>
        </ns0:C534>
      </ns0:PAI>
      <xsl:if test="'ON'">
        <xsl:variable name="var:v14" select="'ON'" />        
        <xsl:variable name="var:v16" select="''" />
        <xsl:variable name="var:v17" select="userCSharp:StringSize(string($var:v16))" />
        <xsl:variable name="var:v18" select="userCSharp:LogicalGt(string($var:v17) , &quot;0&quot;)" />
        <ns0:RFFLoop1>
          <ns0:RFF>
            <ns0:C506>
              <C50601>
                <xsl:value-of select="$var:v14" />
              </C50601>
              
              <C50602>
                 <xsl:value-of select="$var:vPONumber" />
              </C50602>
            </ns0:C506>
          </ns0:RFF>
          <xsl:if test="$var:v18">
            <ns0:DTM_2>
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="$var:v16" />
                </C50701>
                <C50702>
                  <xsl:value-of select="$var:v16" />
                </C50702>
                <C50703>
                  <xsl:value-of select="$var:v16" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
          </xsl:if>
        </ns0:RFFLoop1>
      </xsl:if>
      <xsl:if test="'DQ'">
        <xsl:variable name="var:v19" select="'DQ'" />
        <xsl:variable name="var:v20" select="$var:v12" />
        <xsl:variable name="var:v21" select="'171'" />
        <xsl:variable name="var:v22" select="userCSharp:StringSize(string($var:v21))" />
        <xsl:variable name="var:v23" select="userCSharp:LogicalGt(string($var:v22) , &quot;0&quot;)" />
        <ns0:RFFLoop1>
          <ns0:RFF>
            <ns0:C506>
              <C50601>
                <xsl:value-of select="$var:v19" />
              </C50601>
              <C50602>
                <xsl:value-of select="$var:v20" />
              </C50602>
            </ns0:C506>
          </ns0:RFF>
          <xsl:if test="$var:v23">
            <xsl:variable name="var:v24" select="$var:v13" />
            <xsl:variable name="var:v25" select="'102'" />
            <ns0:DTM_2>
              <ns0:C507_2>
                <C50701>
                  <xsl:value-of select="$var:v21" />
                </C50701>
                <C50702>
                  <xsl:value-of select="$var:v24" />
                </C50702>
                <C50703>
                  <xsl:value-of select="$var:v25" />
                </C50703>
              </ns0:C507_2>
            </ns0:DTM_2>
          </xsl:if>
        </ns0:RFFLoop1>
      </xsl:if>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>BY</NAD01>
          <ns0:C082>            
            <C08201>
              <xsl:value-of select="$var:v27" />
            </C08201>
            <C08203>9</C08203>
          </ns0:C082>
          <xsl:variable name="var:v44" select="Header/CompanyCode" />
          <xsl:variable name="var:v45" select="userCSharp:StringSize(string($var:v44))" />
          <xsl:variable name="var:v46" select="userCSharp:LogicalGt(string($var:v45) , &quot;0&quot;)" />
          <xsl:if test="$var:v46">
            <ns0:C058>              
              <xsl:variable name="var:v48" select="Header/CompanyCode" />
              <C05801>
                <xsl:value-of select="$var:v48" />
              </C05801>
              <C05802>
                <xsl:value-of select="$var:v33" />
              </C05802>
            </ns0:C058>
          </xsl:if>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>VA</C50601>
              <C50602>77000011316</C50602>
            </ns0:C506_2>
          </ns0:RFF_2>          
        </ns0:RFFLoop2>
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>SU</NAD01>
          <ns0:C082>            
            <C08201>VISYBOARD</C08201>
            <C08203>ZZZ</C08203>
          </ns0:C082>          
          <xsl:variable name="var:v71" select="userCSharp:StringSize(string($var:v37))" />
          <xsl:variable name="var:v72" select="userCSharp:LogicalGt(string($var:v71) , &quot;0&quot;)" />
          <xsl:if test="$var:v72">
            <ns0:C058>
              <C05801>
                <xsl:value-of select="$var:v37" />
              </C05801>              
              <C05802>
                <xsl:value-of select="$var:v35" />
              </C05802>
            </ns0:C058>
          </xsl:if>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>VA</C50601>
              <C50602>58005787913</C50602>
            </ns0:C506_2>
          </ns0:RFF_2>          
        </ns0:RFFLoop2>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>ZZZ</C50601>
              <C50602>100280401<!--<xsl:value-of select="ScriptNS0:GetVendorCodeFromLGX($var:v38)" />--></C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>        
      </ns0:NADLoop1>
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
							<xsl:value-of select="userCSharp:StringLeft(string(Header/DeliveryAddressee/text()), &quot;35&quot;)" />
						</C08001>
					</ns0:C080>
					<ns0:C059>
						<C05901>
							<xsl:value-of select="userCSharp:StringLeft(string(Header/DeliveryStreet1/text()), &quot;35&quot;)" />
						</C05901>
					</ns0:C059>
					<NAD06>
						<xsl:value-of select="string(Header/DeliveryCity/text())" />
					</NAD06>
					<ns0:C819>
						<C81901>
							<xsl:value-of select="string(Header/DeliveryState/text())" />
						</C81901>
					</ns0:C819>
					<NAD08>
						<xsl:value-of select="string(Header/DeliveryPostCode/text())" />
					</NAD08>
					<NAD09>
						<xsl:value-of select="'AU'" />
					</NAD09>
				</ns0:NAD>			
			</ns0:NADLoop1>
      <ns0:CUXLoop1>
        <ns0:CUX>
          <ns0:C504>
            <C50401>
              <xsl:value-of select="$var:v89" />
            </C50401>
            <C50402>
              <xsl:value-of select="$var:v90" />
            </C50402>
            <C50403>
              <xsl:value-of select="$var:v91" />
            </C50403>
          </ns0:C504>
        </ns0:CUX>
      </ns0:CUXLoop1>
      <ns0:PATLoop1>
        <ns0:PAT>
          <PAT01>
            <xsl:value-of select="$var:v92" />
          </PAT01>
          <ns0:C112>
            <C11201>
              <xsl:value-of select="$var:v93" />
            </C11201>
            <C11202>
              <xsl:value-of select="$var:v94" />
            </C11202>
            <C11203>
              <xsl:value-of select="$var:v95" />
            </C11203>
            <C11204>
              <xsl:value-of select="$var:v92" />
            </C11204>
          </ns0:C112>
        </ns0:PAT>
      </ns0:PATLoop1>
      <xsl:for-each select="Detail">
        <xsl:variable name="var:v96" select="userCSharp:StringSize(string(ProductCode/text()))" />
        <xsl:variable name="var:v97" select="userCSharp:LogicalGt(string($var:v96) , &quot;0&quot;)" />
        <xsl:variable name="var:v99" select="userCSharp:LogicalNot(string($var:v97))" />
        <xsl:variable name="var:v101" select="string(ProductCode/text())" />
        <xsl:variable name="var:v102" select="userCSharp:StringSize($var:v101)" />
        <xsl:variable name="var:v103" select="userCSharp:LogicalGt(string($var:v102) , &quot;0&quot;)" />
        <xsl:variable name="var:v105" select="userCSharp:LogicalNot(string($var:v103))" />
        <xsl:variable name="var:v107" select="userCSharp:StringConcat(&quot;F&quot;)" />
        <xsl:variable name="var:v109" select="userCSharp:LogicalEq(string($var:v102) , &quot;0&quot;)" />
        <xsl:variable name="var:v111" select="userCSharp:LogicalEq(string(../Header/CompanyCode/text()) , &quot;C2745&quot;)" />
        <xsl:variable name="var:v112" select="userCSharp:LogicalNot(string($var:v111))" />
        <xsl:variable name="var:v115" select="'203'" />
        <xsl:variable name="var:v116" select="userCSharp:MathRound(string($var:v115) , &quot;2&quot;)" />
        <xsl:variable name="var:v118" select="InvoiceLineTotal" />
        <xsl:variable name="var:v119" select="userCSharp:MathRound(string($var:v118) , &quot;2&quot;)" />
        <xsl:variable name="var:v120" select="'369'" />
        <xsl:variable name="var:v121" select="userCSharp:MathRound(string($var:v120) , &quot;2&quot;)" />
        <xsl:variable name="var:v123" select="InvoiceLineGST" />
        <xsl:variable name="var:v124" select="userCSharp:MathRound(string($var:v123) , &quot;2&quot;)" />
        <xsl:variable name="var:v125" select="userCSharp:StringConcat(&quot;AAA&quot;)" />
        <xsl:variable name="var:v126" select="userCSharp:MathRound(string(UnitPrice/text()) , &quot;6&quot;)" />
        <xsl:variable name="var:v127" select="userCSharp:StringConcat(&quot;PE&quot;)" />
        <xsl:variable name="var:v128" select="userCSharp:StringConcat(&quot;ON&quot;)" />
        <xsl:variable name="var:v129" select="userCSharp:StringConcat(&quot;7&quot;)" />
        <xsl:variable name="var:v130" select="userCSharp:StringConcat(&quot;GST&quot;)" />
        <xsl:variable name="var:v131" select="userCSharp:StringConcat(&quot;10&quot;)" />
        <ns0:LINLoop1>
          <ns0:LIN>
            <LIN01>
              <xsl:value-of select="InvoiceLineNumber/text()" />
            </LIN01>
            <ns0:C212>
              <xsl:if test="string($var:v97)='true'">
                <xsl:variable name="var:v98" select="ProductCode/text()" />
                <C21201>
                  <xsl:value-of select="$var:v98" />
                </C21201>
              </xsl:if>
              <xsl:if test="string($var:v99)='true'">
                <xsl:variable name="var:v100" select="SundryItemCode/text()" />
                <C21201>
                  <xsl:value-of select="$var:v100" />
                </C21201>
              </xsl:if>
              <xsl:if test="string($var:v103)='true'">
                <xsl:variable name="var:v104" select="&quot;BP&quot;" />
                <C21202>
                  <xsl:value-of select="$var:v104" />
                </C21202>
              </xsl:if>
              <xsl:if test="string($var:v105)='true'">
                <xsl:variable name="var:v106" select="&quot;VN&quot;" />
                <C21202>
                  <xsl:value-of select="$var:v106" />
                </C21202>
              </xsl:if>
            </ns0:C212>
          </ns0:LIN>
          <ns0:IMD>
            <IMD01>
              <xsl:value-of select="$var:v107" />
            </IMD01>
            <ns0:C273>
              <C27305>
                <xsl:value-of select="ItemDescription/text()" />
              </C27305>
            </ns0:C273>
          </ns0:IMD>
          <ns0:QTY_2>
            <ns0:C186_2>
              <xsl:if test="string($var:v103)='true'">
                <xsl:variable name="var:v108" select="&quot;47&quot;" />
                <C18601>
                  <xsl:value-of select="$var:v108" />
                </C18601>
              </xsl:if>
              <xsl:if test="string($var:v109)='true'">
                <xsl:variable name="var:v110" select="&quot;2&quot;" />
                <C18601>
                  <xsl:value-of select="$var:v110" />
                </C18601>
              </xsl:if>
              <C18602>
                <xsl:value-of select="Quantity/text()" />
              </C18602>
              <xsl:if test="string($var:v112)='true'">
                <xsl:variable name="var:v113" select="UnitOfMeasurement/text()" />
                <C18603>
                  <xsl:value-of select="$var:v113" />
                </C18603>
              </xsl:if>
              <xsl:if test="string($var:v111)='true'">
                <xsl:variable name="var:v114" select="userCSharp:StringConcat(&quot;Piece&quot;)" />
                <C18603>
                  <xsl:value-of select="$var:v114" />
                </C18603>
              </xsl:if>
            </ns0:C186_2>
          </ns0:QTY_2>
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>
                <xsl:variable name="var:v117" select="userCSharp:Nestle_padd1(string($var:v116))" />
                <C51601>
                  <xsl:value-of select="$var:v117" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:v119" />
                </C51602>
              </ns0:C516_5>
            </ns0:MOA_5>
          </ns0:MOALoop2>
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>
                <xsl:variable name="var:v122" select="userCSharp:Nestle_padd1(string($var:v121))" />
                <C51601>
                  <xsl:value-of select="$var:v122" />
                </C51601>
                <C51602>
                  <xsl:value-of select="$var:v124" />
                </C51602>
              </ns0:C516_5>
            </ns0:MOA_5>
          </ns0:MOALoop2>
          <ns0:PRILoop1>
            <ns0:PRI>
              <ns0:C509>
                <C50901>
                  <xsl:value-of select="$var:v125" />
                </C50901>
                <C50902>
                  <xsl:value-of select="$var:v126" />
                </C50902>
                <C50903>
                  <xsl:value-of select="$var:v127" />
                </C50903>
              </ns0:C509>
            </ns0:PRI>
          </ns0:PRILoop1>
          <ns0:RFFLoop3>
            <ns0:RFF_3>
              <ns0:C506_3>
                <C50601>
                  <xsl:value-of select="$var:v128" />
                </C50601>
                 <xsl:variable name="var:vPONumberLT" select="userCSharp:GetPONumberLT(string(PurchaseOrderNumber/text()))" />
                <C50602>                 
                 <xsl:value-of select="$var:vPONumberLT" />
                </C50602>
                <C50603>
                  <xsl:value-of select="PurchaseOrderLineNumber/text()" />
                </C50603>
              </ns0:C506_3>
            </ns0:RFF_3>
          </ns0:RFFLoop3>
          <ns0:TAXLoop3>
            <ns0:TAX_3>
              <TAX01>
                <xsl:value-of select="$var:v129" />
              </TAX01>
              <ns0:C241_3>
                <C24101>
                  <xsl:value-of select="$var:v130" />
                </C24101>
              </ns0:C241_3>
              <ns0:C243_3>
                <C24304>
                  <xsl:value-of select="$var:v131" />
                </C24304>
              </ns0:C243_3>
            </ns0:TAX_3>
          </ns0:TAXLoop3>
        </ns0:LINLoop1>
      </xsl:for-each>
      <ns0:UNS>
        <UNS01>
          <xsl:value-of select="$var:v132" />
        </UNS01>
      </ns0:UNS>
      <ns0:CNT>
        <ns0:C270>
          <C27001>
            <xsl:value-of select="$var:v91" />
          </C27001>
          <C27002>
            <xsl:value-of select="$var:v133" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <xsl:variable name="var:v136" select="userCSharp:Nestle_padd3(string($var:v135))" />
            <C51601>
              <xsl:value-of select="$var:v136" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:v138" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <xsl:variable name="var:v141" select="userCSharp:Nestle_padd3(string($var:v140))" />
            <C51601>
              <xsl:value-of select="$var:v141" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:v143" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <xsl:variable name="var:v146" select="userCSharp:Nestle_padd3(string($var:v145))" />
            <C51601>
              <xsl:value-of select="$var:v146" />
            </C51601>
            <C51602>
              <xsl:value-of select="$var:v148" />
            </C51602>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
    </ns0:EFACT_D01B_INVOIC_EAN011_V2>
  </xsl:template>
  
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
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


public string StringLeft(string str, string count)
{
	string retval = "";
	double d = 0;
	if (str != null && IsNumeric(count, ref d))
	{
		int i = (int) d;
		if (i > 0)
		{ 
			if (i <= str.Length)
			{
				retval = str.Substring(0, i);
			}
			else
			{
				retval = str;
			}
		}
	}
	return retval;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string MathRound(string val)
{
	return MathRound(val, "0");
}

public string MathRound(string val, string decimals)
{
	string retval = "";
	double v = 0;
	double db = 0;
	if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	{
		try
		{
			int d = (int) db;
			double ret = Math.Round(v, d);
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}


public string Nestle_padd1(string strParam)
        {
            if (strParam.IndexOf(".") == -1)
                return strParam;
            else
            {
                string temp = strParam.Substring(strParam.IndexOf(".")+1);
                if (temp.Length == 1)
                {
                    return strParam + "0";
                }
                return strParam;
            }
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


public string Nestle_padd3(string param2)
        {
            if (param2.IndexOf(".") == -1)
                return param2;
            else
            {
                string temp = param2.Substring(param2.IndexOf(".")+1);
                if (temp.Length == 1)
                {
                    return param2 + "0";
                }
                return param2;
            }
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

public string GetPONumberRFF(string poNumber)
{
	 string outPO = poNumber;
            if (poNumber.Contains("/")) {
                outPO = poNumber.Split('/')[1];
            }

            if (poNumber.Contains("-"))
            {
                outPO = poNumber.Split('-')[1].Length > poNumber.Split('-')[0].Length ? poNumber.Split('-')[1] : poNumber.Split('-')[0];
            }

            return outPO;
}
public string GetPONumberLT(string poNumber)
{
	 string outPO = poNumber;
            if (poNumber.Contains("/")) {
                outPO = poNumber.Split('/')[1];
            }

            if (poNumber.Contains("-"))
            {
                outPO = poNumber.Split('-')[1].Length > poNumber.Split('-')[0].Length ? poNumber.Split('-')[1] : poNumber.Split('-')[0];
            }

            return outPO;
}
]]></msxsl:script>
</xsl:stylesheet>