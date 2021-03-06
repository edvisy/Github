<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0" version="1.0" 
                xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//740" 
                xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//740/Send" 
                xmlns:ns2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006" 
                xmlns:ns3="http://schemas.microsoft.com/2003/10/Serialization/">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:X12_00401_855" />
  </xsl:template>
  <xsl:template match="/s0:X12_00401_855">
    <xsl:variable name="var_PoNumber" select="/s0:X12_00401_855/s0:BAK/BAK03/text()"/>
    <ns0:Send>
      <ns0:idocData>
        <ns1:EDI_DC40>
          <ns2:TABNAM>EDI_DC40</ns2:TABNAM>
          <ns2:DIRECT>2</ns2:DIRECT>
          <ns2:IDOCTYP>ORDERS05</ns2:IDOCTYP>
          <ns2:MESTYP>ORDRSP</ns2:MESTYP>
          <ns2:SNDPOR>BIZTALK</ns2:SNDPOR>
          <ns2:SNDPRT>LI</ns2:SNDPRT>
          <ns2:SNDPFC>LF</ns2:SNDPFC>
          <ns2:SNDPRN>250532</ns2:SNDPRN>
          <ns2:RCVPOR>SAPSP1</ns2:RCVPOR>
          <ns2:RCVPRT>LI</ns2:RCVPRT>
          <ns2:RCVPFC>LF</ns2:RCVPFC>
          <ns2:RCVPRN>250532</ns2:RCVPRN>
        </ns1:EDI_DC40>
        <ns1:E2EDK01005>
          <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDK01005</ns1:DATAHEADERCOLUMN_SEGNAM>
          <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
          <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
          <ns1:DATAHEADERCOLUMN_PSGNUM/>
          <ns1:BELNR>
            <xsl:value-of select="$var_PoNumber"/>
          </ns1:BELNR>
        </ns1:E2EDK01005>        
        <ns1:E2EDK02>
          <ns1:QUALF>001</ns1:QUALF>
          <ns1:BELNR>
            <xsl:value-of select="$var_PoNumber"/>
          </ns1:BELNR>
          <ns1:DATUM>
            <xsl:value-of select="/s0:X12_00401_855/s0:BAK/BAK04/text()"/>
          </ns1:DATUM>
        </ns1:E2EDK02>
        <ns1:E2EDK02>
          <ns1:QUALF>002</ns1:QUALF>
          <ns1:BELNR>
            <xsl:value-of select="/s0:X12_00401_855/s0:BAK/BAK09/text()"/>
          </ns1:BELNR>
        </ns1:E2EDK02>
        <xsl:for-each select="/s0:X12_00401_855/s0:PO1Loop1">
          <ns1:E2EDP01010GRP>
            <ns1:E2EDP01010>
              <ns1:DATAHEADERCOLUMN_SEGNAM>E2EDP01010</ns1:DATAHEADERCOLUMN_SEGNAM>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL> </ns1:DATAHEADERCOLUMN_HLEVEL>
              <ns1:POSEX>
                <xsl:value-of select="s0:PO1/PO101/text()"/>
              </ns1:POSEX>
              <ns1:MENEE>
                <xsl:value-of select="s0:PO1/PO103/text()"/>
              </ns1:MENEE>
              <ns1:BMNG2>
                <xsl:value-of select="s0:PO1/PO102/text()"/>
              </ns1:BMNG2>
              <ns1:PMENE>
                <xsl:value-of select="s0:PO1/PO103/text()"/>
              </ns1:PMENE>
              <ns1:VPREI>
                <xsl:value-of select="s0:PO1/PO104/text()"/>
              </ns1:VPREI>
              <ns1:PEINH>
                <xsl:value-of select="s0:PO1/PO105/text()"/>
              </ns1:PEINH>
            </ns1:E2EDP01010>
            <ns1:E2EDP02001>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>001</ns1:QUALF>
              <ns1:BELNR>
                <xsl:value-of select="$var_PoNumber"/>
              </ns1:BELNR>
              <ns1:ZEILE>
                <xsl:value-of select="s0:PO1/PO101/text()"/>
              </ns1:ZEILE>
            </ns1:E2EDP02001>
            <xsl:for-each select="s0:ACKLoop1">
              <ns1:E2EDP20002>
                <ns1:WMENG>
                  <xsl:value-of select="s0:ACK/ACK02/text()"/>
                </ns1:WMENG>
                <ns1:EDATU>
                  <xsl:value-of select="s0:ACK/ACK05/text()"/>
                </ns1:EDATU>
              </ns1:E2EDP20002>
            </xsl:for-each>
            <ns1:E2EDP19002>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>             
              <ns1:QUALF>001</ns1:QUALF>
              <ns1:IDTNR>
                <xsl:value-of select="s0:PO1/PO107/text()"/>
              </ns1:IDTNR>
              <ns1:KTEXT>
                <xsl:value-of select="s0:PIDLoop1[s0:PID_2/PID01='F']/s0:PID_2/PID05/text()"/>
              </ns1:KTEXT>
            </ns1:E2EDP19002>
            <ns1:E2EDP19002>
              <ns1:DATAHEADERCOLUMN_SEGNAM/>
              <ns1:DATAHEADERCOLUMN_MANDT> </ns1:DATAHEADERCOLUMN_MANDT>
              <ns1:DATAHEADERCOLUMN_SEGNUM> </ns1:DATAHEADERCOLUMN_SEGNUM>
              <ns1:DATAHEADERCOLUMN_PSGNUM/>
              <ns1:DATAHEADERCOLUMN_HLEVEL/>
              <ns1:QUALF>002</ns1:QUALF>
              <ns1:IDTNR>
                <xsl:value-of select="s0:PO1/PO109/text()"/>
              </ns1:IDTNR>
            </ns1:E2EDP19002>           
          </ns1:E2EDP01010GRP>
        </xsl:for-each>
        <ns1:E2EDS01>
          <ns1:SUMID>001</ns1:SUMID>
          <ns1:SUMME>
            <xsl:value-of select="/s0:X12_00401_855/s0:CTTLoop1[1]/s0:CTT/CTT01"/>
          </ns1:SUMME>
        </ns1:E2EDS01>
      </ns0:idocData>
    </ns0:Send>
  </xsl:template>
</xsl:stylesheet>