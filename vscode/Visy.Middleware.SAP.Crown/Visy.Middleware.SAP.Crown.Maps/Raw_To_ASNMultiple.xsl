<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	  exclude-result-prefixes="msxsl var s1 s2 s0 ScriptNS0"
	  version="1.0"
	  xmlns:ns0="http://Visy.Middleware.SAP.Crown.Schemas.ASN_Single"
	  xmlns:s1="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
	  xmlns:s0="urn:ean.ucc:2" xmlns:s2="urn:ean.ucc:deliver:2"
	  xmlns:ns1="http://Visy.Middleware.SAP.Crown.Schemas.ASN_Multiple"
    xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/documentReference/uniqueCreatorIdentification/text()" match="s0:message/s0:transaction/command/s0:documentCommand/documentCommandOperand/s2:despatchAdvice/despatchAdviceLogisticUnitLineItem" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:StandardBusinessDocument" />
  </xsl:template>
  <xsl:template match="/s1:StandardBusinessDocument">
    <ns1:ASN_Multiple>
      <xsl:for-each select="s0:message/s0:transaction/command/s0:documentCommand/documentCommandOperand/s2:despatchAdvice/despatchAdviceLogisticUnitLineItem[generate-id(.)=generate-id(key('groups',despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/documentReference/uniqueCreatorIdentification/text()))]">
        <ns0:ASN_Single>
          <PONumber>
            <xsl:value-of select="despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/documentReference/uniqueCreatorIdentification" />
          </PONumber>
          <PODate></PODate>
          <xsl:for-each select="key('groups', despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/documentReference/uniqueCreatorIdentification)">
            <Details>
              <DeliveryDate>
                <xsl:value-of select="ScriptNS0:FormateDateNew(string(despatchAdviceItemContainmentLineItem/deliveryNote/reference/referenceDateTime) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-ddTHH:mm:ss&quot;)" />
              </DeliveryDate>
              <ContainerNumber>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/deliveryNote/reference/referenceIdentification" />
              </ContainerNumber>
              <InvoiceNumber>
                <xsl:value-of select="''" />
              </InvoiceNumber>
              <LineNo>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/@number" />
              </LineNo>
              <SGVisyPONumber>
                <xsl:value-of select="''" />
              </SGVisyPONumber>
              <VisyPONumber>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/purchaseOrder/documentLineReference/documentReference/uniqueCreatorIdentification" />
              </VisyPONumber>
              <MaterialNumber>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/containedItemIdentification/additionalTradeItemIdentification[1]/additionalTradeItemIdentificationValue" />
              </MaterialNumber>
              <LotNumber>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/extendedAttributes/lotNumber" />
              </LotNumber>
              <Quantity>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/requestedQuantity/value" />
              </Quantity>              
              <UOM>
                <xsl:value-of select="despatchAdviceItemContainmentLineItem/requestedQuantity/unitOfMeasure/measurementUnitCodeValue" />
              </UOM>
              <DeliveryNumber>               
                <!--<xsl:value-of select="despatchAdviceItemContainmentLineItem/deliveryNote/reference/referenceIdentification" />-->
                <xsl:value-of select=" substring(logisticUnitIdentification/serialShipmentContainerCode/serialShippingContainerCode/text(), string-length(logisticUnitIdentification/serialShipmentContainerCode/serialShippingContainerCode/text()) - 10 + 1, 10)" />
              </DeliveryNumber>
              <ArrivalDate>
                <xsl:value-of select="ScriptNS0:FormateDateNew(string(../despatchInformation/estimatedDelivery/estimatedDeliveryPeriod/dateTimePeriod/@beginDateTime) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-ddTHH:mm:ss&quot;)" />
              </ArrivalDate>              
            </Details>
          </xsl:for-each>
        </ns0:ASN_Single>
      </xsl:for-each>
    </ns1:ASN_Multiple>
  </xsl:template>
</xsl:stylesheet>