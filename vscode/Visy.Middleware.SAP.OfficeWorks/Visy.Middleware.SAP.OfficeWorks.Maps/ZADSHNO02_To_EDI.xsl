<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s1 s2 s0 userCSharp" version="1.0"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZADSHNO02//740/Receive"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZADSHNO02//740"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:asnNo" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:ASN_NO/text())" />
    <xsl:variable name="var:poNumber" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:PO_NO/text())" />
    <xsl:variable name="var:deliveryDate" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:DELIVERY_DATE/text())" />
    <xsl:variable name="var:despatchDate" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:DESPATCH_DATE/text())" />
    <xsl:variable name="var:poDateTime" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:PO_DATE/text())" />
    <xsl:variable name="var:idocDate" select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:IDOC_DATE/text())" />
    <xsl:variable name="var:itemCount" select="count(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_LOCATION000GRP/s0:ZASN_HUDETAILS000)" />
    <ns0:EFACT_D96A_DESADV>
      <UNH>
        <UNH1>17614</UNH1>
        <UNH2>
          <UNH2.1>DESADV</UNH2.1>
          <UNH2.2>D</UNH2.2>
          <UNH2.3>96A</UNH2.3>
          <UNH2.4>UN</UNH2.4>
          <UNH2.5>EAN005</UNH2.5>
        </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>YA5</C00201>
          <C00203>9</C00203>
        </ns0:C002>
        <xsl:if test="$var:asnNo">
          <BGM02>
            <xsl:value-of select="$var:asnNo" />
          </BGM02>
        </xsl:if>
        <BGM03>9</BGM03>
      </ns0:BGM>
      <xsl:if test="$var:idocDate">
        <ns0:DTM>
          <ns0:C507>
            <C50701>137</C50701>
            <C50702>
              <xsl:value-of select="$var:idocDate" />
            </C50702>
            <C50703>203</C50703>
          </ns0:C507>
        </ns0:DTM>
      </xsl:if>
      <xsl:if test="$var:despatchDate">
        <ns0:DTM>
          <ns0:C507>
            <C50701>11</C50701>
            <C50702>
              <xsl:value-of select="$var:despatchDate" />
            </C50702>
            <C50703>102</C50703>
          </ns0:C507>
        </ns0:DTM>
      </xsl:if>
      <xsl:if test="$var:deliveryDate">
        <ns0:DTM>
          <ns0:C507>
            <C50701>17</C50701>
            <C50702>
              <xsl:value-of select="$var:deliveryDate" />
            </C50702>
            <C50703>102</C50703>
          </ns0:C507>
        </ns0:DTM>
      </xsl:if>


      <ns0:ALI>
        <ALI03>X7</ALI03>
        <xsl:if test="s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:SHIPMENT_STATUS">
          <ALI04>
            <xsl:value-of select="s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:SHIPMENT_STATUS/text()" />
          </ALI04>
        </xsl:if>
      </ns0:ALI>

      <ns0:RFFLoop1>
        <ns0:RFF>
          <ns0:C506>
            <C50601>ON</C50601>
            <xsl:if test="$var:poNumber">
              <C50602>
                <xsl:value-of select="$var:poNumber" />
              </C50602>
            </xsl:if>
          </ns0:C506>
        </ns0:RFF>
        <xsl:if test="$var:poDateTime">
          <ns0:DTM_2>
          <ns0:C507_2>
            <C50701>171</C50701>
            <C50702><xsl:value-of select="$var:poDateTime" /></C50702>
            <C50703>102</C50703>
          </ns0:C507_2>
        </ns0:DTM_2>
        </xsl:if>      
      </ns0:RFFLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>SU</NAD01>
          <ns0:C082>
            <C08201>9325557847917</C08201>
            <C08203>92</C08203>
          </ns0:C082>
        </ns0:NAD>
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>ST</NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:SHIP_TO_CODE/text())" />
            </C08201>
            <C08203>92</C08203>
          </ns0:C082>
        </ns0:NAD>
      </ns0:NADLoop1>
      <ns0:CPSLoop1>
        <ns0:CPS>
          <CPS01>1</CPS01>
          <CPS03>1E</CPS03>
        </ns0:CPS>
        <ns0:PACLoop1>
          <ns0:PAC>
            <PAC01>
              <xsl:value-of select="userCSharp:MathInt(string(s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_HEADER000/s0:NUMBER_OF_HU/text()))" />
            </PAC01>
            <ns0:C202>
              <C20201>CT</C20201>
            </ns0:C202>
          </ns0:PAC>
        </ns0:PACLoop1>
      </ns0:CPSLoop1>

      <xsl:for-each select="s1:idocData/s0:ZASN_HEADER000GRP/s0:ZASN_LOCATION000GRP">
        <xsl:variable name="cpsNum" select="userCSharp:setCPSNumber()" />
        <ns0:CPSLoop1>
          <ns0:CPS>
            <CPS01>
              <xsl:value-of select="userCSharp:incrementCTR()" />
            </CPS01>
            <CPS02>1</CPS02>
            <CPS03>3</CPS03>
          </ns0:CPS>
          <ns0:LINLoop1>
            <ns0:LIN>
              <LIN01>0</LIN01>
            </ns0:LIN>
            <ns0:LOCLoop2>
              <ns0:LOC_4>
                <LOC01>8</LOC01>
                <ns0:C517_4>
                  <C51701>
                    <xsl:value-of select="string(s0:ZASN_LOCATION000/s0:LOCATION_CODE/text())" />
                  </C51701>
                  <C51703>92</C51703>
                </ns0:C517_4>
              </ns0:LOC_4>
            </ns0:LOCLoop2>
          </ns0:LINLoop1>
        </ns0:CPSLoop1>

        <xsl:for-each select="s0:ZASN_HUDETAILS000">
          <xsl:call-template name="lineItemsTemplate">
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>

      <ns0:CNT>
        <ns0:C270>
          <C27001>2</C27001>
          <C27002>54</C27002>
        </ns0:C270>
      </ns0:CNT>
      <ns0:CNT>
        <ns0:C270>
          <C27001>1</C27001>
          <C27002>864</C27002>
        </ns0:C270>
      </ns0:CNT>
      <UNT>
        <UNT1>372</UNT1>
        <UNT2>17614</UNT2>
      </UNT>
    </ns0:EFACT_D96A_DESADV>
  </xsl:template>
  <xsl:template name="lineItemsTemplate">
    <ns0:CPSLoop1>
      <ns0:CPS>
        <CPS01>
          <xsl:value-of select="userCSharp:incrementCTR()" />
        </CPS01>
        <CPS02>
          <xsl:value-of select="userCSharp:getCPSNumber()" />
        </CPS02>
        <CPS03>1</CPS03>
      </ns0:CPS>
      <ns0:PACLoop1>
        <ns0:PAC>
          <PAC01>1</PAC01>
          <ns0:C202>
            <C20201>CT</C20201>
          </ns0:C202>
        </ns0:PAC>
        <ns0:PCILoop1>
          <ns0:PCI>
            <PCI01>33E</PCI01>
          </ns0:PCI>
          <ns0:GINLoop1>
            <ns0:GIN>
              <GIN01>BJ</GIN01>
              <ns0:C208>
                <C20801>
                  <xsl:value-of select="s0:SSCC_NO/text()" />
                </C20801>
              </ns0:C208>
            </ns0:GIN>
          </ns0:GINLoop1>
        </ns0:PCILoop1>
      </ns0:PACLoop1>
      <ns0:LINLoop1>
        <ns0:LIN>
          <LIN01>
            <xsl:value-of select="userCSharp:incrementLineCTR()" />
          </LIN01>
          <ns0:C212>
            <C21201>
              <xsl:value-of select="s0:EAN_NO/text()" />
            </C21201>
            <C21202>EN</C21202>
          </ns0:C212>
        </ns0:LIN>
        <ns0:QTY_2>
          <ns0:C186_2>
            <C18601>12</C18601>
            <C18602>
              <xsl:value-of select="userCSharp:MathInt(string(s0:QTY/text()))" />
            </C18602>
          </ns0:C186_2>
        </ns0:QTY_2>
      </ns0:LINLoop1>
    </ns0:CPSLoop1>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[    
        public int cpsCTR = 1;
        public int lineCTR = 0;
        public int cpsNumber = 0;
        
        public int incrementCTR()
        {	       
	        cpsCTR = cpsCTR + 1;
          
          return cpsCTR;
        }
        
        public int incrementLineCTR()
        {	       
	        lineCTR = lineCTR + 1;
          
          return lineCTR;
        }
        
        public void setCPSNumber(){
          cpsNumber = cpsCTR + 1;
        }       
        
        public int getCPSNumber(){
          return cpsNumber;
        }       
        
        
        public string MathInt(string val)
        {
	        string retval = "";
	        double d = 0;
	        if (IsNumeric(val, ref d))
	        {
		        try
		        {
			        int i = Convert.ToInt32(d, System.Globalization.CultureInfo.InvariantCulture);
			        if (i > d)
			        {
				        i = i-1;
			        }
			        retval = i.ToString(System.Globalization.CultureInfo.InvariantCulture);
		        }
		        catch (Exception)
		        {
		        }
	        }
	        return retval;
        }


        public string StringConcat(string param0)
        {
           return param0;
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


        public string StringTrimLeft(string str) { 
            if (str == null) { 
              return ""; 
            } 
            return str.TrimStart(null); 
        } 

        public string StringTrimRight(string str) { 
          if (str == null) { 
            return ""; 
          } 
          return str.TrimEnd(null); 
        }
    ]]>
  </msxsl:script>
</xsl:stylesheet>