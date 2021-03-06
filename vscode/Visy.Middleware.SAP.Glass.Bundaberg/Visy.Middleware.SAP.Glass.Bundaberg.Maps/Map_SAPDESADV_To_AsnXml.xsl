<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" version="1.0"
  exclude-result-prefixes="msxsl var s0 s1 s2 ScriptNS0 ScriptNS2 userCSharp ns0 ns1"
  xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
  xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
  xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DELVRY07//740"
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
  xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
  xmlns:add="http://www.w3.org/2005/08/addressing"
  xmlns:qdoc="urn:schemas-qad-com:xml-services"
  xmlns:ns1="urn:schemas-qad-com:xml-services:common"
  xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DELVRY07//740/Receive"
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">

  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
  <xsl:key use="s0:E2EDL24007/s0:CHARG" match="/s1:Receive/s1:idocData/s0:E2EDK08001GRP/s0:E2EDP07001GRP/s0:E2EDL24007GRP" name="groups"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">


    <xsl:variable name="var:vPayLoadId" select="userCSharp:PayLoadId_GenerateGUID()" />

    <xsl:variable name="var:vShipDate" select="ScriptNS2:FormateDateNew(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDT13001GRP[s0:E2EDT13001/s0:QUALF/text()='006']/s0:E2EDT13001/s0:NTANF/text()), &quot;yyyy-MM-dd&quot;, &quot;yyyyMMdd&quot;)" />
    <xsl:variable name="var:vDeliveryDate" select="ScriptNS2:FormateDateNew(string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDT13001GRP[s0:E2EDT13001/s0:QUALF/text()='007']/s0:E2EDT13001/s0:NTANF/text()), &quot;yyyy-MM-dd&quot;, &quot;yyyyMMdd&quot;)" />

    <xsl:variable name="var:vDeliveryId" select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:VBELN/text())" />

    <xsl:variable name="var:vOrderNumber" select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP[1]/s0:E2EDL43000[s0:QUALF='C']/s0:BELNR/text())" />
    <xsl:variable name="var:vPlant" select="string(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL20003/s0:VSTEL/text())" />


    <xsl:variable name="var:vLineItemCount" select="count(s1:idocData/s0:E2EDL20003GRP/s0:E2EDL24007GRP)" />


    <xsl:variable name="var:vShipFrom" select="'ACIGLA'" />
    <xsl:variable name="var:vScxPO" select="'ACIGLA01'" />
    <ns0:Envelope>
      <ns0:Body>
        <qdoc:maintainPOShipper>
          <qdoc:dsPOShipper>
            <xsl:for-each select="s1:idocData">
              <xsl:for-each select="s0:E2EDL20003GRP">
                <qdoc:ttPOShipper>
                  <qdoc:absId>
                    <xsl:value-of select="$var:vDeliveryId" />
                  </qdoc:absId>
                  <qdoc:absShipFrom>
                    <xsl:value-of select="$var:vShipFrom" />
                  </qdoc:absShipFrom>
                  <qdoc:absShipTo>
                    <xsl:value-of select="'BBD'" />
                  </qdoc:absShipTo>
                  <xsl:for-each select="s0:E2EDL24007GRP[string(s0:E2EDL24007/s0:CHARG/text()) != '']">
                    
                    <xsl:if test="substring(substring(concat('000000', s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text()), string-length(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text()) + 1, 6), 2, 5) = ''">             
                        <xsl:message terminate="yes">
                          Missing POSEX value
                        </xsl:message>             
                    </xsl:if>
                    
                    <xsl:variable name="var:vShipNoticeLineNumber" select="number(s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:POSEX/text())" />
                    <xsl:variable name="var:vBuyerPartId" select="string(s0:E2EDL24007/s0:MATKL/text())" />
                    <xsl:variable name="var:vKDMAT" select="string(s0:E2EDL24007/s0:KDMAT/text())" />
                    <!--<xsl:variable name="var:vSerialNumber" select="string(s0:E2EDL24007/s0:KDMAT/text())" />-->
                    <xsl:variable name="var:vSupplierPartId" select="string(s0:E2EDL24007/s0:MATNR/text())" />
                    <!--<xsl:variable name="var:vMaterialDesc" select="string(s0:E2EDL24007/s0:ARKTX/text())" />-->
                    <xsl:variable name="var:vQTYValueEA" select="string(s0:E2EDL24007/s0:LGMNG/text())" />
                    <xsl:variable name="var:vQTYValuePAL" select="string(s0:E2EDL24007/s0:LFIMG/text())" />
                    <xsl:variable name="var:vUOMValue" select="string(s0:E2EDL24007/s0:MEINS/text())" />
                    <xsl:variable name="var:vUnitPrice" select="string(s0:E2EDL24007/s0:BRGEW/text())" />
                    <xsl:variable name="var:vSupplierBatchID" select="string(s0:E2EDL24007/s0:CHARG/text())" />
                    <!--<xsl:variable name="var:vSupplierAuxId" select="string(s0:E2EDL24007/s0:EAN11/text())" />-->
                    <xsl:variable name="var:vPONumber" select="s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:BSTNR/text()" />
                    <xsl:variable name="var:vProdDate" select="ScriptNS2:FormateDateNew(string(s0:E2EDL15[s0:ATNAM/text()='Z_MANUF_DATE']/s0:ATWRT/text()), 'yyMMdd', 'dd.MM.yyyy')" />
                    <qdoc:ttPOShipperItem>
                      <qdoc:absId>
                        <xsl:value-of select="$var:vDeliveryId" />
                      </qdoc:absId>
                      <qdoc:absShipFrom>
                        <xsl:value-of select="$var:vShipFrom" />
                      </qdoc:absShipFrom>
                      <qdoc:scxPart>
                        <xsl:value-of select="$var:vKDMAT" />
                      </qdoc:scxPart>
                      <qdoc:scxPo>
                        <xsl:value-of select="$var:vScxPO" />
                      </qdoc:scxPo>
                      <qdoc:scxLine><xsl:value-of select="$var:vShipNoticeLineNumber" /></qdoc:scxLine>
                      <qdoc:multiEntry>
                        <xsl:value-of select="'True'" />
                      </qdoc:multiEntry>
                      <xsl:for-each select="../s0:E2EDL37005GRP[s0:E2EDL44004GRP/s0:E2EDL44004/s0:MATNR=$var:vSupplierPartId and s0:E2EDL44004GRP/s0:E2EDL44004/s0:CHARG = $var:vSupplierBatchID]">                       
                        <qdoc:ttShipperItemMultiLineEntry>
                          <qdoc:absId>
                            <xsl:value-of select="$var:vDeliveryId" />
                          </qdoc:absId>
                          <qdoc:absShipFrom>
                            <xsl:value-of select="$var:vShipFrom" />
                          </qdoc:absShipFrom>
                          <qdoc:scxPart>
                            <xsl:value-of select="$var:vKDMAT" />
                          </qdoc:scxPart>
                          <qdoc:scxPo>
                            <xsl:value-of select="$var:vScxPO" />
                          </qdoc:scxPo>
                          <qdoc:scxLine>
                            <xsl:value-of select="$var:vShipNoticeLineNumber" />
                          </qdoc:scxLine>
                          <qdoc:srSite>
                            <xsl:value-of select="'BBD'" />
                          </qdoc:srSite>
                          <qdoc:srLoc>
                            <xsl:value-of select="'DOCK2'" />
                          </qdoc:srLoc>
                          <xsl:variable name="var:siteSettings" select="ScriptNS0:GetInterfaceLookupData(substring($var:vSupplierBatchID, 1, 3) , &quot;SAP.Glass.Bundaberg.SiteSettings&quot;)" />
                          <qdoc:srLotser> 
                                <xsl:value-of select="concat($var:vProdDate, $var:siteSettings)" />
                          </qdoc:srLotser>
                          <qdoc:srRef>
                            <xsl:value-of select="substring(number(s0:E2EDL37005/s0:EXIDV/text()), 4, string-length(number(s0:E2EDL37005/s0:EXIDV/text())))" />
                          </qdoc:srRef>
                          <!--<qdoc:srVendLot>1</qdoc:srVendLot>-->
                          <qdoc:srQty>
                            <xsl:value-of select="s0:E2EDL44004GRP/s0:E2EDL44004/s0:VEMNG" />
                            <!--<xsl:choose>
                              <xsl:when test="$var:vUOMValue = 'EA'">
                                <xsl:value-of select="$var:vQTYValueEA" />
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$var:vQTYValuePAL" />
                              </xsl:otherwise>
                            </xsl:choose>-->
                          </qdoc:srQty>
                        </qdoc:ttShipperItemMultiLineEntry>
                      </xsl:for-each>
                    </qdoc:ttPOShipperItem>
                  </xsl:for-each>
                  <qdoc:ttShipperCarrier>
                    <qdoc:absId>
                      <xsl:value-of select="$var:vDeliveryId" />
                    </qdoc:absId>
                    <qdoc:absShipFrom>
                      <xsl:value-of select="$var:vShipFrom" />
                    </qdoc:absShipFrom>
                    <qdoc:carrierRef>
                      <xsl:value-of select="s0:E2EDL24007GRP[string(s0:E2EDL24007/s0:CHARG/text()) != '']/s0:E2EDL41000GRP/s0:E2EDL41000[s0:QUALI='001']/s0:BSTNR/text()" />
                    </qdoc:carrierRef>
                    <qdoc:carrierRef2>
                      <xsl:value-of select="$var:vOrderNumber" />
                    </qdoc:carrierRef2>
                    <qdoc:absShipvia>
                      <xsl:value-of select="s0:E2EDL18[s0:QUALF='ZTL']/s0:PARAM"/>
                    </qdoc:absShipvia>
                    <qdoc:absFob>
                      <xsl:value-of select="s0:E2EDL20003/s0:INCO1"/>
                    </qdoc:absFob>
                    <qdoc:absVehRef>
                      <xsl:value-of select="s0:E2EDL18[s0:QUALF='ZTL']/s0:PARAM"/>
                    </qdoc:absVehRef>
                    <qdoc:absiVoyage>1659242</qdoc:absiVoyage>
                    <qdoc:absiPortDepart>
                      <xsl:value-of select="$var:vPlant" />
                    </qdoc:absiPortDepart>
                    <qdoc:absShipDate>
                      <xsl:value-of select="$var:vShipDate" />
                    </qdoc:absShipDate>
                    <qdoc:absiDueDate>
                      <xsl:value-of select="$var:vDeliveryDate" />
                    </qdoc:absiDueDate>
                  </qdoc:ttShipperCarrier>
                </qdoc:ttPOShipper>
              </xsl:for-each>
            </xsl:for-each>
          </qdoc:dsPOShipper>
        </qdoc:maintainPOShipper>
      </ns0:Body>
    </ns0:Envelope>


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