<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 ScriptNS2" version="1.0" 
                xmlns:qdoc="urn:schemas-qad-com:xml-services" 
                xmlns:s0="http://Visy.Middleware.LGX.Bundaberg.Schemas.LGXAsnFF" 
                xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/" 
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
                xmlns:add="http://www.w3.org/2005/08/addressing" 
                xmlns:ns1="urn:schemas-qad-com:xml-services:common">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key use="factord_id" match="s0:BBDDesAdv/Details" name="groups"/>
 
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:BBDDesAdv" />
  </xsl:template>
  <xsl:template match="/s0:BBDDesAdv">
    <ns0:Envelope>
      <ns0:Body>
        <qdoc:maintainPOShipper>
          <qdoc:dsPOShipper>        
              <xsl:variable name="var:DeliveryId" select="Details[1]/delivery_id/text()" />             
              <xsl:variable name="var:vShipFrom" select="'VISBOA'" />
              <xsl:variable name="var:vDeliveryDate" select="ScriptNS2:FormateDateNew(string(Details[1]/delivery_date/text()), &quot;yyyy-MM-dd&quot;, &quot;yyyyMMdd&quot;)" />
              <xsl:variable name="JDN">
                <xsl:call-template name="JDN">
                  <xsl:with-param name="date" select="$var:vDeliveryDate" />
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="var:vDueDate">
                <xsl:call-template name="GD">
                  <xsl:with-param name="JDN" select="$JDN + 1" />
                </xsl:call-template>
              </xsl:variable>  
            
            <qdoc:ttPOShipper>
                 <qdoc:absId>
                    <xsl:value-of select="$var:DeliveryId" />
                  </qdoc:absId>
                  <qdoc:absShipFrom>
                    <xsl:value-of select="$var:vShipFrom" />
                  </qdoc:absShipFrom>
                  <qdoc:absShipTo>
                    <xsl:value-of select="'BBD'" />
                </qdoc:absShipTo>
                <xsl:for-each select="Details[generate-id(.)=generate-id(key('groups',factord_id))]">
                <qdoc:ttPOShipperItem>
                  <qdoc:absId>
                    <xsl:value-of select="delivery_id/text()" />
                  </qdoc:absId>
                  <qdoc:absShipFrom>
                        <xsl:value-of select="$var:vShipFrom" />
                      </qdoc:absShipFrom>
                  <qdoc:scxPart>
                    <xsl:value-of select="product_code/text()" />
                  </qdoc:scxPart>
                  <qdoc:scxPo>
                    <xsl:value-of select="'VISBOA01'" />
                  </qdoc:scxPo>
                  <qdoc:scxLine>
                    <xsl:value-of select="customer_product_code/text()" />
                  </qdoc:scxLine>
                  <qdoc:multiEntry>True</qdoc:multiEntry>
                  <xsl:for-each select="key('groups',factord_id)">
                    <qdoc:ttShipperItemMultiLineEntry>
                      <qdoc:absId>
                        <xsl:value-of select="delivery_id/text()" />
                      </qdoc:absId>
                      <qdoc:absShipFrom>
                        <xsl:value-of select="$var:vShipFrom" />
                      </qdoc:absShipFrom>
                      <qdoc:scxPart>
                        <xsl:value-of select="product_code/text()" />
                      </qdoc:scxPart>
                      <qdoc:scxPo>
                        <xsl:value-of select="'VISBOA01'" />
                      </qdoc:scxPo>
                      <qdoc:scxLine>
                       <xsl:value-of select="customer_product_code/text()" />
                      </qdoc:scxLine>
                      <qdoc:srSite>
                        <xsl:value-of select="'BBD'" />
                      </qdoc:srSite>
                      <qdoc:srLoc>
                        <xsl:value-of select="'DOCK2'" />
                      </qdoc:srLoc>
                      <qdoc:srLotser>
                        <xsl:value-of select="factord_id/text()" />
                      </qdoc:srLotser>
                      <qdoc:srRef>
                        <xsl:value-of select="concat('C', substring(scan_sscc_barcode, string-length(scan_sscc_barcode) - 8 + 1, 7))" />
                      </qdoc:srRef>
                      <qdoc:srQty>
                        <xsl:value-of select="pallet_qty/text()" />
                      </qdoc:srQty>
                    </qdoc:ttShipperItemMultiLineEntry>
                  </xsl:for-each>
                </qdoc:ttPOShipperItem>
                </xsl:for-each>
                <qdoc:ttShipperCarrier>
                      <qdoc:absId>
                        <xsl:value-of select="$var:DeliveryId" />
                      </qdoc:absId>
                      <qdoc:absShipFrom>
                        <xsl:value-of select="$var:vShipFrom" />
                      </qdoc:absShipFrom>
                      <qdoc:carrierRef>
                        <xsl:value-of select="Details[1]/purchase_order_number/text()" />
                      </qdoc:carrierRef>
                      <!--<qdoc:carrierRef2>
                        <xsl:value-of select="''" />
                      </qdoc:carrierRef2>-->
                      <qdoc:absShipvia>
                        <xsl:value-of select="''" />
                        <xsl:value-of select="'VISY BOARD YATALA'" />
                      </qdoc:absShipvia>
                      <!--<qdoc:absFob>
                        <xsl:value-of select="''"/>
                      </qdoc:absFob>-->
                      <qdoc:absVehRef>
                        <xsl:value-of select="Header[1]/driver_mobile_no/text()" />
                      </qdoc:absVehRef>
                      <qdoc:absiVoyage><xsl:value-of select="$var:DeliveryId" /></qdoc:absiVoyage>
                      <qdoc:absiPortDepart>
                        <xsl:value-of select="'Yatala'" />
                      </qdoc:absiPortDepart>
                      <qdoc:absShipDate>
                        <xsl:value-of select="$var:vDeliveryDate" />
                      </qdoc:absShipDate>
                      <qdoc:absiDueDate>
                        <xsl:value-of select="$var:vDueDate" />
                      </qdoc:absiDueDate>
                    </qdoc:ttShipperCarrier>
              </qdoc:ttPOShipper>          
          </qdoc:dsPOShipper>
        </qdoc:maintainPOShipper>
      </ns0:Body>
    </ns0:Envelope>
  </xsl:template>
  <xsl:template name="JDN">
    <xsl:param name="date"/>
    <xsl:param name="year" select="substring($date, 1, 4)"/>
    <xsl:param name="month" select="substring($date, 6, 2)"/>
    <xsl:param name="day" select="substring($date, 9, 2)"/>
    <xsl:param name="a" select="floor((14 - $month) div 12)"/>
    <xsl:param name="y" select="$year + 4800 - $a"/>
    <xsl:param name="m" select="$month + 12*$a - 3"/>
    <xsl:value-of select="$day + floor((153*$m + 2) div 5) + 365*$y + floor($y div 4) - floor($y div 100) + floor($y div 400) - 32045" />
  </xsl:template>

  <xsl:template name="GD">
    <xsl:param name="JDN"/>
    <xsl:param name="f" select="$JDN + 1401 + floor((floor((4 * $JDN + 274277) div 146097) * 3) div 4) - 38"/>
    <xsl:param name="e" select="4*$f + 3"/>
    <xsl:param name="g" select="floor(($e mod 1461) div 4)"/>
    <xsl:param name="h" select="5*$g + 2"/>
    <xsl:param name="D" select="floor(($h mod 153) div 5 ) + 1"/>
    <xsl:param name="M" select="(floor($h div 153) + 2) mod 12 + 1"/>
    <xsl:param name="Y" select="floor($e div 1461) - 4716 + floor((14 - $M) div 12)"/>
    <xsl:param name="MM" select="substring(100 + $M, 2)"/>
    <xsl:param name="DD" select="substring(100 + $D, 2)"/>
    <xsl:value-of select="concat($Y, '-', $MM, '-', $DD)" />
  </xsl:template>
</xsl:stylesheet>