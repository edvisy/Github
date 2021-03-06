<?xml version="1.0" encoding="UTF-16" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0 ScriptNS1"
	version="1.0" xmlns:ns0="http://DESADV01.V3"
	xmlns:s0="http://Visy.Middleware.SAP.GSGlobal.Schemas.SinglePOASN"
	xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
	xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
  xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:SinglePOASN" />
  </xsl:template>
  <xsl:template match="/s0:SinglePOASN">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;EDI_DC40&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;2&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;DESADV01&quot;)" />
    <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;DESADV&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;E&quot;)" />
    <xsl:variable name="var:v8" select="userCSharp:StringConcat(&quot;LI&quot;)" />
    <xsl:variable name="var:v9" select="userCSharp:StringConcat(&quot;LF&quot;)" />
    <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;11214&quot;)" />
    <xsl:variable name="var:v12" select="userCSharp:StringConcat(&quot;.&quot;)" />
    <xsl:variable name="var:v13" select="Detail/BatchItem[1]/Vessel/text()" />
    <xsl:variable name="var:v14" select="'LF'" />
    <xsl:variable name="var:v15" select="'11214'" />
    <xsl:variable name="var:v16" select="'WE'" />
    <xsl:variable name="var:v17" select="'2105'" />
    <xsl:variable name="var:v18" select="userCSharp:StringConcat(&quot;001&quot;)" />
    <xsl:variable name="var:v19" select="Detail/BatchItem[1]/ETA/text()" />
    <xsl:variable name="var:v21" select="userCSharp:LogicalEq(&quot;False&quot; , &quot;True&quot;)" />
    <xsl:variable name="var:v22" select="Detail/BatchItem[1]/InvoiceNo/text()" />
    <xsl:variable name="var:v23" select="userCSharp:StringConcat(&quot;0003&quot;)" />
    <xsl:variable name="var:v24" select="userCSharp:StringConcat(&quot;0000011214&quot;)" />
    <ns0:DESADV01>
      <EDI_DC40>
        <TABNAM>
          <xsl:value-of select="$var:v1" />
        </TABNAM>
        <xsl:variable name="var:v2" select="ScriptNS0:GetLookupValue(&quot;MANDT&quot; , &quot;SAP.GSGlobal&quot;)" />
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
        <xsl:variable name="var:v7" select="ScriptNS0:GetLookupValue(&quot;SNDPOR&quot; , &quot;SAP.GSGlobal&quot;)" />
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
        <xsl:variable name="var:v11" select="ScriptNS0:GetLookupValue(&quot;RCVPOR&quot; , &quot;SAP.GSGlobal&quot;)" />
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
          <xsl:text> </xsl:text>
        </CREDAT>
        <CRETIM>
          <xsl:text> </xsl:text>
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
              <xsl:text> </xsl:text>
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
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v14" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:v15" />
          </PARTN>
        </E1EDKA1>
        <E1EDKA1>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDKA1003</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v16" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:v17" />
          </PARTN>
        </E1EDKA1>
        <E1EDK03>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK03</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v18" />
          </IDDAT>
          <xsl:variable name="var:v20" select="ScriptNS1:FormateDateNew(string($var:v19) , &quot;yyyyMMdd&quot; , &quot;dd/MM/yyyy&quot;)" />
          <DATUM>
            <xsl:value-of select="$var:v20" />
          </DATUM>
        </E1EDK03>
        <xsl:if test="$var:v21">
          <E2EDKT1002GRP>
            <E1EDKT1>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKT1002</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text> </xsl:text>
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
                  <xsl:text> </xsl:text>
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
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v22" />
          </VBELN>
          <TRAID>
            <xsl:value-of select="$var:v13" />
          </TRAID>
          <TRATY>
            <xsl:value-of select="$var:v23" />
          </TRATY>
        </E1EDK08>
        <xsl:if test="$var:v21">
          <E1EDS01>
            <DATAHEADERREC>
              <SEGNAM>
                <xsl:text>E2EDS01</xsl:text>
              </SEGNAM>
              <MANDT>
                <xsl:text> </xsl:text>
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
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v9" />
          </PARVW>
          <PARTN>
            <xsl:value-of select="$var:v24" />
          </PARTN>
        </E1EDKA2>
        <E1EDK06>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDK06</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text> </xsl:text>
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
            <xsl:value-of select="$var:v18" />
          </IDDAT>
          <xsl:variable name="var:v25" select="ScriptNS1:FormateDateNew(string($var:v19) , &quot;yyyyMMdd&quot; , &quot;dd/MM/yyyy&quot;)" />
          <DATUM>
            <xsl:value-of select="$var:v25" />
          </DATUM>
        </E1EDK06>
        <xsl:if test="$var:v21">
          <E2EDKT3001GRP>
            <E1EDKT3>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDKT3001</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text> </xsl:text>
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
                  <xsl:text> </xsl:text>
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
        <E1EDP06>
          <DATAHEADERREC>
            <SEGNAM>
              <xsl:text>E2EDP06</xsl:text>
            </SEGNAM>
            <MANDT>
              <xsl:text> </xsl:text>
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
        <xsl:for-each select="Detail">
          <xsl:variable name="var:v26" select="userCSharp:LogicalEq(&quot;False&quot; , &quot;True&quot;)" />
          <E2EDP07GRP>
            <E1EDP07>
              <DATAHEADERREC>
                <SEGNAM>
                  <xsl:text>E2EDP07</xsl:text>
                </SEGNAM>
                <MANDT>
                  <xsl:text> </xsl:text>
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
                <xsl:value-of select="../PONo/text()" />
              </BSTNK>
              <POSEX>
                <xsl:value-of select="VisyPOEntNo/text()" />
              </POSEX>
            </E1EDP07>
            <xsl:if test="$var:v26">
              <E1EDP08>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDP08</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text> </xsl:text>
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
            <xsl:for-each select="BatchItem">
              <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;TNE&quot;)" />
              <E1EDP09>
                <DATAHEADERREC>
                  <SEGNAM>
                    <xsl:text>E2EDP09001</xsl:text>
                  </SEGNAM>
                  <MANDT>
                    <xsl:text> </xsl:text>
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
                  <xsl:value-of select="../../PONo/text()" />
                </VBELN>
                <CHARG>
                  <xsl:value-of select="InspectionNo/text()" />
                </CHARG>
                <KDMAT>
                  <xsl:value-of select="ProductCode/text()" />
                </KDMAT>
                <LFIMG>
                  <xsl:value-of select="NetWeight/text()" />
                </LFIMG>
                <VRKME>
                  <xsl:value-of select="$var:v27" />
                </VRKME>
              </E1EDP09>
            </xsl:for-each>
            <xsl:if test="$var:v26">
              <E2EDPT1001GRP>
                <E1EDPT1>
                  <DATAHEADERREC>
                    <SEGNAM>
                      <xsl:text>E2EDPT1001</xsl:text>
                    </SEGNAM>
                    <MANDT>
                      <xsl:text> </xsl:text>
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
                      <xsl:text> </xsl:text>
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
            <xsl:text> </xsl:text>
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




]]>
  </msxsl:script>
</xsl:stylesheet>