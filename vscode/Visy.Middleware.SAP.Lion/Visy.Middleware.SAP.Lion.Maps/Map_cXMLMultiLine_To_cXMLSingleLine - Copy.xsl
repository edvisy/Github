<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 ScriptNS0" version="1.0" xmlns:ns1="http://tempuri.org/cXML_1.2.031" xmlns:ns2="uri:xades" xmlns:s0="http://schemas.microsoft.com/BizTalk/2003/aggschema" xmlns:ns3="http://www.w3.org/XML/1998/namespace" xmlns:ns0="uri:ds" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Root" />
  </xsl:template>
  <xsl:template match="/s0:Root">
    <ns1:cXML>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@version">
        <xsl:attribute name="version">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@version" />
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="payloadID">
        <xsl:value-of select="InputMessagePart_0/ns1:cXML/@payloadID" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <xsl:value-of select="InputMessagePart_0/ns1:cXML/@timestamp" />
      </xsl:attribute>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@signatureVersion">
        <xsl:attribute name="signatureVersion">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@signatureVersion" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="InputMessagePart_0/ns1:cXML/@ns3:lang">
        <xsl:attribute name="ns3:lang">
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/@ns3:lang" />
        </xsl:attribute>
      </xsl:if>
      <ns1:Header>
        <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Header/@*" />
        <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Header/*" />
      </ns1:Header>
      
      <ns1:Request>
        <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/@deploymentMode">
          <xsl:attribute name="deploymentMode">
            <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/@deploymentMode" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/@Id">
          <xsl:attribute name="Id">
            <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/@Id" />
          </xsl:attribute>
        </xsl:if>
        <ns1:OrderRequest>
          <ns1:OrderRequestHeader>
            <xsl:attribute name="orderID">
              <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderID" />
            </xsl:attribute>
            <xsl:attribute name="orderDate">
              <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderDate" />
            </xsl:attribute>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderType">
              <xsl:attribute name="orderType">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderType" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@releaseRequired">
              <xsl:attribute name="releaseRequired">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@releaseRequired" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@type">
              <xsl:attribute name="type">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@type" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderVersion">
              <xsl:attribute name="orderVersion">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@orderVersion" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@isInternalVersion">
              <xsl:attribute name="isInternalVersion">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@isInternalVersion" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@parentAgreementID">
              <xsl:attribute name="parentAgreementID">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@parentAgreementID" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@parentAgreementPayloadID">
              <xsl:attribute name="parentAgreementPayloadID">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@parentAgreementPayloadID" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@effectiveDate">
              <xsl:attribute name="effectiveDate">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@effectiveDate" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@expirationDate">
              <xsl:attribute name="expirationDate">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@expirationDate" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@agreementID">
              <xsl:attribute name="agreementID">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@agreementID" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@agreementPayloadID">
              <xsl:attribute name="agreementPayloadID">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@agreementPayloadID" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@requisitionID">
              <xsl:attribute name="requisitionID">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@requisitionID" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@shipComplete">
              <xsl:attribute name="shipComplete">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@shipComplete" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@pickUpDate">
              <xsl:attribute name="pickUpDate">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@pickUpDate" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@requestedDeliveryDate">
              <xsl:attribute name="requestedDeliveryDate">
                <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/@requestedDeliveryDate" />
              </xsl:attribute>
            </xsl:if>
            <ns1:Total>
              <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Total/@*" />
              <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Total/*" />
            </ns1:Total>
            <ns1:ShipTo>
              <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:ShipTo">
                <ns1:Address>
                  <xsl:if test="ns1:Address/@isoCountryCode">
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="ns1:Address/@isoCountryCode" />
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:variable name="var:v1" select="ScriptNS0:GetInterfaceLookupData(string(../../../../../../InputMessagePart_1/ns1:ItemOut/ns1:ItemID/ns1:BuyerPartID/text()) , &quot;SAP.Lion.Plant&quot;)" />
                  <xsl:attribute name="addressID">
                    <xsl:value-of select="$var:v1" />
                  </xsl:attribute>
                  <xsl:if test="ns1:Address/@addressIDDomain">
                    <xsl:attribute name="addressIDDomain">
                      <xsl:value-of select="ns1:Address/@addressIDDomain" />
                    </xsl:attribute>
                  </xsl:if>
                  <ns1:Name>
                    <xsl:copy-of select="ns1:Address/ns1:Name/@*" />
                    <xsl:copy-of select="ns1:Address/ns1:Name/*" />
                  </ns1:Name>
                  <xsl:for-each select="ns1:Address/ns1:PostalAddress">
                    <ns1:PostalAddress>
                      <xsl:copy-of select="./@*" />
                      <xsl:copy-of select="./*" />
                    </ns1:PostalAddress>
                  </xsl:for-each>
                  <xsl:for-each select="ns1:Address/ns1:Email">
                    <ns1:Email>
                      <xsl:copy-of select="./@*" />
                      <xsl:copy-of select="./*" />
                    </ns1:Email>
                  </xsl:for-each>
                  <xsl:for-each select="ns1:Address/ns1:Phone">
                    <ns1:Phone>
                      <xsl:copy-of select="./@*" />
                      <xsl:copy-of select="./*" />
                    </ns1:Phone>
                  </xsl:for-each>
                  <xsl:for-each select="ns1:Address/ns1:Fax">
                    <ns1:Fax>
                      <xsl:copy-of select="./@*" />
                      <xsl:copy-of select="./*" />
                    </ns1:Fax>
                  </xsl:for-each>
                  <xsl:for-each select="ns1:Address/ns1:URL">
                    <ns1:URL>
                      <xsl:copy-of select="./@*" />
                      <xsl:copy-of select="./*" />
                    </ns1:URL>
                  </xsl:for-each>
                </ns1:Address>
              </xsl:for-each>
              <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:ShipTo">
                <xsl:for-each select="ns1:CarrierIdentifier">
                  <ns1:CarrierIdentifier>
                    <xsl:copy-of select="./@*" />
                    <xsl:copy-of select="./*" />
                  </ns1:CarrierIdentifier>
                </xsl:for-each>
              </xsl:for-each>
              <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:ShipTo">
                <xsl:for-each select="ns1:TransportInformation">
                  <ns1:TransportInformation>
                    <xsl:copy-of select="./@*" />
                    <xsl:copy-of select="./*" />
                  </ns1:TransportInformation>
                </xsl:for-each>
              </xsl:for-each>
              <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:ShipTo">
                <xsl:for-each select="ns1:IdReference">
                  <ns1:IdReference>
                    <xsl:copy-of select="./@*" />
                    <xsl:copy-of select="./*" />
                  </ns1:IdReference>
                </xsl:for-each>
              </xsl:for-each>
            </ns1:ShipTo>
            <ns1:BillTo>
              <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:BillTo/@*" />
              <xsl:copy-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:BillTo/*" />
            </ns1:BillTo>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Shipping">
              <ns1:Shipping>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Shipping>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Tax">
              <ns1:Tax>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Tax>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Payment">
              <ns1:Payment>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Payment>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:PaymentTerm">
              <ns1:PaymentTerm>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:PaymentTerm>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Contact">
              <ns1:Contact>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Contact>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Comments">
              <ns1:Comments>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Comments>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Followup">
              <ns1:Followup>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Followup>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:ControlKeys">
              <ns1:ControlKeys>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:ControlKeys>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:DocumentReference">
              <ns1:DocumentReference>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:DocumentReference>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:SupplierOrderInfo">
              <ns1:SupplierOrderInfo>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:SupplierOrderInfo>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:TermsOfDelivery">
              <ns1:TermsOfDelivery>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:TermsOfDelivery>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:DeliveryPeriod">
              <ns1:DeliveryPeriod>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:DeliveryPeriod>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:IdReference">
              <ns1:IdReference>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:IdReference>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:OrderRequestHeaderIndustry">
              <ns1:OrderRequestHeaderIndustry>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:OrderRequestHeaderIndustry>
            </xsl:for-each>
            <xsl:for-each select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/ns1:Extrinsic">
              <ns1:Extrinsic>
                <xsl:copy-of select="./@*" />
                <xsl:copy-of select="./*" />
              </ns1:Extrinsic>
            </xsl:for-each>
            <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/ns1:OrderRequestHeader/text()" />
          </ns1:OrderRequestHeader>
          <ns1:ItemOut>
            <xsl:copy-of select="InputMessagePart_1/ns1:ItemOut/@*" />
            <xsl:copy-of select="InputMessagePart_1/ns1:ItemOut/*" />
          </ns1:ItemOut>
          <xsl:value-of select="InputMessagePart_0/ns1:cXML/ns1:Request/ns1:OrderRequest/text()" />
        </ns1:OrderRequest>       
      </ns1:Request>
      
    </ns1:cXML>
  </xsl:template>
</xsl:stylesheet>