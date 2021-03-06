<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
    exclude-result-prefixes="msxsl var s0 s1 s2 ScriptNS0 ScriptNS2 userCSharp ns0 ns1 ns2"
    version="1.0"
    xmlns:ns1="http://tempuri.org/Fulfill_1.2.031"
    xmlns:ns2="uri:xades"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
    xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
    xmlns:ns0="uri:ds"
    xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
    xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DELVRY07//740/Receive"
    xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DELVRY07//740"
    xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="no" method="xml" version="1.0" doctype-system="http://xml.cxml.org/schemas/cXML/1.2.031/Fulfill.dtd" />
  <xsl:key use="s0:E2EDL24007/s0:CHARG" match="/s1:Receive/s1:idocData/s0:E2EDK08001GRP/s0:E2EDP07001GRP/s0:E2EDL24007GRP" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">


    <xsl:variable name="var:vPayLoadId" select="userCSharp:PayLoadId_GenerateGUID()" />
    <xsl:variable name="var:vOrderDate" select="ScriptNS2:FormateDateNew(concat(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:PODAT/text()),string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:POTIM/text())), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMddHHmmss&quot;)" />
    <xsl:variable name="var:vNoticeDate" select="ScriptNS2:FormateDateNew(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDT13001GRP[s0:E2EDT13001/s0:QUALF/text()='001']/s0:E2EDT13001/s0:NTANF/text()), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)" />
    <xsl:variable name="var:vShipmentDate" select="ScriptNS2:FormateDateNew(concat(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:PODAT/text()),string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:POTIM/text())), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMddHHmmss&quot;)" />
    <xsl:variable name="var:vDeliveryId" select="number(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:VBELN/text())" />

    <xsl:variable name="var:vDeliveryDate" select="ScriptNS2:FormateDateNew(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP[1]/s0:E2EDL43000[s0:QUALF='C']/s0:DATUM/text()), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)" />
    <xsl:variable name="var:vCurrency" select="string(s1:idocData/s0:E2EDK07001GRP[1]/s0:E2EDK07001/s0:WAERK/text())" />
    <xsl:variable name="var:vTransportName" select="string(s1:idocData/s0:E2EDK07001GRP/s0:E2EDK07001/s0:TRAID/text())" />
    <xsl:variable name="var:vPlant" select="string(s1:idocData/s0:E2EDK07001GRP/s0:E2EDK07001/s0:VSTEL/text())" />
    <xsl:variable name="var:vPlantDesc" select="string(s1:idocData/s0:E2EDK07001GRP/s0:E2EDK07001/s0:VSTEL_BEZ/text())" />

    <xsl:variable name="var:vLineItemCount" select="count(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP)" />
    <cXML>
      <xsl:attribute name="payloadID">
        <xsl:value-of select="$var:vPayLoadId" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <!--<xsl:value-of select="userCSharp:DateCurrentDateTime()" />-->
        <xsl:value-of select="ScriptNS2:FormateDateNew(userCSharp:DateCurrentDateTime(), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyy-MM-ddTHH:mm:ss&quot;)" />
      </xsl:attribute>
      <xsl:attribute name="version">
        <xsl:value-of select="'1.2.031'" />
      </xsl:attribute>
      <Header>
        <From>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='AU'">
                <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('SupplierIdAU' , 'SAP.Glass.Lion.cXML')" />
              </xsl:if>
              <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='NZ'">
                <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('SupplierIdNZ' , 'SAP.Glass.Lion.cXML')" />
              </xsl:if>
            </Identity>
          </Credential>
        </From>
        <To>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('CustomerId' , 'SAP.Glass.Lion.cXML')" />
            </Identity>
          </Credential>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'EndPointID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('EndPointId' , 'SAP.Glass.Lion.cXML')" />
            </Identity>
          </Credential>
        </To>
        <Sender>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='AU'">
                <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('SupplierIdAU' , 'SAP.Glass.Lion.cXML')" />
              </xsl:if>
              <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='NZ'">
                <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('SupplierIdNZ' , 'SAP.Glass.Lion.cXML')" />
              </xsl:if>
            </Identity>
            <SharedSecret>
              <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('SharedSecret' , 'SAP.Glass.Lion.cXML')" />
            </SharedSecret>
          </Credential>
          <UserAgent>
            <xsl:value-of select="'Supplier'" />
          </UserAgent>
        </Sender>
      </Header>
      <Request>
        <xsl:attribute name="deploymentMode">
          <xsl:value-of select="ScriptNS0:GetInterfaceLookupData('Environment' , 'SAP.Glass.Lion.cXML')" />
        </xsl:attribute>
        <ShipNoticeRequest>
          <ShipNoticeHeader>
            <xsl:attribute name="deliveryDate">
              <xsl:value-of select="$var:vDeliveryDate" />
            </xsl:attribute>
            <xsl:attribute name="noticeDate">
              <xsl:value-of select="$var:vNoticeDate" />
            </xsl:attribute>
            <xsl:attribute name="shipmentDate">
              <xsl:value-of select="$var:vShipmentDate" />
            </xsl:attribute>
            <xsl:attribute name="operation">
              <xsl:text>new</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="shipmentID">
              <xsl:value-of select="$var:vDeliveryId" />
            </xsl:attribute>
            <xsl:attribute name="shipmentType">
              <xsl:text>actual</xsl:text>
            </xsl:attribute>
            <Contact>
              <xsl:attribute name="role">
                <xsl:text>shipFrom</xsl:text>
              </xsl:attribute>
              <Name xml:lang="en">
                <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:NAME1/text())" />
              </Name>
              <PostalAddress>
                <Street>
                  <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:STREET1/text())" />
                </Street>
                <City>
                  <xsl:attribute name="cityCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:CITY1/text())" />
                  </xsl:attribute>
                </City>
                <State>
                  <xsl:attribute name="isoStateCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:REGION/text())" />
                  </xsl:attribute>
                </State>
                <PostalCode>
                  <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:POSTL_COD2/text())" />
                </PostalCode>
                <Country>
                  <xsl:attribute name="isoCountryCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())" />
                  </xsl:attribute>
                  <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='AU'">
                    <xsl:text>Australia</xsl:text>
                  </xsl:if>
                  <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='OSO']/s0:COUNTRY1/text())='NZ'">
                    <xsl:text>New Zealand</xsl:text>
                  </xsl:if>
                </Country>
              </PostalAddress>
            </Contact>
            <Contact>
              <xsl:attribute name="role">
                <xsl:text>shipTo</xsl:text>
              </xsl:attribute>
              <Name xml:lang="en">
                <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:NAME1/text())" />
              </Name>
              <PostalAddress>
                <Street>
                  <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:STREET1/text())" />
                </Street>
                <City>
                  <xsl:attribute name="cityCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:CITY1/text())" />
                  </xsl:attribute>
                </City>
                <State>
                  <xsl:attribute name="isoStateCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:REGION/text())" />
                  </xsl:attribute>
                </State>
                <PostalCode>
                  <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:POSTL_COD2/text())" />
                </PostalCode>
                <Country>
                  <xsl:attribute name="isoCountryCode">
                    <xsl:value-of select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:COUNTRY1/text())" />
                  </xsl:attribute>
                  <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:COUNTRY1/text())='AU'">
                    <xsl:text>Australia</xsl:text>
                  </xsl:if>
                  <xsl:if test="string(s1:idocData/s0:E2EDL20003GRP/s0:E2ADRM1001GRP/s0:E2ADRM1001[s0:PARTNER_Q='WE']/s0:COUNTRY1/text())='NZ'">
                    <xsl:text>New Zealand</xsl:text>
                  </xsl:if>
                </Country>
              </PostalAddress>
            </Contact>
            <Extrinsic name="totalOfPackages">
              <xsl:value-of select="count(s1:idocData/s0:E2EDL20003GRP[s0:E2EDL24007GRP[string(s0:E2EDL24007/s0:CHARG/text()) != '']]/s0:E2EDL37005GRP/s0:E2EDL37005/s0:INHALT)"/>
            </Extrinsic>
          </ShipNoticeHeader>

          <xsl:for-each select="s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP[string(s0:E2EDL24007/s0:CHARG/text()) != '']">

            <xsl:if test="substring(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text(), 2, 5) = ''">             
                <xsl:message terminate="yes">
                  Missing POSEX value
                </xsl:message>             
            </xsl:if>
            
            <ShipNoticePortion>
              <OrderReference>
                <!--<xsl:attribute name="orderDate">
                      <xsl:value-of select="$var:vOrderDate" />
                    </xsl:attribute>-->
                <xsl:attribute name="orderID">
                  <!--<xsl:value-of select="s0:E2EDL43000[s0:QUALF='C']/s0:BELNR/text()" />-->
                  <xsl:value-of select="concat(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:BSTNR/text(), substring(format-number(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text(), '000000'), 2, 5), 'JIT')" />
                </xsl:attribute>
                <DocumentReference>
                  <xsl:attribute name="payloadID">
                    <xsl:value-of select="''" />
                  </xsl:attribute>
                </DocumentReference>
              </OrderReference>
              <MasterAgreementIDInfo>
                <xsl:attribute name="agreementType">
                  <xsl:value-of select="'scheduling_agreement'" />
                </xsl:attribute>
                <xsl:attribute name="agreementID">
                  <xsl:value-of select="substring(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:BSTNR/text(), 1, 10)" />
                </xsl:attribute>
                <!--<xsl:attribute name="agreementType">
                        <xsl:value-of select="'scheduling_agreement'" />
                      </xsl:attribute>-->
              </MasterAgreementIDInfo>
              <xsl:variable name="var:vLineNumber" select="number(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text())" />
              <!--<xsl:for-each select="s0:E2EDL24007GRP[generate-id(.)=generate-id(key('groups', s0:E2EDL24007/s0:CHARG))]"> 
                    <xsl:variable name="var:ssccNum" select="string(s0:Z2EDP09_2001/s0:SSCC_NUM/text())"></xsl:variable>
                    <xsl:if test="string(s0:E2EDL24007/s0:CHARG/text()) != ''">-->
              <ShipNoticeItem>
                <xsl:variable name="var:vShipNoticeLineNumber" select="number(s0:E2EDL24007/s0:POSNR/text())" />
              
                <xsl:variable name="var:vKDMAT" select="string(s0:E2EDL24007/s0:KDMAT/text())" />
                <xsl:variable name="var:vSerialNumber" select="string(s0:E2EDL24007/s0:KDMAT/text())" />
                <xsl:variable name="var:vSupplierPartId" select="string(s0:E2EDL24007/s0:MATNR/text())" />
                <xsl:variable name="var:vMaterialDesc" select="string(s0:E2EDL24007/s0:ARKTX/text())" />
                <xsl:variable name="var:vQTYValue" select="string(s0:E2EDL24007/s0:LGMNG/text())" />
                <xsl:variable name="var:vUOMValue" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDL24007/s0:MEINS/text()) , &quot;SAP.Glass.Lion.UOMResponse&quot;)" />
                <!--<xsl:variable name="var:vQTYValue" select="string(s0:E2EDL24007/s0:LFIMG/text())" /> 
                        <xsl:variable name="var:vUOMValue" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDL24007/s0:VRKME/text()) , &quot;SAP.Glass.Lion.UOMResponse&quot;)" />-->
                <xsl:variable name="var:vUnitPrice" select="string(s0:E2EDL24007/s0:BRGEW/text())" />
                <xsl:variable name="var:vSupplierBatchID" select="string(s0:E2EDL24007/s0:CHARG/text())" />
                <xsl:variable name="var:vSupplierAuxId" select="string(s0:E2EDL24007/s0:EAN11/text())" />
                <!--<xsl:variable name="var:vBatchExpDate" select="ScriptNS2:FormateDateNew(string(s0:Z2EDP09_2001/s0:VFDAT/text()), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)" />
                        <xsl:variable name="var:vBatchProdDate" select="ScriptNS2:FormateDateNew(string(s0:Z2EDP09_2001/s0:HSDAT/text()), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)" />-->

                <xsl:attribute name="lineNumber">
                  <xsl:value-of select="$var:vLineNumber" />
                </xsl:attribute>
                <xsl:attribute name="quantity">
                  <xsl:choose>
                    <xsl:when test="s0:E2EDL24007/s0:VRKME/text()='TH'">
                      <xsl:value-of select="$var:vQTYValue*1000" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$var:vQTYValue" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="shipNoticeLineNumber">
                  <xsl:value-of select="$var:vShipNoticeLineNumber" />
                </xsl:attribute>
                <!--<xsl:if test="$var:ssccNum != ''">-->
                <ItemID>
                  <SupplierPartID>
                    <xsl:value-of select="$var:vSupplierPartId" />
                  </SupplierPartID>
                  <SupplierPartAuxiliaryID>
                    <xsl:value-of select="$var:vSupplierAuxId" />
                  </SupplierPartAuxiliaryID>
                    <xsl:choose>
                              <xsl:when test="substring($var:vKDMAT, string-length($var:vKDMAT)-4, 5) = '....'">
                                <BuyerPartID>
                                  <xsl:value-of select="substring($var:vKDMAT, 1, string-length($var:vKDMAT) - 5)" />
                                </BuyerPartID>
                              </xsl:when>
                              <xsl:when test="substring($var:vKDMAT, string-length($var:vKDMAT)-3, 4) = '....'">
                                <BuyerPartID>
                                  <xsl:value-of select="substring($var:vKDMAT, 1, string-length($var:vKDMAT) - 4)" />
                                </BuyerPartID>
                              </xsl:when>
                              <xsl:when test="substring($var:vKDMAT, string-length($var:vKDMAT)-2, 3) = '...'">
                                <BuyerPartID>
                                  <xsl:value-of select="substring($var:vKDMAT, 1, string-length($var:vKDMAT) - 3)" />
                                </BuyerPartID>                          
                              </xsl:when>
                              <xsl:when test="substring($var:vKDMAT, string-length($var:vKDMAT)-1, 2) = '..'">
                                <BuyerPartID>
                                  <xsl:value-of select="substring($var:vKDMAT, 1, string-length($var:vKDMAT) - 2)" />
                                </BuyerPartID>                          
                              </xsl:when>
                              <xsl:when test="substring($var:vKDMAT, string-length($var:vKDMAT), 1) = '.'">
                                <BuyerPartID>
                                  <xsl:value-of select="substring($var:vKDMAT, 1, string-length($var:vKDMAT) - 1)" />
                                </BuyerPartID>                          
                              </xsl:when>
                              <xsl:otherwise>
                                 <BuyerPartID>
                                  <xsl:value-of select="$var:vKDMAT" />
                                </BuyerPartID> 
                              </xsl:otherwise>
                            </xsl:choose> 
                </ItemID>
                <ShipNoticeItemDetail>
                  <UnitPrice>
                    <Money>
                      <xsl:attribute name="currency">
                        <xsl:value-of select="$var:vCurrency" />
                      </xsl:attribute>
                      <xsl:value-of select="$var:vUnitPrice" />
                    </Money>
                  </UnitPrice>
                  <Description xml:lang="en-AU">
                    <xsl:value-of select="$var:vMaterialDesc" />
                  </Description>
                  <UnitOfMeasure>
                    <xsl:value-of select="$var:vUOMValue" />
                  </UnitOfMeasure>
                </ShipNoticeItemDetail>
                <UnitOfMeasure>
                  <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDL24007/s0:MEINS/text()) , &quot;SAP.Glass.Lion.UOMResponse&quot;)" />
                </UnitOfMeasure>
                <xsl:for-each select="../s0:E2EDL37005GRP[s0:E2EDL44004GRP/s0:E2EDL44004/s0:MATNR=$var:vSupplierPartId and s0:E2EDL44004GRP/s0:E2EDL44004/s0:CHARG = $var:vSupplierBatchID]">
                  <Packaging>
                    <PackagingCode xml:lang="en-AU">PALLET</PackagingCode>
                    <!--<Dimension>
                      <xsl:attribute name="quantity">
                        <xsl:value-of select="s0:E2EDL37005/s0:BRGEW" />
                      </xsl:attribute>
                      <xsl:attribute name="type">
                        <xsl:value-of select="'weight'" />
                      </xsl:attribute>
                      <UnitOfMeasure>
                        <xsl:value-of select="s0:E2EDL37005/s0:GWEIT" />
                      </UnitOfMeasure>
                    </Dimension>                  
                    <Description type="Material" xml:lang="en"/>
                    <PackageTypeCodeIdentifierCode>
                      --><!--<xsl:value-of select="s0:E2EDL37005/s0:VOLEM" />--><!--
                      <xsl:value-of select="'PLT'" />
                    </PackageTypeCodeIdentifierCode>-->
                    <PackageID>
                      <GlobalIndividualAssetID>
                        <xsl:value-of select="s0:E2EDL37005/s0:INHALT" />
                      </GlobalIndividualAssetID>
                    </PackageID>
                    <DispatchQuantity>
                      <xsl:attribute name="quantity">
                        <xsl:value-of select="s0:E2EDL44004GRP/s0:E2EDL44004/s0:VEMNG" />
                      </xsl:attribute>
                      <UnitOfMeasure>
                        <xsl:value-of select="s0:E2EDL44004GRP/s0:E2EDL44004/s0:VEMEH" />
                      </UnitOfMeasure>
                    </DispatchQuantity>
                  </Packaging>
                </xsl:for-each>
                <Batch>
                  <SupplierBatchID>
                    <xsl:value-of select="$var:vSupplierBatchID" />
                  </SupplierBatchID>
                </Batch>
                <!--<AssetInfo>
                            <xsl:attribute name="serialNumber">
                              <xsl:value-of select="$var:vSerialNumber" />
                            </xsl:attribute>
                            <xsl:attribute name="tagNumber">
                                  <xsl:value-of select="'CZ'" />
                            </xsl:attribute>                         
                          </AssetInfo>-->
                <OrderedQuantity>
                  <xsl:attribute name="quantity">
                    <xsl:value-of select="$var:vQTYValue" />
                  </xsl:attribute>
                  <UnitOfMeasure>
                    <xsl:value-of select="$var:vUOMValue" />
                  </UnitOfMeasure>
                </OrderedQuantity>
                <Extrinsic name="customersPartNo">
                  <xsl:value-of select="$var:vKDMAT" />
                </Extrinsic>
                <!--</xsl:if>-->
                <!--<xsl:if test="$var:vSupplierBatchID != ''">
                          <Batch>
                            <xsl:attribute name="expirationDate">
                              <xsl:value-of select="$var:vBatchExpDate" />
                            </xsl:attribute>
                            <xsl:attribute name="productionDate">
                              <xsl:value-of select="$var:vBatchProdDate" />
                            </xsl:attribute>
                            <SupplierBatchID>
                              <xsl:value-of select="$var:vSupplierBatchID" />
                            </SupplierBatchID>
                          </Batch>
                        </xsl:if>-->
              </ShipNoticeItem>
              <!--</xsl:if>
                  </xsl:for-each>-->
            </ShipNoticePortion>
          </xsl:for-each>

        </ShipNoticeRequest>

      </Request>

    </cXML>
  </xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
  public string StringConcat(string param0)
  {
     return param0;
  }

  public string DateCurrentDateTime()
  {
	  DateTime dt = DateTime.Now;
	  string curdate = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
	  string curtime = dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
	  string retval = curdate + "T" + curtime;
	  return retval;
  }

  public string StringConcat(string param0, string param1)
  {
     return param0 + param1;
  }
  
  public string PayLoadId_GenerateGUID()
  {
       return System.Guid.NewGuid().ToString();
  }

public string CheckIfTrue(bool param1)
{
if (param1 == true)
    {
        return "accept";
    }
    else
    {
         return "reject";
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

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

]]>
  </msxsl:script>
</xsl:stylesheet>