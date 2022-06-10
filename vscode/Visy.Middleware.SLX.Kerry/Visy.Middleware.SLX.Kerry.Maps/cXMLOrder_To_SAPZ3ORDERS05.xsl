<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
    xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
    exclude-result-prefixes="msxsl var s1 xml userCSharp ScriptNS0" 
    version="1.0" 
    xmlns:s2="http://tempuri.org/cXML_1.2.031" 
    xmlns:s3="uri:xades"
    xmlns:s1="uri:ds"
    xmlns:xml="http://www.w3.org/XML/1998/namespace" 
    xmlns:ns0="http://Z3ORDERS05.V3"
    xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
    xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s2:cXML" />
  </xsl:template>
  <xsl:template match="/s2:cXML">
    <!--<xsl:if test="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderID)='' or string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderID)='' >
      <xsl:message terminate="yes">
        <xsl:value-of select="concat(string(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN)), ' does not have matching LGX Customer Code')"/>
      </xsl:message>
    </xsl:if>-->

    <xsl:variable name="var:vPONumber" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderID)" />    
    <xsl:variable name="var:vPODate" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderDate)" />
    <xsl:variable name="var:vWE" select="userCSharp:StringConcat(&quot;WE&quot;)" />
    <xsl:variable name="var:vAG" select="userCSharp:StringConcat(&quot;AG&quot;)" />
    <xsl:variable name="var:vLF" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:vSpace" select="userCSharp:StringConcat(&quot; &quot;)" />
    <xsl:variable name="var:vEmpty" select="userCSharp:StringConcat(&quot;&quot;)" />
    
    <!--<xsl:variable name="var:vShipToCode" select="userCSharp:StringConcat(&quot;15688&quot;)" />--> 
    <xsl:variable name="var:vBuyerLocationID" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:IdReference/@identifier)" />
    <xsl:variable name="var:vShipToCode" select="'74288'" />        
    <xsl:variable name="var:vLionsPlantCode" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID)" />
    <xsl:variable name="var:vSoldToCode" select="$var:vShipToCode" />
  
    <ns0:Z3ORDERS05>
      <EDI_DC40>
        <TABNAM>
          <xsl:text>EDI_DC40</xsl:text>
        </TABNAM>
        <MANDT>
          <xsl:text>   </xsl:text>
        </MANDT>
        <DOCNUM>
          <xsl:text>1</xsl:text>
        </DOCNUM>
        <DOCREL>
          <xsl:text />
        </DOCREL>
        <STATUS>
          <xsl:text />
        </STATUS>
        <DIRECT>
          <xsl:text />
        </DIRECT>
        <OUTMOD>
          <xsl:text />
        </OUTMOD>
        <EXPRSS>
          <xsl:text />
        </EXPRSS>
        <TEST>
          <xsl:text />
        </TEST>
        <IDOCTYP>
          <xsl:text />
        </IDOCTYP>
        <CIMTYP>
          <xsl:text />
        </CIMTYP>
        <MESTYP>
          <xsl:text />
        </MESTYP>
        <MESCOD>
          <xsl:text />
        </MESCOD>
        <MESFCT>
          <xsl:text />
        </MESFCT>
        <STD>
          <xsl:text />
        </STD>
        <STDVRS>
          <xsl:text />
        </STDVRS>
        <STDMES>
          <xsl:text />
        </STDMES>
        <SNDPOR>
          <xsl:text />
        </SNDPOR>
        <SNDPRT>
          <xsl:text />
        </SNDPRT>
        <SNDPFC>
          <xsl:text />
        </SNDPFC>        
        <SNDPRN>
          <xsl:value-of select="$var:vSoldToCode" />
        </SNDPRN>
        <SNDSAD>
          <xsl:text />
        </SNDSAD>
        <SNDLAD>
          <xsl:text />
        </SNDLAD>
        <RCVPOR>
          <xsl:text />
        </RCVPOR>
        <RCVPRT>
          <xsl:text />
        </RCVPRT>
        <RCVPFC>
          <xsl:text />
        </RCVPFC>        
        <RCVPRN>
          <xsl:value-of select="$var:vLionsPlantCode" />
        </RCVPRN>
        <RCVSAD>
          <xsl:text />
        </RCVSAD>
        <RCVLAD>
          <xsl:text />
        </RCVLAD>
        <CREDAT>
          <xsl:text />
        </CREDAT>
        <CRETIM>
          <xsl:text>      </xsl:text>
        </CRETIM>
        <REFINT>
          <xsl:text />
        </REFINT>
        <REFGRP>
          <xsl:text />
        </REFGRP>
        <REFMES>
          <xsl:text />
        </REFMES>
        <ARCKEY>
          <xsl:value-of select="userCSharp:EDI_DC40_ARCKEY_GenerateGUID()" />
        </ARCKEY>
        <SERIAL>
          <xsl:text />
        </SERIAL>
      </EDI_DC40>
      
      <E2EDK01005GRP>
        <E1EDK01>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK01005</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <ACTION>
            <xsl:text />
          </ACTION>
          <BELNR>
            <xsl:value-of select="$var:vPONumber" />
          </BELNR>
        </E1EDK01>
        <Z1E1EDK01>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>Z2E1EDK01000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <PO_TYPE>
            <xsl:text />
          </PO_TYPE>
          <AP_VALUE>
            <xsl:text />
          </AP_VALUE>
          <DP_VALUE>
            <xsl:text />
          </DP_VALUE>
        </Z1E1EDK01>
      </E2EDK01005GRP>
      
      <E1EDK14>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK14</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK14>
      <E1EDK03>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK03</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <IDDAT>
          <xsl:value-of select="'022'" />
        </IDDAT>
        <DATUM>          
          <xsl:value-of select="userCSharp:FormatDate(string($var:vPODate))" />            
        </DATUM>
      </E1EDK03>
      <E1EDK04>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK04001</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <MWSKZ>
          <xsl:text />
        </MWSKZ>
      </E1EDK04>
      <E1EDK05>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK05001</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <ALCKZ>
          <xsl:text />
        </ALCKZ>
      </E1EDK05>

      <xsl:variable name="var:vAddressName" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/s2:Name)" />                             
      <xsl:variable name="var:vAddressStreet" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/s2:PostalAddress/s2:Street)" />
      <xsl:variable name="var:vAddressCity" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/s2:PostalAddress/s2:City)" />  
      <xsl:variable name="var:vAddressZipCode" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/s2:PostalAddress/s2:PostalCode)" />
      <xsl:variable name="var:vAddressCountry" select="string(s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/s2:PostalAddress/s2:Country/@isoCountryCode)" />      
      
      <E2EDKA1003GRP>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="$var:vWE" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:vShipToCode" />
          </PARTN>
          <NAME1>
            <xsl:value-of select="$var:vAddressName" />
          </NAME1>
          <STRAS>
            <xsl:value-of select="$var:vAddressStreet" />
          </STRAS>
          <ORT01>
            <xsl:value-of select="$var:vAddressCity" />
          </ORT01>
          <PSTLZ>
            <xsl:value-of select="$var:vAddressZipCode" />
          </PSTLZ>
          <LAND1>
            <xsl:value-of select="$var:vAddressCountry" />
          </LAND1>
          <!--<REGIO>
            <xsl:value-of select="$var:vAddressState" />
          </REGIO>-->
        </E1EDKA1>        
        <E1EDKA3>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <QUALP>
            <xsl:text />
          </QUALP>
        </E1EDKA3>
      </E2EDKA1003GRP>
            
      <E2EDKA1003GRP>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="$var:vLF" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:vLionsPlantCode" />
          </PARTN>
        </E1EDKA1>
        <E1EDKA3>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <QUALP>
            <xsl:text />
          </QUALP>
        </E1EDKA3>
      </E2EDKA1003GRP>

      <E2EDKA1003GRP>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="$var:vAG" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:vSoldToCode" />
          </PARTN>

        </E1EDKA1>
        <E1EDKA3>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA3</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM />
            <PSGNUM />
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <QUALP>
            <xsl:text />
          </QUALP>
        </E1EDKA3>
      </E2EDKA1003GRP>
      
      <E1EDK02>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK02</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM />
          <PSGNUM />
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:value-of select="'001'" />
        </QUALF>
        <BELNR>
          <xsl:value-of select="$var:vPONumber" />
        </BELNR>
        <DATUM>
          <xsl:value-of select="userCSharp:FormatDate(string($var:vPODate))" />
        </DATUM>
      </E1EDK02>
      
      <E1EDK17>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK17</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK17>
      <E1EDK18>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK18</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <QUALF>
          <xsl:text />
        </QUALF>
      </E1EDK18>
      <E1EDK35>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK35000</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <QUALZ>
          <xsl:text />
        </QUALZ>
      </E1EDK35>
      <E1EDK36>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDK36000</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <CCINS>
          <xsl:text />
        </CCINS>
      </E1EDK36>
      <E2EDKT1002GRP>
        <E1EDKT1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKT1002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <TDID>
            <xsl:text />
          </TDID>
        </E1EDKT1>
        <E1EDKT2>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKT2001</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <TDLINE>
            <xsl:text />
          </TDLINE>
        </E1EDKT2>
      </E2EDKT1002GRP>
      
      <xsl:for-each select="s2:Request/s2:OrderRequest/s2:ItemOut">
        
        <xsl:variable name="var:vMENGE" select="string(@quantity)" />        
        <xsl:variable name="var:vMENEE" select="ScriptNS0:GetInterfaceLookupData(string(s2:ItemDetail/s2:UnitOfMeasure/text()) , &quot;SLX.Kerry.UOM&quot;)" />        
        <xsl:variable name="var:vPMENE" select="ScriptNS0:GetInterfaceLookupData(string(s2:ItemDetail/s2:PriceBasisQuantity/s2:UnitOfMeasure/text()) , &quot;SLX.Kerry.UOM&quot;)" />        
        <xsl:variable name="var:vVPREI" select="string(s2:ItemDetail/s2:UnitPrice)" />
        <xsl:variable name="var:vPEINH" select="string(s2:ItemDetail/s2:PriceBasisQuantity/@quantity)" />
        <xsl:variable name="var:vConversionFactor" select="string(s2:ItemDetail/s2:PriceBasisQuantity/@conversionFactor)" />
                
        <xsl:variable name="var:vZEILE001" select="userCSharp:MyPadding(string(@lineNumber))" />
        <xsl:variable name="var:vDATUM002" select="'2020-08-25T00:00:00+10:00'" />
        <xsl:variable name="var:vIDTNR001" select="string(s2:ItemID/s2:BuyerPartID)" />
        <xsl:variable name="var:vKTEXT001" select="string(s2:ItemDetail/s2:Description)" />

        <!--26-Nov-19 Changed from Prasad's new requirement-->
        <!--<xsl:variable name="var:vLOCATION" select="string(s2:ItemDetail/s2:Classification)" />-->
        <xsl:variable name="var:vClassification" select="string(s2:ItemDetail/s2:Classification)" />

        <xsl:variable name="var:vTDLINE" select="concat($var:vPEINH, '~', $var:vConversionFactor, '~', $var:vPMENE, '~', $var:vClassification)" />

        <!--<xsl:variable name="var:vWERKS" select="ScriptNS0:GetInterfaceLookupData($var:vMaterial , &quot;SAP.Lion.Plant&quot;)" />-->        
          
        <xsl:if test="string($var:vMENEE)=''">
          <xsl:message terminate="yes">
            UOM value is missing.
          </xsl:message>
        </xsl:if>
        
        <xsl:if test="string($var:vPMENE)=''">
          <xsl:message terminate="yes">
            Unit UOM value is missing.
          </xsl:message>
        </xsl:if>
                
        <E2EDP01007GRP>
          <E1EDP01>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP01007</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>                        
            <POSEX>
              <xsl:value-of select="$var:vZEILE001" />
            </POSEX>
            <MENGE>
              <xsl:value-of select="number($var:vMENGE)" />
            </MENGE>
            <MENEE>
              <xsl:value-of select="$var:vMENEE" />
            </MENEE>
            <PMENE>
              <xsl:value-of select="$var:vPMENE" />
            </PMENE>
            <VPREI>
              <xsl:value-of select="$var:vVPREI" />
            </VPREI>
            <PEINH>
              <xsl:value-of select="number($var:vPEINH)" />
            </PEINH>
            <!--<WERKS>
              <xsl:value-of select="number($var:vWERKS)" />
            </WERKS>-->
          </E1EDP01>
          <Z1E1EDP1>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>Z2E1EDP1000</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <LOCATION>
              <xsl:text />
              <!--<xsl:value-of select="$var:vLOCATION" />-->
            </LOCATION>
            <MENGE>
              <xsl:value-of select="$var:vMENGE" />
            </MENGE>
            <MENEE>
              <xsl:value-of select="$var:vMENEE" />
            </MENEE>
            <DATUM>
              <xsl:value-of select="userCSharp:FormatDate(string($var:vDATUM002))" />
            </DATUM>
          </Z1E1EDP1>
          <E1EDP02>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP02001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:value-of select="'001'" />
            </QUALF>
            <BELNR>
              <xsl:value-of select="$var:vPONumber" />
            </BELNR>
            <ZEILE>
              <xsl:value-of select="$var:vZEILE001" />
            </ZEILE>
          </E1EDP02>
          <E1CUREF>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2CUREF</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <POSEX>
              <xsl:text />
            </POSEX>
          </E1CUREF>
          <E1ADDI1>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2ADDI1001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <ADDIMATNR>
              <xsl:text />
            </ADDIMATNR>
          </E1ADDI1>
          <E1EDP03>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP03</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <IDDAT>
              <xsl:value-of select="'002'" />
            </IDDAT>
            <DATUM>
              <xsl:value-of select="userCSharp:FormatDate(string($var:vDATUM002))" />
            </DATUM>
          </E1EDP03>
          <E1EDP04>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP04001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <MWSKZ>
              <xsl:text />
            </MWSKZ>
          </E1EDP04>
          <E2EDP05002GRP>
            <E1EDP05>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDP05002</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <ALCKZ>
                <xsl:text />
              </ALCKZ>
            </E1EDP05>
            <E1EDPS5>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPS5000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
            </E1EDPS5>
          </E2EDP05002GRP>
          <E1EDP20>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP20001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <WMENG>
              <xsl:text />
            </WMENG>
          </E1EDP20>
          <E2EDPA1003GRP>
            <E1EDPA1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPA1003</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <PARVW>
                <xsl:text />
              </PARVW>
            </E1EDPA1>
            <E1EDPA3>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPA3</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALP>
                <xsl:text />
              </QUALP>
            </E1EDPA3>
          </E2EDPA1003GRP>
          <E1EDP19>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP19001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:value-of select="'001'" />
            </QUALF>
            <IDTNR>
              <xsl:value-of select="$var:vIDTNR001" />
            </IDTNR>
            <KTEXT>
              <xsl:value-of select="$var:vKTEXT001" />
            </KTEXT>
          </E1EDP19>
          <E2EDPAD001GRP>
            <E1EDPAD>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPAD001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDPAD>
            <E2TXTH1001GRP>
              <E1TXTH1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2TXTH1001</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text />
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text />
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text />
                  </HLEVEL>
                </DATAHEADERREC>
                <FUNCTION>
                  <xsl:text />
                </FUNCTION>
              </E1TXTH1>
              <E1TXTP1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2TXTP1</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text />
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text />
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text />
                  </HLEVEL>
                </DATAHEADERREC>
                <TDFORMAT>
                  <xsl:text />
                </TDFORMAT>
              </E1TXTP1>
            </E2TXTH1001GRP>
          </E2EDPAD001GRP>
          <E1EDP17>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP17001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:text />
            </QUALF>
          </E1EDP17>
          <E1EDP18>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP18001</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <QUALF>
              <xsl:text />
            </QUALF>
          </E1EDP18>
          <E1EDP35>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP35000</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text />
              </SEGNUM>
              <PSGNUM>
                <xsl:text />
              </PSGNUM>
              <HLEVEL>
                <xsl:text />
              </HLEVEL>
            </DATAHEADERREC>
            <QUALZ>
              <xsl:text />
            </QUALZ>
          </E1EDP35>
          <E2EDPT1001GRP>
            <E1EDPT1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPT1001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <TDID>
                <xsl:text>0010</xsl:text>
              </TDID>
            </E1EDPT1>
            <E1EDPT2>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDPT2001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <TDLINE>
                <xsl:value-of select="$var:vTDLINE" />
              </TDLINE>
            </E1EDPT2>
          </E2EDPT1001GRP>
          <E2EDC01GRP>
            <E1EDC01>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC01</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <SGTYP>
                <xsl:text />
              </SGTYP>
            </E1EDC01>
            <E1EDC02>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC02</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC02>
            <E1EDC03>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC03</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <IDDAT>
                <xsl:text />
              </IDDAT>
            </E1EDC03>
            <E1EDC04>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC04</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <MWSKZ>
                <xsl:text />
              </MWSKZ>
            </E1EDC04>
            <E1EDC05>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC05</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <ALCKZ>
                <xsl:text />
              </ALCKZ>
            </E1EDC05>
            <E1EDC06>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC06000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <FORMELNR>
                <xsl:text />
              </FORMELNR>
            </E1EDC06>
            <E1EDC07>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC07000</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <USERF1_NUM>
                <xsl:text />
              </USERF1_NUM>
            </E1EDC07>
            <E1EDCA1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDCA1</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <PARVW>
                <xsl:text />
              </PARVW>
            </E1EDCA1>
            <E1EDC19>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC19</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC19>
            <E1EDC17>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC17</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC17>
            <E1EDC18>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDC18</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text />
                </SEGNUM>
                <PSGNUM>
                  <xsl:text />
                </PSGNUM>
                <HLEVEL>
                  <xsl:text />
                </HLEVEL>
              </DATAHEADERREC>
              <QUALF>
                <xsl:text />
              </QUALF>
            </E1EDC18>
            <E2EDCT1GRP>
              <E1EDCT1>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDCT1</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text />
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text />
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text />
                  </HLEVEL>
                </DATAHEADERREC>
                <TDID>
                  <xsl:text />
                </TDID>
              </E1EDCT1>
              <E1EDCT2>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDCT2</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text />
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text />
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text />
                  </HLEVEL>
                </DATAHEADERREC>
                <TDLINE>
                  <xsl:text />
                </TDLINE>
              </E1EDCT2>
            </E2EDCT1GRP>
          </E2EDC01GRP>
        </E2EDP01007GRP>
      </xsl:for-each>
      
      <E2CUCFG003GRP>
        <E1CUCFG>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUCFG003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <POSEX>
            <xsl:text />
          </POSEX>
        </E1CUCFG>
        <E1CUINS>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUINS002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <INST_ID>
            <xsl:text />
          </INST_ID>
        </E1CUINS>
        <E1CUPRT>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUPRT002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <PARENT_ID>
            <xsl:text />
          </PARENT_ID>
        </E1CUPRT>
        <E1CUVAL>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUVAL002</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <INST_ID>
            <xsl:text />
          </INST_ID>
        </E1CUVAL>
        <E1CUBLB>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2CUBLB000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <CONTENT>
            <xsl:text />
          </CONTENT>
        </E1CUBLB>
      </E2CUCFG003GRP>
      <E2EDL37005GRP>
        <E1EDL37>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL37004</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <EXIDV>
            <xsl:text />
          </EXIDV>
        </E1EDL37>
        <E1EDL39>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL39000</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <QUALF>
            <xsl:text />
          </QUALF>
        </E1EDL39>
        <E1EDL38>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL38</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <VEGR1_BEZ>
            <xsl:text />
          </VEGR1_BEZ>
        </E1EDL38>
        <E1EDL44>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDL44003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text />
            </SEGNUM>
            <PSGNUM>
              <xsl:text />
            </PSGNUM>
            <HLEVEL>
              <xsl:text />
            </HLEVEL>
          </DATAHEADERREC>
          <VELIN>
            <xsl:text />
          </VELIN>
        </E1EDL44>
      </E2EDL37005GRP>
      <E1EDS01>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDS01</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text />
          </SEGNUM>
          <PSGNUM>
            <xsl:text />
          </PSGNUM>
          <HLEVEL>
            <xsl:text />
          </HLEVEL>
        </DATAHEADERREC>
        <SUMID>
          <xsl:text />
        </SUMID>
      </E1EDS01>
    </ns0:Z3ORDERS05>
  
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
      public string StringConcat(string param0)
      {
         return param0;
      }
      
      public string FormatDate(string dateString)
      {
	      return DateTime.ParseExact(dateString, "yyyy-MM-ddTHH:mm:sszzz", null).ToString("yyyyMMdd");                                                
      }
      
      public string EDI_DC40_ARCKEY_GenerateGUID()
      {
             return System.Guid.NewGuid().ToString();
      }
      
      public string MyPadding(int intValue)
      {
    	      string fmt = "000000.##";
            return intValue.ToString(fmt);
      }
      
    ]]>
  </msxsl:script>
</xsl:stylesheet>