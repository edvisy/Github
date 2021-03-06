<?xml version="1.0" encoding="UTF-16" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var userCSharp ScriptNS0 ScriptNS1 ScriptNS2"
                version="1.0" xmlns:ns0="http://DESADV01.V3"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
                >
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/PACKING_LISTS" />
  </xsl:template>
  <xsl:template match="PACKING_LISTS">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;EDI_DC40&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;2&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;DESADV01&quot;)" />
    <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;DESADV&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;E&quot;)" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;LI&quot;)" />
    <xsl:variable name="var:v9" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;30238&quot;)" />
    <xsl:variable name="var:v12" select="userCSharp:StringConcat(&quot;.&quot;)" />
    <xsl:variable name="var:v13" select="PACKING_LIST/HEADER[1]/HEADER_REFERENCES[1]/SUPPLIER_TRANSPORT_NUMBER/text()" />
    <xsl:variable name="var:v14" select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/NAME/text()" />
    <xsl:variable name="var:v15" select="userCSharp:StringFind(string($var:v14) , &quot;/&quot;)" />
    <xsl:variable name="var:v16" select="userCSharp:MathSubtract(string($var:v15) , &quot;1&quot;)" />
    <xsl:variable name="var:v17" select="userCSharp:StringLeft(string($var:v14) , string($var:v16))" />
    <xsl:variable name="var:v18" select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/STREET/text()" />
    <xsl:variable name="var:v19" select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/CITY/text()" />
    <xsl:variable name="var:v20" select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/ZIP/text()" />
    <xsl:variable name="var:v21" select="PACKING_LIST/HEADER/SUPPLIER[1]/ADDRESS[1]/COUNTRY_ISO_CODE/text()" />
    <xsl:variable name="var:v22" select="userCSharp:StringConcat(&quot;001&quot;)" />
    <xsl:variable name="var:v23" select="./PACKING_LIST[1]/HEADER[1]/@PACKING_LIST_DATE" />
    <xsl:variable name="var:v24" select="userCSharp:DateAddDays(string($var:v23) , &quot;60&quot;)" />
    <xsl:variable name="var:v26" select="userCSharp:StringConcat(&quot;false&quot;)" />
    <xsl:variable name="var:v27" select="userCSharp:LogicalEq(string($var:v26) , &quot;true&quot;)" />
    <xsl:variable name="var:v28" select="userCSharp:MathAdd(string($var:v15) , &quot;1&quot;)" />
    <xsl:variable name="var:v29" select="userCSharp:StringSize(string($var:v14))" />
    <xsl:variable name="var:v30" select="userCSharp:StringSubstring(string($var:v14) , string($var:v28) , string($var:v29))" />
    <ns0:DESADV01>
      <EDI_DC40>
        <TABNAM>
          <xsl:value-of select="$var:v1" />
        </TABNAM>
        <xsl:variable name="var:v2" select="ScriptNS0:GetLookupValue(&quot;MANDT&quot; , &quot;SAP.Rasselstein&quot;)" />
        <MANDT>
          <xsl:value-of select="$var:v2" />
        </MANDT>
        <DOCNUM>
          <xsl:text>1</xsl:text>
        </DOCNUM>
        <DOCREL>
          <xsl:text> </xsl:text>
        </DOCREL>
        <STATUS>
          <xsl:text> </xsl:text>
        </STATUS>
        <DIRECT>
          <xsl:value-of select="$var:v3" />
        </DIRECT>
        <OUTMOD>
          <xsl:text> </xsl:text>
        </OUTMOD>
        <EXPRSS>
          <xsl:text> </xsl:text>
        </EXPRSS>
        <TEST>
          <xsl:text> </xsl:text>
        </TEST>
        <IDOCTYP>
          <xsl:value-of select="$var:v4" />
        </IDOCTYP>
        <CIMTYP>
          <xsl:text> </xsl:text>
        </CIMTYP>
        <MESTYP>
          <xsl:value-of select="$var:v5" />
        </MESTYP>
        <MESCOD>
          <xsl:text> </xsl:text>
        </MESCOD>
        <MESFCT>
          <xsl:text> </xsl:text>
        </MESFCT>
        <STD>
          <xsl:value-of select="$var:v6" />
        </STD>
        <STDVRS>
          <xsl:text> </xsl:text>
        </STDVRS>
        <STDMES>
          <xsl:text> </xsl:text>
        </STDMES>
        <xsl:variable name="var:v7" select="ScriptNS0:GetLookupValue(&quot;SNDPOR&quot; , &quot;SAP.Rasselstein&quot;)" />
        <SNDPOR>
          <xsl:value-of select="$var:v7" />
        </SNDPOR>
        <SNDPRT>
          <xsl:value-of select="$var:v8" />
        </SNDPRT>
        <SNDPFC>
          <xsl:value-of select="$var:v9" />
        </SNDPFC>
        <SNDPRN>
          <xsl:value-of select="$var:v10" />
        </SNDPRN>
        <SNDSAD>
          <xsl:text> </xsl:text>
        </SNDSAD>
        <SNDLAD>
          <xsl:text> </xsl:text>
        </SNDLAD>
        <xsl:variable name="var:v11" select="ScriptNS0:GetLookupValue(&quot;RCVPOR&quot; , &quot;SAP.Rasselstein&quot;)" />
        <RCVPOR>
          <xsl:value-of select="$var:v11" />
        </RCVPOR>
        <RCVPRT>
          <xsl:value-of select="$var:v8" />
        </RCVPRT>
        <RCVPFC>
          <xsl:value-of select="$var:v9" />
        </RCVPFC>
        <RCVPRN>
          <xsl:value-of select="$var:v10" />
        </RCVPRN>
        <RCVSAD>
          <xsl:text> </xsl:text>
        </RCVSAD>
        <RCVLAD>
          <xsl:text> </xsl:text>
        </RCVLAD>
        <CREDAT>
          <xsl:text>        </xsl:text>
        </CREDAT>
        <CRETIM>
          <xsl:text>      </xsl:text>
        </CRETIM>
        <REFINT>
          <xsl:text> </xsl:text>
        </REFINT>
        <REFGRP>
          <xsl:text> </xsl:text>
        </REFGRP>
        <REFMES>
          <xsl:text> </xsl:text>
        </REFMES>
        <ARCKEY>
          <xsl:value-of select="$var:v12" />
        </ARCKEY>
        <SERIAL>
          <xsl:text> </xsl:text>
        </SERIAL>
      </EDI_DC40>
      <E2EDK07001GRP>
        <E1EDK07>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK07001</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <ACTION>
            <xsl:text> </xsl:text>
          </ACTION>
          <TRAID>
            <xsl:value-of select="$var:v13" />
          </TRAID>
        </E1EDK07>
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
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="$var:v8" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:v10" />
          </PARTN>
          <NAME1>
            <xsl:value-of select="$var:v17" />
          </NAME1>
          <STRAS>
            <xsl:value-of select="$var:v18" />
          </STRAS>
          <ORT01>
            <xsl:value-of select="$var:v19" />
          </ORT01>
          <PSTLZ>
            <xsl:value-of select="$var:v20" />
          </PSTLZ>
          <ISOAL>
            <xsl:value-of select="$var:v21" />
          </ISOAL>
        </E1EDKA1>
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
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <IDDAT>
            <xsl:value-of select="$var:v22" />
          </IDDAT>
          <xsl:variable name="var:v25" select="string($var:v24)" />
          <DATUM>
            <xsl:value-of select="$var:v25" />
          </DATUM>
        </E1EDK03>
        <xsl:if test="$var:v27">
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
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDID>
                <xsl:text> </xsl:text>
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
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDLINE>
                <xsl:text> </xsl:text>
              </TDLINE>
            </E1EDKT2>
          </E2EDKT1002GRP>
        </xsl:if>
      </E2EDK07001GRP>
      <E2EDK08001GRP>
        <E1EDK08>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK08001</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <ACTION>
            <xsl:text> </xsl:text>
          </ACTION>
          <VBELN>
            <xsl:value-of select="$var:v30" />
          </VBELN>
          <TRAID>
            <xsl:value-of select="$var:v13" />
          </TRAID>
          <TRATY>
            <xsl:text>0003</xsl:text>
          </TRATY>
        </E1EDK08>
        <xsl:if test="$var:v27">
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
                <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text> </xsl:text>
              </PSGNUM>
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <SUMID>
              <xsl:text> </xsl:text>
            </SUMID>
          </E1EDS01>
        </xsl:if>
        <E1EDKA2>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA2001</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <PARVW>
            <xsl:value-of select="$var:v8" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:v10" />
          </PARTN>
          <NAME1>
            <xsl:value-of select="$var:v17" />
          </NAME1>
          <STRAS>
            <xsl:value-of select="$var:v18" />
          </STRAS>
          <ORT01>
            <xsl:value-of select="$var:v19" />
          </ORT01>
          <PSTLZ>
            <xsl:value-of select="$var:v20" />
          </PSTLZ>
          <ISOAL>
            <xsl:value-of select="$var:v21" />
          </ISOAL>
        </E1EDKA2>
        <E1EDK06>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK06</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text>   </xsl:text>
            </MANDT>
            <DOCNUM>
              <xsl:text>1</xsl:text>
            </DOCNUM>
            <SEGNUM>
              <xsl:text> </xsl:text>
            </SEGNUM>
            <PSGNUM>
              <xsl:text> </xsl:text>
            </PSGNUM>
            <HLEVEL>
              <xsl:text> </xsl:text>
            </HLEVEL>
          </DATAHEADERREC>
          <IDDAT>
            <xsl:value-of select="$var:v22" />
          </IDDAT>
          <xsl:variable name="var:v31" select="string($var:v24)" />
          <DATUM>
            <xsl:value-of select="$var:v31" />
          </DATUM>
        </E1EDK06>
        <xsl:if test="$var:v27">
          <E2EDKT3001GRP>
            <E1EDKT3>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKT3001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDID>
                <xsl:text> </xsl:text>
              </TDID>
            </E1EDKT3>
            <E1EDKT4>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKT4001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <TDLINE>
                <xsl:text> </xsl:text>
              </TDLINE>
            </E1EDKT4>
          </E2EDKT3001GRP>
        </xsl:if>
        <xsl:if test="$var:v27">
          <E1EDP06>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDP06</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text>   </xsl:text>
              </MANDT>
              <DOCNUM>
                <xsl:text>1</xsl:text>
              </DOCNUM>
              <SEGNUM>
                <xsl:text> </xsl:text>
              </SEGNUM>
              <PSGNUM>
                <xsl:text> </xsl:text>
              </PSGNUM>
              <HLEVEL>
                <xsl:text> </xsl:text>
              </HLEVEL>
            </DATAHEADERREC>
            <PCKAR>
              <xsl:text> </xsl:text>
            </PCKAR>
          </E1EDP06>
        </xsl:if>
        <xsl:for-each select="PACKING_LIST/HEADER">

          <xsl:variable name="var:v32" select="./Material[1]/BUYER_ORDER_NUMBER/text()" />
          <xsl:variable name="var:v33" select="./Material[1]/BUYER_POS_NUMBER/text()" />
          <!--<xsl:variable name="var:v33" select="userCSharp:StringFind(string($var:v32) , &quot;/&quot;)" />-->
          <!--<xsl:variable name="var:v34" select="userCSharp:MathSubtract(string($var:v33) , &quot;1&quot;)" />-->
          <!--<xsl:variable name="var:v35" select="userCSharp:StringLeft(string($var:v32) , string($var:v34))" />-->
          <xsl:variable name="var:v36" select="userCSharp:StringRight(string($var:v33) , &quot;4&quot;)" />
          <xsl:variable name="var:v37" select="userCSharp:StringConcat(&quot;false&quot;)" />
          <xsl:variable name="var:v38" select="userCSharp:LogicalEq(string($var:v37) , &quot;true&quot;)" />
          
          <E2EDP07GRP>
            <E1EDP07>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDP07</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text>   </xsl:text>
                </MANDT>
                <DOCNUM>
                  <xsl:text>1</xsl:text>
                </DOCNUM>
                <SEGNUM>
                  <xsl:text> </xsl:text>
                </SEGNUM>
                <PSGNUM>
                  <xsl:text> </xsl:text>
                </PSGNUM>
                <HLEVEL>
                  <xsl:text> </xsl:text>
                </HLEVEL>
              </DATAHEADERREC>
              <HLNUM>
                <xsl:text> </xsl:text>
              </HLNUM>
              <BSTNK>
                <xsl:value-of select="$var:v32" />
              </BSTNK>
              <POSEX>
                <xsl:value-of select="$var:v36" />
              </POSEX>
            </E1EDP07>
            <xsl:if test="$var:v38">
              <E1EDP08>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDP08</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text> </xsl:text>
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text> </xsl:text>
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <HLNUM>
                  <xsl:text> </xsl:text>
                </HLNUM>
              </E1EDP08>
            </xsl:if>
            <xsl:for-each select="Material/PACKAGES/PACKAGE">
              <xsl:variable name="var:v40" select="userCSharp:StringConcat(&quot;TNE&quot;)" />
              <E1EDP09>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDP09001</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text>   </xsl:text>
                  </MANDT>
                  <DOCNUM>
                    <xsl:text>1</xsl:text>
                  </DOCNUM>
                  <SEGNUM>
                    <xsl:text> </xsl:text>
                  </SEGNUM>
                  <PSGNUM>
                    <xsl:text> </xsl:text>
                  </PSGNUM>
                  <HLEVEL>
                    <xsl:text> </xsl:text>
                  </HLEVEL>
                </DATAHEADERREC>
                <HLNUM>
                  <xsl:text> </xsl:text>
                </HLNUM>
                <VBELN>
                  <xsl:value-of select="../../../../HEADER[1]/@PACKING_LIST_NUMBER" />
                </VBELN>
                <CHARG>
                  <xsl:value-of select="PACKAGE_NUMBER/text()" />
                </CHARG>
                <xsl:variable name="var:v39" select="ScriptNS2:ReplaceString(string(QUANTITY_OF_ARTICLES/text()) , &quot;,&quot; , &quot;.&quot;)" />
                <LFIMG>
                  <xsl:value-of select="$var:v39" />
                </LFIMG>
                <VRKME>
                  <xsl:value-of select="$var:v40" />
                </VRKME>
              </E1EDP09>
            </xsl:for-each>
            <xsl:if test="$var:v38">
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
                      <xsl:text> </xsl:text>
                    </SEGNUM>
                    <PSGNUM>
                      <xsl:text> </xsl:text>
                    </PSGNUM>
                    <HLEVEL>
                      <xsl:text> </xsl:text>
                    </HLEVEL>
                  </DATAHEADERREC>
                  <TDID>
                    <xsl:text> </xsl:text>
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
                      <xsl:text> </xsl:text>
                    </SEGNUM>
                    <PSGNUM>
                      <xsl:text> </xsl:text>
                    </PSGNUM>
                    <HLEVEL>
                      <xsl:text> </xsl:text>
                    </HLEVEL>
                  </DATAHEADERREC>
                  <TDLINE>
                    <xsl:text> </xsl:text>
                  </TDLINE>
                </E1EDPT2>
              </E2EDPT1001GRP>
            </xsl:if>
          </E2EDP07GRP>
        </xsl:for-each>
      </E2EDK08001GRP>
      <E1EDS02>
        <DATAHEADERREC>
          <SEGNAM>
            <xsl:text>E2EDS02</xsl:text>
          </SEGNAM>
          <MANDT>
            <xsl:text>   </xsl:text>
          </MANDT>
          <DOCNUM>
            <xsl:text>1</xsl:text>
          </DOCNUM>
          <SEGNUM>
            <xsl:text> </xsl:text>
          </SEGNUM>
          <PSGNUM>
            <xsl:text> </xsl:text>
          </PSGNUM>
          <HLEVEL>
            <xsl:text> </xsl:text>
          </HLEVEL>
        </DATAHEADERREC>
        <SUMID>
          <xsl:text> </xsl:text>
        </SUMID>
      </E1EDS02>
    </ns0:DESADV01>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
public string StringConcat(string param0)
{
 return param0;
}


public string DateAddDays(string date, string days)
{
	string retval = "";
	double db = 0;
	if (IsNumeric(days, ref db))
	{
		//DateTime dt = DateTime.Parse(date);
    DateTime dt = DateTime.ParseExact(date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
		int d = (int) db;
		dt = dt.AddDays(d);
		retval = dt.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
	}
	return retval;
}


public int StringFind(string str, string strFind)
{
	if (str == null || strFind == null || strFind == "")
	{
		return 0;
	}
	return (str.IndexOf(strFind) + 1);
}


public string StringLeft(string str, string count)
{
	string retval = "";
	double d = 0;
	if (str != null && IsNumeric(count, ref d))
	{
		int i = (int) d;
		if (i > 0)
		{ 
			if (i <= str.Length)
			{
				retval = str.Substring(0, i);
			}
			else
			{
				retval = str;
			}
		}
	}
	return retval;
}


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
	return retval;
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public string MathSubtract(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	bool first = true;
	foreach (string obj in listValues)
	{
		if (first)
		{
			first = false;
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret = d;
			}
			else
			{
				return "";
			}
		}
		else
		{
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret -= d;
			}
			else
			{
				return "";
			}
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
}


public string MathAdd(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	foreach (string obj in listValues)
	{
	double d = 0;
		if (IsNumeric(obj, ref d))
		{
			ret += d;
		}
		else
		{
			return "";
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
}


public string StringRight(string str, string count)
{
	string retval = "";
	double d = 0;
	if (str != null && IsNumeric(count, ref d))
	{
		int i = (int) d;
		if (i > 0)
		{
			if (i <= str.Length)
			{
				retval = str.Substring(str.Length-i);
			}
			else
			{
				retval = str;
			}
		}
	}
	return retval;
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

public bool IsDate(string val)
{
	bool retval = true;
	try
	{
		DateTime dt = Convert.ToDateTime(val, System.Globalization.CultureInfo.InvariantCulture);
	}
	catch (Exception)
	{
		retval = false;
	}
	return retval;
}




]]>
  </msxsl:script>
</xsl:stylesheet>