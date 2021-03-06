<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0" xmlns:qdoc="urn:schemas-qad-com:xml-services" xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/" xmlns:add="http://www.w3.org/2005/08/addressing" xmlns:ns1="urn:schemas-qad-com:xml-services:common">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="qdoc:srRef" match="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttPOShipperItem/qdoc:ttShipperItemMultiLineEntry" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/ns0:Envelope" />
  </xsl:template>
  <xsl:template match="/ns0:Envelope">
    <ns0:Envelope>
      <ns0:Body>
        <qdoc:maintainPOShipper>
          <qdoc:dsPOShipper>
            <qdoc:ttPOShipper>
              <qdoc:absId>
                <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:absId/text()" />
              </qdoc:absId>
              <qdoc:absShipFrom>
                <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:absShipFrom/text()" />
              </qdoc:absShipFrom>
              <qdoc:absShipTo>
                <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:absShipTo/text()" />
              </qdoc:absShipTo>
              
              <xsl:for-each select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttPOShipperItem">
                <qdoc:ttPOShipperItem>
                  <qdoc:absId>
                    <xsl:value-of select="qdoc:absId/text()" />
                  </qdoc:absId>
                  <qdoc:absShipFrom>
                    <xsl:value-of select="qdoc:absShipFrom/text()" />
                  </qdoc:absShipFrom>
                  <qdoc:scxPart>
                    <xsl:value-of select="qdoc:scxPart/text()" />
                  </qdoc:scxPart>
                  <qdoc:scxPo>
                    <xsl:value-of select="qdoc:scxPo/text()" />
                  </qdoc:scxPo>
                  <qdoc:scxLine>
                    <xsl:value-of select="qdoc:scxLine/text()" />
                  </qdoc:scxLine>
                  <qdoc:multiEntry>
                    <xsl:value-of select="qdoc:multiEntry/text()" />
                  </qdoc:multiEntry>
                 <xsl:for-each select="qdoc:ttShipperItemMultiLineEntry[generate-id(.)=generate-id(key('groups',qdoc:srRef))]">
                  <!--<xsl:for-each select="qdoc:ttShipperItemMultiLineEntry">-->
                    <qdoc:ttShipperItemMultiLineEntry>
                      <qdoc:absId>
                        <xsl:value-of select="qdoc:absId/text()" />
                      </qdoc:absId>
                      <qdoc:absShipFrom>
                        <xsl:value-of select="qdoc:absShipFrom/text()" />
                      </qdoc:absShipFrom>
                      <qdoc:scxPart>
                        <xsl:value-of select="qdoc:scxPart/text()" />
                      </qdoc:scxPart>
                      <qdoc:scxPo>
                        <xsl:value-of select="qdoc:scxPo/text()" />
                      </qdoc:scxPo>
                      <qdoc:scxLine>
                        <xsl:value-of select="qdoc:scxLine/text()" />
                      </qdoc:scxLine>
                      <qdoc:srSite>
                        <xsl:value-of select="qdoc:srSite/text()" />
                      </qdoc:srSite>
                      <qdoc:srLoc>
                        <xsl:value-of select="qdoc:srLoc/text()" />
                      </qdoc:srLoc>
                      <qdoc:srLotser>
                        <xsl:value-of select="qdoc:srLotser/text()" />
                      </qdoc:srLotser>
                      <qdoc:srRef>
                        <xsl:value-of select="qdoc:srRef/text()" />
                      </qdoc:srRef>
                      <xsl:if test="qdoc:srVendLot">
                        <qdoc:srVendLot>
                          <xsl:value-of select="qdoc:srVendLot/text()" />
                        </qdoc:srVendLot>
                      </xsl:if>
                      <qdoc:srQty>
                        <xsl:value-of select="qdoc:srQty/text()" />
                      </qdoc:srQty>
                    </qdoc:ttShipperItemMultiLineEntry>
                  </xsl:for-each>
                  <xsl:value-of select="./text()" />
                </qdoc:ttPOShipperItem>
              </xsl:for-each>
              <qdoc:ttShipperCarrier>
                <qdoc:absId>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absId/text()" />
                </qdoc:absId>
                <qdoc:absShipFrom>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absShipFrom/text()" />
                </qdoc:absShipFrom>
                <qdoc:carrierRef>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:carrierRef/text()" />
                </qdoc:carrierRef>
                <qdoc:carrierRef2>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:carrierRef2/text()" />
                </qdoc:carrierRef2>
                <qdoc:absShipvia>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absShipvia/text()" />
                </qdoc:absShipvia>
                <qdoc:absFob>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absFob/text()" />
                </qdoc:absFob>
                <qdoc:absVehRef>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absVehRef/text()" />
                </qdoc:absVehRef>
                <qdoc:absiVoyage>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absiVoyage/text()" />
                </qdoc:absiVoyage>
                <qdoc:absiPortDepart>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absiPortDepart/text()" />
                </qdoc:absiPortDepart>
                <qdoc:absShipDate>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absShipDate/text()" />
                </qdoc:absShipDate>
                <qdoc:absiDueDate>
                  <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/qdoc:absiDueDate/text()" />
                </qdoc:absiDueDate>
                <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/qdoc:ttShipperCarrier/text()" />
              </qdoc:ttShipperCarrier>
              <xsl:value-of select="ns0:Body/qdoc:maintainPOShipper/qdoc:dsPOShipper/qdoc:ttPOShipper/text()" />
            </qdoc:ttPOShipper>
          </qdoc:dsPOShipper>
        </qdoc:maintainPOShipper>
      </ns0:Body>
    </ns0:Envelope>
  </xsl:template>
</xsl:stylesheet>