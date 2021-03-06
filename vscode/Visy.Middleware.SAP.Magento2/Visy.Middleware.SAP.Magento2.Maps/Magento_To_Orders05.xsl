<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s1 userCSharp ScriptNS0 ScriptNS1 s0"
                version="1.0"
                xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//740"
                xmlns:ns3="http://schemas.microsoft.com/2003/10/Serialization/"
                xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//740/Send"
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:s0="https://Visy.Middleware.SAP.Magento2.Schemas.order_json_xml"
                xmlns:s1="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:salesorder" />
  </xsl:template>
  <xsl:template match="/s0:salesorder">

    <xsl:if test="string(ScriptNS1:GetInterfaceLookupData(string(payment/method) , &quot;SAP.Magento2.OrderType&quot;))=string(payment/method)">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Cant find lookup value for Payment Method'"/>
      </xsl:message>
    </xsl:if>

    <xsl:variable name="var:paymentType" select="ScriptNS1:GetInterfaceLookupData(string(payment/method/text()) , &quot;SAP.Magento2.OrderType&quot;)" />

    <xsl:variable name="var:incrementId" select="increment_id/text()"/>
    <xsl:variable name="var:entityId" select="entity_id/text()"/>
    <xsl:variable name="var:poNumber" select="string(payment/po_number/text())"/>
    <xsl:variable name="var:country" select="string(billing_address/country_id/text())"/>

    <xsl:if test="string(ScriptNS1:GetInterfaceLookupData(string(extension_attributes/shipping_assignments/shipping[1]/address/region_id/text()) , &quot;SAP.Magento2.Plant&quot;))=string(extension_attributes/shipping_assignments/shipping[1]/address/region_id/text())">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Cant find lookup value for RegionID'"/>
      </xsl:message>
    </xsl:if>

    <xsl:variable name="var:plantNo" select="ScriptNS1:GetInterfaceLookupData(string(extension_attributes/shipping_assignments/shipping[1]/address/region_id/text()) , &quot;SAP.Magento2.Plant&quot;)" />

    <xsl:if test="string(ScriptNS1:GetInterfaceLookupData(&quot;RcvPor&quot; , &quot;SAP.Magento2.SAPConnection&quot;))=string(RcvPor)">
      <xsl:message terminate="yes">
        <xsl:value-of select="'Cant find lookup value for SAP Connection'"/>
      </xsl:message>
    </xsl:if>

    <xsl:variable name="var:RcvPor" select="ScriptNS1:GetInterfaceLookupData(&quot;RcvPor&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrn" select="ScriptNS1:GetInterfaceLookupData(&quot;RcvPrn&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPrt" select="ScriptNS1:GetInterfaceLookupData(&quot;RcvPrt&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:RcvPfc" select="ScriptNS1:GetInterfaceLookupData(&quot;RcvPfc&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPor" select="ScriptNS1:GetInterfaceLookupData(&quot;SndPor&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrn" select="ScriptNS1:GetInterfaceLookupData(&quot;SndPrn&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPrt" select="ScriptNS1:GetInterfaceLookupData(&quot;SndPrt&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:SndPfc" select="ScriptNS1:GetInterfaceLookupData(&quot;SndPfc&quot; , &quot;SAP.Magento2.SAPConnection&quot;)" />
    <xsl:variable name="var:checkShippingCost" select="userCSharp:LogicalGt(string(userCSharp:StringSize(
                string(userCSharp:StringTrimRight(
                    string(userCSharp:StringTrimLeft(
                        string(payment/shipping_amount/text())
                    )
                ))))) , &quot;0&quot;)" />

    <xsl:variable name="var:checkIfPONumber" select="userCSharp:LogicalGt(string(userCSharp:StringSize(
                string(userCSharp:StringTrimRight(
                    string(userCSharp:StringTrimLeft(
                        string(payment/po_number/text())
                    )
                ))))) , &quot;0&quot;)" />


    <ns0:Send>
      <ns0:idocData>
        <ns1:EDI_DC40>
          <ns2:TABNAM>EDI_DC40</ns2:TABNAM>
          <ns2:MANDT>330</ns2:MANDT>
          <ns2:DOCNUM> </ns2:DOCNUM>
          <ns2:DOCREL/>
          <ns2:STATUS> </ns2:STATUS>
          <ns2:DIRECT>2</ns2:DIRECT>
          <ns2:OUTMOD> </ns2:OUTMOD>
          <ns2:EXPRSS> </ns2:EXPRSS>
          <ns2:TEST> </ns2:TEST>
          <ns2:IDOCTYP>ORDERS05</ns2:IDOCTYP>
          <ns2:MESTYP>ORDERS</ns2:MESTYP>
          <ns2:MESCOD> </ns2:MESCOD>
          <ns2:MESFCT> </ns2:MESFCT>
          <ns2:STD>X</ns2:STD>
          <ns2:STDVRS> </ns2:STDVRS>
          <ns2:STDMES> </ns2:STDMES>
          <ns2:SNDPOR>
            <xsl:value-of select="$var:SndPor"/>
          </ns2:SNDPOR>
          <ns2:SNDPRT>
            <xsl:value-of select="$var:SndPrt"/>
          </ns2:SNDPRT>
          <ns2:SNDPFC>
            <xsl:value-of select="$var:SndPfc"/>
          </ns2:SNDPFC>
          <ns2:SNDPRN>
            <xsl:value-of select="$var:SndPrn"/>
          </ns2:SNDPRN>
          <ns2:SNDSAD> </ns2:SNDSAD>
          <ns2:SNDLAD> </ns2:SNDLAD>
          <ns2:RCVPOR>
            <xsl:value-of select="$var:RcvPor"/>
          </ns2:RCVPOR>
          <ns2:RCVPRT>
            <xsl:value-of select="$var:RcvPrt"/>
          </ns2:RCVPRT>
          <ns2:RCVPFC>
            <xsl:value-of select="$var:RcvPfc"/>
          </ns2:RCVPFC>
          <ns2:RCVPRN>
            <xsl:value-of select="$var:RcvPrn"/>
          </ns2:RCVPRN>
          <ns2:RCVSAD> </ns2:RCVSAD>
          <ns2:RCVLAD> </ns2:RCVLAD>
          <ns2:CREDAT>
            <xsl:value-of select="ScriptNS0:FormateDateNew(string(userCSharp:DateCurrentDate()) , &quot;yyyyMMdd&quot; , &quot;yyyy-MM-dd&quot;)" />
          </ns2:CREDAT>
          <ns2:CRETIM>
            <xsl:value-of select="userCSharp:EDI_DC40_CRETIM_ReplaceColon(string(userCSharp:DateCurrentTime()))" />
          </ns2:CRETIM>
          <ns2:REFINT> </ns2:REFINT>
          <ns2:REFGRP> </ns2:REFGRP>
          <ns2:REFMES> </ns2:REFMES>
          <ns2:ARCKEY>
            <xsl:value-of select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
          </ns2:ARCKEY>
          <ns2:SERIAL> </ns2:SERIAL>
        </ns1:EDI_DC40>
        <ns1:E2EDK01005>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK01005</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:BELNR>
            <xsl:value-of select="$var:incrementId"/>
          </ns1:BELNR>
        </ns1:E2EDK01005>
        <ns1:E2EDK14>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK14</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>012</ns1:QUALF>
          <ns1:ORGID>
            <xsl:value-of select="$var:paymentType"/>
          </ns1:ORGID>
        </ns1:E2EDK14>
        <ns1:E2EDK14>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK14</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>008</ns1:QUALF>
          <xsl:choose>
            <xsl:when test="$var:country='AU'">
              <ns1:ORGID>2000</ns1:ORGID>
            </xsl:when>
            <xsl:when test="$var:country='NZ'">
              <ns1:ORGID>2600</ns1:ORGID>
            </xsl:when>
            <xsl:otherwise>
              <ns1:ORGID>2000</ns1:ORGID>.
            </xsl:otherwise>
          </xsl:choose>
        </ns1:E2EDK14>
        <ns1:E2EDK14>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK14</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>006</ns1:QUALF>
          <ns1:ORGID>20</ns1:ORGID>
        </ns1:E2EDK14>
        <ns1:E2EDK14>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK14</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>007</ns1:QUALF>
          <xsl:choose>
            <xsl:when test="$var:country='AU'">
              <ns1:ORGID>BF</ns1:ORGID>
            </xsl:when>
            <xsl:when test="$var:country='NZ'">
              <ns1:ORGID>BG</ns1:ORGID>
            </xsl:when>
            <xsl:otherwise>
              <ns1:ORGID>BF</ns1:ORGID>.
            </xsl:otherwise>
          </xsl:choose>
        </ns1:E2EDK14>
        <ns1:E2EDK03>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK03</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:IDDAT>002</ns1:IDDAT>
          <xsl:if test="extension_attributes/delivery_date/text()">
            <ns1:DATUM>
              <xsl:value-of select="ScriptNS0:FormateDateNew(string(extension_attributes/delivery_date/text()) , &quot;yyyyMMdd&quot;, &quot;yyyy-MM-dd HH:mm:ss&quot;)"/>
            </ns1:DATUM>
          </xsl:if>
        </ns1:E2EDK03>
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDKA1003</ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT/>
            <ns1:DATAHEADERCOLUMN_SEGNUM/>
            <ns1:DATAHEADERCOLUMN_PSGNUM> </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL/>
            <ns1:PARVW>WE</ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="extension_attributes/customer_code/text()"/>
            </ns1:PARTN>
            <ns1:NAME1>
              <xsl:value-of select="userCSharp:StringConcat(string(extension_attributes/shipping_assignments/shipping[1]/address/firstname/text()), &quot; &quot; , string(extension_attributes/shipping_assignments/shipping[1]/address/lastname/text()))"/>
            </ns1:NAME1>
            <ns1:STRAS>
              <xsl:value-of select="substring(extension_attributes/shipping_assignments/shipping[1]/address/street/text(), 1, 35)"/>
            </ns1:STRAS>
            <ns1:ORT01>
              <xsl:value-of select="extension_attributes/shipping_assignments/shipping[1]/address/city/text()"/>
            </ns1:ORT01>
            <ns1:PSTLZ>
              <xsl:value-of select="extension_attributes/shipping_assignments/shipping[1]/address/postcode/text()"/>
            </ns1:PSTLZ>
            <ns1:LAND1>
              <xsl:value-of select="extension_attributes/shipping_assignments/shipping[1]/address/country_id/text()"/>
            </ns1:LAND1>
            <ns1:TELF1>
              <xsl:value-of select="extension_attributes/shipping_assignments/shipping[1]/address/telephone/text()"/>
            </ns1:TELF1>
            <ns1:TELFX>
              <xsl:value-of select="extension_attributes/shipping_assignments/shipping[1]/address/fax/text()"/>
            </ns1:TELFX>
            <ns1:REGIO>
              <xsl:value-of select="ScriptNS1:GetInterfaceLookupData(string(extension_attributes/shipping_assignments/shipping[1]/address/region_id/text()) , &quot;SAP.Magento2.Region&quot;)"/>
            </ns1:REGIO>
          </ns1:E2EDKA1003>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDKA1003</ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT/>
            <ns1:DATAHEADERCOLUMN_SEGNUM/>
            <ns1:DATAHEADERCOLUMN_PSGNUM> </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL/>
            <ns1:PARVW>LF</ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="$var:plantNo"/>
            </ns1:PARTN>
          </ns1:E2EDKA1003>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDKA1003GRP>
          <ns1:E2EDKA1003>
            <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDKA1003</ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT/>
            <ns1:DATAHEADERCOLUMN_SEGNUM/>
            <ns1:DATAHEADERCOLUMN_PSGNUM> </ns1:DATAHEADERCOLUMN_PSGNUM>
            <ns1:DATAHEADERCOLUMN_HLEVEL/>
            <ns1:PARVW>AG</ns1:PARVW>
            <ns1:PARTN>
              <xsl:value-of select="extension_attributes/customer_code/text()"/>
            </ns1:PARTN>
            <ns1:NAME1>
              <xsl:value-of select="userCSharp:StringConcat(string(billing_address/firstname/text()), &quot; &quot; , string(billing_address/lastname/text()))"/>
            </ns1:NAME1>
            <ns1:STRAS>
              <xsl:value-of select="substring(billing_address/street/text(), 1, 35)"/>
            </ns1:STRAS>
            <ns1:ORT01>
              <xsl:value-of select="billing_address/city/text()"/>
            </ns1:ORT01>
            <ns1:PSTLZ>
              <xsl:value-of select="billing_address/postcode/text()"/>
            </ns1:PSTLZ>
            <ns1:LAND1>
              <xsl:value-of select="billing_address/country_id/text()"/>
            </ns1:LAND1>
            <ns1:TELF1>
              <xsl:value-of select="billing_address/telephone/text()"/>
            </ns1:TELF1>
            <ns1:TELFX>
              <xsl:value-of select="billing_address/fax/text()"/>
            </ns1:TELFX>
            <ns1:REGIO>
              <xsl:value-of select="ScriptNS1:GetInterfaceLookupData(string(billing_address/region_id/text()) , &quot;SAP.Magento2.Region&quot;)"/>
            </ns1:REGIO>
            <ns1:IHREZ>
              <xsl:value-of select="$var:entityId" />
            </ns1:IHREZ>
          </ns1:E2EDKA1003>
        </ns1:E2EDKA1003GRP>
        <ns1:E2EDK02>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK02</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
          <ns1:QUALF>001</ns1:QUALF>
          <ns1:BELNR>
            <xsl:value-of select="$var:incrementId" />
          </ns1:BELNR>        
        </ns1:E2EDK02>
        <ns1:E2EDKT1002GRP>
          <ns1:E2EDKT1002>
            <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDKT1002</ns1:DATAHEADERCOLUMN_SEGNAM>
            <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
            <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
            <ns1:DATAHEADERCOLUMN_PSGNUM/>
            <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
            <ns1:TDID>9201</ns1:TDID>
            <ns1:TSSPRAS>EN</ns1:TSSPRAS>
          </ns1:E2EDKT1002>

          <xsl:choose>
            <xsl:when test="string-length(extension_attributes/shipping_assignments/shipping[1]/address/street)>35">
              <xsl:call-template name="tokenize_shipping_comments">
                <xsl:with-param name="text" select="concat(extension_attributes/shipping_comment/text(), ' ', extension_attributes/shipping_assignments/shipping[1]/address/street/text())" />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="tokenize_shipping_comments">
                <xsl:with-param name="text" select="extension_attributes/shipping_comment/text()" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </ns1:E2EDKT1002GRP>
        <xsl:for-each select="items">
          <xsl:variable name="var:vZeile" select="item_id/text()"/>
          <ns1:E2EDP01010GRP>
            <ns1:E2EDP01010>
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP01010</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>             
              <xsl:if test="qty_ordered">
                <ns1:MENGE>
                  <xsl:value-of select="qty_ordered/text()" />
                </ns1:MENGE>
              </xsl:if>
              <!--<ns1:MENEE>EA</ns1:MENEE>
              <ns1:PMENE>EA</ns1:PMENE>-->
              <ns1:MENEE></ns1:MENEE>
              <ns1:PMENE></ns1:PMENE>
              <xsl:if test="price">
                <ns1:VPREI>
                  <xsl:value-of select="price/text()" />
                </ns1:VPREI>
              </xsl:if>
              <ns1:PEINH>1</ns1:PEINH>
              <xsl:if test="../../store_id">
                <ns1:WERKS>
                  <xsl:value-of select="../../store_id/text()" />
                </ns1:WERKS>
              </xsl:if>
              <ns1:POSEX>
                <xsl:value-of select="$var:vZeile" />
              </ns1:POSEX>
            </ns1:E2EDP01010>
            <ns1:E2EDP02001>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>001</ns1:QUALF>
              <ns1:BELNR>
                <xsl:value-of select="$var:incrementId" />
              </ns1:BELNR>
              <!--<ns1:ZEILE>
                <xsl:value-of select="$var:vZeile" />
              </ns1:ZEILE>-->
            </ns1:E2EDP02001>
            <xsl:if test="string($var:checkIfPONumber)='true'">
              <ns1:E2EDP02001>
                <ns1:DATAHEADERCOLUMN_SEGNAM/>
                <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM/>
                <ns1:DATAHEADERCOLUMN_HLEVEL/>
                <ns1:QUALF>044</ns1:QUALF>
                <ns1:BELNR>
                  <xsl:value-of select="$var:poNumber" />
                </ns1:BELNR>
                <!--<ns1:ZEILE>
                <xsl:value-of select="$var:vZeile" />
              </ns1:ZEILE>-->
              </ns1:E2EDP02001>

            </xsl:if>
            <ns1:E2EDP02001>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>083</ns1:QUALF>
              <ns1:BELNR>
                <xsl:value-of select="$var:plantNo" />
              </ns1:BELNR>
            </ns1:E2EDP02001>
            <ns1:E2EDP05002GRP>
              <!--<xsl:if test="string($var:checkIfPONumber)='false'">-->
              <ns1:E2EDP05002>
                <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP05002</ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM/>
                <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:KSCHL>ZVBM</ns1:KSCHL>
                <ns1:KRATE>
                  <xsl:value-of select="price/text()" />
                </ns1:KRATE>
                <ns1:UPRBS>1</ns1:UPRBS>
                <!--<ns1:MEAUN>EA</ns1:MEAUN>-->
                <ns1:MEAUN></ns1:MEAUN>
                <ns1:KOEIN>
                  <xsl:value-of select="string(../order_currency_code/text())" />
                </ns1:KOEIN>
              </ns1:E2EDP05002>
              <!--</xsl:if>-->
            </ns1:E2EDP05002GRP>
            <ns1:E2EDP19002>
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP19002</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF>002</ns1:QUALF>
              <xsl:if test="sku">
                <ns1:IDTNR>
                  <xsl:value-of select="sku/text()" />
                </ns1:IDTNR>
              </xsl:if>
              <xsl:if test="name">
                <ns1:KTEXT>
                  <xsl:value-of select="name/text()" />
                </ns1:KTEXT>
              </xsl:if>
            </ns1:E2EDP19002>
          </ns1:E2EDP01010GRP>
        </xsl:for-each>
        <xsl:if test="number(string(payment/shipping_amount/text()))!=0 and string($var:checkShippingCost)='true'">
          <ns1:E2EDP01010GRP>
            <ns1:E2EDP01010>
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP01010</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:MENGE>1</ns1:MENGE>
              <!--<ns1:MENEE>EA</ns1:MENEE>
              <ns1:PMENE>EA</ns1:PMENE>-->
              <ns1:MENEE></ns1:MENEE>
              <ns1:PMENE></ns1:PMENE>
              <xsl:if test="price">
                <ns1:VPREI>
                  <xsl:value-of select="string(payment/shipping_amount/text())" />
                </ns1:VPREI>
              </xsl:if>
              <ns1:PEINH>1</ns1:PEINH>
              <xsl:if test="store_id">
                <ns1:WERKS>
                  <xsl:value-of select="store_id/text()" />
                </ns1:WERKS>
              </xsl:if>
            </ns1:E2EDP01010>
            <ns1:E2EDP02001>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>001</ns1:QUALF>
              <ns1:BELNR>
                <xsl:value-of select="$var:incrementId" />
              </ns1:BELNR>
            </ns1:E2EDP02001>
            <ns1:E2EDP02001>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>083</ns1:QUALF>
              <ns1:BELNR>
                <xsl:value-of select="$var:plantNo" />
              </ns1:BELNR>
            </ns1:E2EDP02001>
            <ns1:E2EDP05002GRP>
              <ns1:E2EDP05002>
                <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP05002</ns1:DATAHEADERCOLUMN_SEGNAM>
                <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
                <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
                <ns1:DATAHEADERCOLUMN_PSGNUM/>
                <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
                <ns1:KSCHL>ZVBM</ns1:KSCHL>
                <ns1:KRATE>
                  <xsl:value-of select="string(payment/shipping_amount/text())" />
                </ns1:KRATE>
                <ns1:UPRBS>1</ns1:UPRBS>
                <!--<ns1:MEAUN>EA</ns1:MEAUN>-->
                <ns1:MEAUN>EA</ns1:MEAUN>
                <ns1:KOEIN>
                  <xsl:value-of select="string(../order_currency_code/text())" />
                </ns1:KOEIN>
              </ns1:E2EDP05002>
            </ns1:E2EDP05002GRP>
            <ns1:E2EDP19002>
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP19002</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:QUALF>002</ns1:QUALF>
              <ns1:IDTNR>FREIGHT</ns1:IDTNR>
            </ns1:E2EDP19002>
          </ns1:E2EDP01010GRP>
        </xsl:if>
      </ns0:idocData>
    </ns0:Send>
  </xsl:template>

  <xsl:template name="tokenize_shipping_comments">
    <xsl:param name="text"/>
    <xsl:variable name="var:sILen" select="string-length($text) div 70"/>
    <ns1:E2EDKT2001>
      <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDKT2001</ns1:DATAHEADERCOLUMN_SEGNAM>
      <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
      <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
      <ns1:DATAHEADERCOLUMN_PSGNUM/>
      <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
      <ns1:TDLINE>
        <xsl:value-of select="substring($text, 1, 70)"/>
      </ns1:TDLINE>
      <xsl:if test="$var:sILen > 1">
        <ns1:TDFORMAT>
          <xsl:value-of select="'/'"/>
        </ns1:TDFORMAT>
      </xsl:if>
    </ns1:E2EDKT2001>

    <xsl:if test="$var:sILen > 1">
      <xsl:call-template name="tokenize_shipping_comments">
        <xsl:with-param name="text" select="substring($text, 71, string-length($text)-70)"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>


  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
    public string StringConcat(string param0)
    {
       return param0;
    }


    public string DateCurrentDate()
    {
	    DateTime dt = DateTime.Now;
	    return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
    }


    public string DateCurrentTime()
    {
	    DateTime dt = DateTime.Now;
	    return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
    }


    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string EDI_DC40_CRETIM_ReplaceColon(string param1)
    {
	    return param1.Replace(":", "");
    }


    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string EDI_DC40_ARCKEY_GenerateGUID()
    {
           return System.Guid.NewGuid().ToString();
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


    public string StringConcat(string param0, string param1, string param2)
    {
       return param0 + param1 + param2;
    }


    public string StringTrimLeft(string str)
    {
	    if (str == null)
	    {
		    return "";
	    }
	    return str.TrimStart(null);
    }


    public string StringTrimRight(string str)
    {
	    if (str == null)
	    {
		    return "";
	    }
	    return str.TrimEnd(null);
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


    public string StringConcat(string param0, string param1)
    {
       return param0 + param1;
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


]]>
  </msxsl:script>
</xsl:stylesheet>