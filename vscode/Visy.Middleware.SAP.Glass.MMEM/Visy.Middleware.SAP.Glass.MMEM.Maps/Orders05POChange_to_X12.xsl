<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 s2 s1"
                version="1.0"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//740"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//740/Receive"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <ns0:X12_00401_860>
      <ST>
        <ST01>860</ST01>
        <ST02>1001</ST02>
      </ST>
      <ns0:BCH>
        <BCH01>04</BCH01>
        <BCH02>SA</BCH02>
        <BCH03>
          <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF='001']/s0:BELNR/text()" />
        </BCH03>
        <BCH06>
          <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF='001']/s0:DATUM/text()" />
        </BCH06>
      </ns0:BCH>
      <ns0:CUR>
        <CUR01>BY</CUR01>
        <CUR02>
          <xsl:value-of select="s1:idocData/s0:E2EDK01005/s0:CURCY/text()" />
        </CUR02>
      </ns0:CUR>
      <ns0:PER>
        <PER01>BD</PER01>
        <PER02>         
          <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:NAME1/text()" />
        </PER02>
        <PER03>TE</PER03>
        <PER04>
          <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:TELF1/text()" />
        </PER04>
        <PER05>FX</PER05>
        <PER06>
          <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:TELFX/text()" />
        </PER06>
      </ns0:PER>
      <ns0:N1Loop1>
        <ns0:N1>
          <N101>BT</N101>
          <N102>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='AG']/s0:ORGTX/text()" />
          </N102>
          <N103>92</N103>
          <N104>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='AG']/s0:PARTN/text()" />
          </N104>
        </ns0:N1>
      </ns0:N1Loop1>
      <ns0:N1Loop1>
        <ns0:N1>
          <N101>ST</N101>
          <N102>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:NAME1/text()" />
          </N102>
          <N103>92</N103>
          <N104>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:LIFNR/text()" />
          </N104>
        </ns0:N1>
        <ns0:N3>
          <N301>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:NAME1/text()" />
          </N301>
          <N302>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:STRAS/text()" />
          </N302>
        </ns0:N3>
        <ns0:N4>
          <N401>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:ORT01/text()" />
          </N401>
          <N402>
            <xsl:variable name="varRegion" select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:REGIO"></xsl:variable>
            <xsl:choose>
              <xsl:when test="$varRegion = 'TAS'">
                <xsl:value-of select="'TA'"/>
              </xsl:when>
              <xsl:when test="$varRegion = 'QLD'">
                <xsl:value-of select="'QL'"/>
              </xsl:when>
              <xsl:when test="$varRegion = 'ACT'">
                <xsl:value-of select="'AC'"/>
              </xsl:when>
              <xsl:when test="$varRegion = 'VIC'">
                <xsl:value-of select="'VI'"/>
              </xsl:when>
              <xsl:when test="$varRegion = 'AUK'">
                <xsl:value-of select="'NZ'"/>
              </xsl:when>
              <xsl:when test="$varRegion = 'NSW'">
                <xsl:value-of select="'NS'"/>
              </xsl:when>
              <xsl:when test="$varRegion = '042'">
                <xsl:value-of select="'DU'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$varRegion"/>
              </xsl:otherwise>
            </xsl:choose>          
            <!--<xsl:value-of select="substring(s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:REGIO/text(), 1, 2)" />-->
          </N402>
          <N403>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:PSTLZ/text()" />
          </N403>
          <N404>
            <xsl:value-of select="s1:idocData/s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW='WE']/s0:LAND1/text()" />
          </N404>
        </ns0:N4>
      </ns0:N1Loop1>
      <xsl:for-each select="s1:idocData/s0:E2EDP01010GRP">
        <ns0:POCLoop1>
          <ns0:POC>
            <POC01>
              <xsl:value-of select="s0:E2EDP01010/s0:POSEX/text()" />
            </POC01>
            <POC02>
              <xsl:value-of select="'MU'" />
            </POC02>
            <POC03>
              <xsl:value-of select="number(s0:E2EDP01010/s0:MENGE/text())" />
            </POC03>
            <POC04>
              <xsl:value-of select="s0:E2EDP01010/s0:MENGE/text()" />
            </POC04>
            <C001_5>
              <C00101> <xsl:value-of select="s0:E2EDP01010/s0:PEINH/text()" /></C00101>
            </C001_5>           
            <POC06>
              <xsl:value-of select="s0:E2EDP01010/s0:VPREI/text()" />
            </POC06>           
          </ns0:POC>
          <ns0:PIDLoop1>
            <ns0:PID_2>
              <PID01>F</PID01>
              <PID05>
                <xsl:value-of select="s0:E2EDP19002[s0:QUALF='001']/s0:KTEXT/text()" />
              </PID05>
            </ns0:PID_2>
          </ns0:PIDLoop1>
          <ns0:DTM_7>
            <DTM01>002</DTM01>
            <DTM02>
              <xsl:value-of select="s0:E2EDP20002/s0:EDATU/text()" />
            </DTM02>
          </ns0:DTM_7>
        </ns0:POCLoop1>
      </xsl:for-each>      
      <ns0:CTTLoop1>
        <ns0:CTT>
          <CTT01>
            <xsl:value-of select="count(s1:idocData/s0:E2EDP01010GRP)" />
          </CTT01>
        </ns0:CTT>
      </ns0:CTTLoop1>
      <SE>
        <SE01>16</SE01>
        <SE02>1001</SE02>
      </SE>
    </ns0:X12_00401_860>
  </xsl:template>
</xsl:stylesheet>