<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 userCSharp"
                version="1.0"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZPOAORD01//740"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZPOAORD01//740/Receive"
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:LineItemCount" select="count(s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_LINEDET000GRP)" />

    <ns0:EFACT_D96A_ORDRSP>
      <UNH>
        <UNH1>
          <xsl:value-of select="'1'" />
        </UNH1>
        <UNH2>
          <UNH2.1>
            <xsl:value-of select="'ORDRSP'" />
          </UNH2.1>
          <UNH2.2>
            <xsl:value-of select="'D'" />
          </UNH2.2>
          <UNH2.3>
            <xsl:value-of select="'96A'" />
          </UNH2.3>
          <UNH2.4>
            <xsl:value-of select="'UN'" />
          </UNH2.4>
          <UNH2.5>
            <xsl:value-of select="'EAN005'" />
          </UNH2.5>
        </UNH2>
      </UNH>
      
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'231'" />
          </C00201>
        </ns0:C002>
        <BGM02>
          <xsl:value-of select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_HEADER000/s0:PO_NO/text()" />
        </BGM02>
        <BGM03>
          <xsl:value-of select="'4'" />
        </BGM03>
      </ns0:BGM>

      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'137'" />
          </C50701>
          <C50702>
            <xsl:value-of select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_HEADER000/s0:PO_DATE/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>


      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'2'" />
          </C50701>
          <C50702>
            <xsl:value-of select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_HEADER000/s0:DELIVERY_DATE/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>

      <ns0:RFFLoop1>
        <ns0:RFF>
          <ns0:C506>
            <C50601>
              <xsl:value-of select="'ON'" />
            </C50601>
            <C50602>
              <xsl:value-of select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_HEADER000/s0:PO_NO_REF/text()" />
            </C50602>
          </ns0:C506>
        </ns0:RFF>
      </ns0:RFFLoop1>

      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'ST'" />
          </NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_HEADER000/s0:SHIP_TO_CODE/text()" />
            </C08201>
            <C08202>
              <xsl:value-of select="'92'" />
            </C08202>
          </ns0:C082>
        </ns0:NAD>
      </ns0:NADLoop1>

      <ns0:NADLoop1>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'SU'" />
          </NAD01>
          <ns0:C082>
            <C08201>
              <xsl:value-of select="'9325557847917'" />
            </C08201>
            <C08202>
              <xsl:value-of select="'92'" />
            </C08202>
          </ns0:C082>
        </ns0:NAD>
        <ns0:RFFLoop2>
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'IA'" />
              </C50601>
              <C50602>
                <xsl:value-of select="'02932469'" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </ns0:RFFLoop2>
      </ns0:NADLoop1>

      <xsl:for-each select="s1:idocData/s0:ZPOA_HEADER000GRP/s0:ZPOA_LINEDET000GRP">
        <ns0:LINLoop1>
          <ns0:LIN>
            <LIN01>
              <xsl:value-of select="userCSharp:MathInt(string(s0:ZPOA_LINEDET000/s0:PO_ITEM_NO/text()))" />
            </LIN01>
            <LIN02>
              <xsl:value-of select="3" />
            </LIN02>
            <ns0:C212>
              <C21201>
                <xsl:value-of select="s0:ZPOA_LINEDET000/s0:EAN_NO/text()" />
              </C21201>
              <C21202>
                <xsl:value-of select="'EN'" />
              </C21202>
            </ns0:C212>
          </ns0:LIN>
          <ns0:QTY_3>
            <ns0:C186_3>
              <C18601>
                <xsl:value-of select="'21'" />
              </C18601>
              <C18602>
                <xsl:value-of select="userCSharp:MathInt(string(s0:ZPOA_LINEDET000/s0:TOTAL_ORDER_QTY/text()))" />
              </C18602>
            </ns0:C186_3>
          </ns0:QTY_3>
          <ns0:PRILoop1>
            <ns0:PRI>
              <ns0:C509>
                <C50901>
                  <xsl:value-of select="'NTP'" />
                </C50901>
                <C50902>
                  <xsl:value-of select="userCSharp:StringTrimRight(userCSharp:StringTrimLeft(string(s0:ZPOA_LINEDET000/s0:PRICE/text())))" />
                </C50902>
              </ns0:C509>
            </ns0:PRI>
          </ns0:PRILoop1>
          <!--Packaging Details-->
          <ns0:PACLoop2>
            <ns0:PAC_2>
              <PAC01>
                <xsl:value-of select="userCSharp:MathInt(string(s0:ZPOA_LINEDET000/s0:NUMBER_OF_PACKAGES/text()))" />
              </PAC01>
              <ns0:C531_2>
                <C53101>
                  <xsl:value-of select="'3'" />
                </C53101>
              </ns0:C531_2>
            </ns0:PAC_2>
          </ns0:PACLoop2>
          
          <xsl:for-each select="s0:ZPOA_LOCATION000">
            <ns0:LOCLoop2>
              <ns0:LOC_5>
                <LOC01>
                  <xsl:value-of select="'7'" />
                </LOC01>
                <ns0:C517_5>
                  <C51701>
                    <xsl:value-of select="s0:ZW_CUSTOMER/text()" />
                  </C51701>
                  <C51703>
                    <xsl:value-of select="'92'" />
                  </C51703>
                </ns0:C517_5>
              </ns0:LOC_5>
              <ns0:QTY_5>
                <ns0:C186_5>
                  <C18601>
                    <xsl:value-of select="'11'" />
                  </C18601>
                  <C18602>
                    <xsl:value-of select="userCSharp:MathInt(string(s0:QUANTITY/text()))" />
                  </C18602>
                </ns0:C186_5>
              </ns0:QTY_5>
            </ns0:LOCLoop2>
          </xsl:for-each>

          <ns0:TAXLoop3>
            <ns0:TAX_3>
              <TAX01>7</TAX01>
              <C243_3>
                <C24304>
                  <xsl:value-of select="userCSharp:MathInt(string(s0:ZPOA_LINEDET000/s0:TAX/text()))" />
                </C24304> 
              </C243_3>             
            </ns0:TAX_3>            
          </ns0:TAXLoop3>
        </ns0:LINLoop1>
      </xsl:for-each>

      <ns0:UNS>
        <UNS01>
          <xsl:value-of select="'S'" />
        </UNS01>
      </ns0:UNS>
      
      <ns0:CNT>
        <ns0:C270>
          <C27001>
            <xsl:value-of select="'2'" />
          </C27001>
          <C27002>
            <xsl:value-of select="$var:LineItemCount" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>


    </ns0:EFACT_D96A_ORDRSP>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
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