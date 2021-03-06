<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s1 s2 s0 userCSharp ScriptNS0" version="1.0" 
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/INVOIC01//740/Receive" 
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/INVOIC01//740"  
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:vInvoiceNumber" select="s1:idocData/s0:E2EDK01005/s0:BELNR/text()"></xsl:variable>
    <xsl:variable name="var:vVisyTaxId" select="s1:idocData/s0:E2EDK01005/s0:EIGENUINR/text()"></xsl:variable>
    <xsl:variable name="var:vCountryPrefix" select="''"></xsl:variable>
    <xsl:variable name="var:vAmazonTaxId" select="s1:idocData/s0:E2EDK01005/s0:KUNDEUINR/text()"></xsl:variable>
    <xsl:variable name="var:vCurrency" select="s1:idocData/s0:E2EDK01005/s0:CURCY/text()"></xsl:variable>
    <xsl:variable name="var:vCompanyCode" select="'A5920'" />
    <xsl:variable name="var:vTaxPercentage" select="s1:idocData/s0:E2EDP01010GRP[1]/s0:E2EDP04001/s0:MSATZ/text()" />
    <ns0:EFACT_D01B_INVOIC_EAN011_V2>
      <UNH>
        <UNH1>
          <xsl:value-of select="'001'" />
        </UNH1>
        <UNH2>
          <UNH2.1>
            <xsl:value-of select="'INVOIC'" />
          </UNH2.1>
          <UNH2.2>
            <xsl:value-of select="'D'" />
          </UNH2.2>
          <UNH2.3>
            <xsl:value-of select="'01B'" />
          </UNH2.3>
          <UNH2.4>
            <xsl:value-of select="'UN'" />
          </UNH2.4>
          <UNH2.5>
            <xsl:value-of select="'EAN010'" />
          </UNH2.5>
        </UNH2>
      </UNH>
      <ns0:BGM>
        <ns0:C002>
          <C00201>
            <xsl:value-of select="'388'" />
          </C00201>
          <C00203>
            <xsl:value-of select="'9'" />
          </C00203>
          <C00204>
            <xsl:value-of select="'TAX INVOICE'" />
          </C00204>
        </ns0:C002>
        <ns0:C106>
          <C10601>
            <xsl:value-of select="$var:vInvoiceNumber" />
          </C10601>
        </ns0:C106>
        <BGM03>
          <xsl:value-of select="'9'" />
        </BGM03>
      </ns0:BGM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'137'" />
          </C50701>          
          <C50702>
            <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF='001']/s0:DATUM/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>
      <ns0:DTM>
        <ns0:C507>
          <C50701>
            <xsl:value-of select="'11'" />
          </C50701>          
          <C50702>
            <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF='002']/s0:DATUM/text()" />
          </C50702>
          <C50703>
            <xsl:value-of select="'102'" />
          </C50703>
        </ns0:C507>
      </ns0:DTM>
      <ns0:NADLoop1>
        <xsl:variable name="var:vPARVW" select="'BK'"></xsl:variable>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'PE'" />
          </NAD01>
          <ns0:C080>
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:NAME1/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>
            <C08002>
              <xsl:value-of select="'VISYBOARD'" />
            </C08002>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:STRAS/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT01/text()) , &quot;1&quot; , &quot;35&quot;)" />
          </NAD06>
          <ns0:C819>
            <C81901>
              <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT02/text())" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:PSTLZ/text())" />
          </NAD08>
          <NAD09>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:LAND1/text())" />
          </NAD09>
        </ns0:NAD>
        <xsl:element name="ns0:RFFLoop2" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'AMT'" />
              </C50601>
              <C50602>
                <xsl:value-of select="concat($var:vCountryPrefix, $var:vVisyTaxId)" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </xsl:element>        
      </ns0:NADLoop1>
      <ns0:NADLoop1>
        <xsl:variable name="var:vPARVW" select="'RE'"></xsl:variable>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'IV'" />
          </NAD01>
          <ns0:C080>
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:NAME1/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>
            <C08002>
              <xsl:value-of select="'VISYBOARD'" />
            </C08002>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:STRAS/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT01/text()) , &quot;1&quot; , &quot;35&quot;)" />
          </NAD06>
          <ns0:C819>
            <C81901>
              <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT02/text())" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:PSTLZ/text())" />
          </NAD08>
          <NAD09>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:LAND1/text())" />
          </NAD09>
        </ns0:NAD>
        <xsl:element name="ns0:RFFLoop2" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
          <ns0:RFF_2>
            <ns0:C506_2>
              <C50601>
                <xsl:value-of select="'VA'" />
              </C50601>
              <C50602>
                <xsl:value-of select="concat($var:vCountryPrefix, $var:vAmazonTaxId)" />
              </C50602>
            </ns0:C506_2>
          </ns0:RFF_2>
        </xsl:element>
      </ns0:NADLoop1>
      <ns0:NADLoop1>
       <xsl:variable name="var:vPARVW" select="'RG'"></xsl:variable>
        <ns0:NAD>
          <NAD01>
            <xsl:value-of select="'ST'" />
          </NAD01>
          <ns0:C080>
            <C08001>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:NAME1/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C08001>
            <C08002>
              <xsl:value-of select="'VISYBOARD'" />
            </C08002>
          </ns0:C080>
          <ns0:C059>
            <C05901>
              <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:STRAS/text()) , &quot;1&quot; , &quot;35&quot;)" />
            </C05901>
          </ns0:C059>
          <NAD06>
            <xsl:value-of select="userCSharp:StringSubstring(string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT01/text()) , &quot;1&quot; , &quot;35&quot;)" />
          </NAD06>
          <ns0:C819>
            <C81901>
              <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:ORT02/text())" />
            </C81901>
          </ns0:C819>
          <NAD08>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:PSTLZ/text())" />
          </NAD08>
          <NAD09>
            <xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW=$var:vPARVW]/s0:LAND1/text())" />
          </NAD09>
        </ns0:NAD>       
      </ns0:NADLoop1>
      <ns0:TAXLoop1>
        <ns0:TAX>
          <TAX01>
            <xsl:value-of select="'7'" />
          </TAX01>
          <ns0:C241>
            <C24101>GST</C24101>
          </ns0:C241>
          <ns0:C243>
            <C24304>
              <xsl:value-of select="$var:vTaxPercentage" />
            </C24304>
          </ns0:C243>
          <TAX06>
            <xsl:value-of select="'S'" />
          </TAX06>
        </ns0:TAX>
      </ns0:TAXLoop1>
      <ns0:CUXLoop1>
		    <ns0:CUX>
			    <ns0:C504>
				    <C50401>2</C50401>
            <C50402><xsl:value-of select="$var:vCurrency"/></C50402>
            <C50403><xsl:value-of select="'4'"/></C50403>
			    </ns0:C504>
			    <ns0:C504_2>
				    <C50401>3</C50401>
            <C50402>
                <xsl:value-of select="$var:vCurrency"/>
            </C50402>
            <C50403>10E</C50403>
			    </ns0:C504_2>       
		    </ns0:CUX>       
	    </ns0:CUXLoop1>    
      <ns0:PATLoop1>
        <ns0:PAT>
          <PAT01>
            <xsl:value-of select="'37'" />
          </PAT01>
          <ns0:C112>
            <C11201>
              <xsl:value-of select="'5'" />
            </C11201>
            <C11202>
              <xsl:value-of select="'3'" />
            </C11202>
            <C11203>
              <xsl:value-of select="'M'" />
            </C11203>
            <C11204>
              <xsl:value-of select="'2'" />
            </C11204>
          </ns0:C112>
        </ns0:PAT>
      </ns0:PATLoop1>
      <xsl:for-each select="s1:idocData/s0:E2EDP01010GRP">
        <ns0:LINLoop1>         
          <ns0:LIN>
            <xsl:if test="s0:E2EDP01010/s0:POSEX">
              <LIN01>
                <xsl:value-of select="s0:E2EDP01010/s0:POSEX/text()" />
              </LIN01>
            </xsl:if>
            <ns0:C212>
              <C21201>
                <xsl:value-of select="s0:E2EDP19002[s0:QUALF='001']/s0:IDTNR/text()" />
              </C21201>
              <C21202>
                <xsl:value-of select="'BP'" />
              </C21202>
            </ns0:C212>
          </ns0:LIN>
          <xsl:for-each select="s0:E2EDP19002">
            <xsl:variable name="var:LINQUALF" select="string(s0:QUALF/text())" />
            <xsl:variable name="var:LINIDTNR" select="string(s0:IDTNR/text())" />           
            <xsl:variable name="var:LINKTEXT" select="string(s0:KTEXT/text())" />
            <xsl:if test="string($var:LINQUALF)='001'">
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="'1'" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNR" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'IN'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
            </xsl:if>
            <xsl:if test="string($var:LINQUALF)='002'">
              <ns0:PIA>
                <PIA01>
                  <xsl:value-of select="'1'" />
                </PIA01>
                <ns0:C212_2>
                  <C21201>
                    <xsl:value-of select="$var:LINIDTNR" />
                  </C21201>
                  <C21202>
                    <xsl:value-of select="'SA'" />
                  </C21202>
                </ns0:C212_2>
              </ns0:PIA>
              <ns0:IMD>
                <IMD01>
                  <xsl:value-of select="'F'" />
                </IMD01>
                <ns0:C273>
                  <C27302>
                    <xsl:value-of select="'DU'" />
                  </C27302>
                  <C27303>
                    <xsl:value-of select="'ZZZ'" />
                  </C27303>
                  <C27304>
                    <xsl:value-of select="$var:LINKTEXT" />
                  </C27304>
                </ns0:C273>
              </ns0:IMD>
            </xsl:if>
          </xsl:for-each>
          <ns0:IMD>
            <IMD01>
              <xsl:value-of select="'F'" />
            </IMD01>
            <ns0:C273>
              <C27301>
                <xsl:value-of select="'GS'" />
              </C27301>
              <C27302>
                <xsl:value-of select="''" />
              </C27302>
              <C27303>
                <xsl:value-of select="''" />
              </C27303>
              <C27304>
                <xsl:value-of select="s0:E2EDP19002[s0:QUALF='002']/s0:KTEXT/text()" />
              </C27304>
            </ns0:C273>
          </ns0:IMD>
          <ns0:QTY_2>
            <ns0:C186_2>
              <C18601>
                <xsl:value-of select="'47'" />
              </C18601>
              <xsl:if test="s0:E2EDP01010/s0:MENGE">               
                <C18602>
                  <xsl:value-of select="s0:E2EDP01010/s0:MENGE/text()" />
                </C18602>
              </xsl:if> 
              <xsl:if test="s0:E2EDP01010/s0:MENGE">               
                <C18603>
                  <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(s0:E2EDP01010/s0:MENEE/text(), 'SLX.Amazon.Invoice.UOM')" />
                </C18603>
              </xsl:if>              
            </ns0:C186_2>
          </ns0:QTY_2>
          <ns0:MOALoop2>
            <ns0:MOA_5>
              <ns0:C516_5>
                <C51601>
                  <xsl:value-of select="'86'" />
                </C51601>
                <C51602>
                  <xsl:value-of select="userCSharp:MathRound(string(s0:E2EDP26[s0:QUALF='004']/s0:BETRG) , &quot;3&quot;)" />
                </C51602>                
              </ns0:C516_5>
            </ns0:MOA_5>
          </ns0:MOALoop2>
         <ns0:PRILoop1>
            <ns0:PRI>
              <ns0:C509>
                <C50901>
                  <xsl:value-of select="'AAA'" />
                </C50901>
                <C50902>
                  <xsl:value-of select="userCSharp:MathRound(string(s0:E2EDP26[s0:QUALF='001']/s0:BETRG) , &quot;3&quot;)" />
                </C50902>                
              </ns0:C509>
            </ns0:PRI>
          </ns0:PRILoop1>
          <ns0:RFFLoop3>
            <ns0:RFF_3>
              <ns0:C506_3>
                <C50601>
                  <xsl:value-of select="'ON'" />
                </C50601>
                <C50602>
                  <xsl:value-of select="s0:E2EDP02001[s0:QUALF='001']/s0:BELNR/text()" />
                </C50602>
                <C50603>
                  <xsl:value-of select="number(s0:E2EDP02001[s0:QUALF='002']/s0:ZEILE/text())" />
                </C50603>
              </ns0:C506_3>
            </ns0:RFF_3>
          </ns0:RFFLoop3>
          <ns0:TAXLoop3>
            <ns0:TAX_3>
              <TAX01>
                <xsl:value-of select="'7'" />
              </TAX01>
              <ns0:C241_3>
                <C24101>
                  <xsl:value-of select="'GST'" />
                </C24101>
              </ns0:C241_3>
              <ns0:C243_3>
                <C24304>
                  <xsl:value-of select="number(s0:E2EDP04001/s0:MSATZ)" />
                </C24304>
              </ns0:C243_3>
              <TAX06>
                <xsl:value-of select="'S'" />
              </TAX06>
            </ns0:TAX_3>
          </ns0:TAXLoop3>
          <ns0:MOA_7 xmlns:gen203="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
            <ns0:C516_7 xmlns:gen204="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
              <C51601>124</C51601>
              <C51602>
                <xsl:value-of select="userCSharp:MathRound(string(s0:E2EDP26[s0:QUALF='004']/s0:BETRG) , &quot;3&quot;)"/>
              </C51602>
            </ns0:C516_7>
          </ns0:MOA_7>
          <ns0:MOA_7 xmlns:gen203="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
            <ns0:C516_7 xmlns:gen204="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006">
              <C51601>125</C51601>
              <C51602>
                <xsl:value-of select="userCSharp:MathRound(string(s0:E2EDP26[s0:QUALF='003']/s0:BETRG) , &quot;3&quot;)"/>
              </C51602>
            </ns0:C516_7>
          </ns0:MOA_7>
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
            <xsl:value-of select="count(s1:idocData/s0:E2EDP01010GRP)" />
          </C27002>
        </ns0:C270>
      </ns0:CNT>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'86'" />
            </C51601>
            <C51602>
              <xsl:value-of select="s1:idocData/s0:E2EDS01[s0:SUMID='012']/s0:SUMME/text()" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
     <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'124'" />
            </C51601>
            <C51602>
               <xsl:value-of select="s1:idocData/s0:E2EDS01[s0:SUMID='010']/s0:SUMME/text()" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
      <ns0:MOALoop4>
        <ns0:MOA_10>
          <ns0:C516_10>
            <C51601>
              <xsl:value-of select="'125'" />
            </C51601>
            <C51602>
               <xsl:value-of select="s1:idocData/s0:E2EDS01[s0:SUMID='005']/s0:SUMME/text()" />
            </C51602>
            <C51603>
              <xsl:value-of select="$var:vCurrency" />
            </C51603>
          </ns0:C516_10>
        </ns0:MOA_10>
      </ns0:MOALoop4>
    </ns0:EFACT_D01B_INVOIC_EAN011_V2>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
    
    public string StringSubstring(string str, string left, string right)
    {
	    string retval = "";
	    double dleft = 0;
	    double dright = 0;
	    if (str != null && IsNumeric(left, ref dleft) && IsNumeric(right, ref dright))
	    {
		    int lt = (int)dleft;
		    int rt = (int)dright;
		    lt--; rt--;
		    if (lt >= 0 && rt >= lt && lt < str.Length)
		    {
			    if (rt < str.Length)
			    {
				    retval = str.Substring(lt, rt-lt+1);
			    }
			    else
			    {
				    retval = str.Substring(lt, str.Length-lt);
			    }
		    }
	    }
	    return retval.Replace("*", "-").Replace(":", "-").Replace("+", "");
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
    public string MathRound(string val)
    {
	    return MathRound(val, "0");
    }

    public string MathRound(string val, string decimals)
    {
	    string retval = "";
	    double v = 0;
	    double db = 0;
	    if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	    {
		    try
		    {
			    int d = (int) db;
			    double ret = Math.Round(v, d);
			    retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		    }
		    catch (Exception)
		    {
		    }
	    }
	    return retval;
    }
    ]]>
  </msxsl:script>
</xsl:stylesheet>