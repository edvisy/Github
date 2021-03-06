<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
  exclude-result-prefixes="msxsl var s0 s1 s2 ScriptNS0 ScriptNS1 ScriptNS2 ScriptNS3 userCSharp ns0 ns1 ns2"
  version="1.0"
  xmlns:ns1="http://tempuri.org/Fulfill_1.2.031"
  xmlns:ns2="uri:xades"
  xmlns:xml="http://www.w3.org/XML/1998/namespace"
  xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
  xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
  xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
  xmlns:ScriptNS3="http://schemas.microsoft.com/BizTalk/2003/ScriptNS3"
  xmlns:ns0="uri:ds"
  xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
  xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05/Z3ORDERS05/620" 
  xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05/Z3ORDERS05/620/Receive" 
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">

  <xsl:output omit-xml-declaration="no" method="xml" version="1.0" doctype-system="http://xml.cxml.org/schemas/cXML/1.2.031/Fulfill.dtd" />

  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <xsl:variable name="var:vPayLoadId" select="userCSharp:PayLoadId_GenerateGUID()" />

    <cXML>
      <xsl:attribute name="payloadID">
        <xsl:value-of select="$var:vPayLoadId" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <xsl:value-of select="userCSharp:DateCurrentDateTime()" />
      </xsl:attribute>
      <xsl:attribute name="version">
        <xsl:value-of select="'1.2.031'" />
      </xsl:attribute>
      <Header>
        <From>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS1:GetLookupValue('SupplierId' , 'SAP.Lion.cXML.Settings')" />
            </Identity>
          </Credential>
        </From>
        <To>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS1:GetLookupValue('CustomerId' , 'SAP.Lion.cXML.Settings')" />
            </Identity>
          </Credential>
        </To>
        <Sender>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS1:GetLookupValue('SupplierId' , 'SAP.Lion.cXML.Settings')" />
            </Identity>
            <SharedSecret>
              <xsl:value-of select="ScriptNS1:GetLookupValue('SharedSecret' , 'SAP.Lion.cXML.Settings')" />
            </SharedSecret>
          </Credential>
          <UserAgent>
            <xsl:value-of select="'Supplier'" />
          </UserAgent>
        </Sender>
      </Header>
      <Request>
        <xsl:attribute name="deploymentMode">
          <xsl:value-of select="ScriptNS1:GetLookupValue('Environment' , 'SAP.Lion.cXML.Settings')" />
        </xsl:attribute>
        <ConfirmationRequest>

          <ConfirmationHeader>
            <xsl:variable name="var:vNoticeDate" 
                  select="ScriptNS2:FormateDateNew(userCSharp:StringConcat(s1:idocData/s0:E2EDK03[s0:IDDAT/text()='025']/s0:DATUM/text()
                    , s1:idocData/s0:E2EDK03[s0:IDDAT/text()='025']/s0:UZEIT/text()) 
                    , &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMddHHmmss&quot;)"/>

            <xsl:attribute name="noticeDate">
              <xsl:value-of select="$var:vNoticeDate" />
            </xsl:attribute>

            <xsl:attribute name="confirmID">
              <xsl:value-of select="s1:idocData/s0:E2EDK01005GRP/s0:E2EDK01005/s0:BELNR[1]/text()" />
            </xsl:attribute>

            <xsl:attribute name="type">
              <xsl:value-of select="'detail'" />
            </xsl:attribute>

          </ConfirmationHeader>

          <OrderReference> 
            <xsl:variable name="var:vOrderDate" 
                select="ScriptNS2:FormateDateNew(userCSharp:StringConcat(s1:idocData/s0:E2EDK02[s0:QUALF/text()='001']/s0:DATUM/text()
                    , 120000) 
                    , &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMddHHmmss&quot;)"/>
            
            <xsl:attribute name="orderDate">
              <xsl:value-of select="$var:vOrderDate" />
            </xsl:attribute>

            <xsl:attribute name="orderID">
              <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF/text()='001']/s0:BELNR/text()" />
            </xsl:attribute>   

            <DocumentReference>
              <xsl:attribute name="payloadID">
                <xsl:value-of select="''" />
              </xsl:attribute>
            </DocumentReference>
          </OrderReference>

          <xsl:for-each select="s1:idocData/s0:E2EDP01007GRP">
            <ConfirmationItem>

              <xsl:if test="s0:E2EDP01007/s0:MENGE">
                <xsl:attribute name="quantity">
                  <xsl:value-of select="s0:E2EDP01007/s0:MENGE/text()" />
                </xsl:attribute>
              </xsl:if>
              <!--<xsl:if test="E1EDP01/POSEX">
                <xsl:attribute name="lineNumber">
                  <xsl:value-of select="E1EDP01/POSEX/text()" />
                </xsl:attribute>
              </xsl:if>-->
              <xsl:if test="s0:E2EDP02001/s0:ZEILE">
                <xsl:attribute name="lineNumber">
                  <xsl:value-of select="s0:E2EDP02001/s0:ZEILE/text()" />
                </xsl:attribute>
              </xsl:if>

              <xsl:if test="s0:E2EDP01007/s0:MENEE">
                <xsl:variable name="var:vUOM" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:MENEE/text()) , &quot;SAP.Lion.UOMResponse&quot;)" />
                <xsl:if test="string($var:vUOM)=''">
                  <xsl:message terminate="yes">
                    UOM value is missing.
                  </xsl:message>
                </xsl:if>
                <UnitOfMeasure>
                  <xsl:value-of select="$var:vUOM" />
                </UnitOfMeasure>
              </xsl:if>

              <ConfirmationStatus>

                <xsl:if test="s0:E2EDP20001/s0:WMENG">
                  <xsl:attribute name="quantity">
                    <xsl:value-of select="s0:E2EDP20001/s0:WMENG/text()" />
                  </xsl:attribute>
                </xsl:if>

                <xsl:if test="s0:E2EDP20001/s0:EDATU">
                  <xsl:attribute name="deliveryDate">
                    <xsl:value-of select="ScriptNS2:FormateDateNew(userCSharp:StringConcat(s0:E2EDP20001/s0:EDATU/text(), 120000) , &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMddHHmmss&quot;)"/>
                  </xsl:attribute>
                </xsl:if>

                <!--When E1EDP01-ABGRT is not blank, Confirmation Type = Reject
                    When E1EDP01-ABGRT is blank,
                    if Z1E1DP1-MENGE = E1EDP20-WMENG AND Z1E1DP1-DATUM = E1EDP20-EDATU AND Z1E1DP1-MENEE = E1EDP01-MENEE, Confirmation Type = Accept
                    else Confirmation type = Accept with Change-->
                <xsl:variable name="var:vMENGEqualFlag" select="userCSharp:LogicalEq(s0:Z2E1EDP1000/s0:MENGE/text() , s0:E2EDP20001/s0:WMENG/text())" />
                <xsl:variable name="var:vDATUqualFlag" select="userCSharp:LogicalEq(s0:Z2E1EDP1000/s0:DATUM/text() , s0:E2EDP20001/s0:EDATU/text())" />
                <xsl:variable name="var:vMENEEqualFlag" select="userCSharp:LogicalEq(s0:Z2E1EDP1000/s0:MENEE/text() , s0:E2EDP01007/s0:MENEE/text())" />

                <xsl:attribute name="type">
                  <xsl:choose>
                    <xsl:when test="string($var:vMENGEqualFlag) = 'false' or string($var:vDATUqualFlag) = 'false' or string($var:vMENEEqualFlag) = 'false'">
                      <xsl:value-of select="'detail'" />
                    </xsl:when>
                    <xsl:when test="s0:E2EDP01007/s0:BGRT != ''">
                      <xsl:value-of select="'reject'" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="'accept'" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>

                <xsl:if test="s0:E2EDP01007/s0:MENEE">
                  <xsl:variable name="var:vUOM" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:MENEE/text()) , &quot;SAP.Lion.UOMResponse&quot;)" />
                  <xsl:if test="string($var:vUOM)=''">
                    <xsl:message terminate="yes">
                      UOM value is missing.
                    </xsl:message>
                  </xsl:if>
                  <UnitOfMeasure>
                    <xsl:value-of select="$var:vUOM" />
                  </UnitOfMeasure>
                </xsl:if>

                <xsl:choose>
                  <xsl:when test="string($var:vMENGEqualFlag) = 'false' or string($var:vDATUqualFlag) = 'false' or string($var:vMENEEqualFlag) = 'false'">
                    <ItemIn>
                      <xsl:if test="s0:E2EDP01007/s0:MENGE">
                        <xsl:attribute name="quantity">
                          <xsl:value-of select="s0:E2EDP01007/s0:MENGE/text()" />
                        </xsl:attribute>
                      </xsl:if>

                      <!--<xsl:if test="E1EDP01/POSEX">
                        <xsl:attribute name="lineNumber">
                          <xsl:value-of select="E1EDP01/POSEX/text()" />
                        </xsl:attribute>
                      </xsl:if>-->

                      <xsl:if test="s0:E2EDP02001/s0:ZEILE">
                        <xsl:attribute name="lineNumber">
                          <xsl:value-of select="s0:E2EDP02001/s0:ZEILE/text()" />
                        </xsl:attribute>
                      </xsl:if>

                      <ItemID>
                        <xsl:for-each select="s0:E2EDP19002">
                          <xsl:variable name="var:vQUALFMaterialID" select="string(s0:QUALF/text())" />
                          <xsl:if test="string($var:vQUALFMaterialID)='002'">
                            <xsl:if test="s0:IDTNR">
                              <SupplierPartID>
                                <xsl:value-of select="''" />
                              </SupplierPartID>
                            </xsl:if>
                          </xsl:if>
                          <xsl:if test="string($var:vQUALFMaterialID)='001'">
                            <xsl:if test="s0:IDTNR">
                              <BuyerPartID>
                                <xsl:value-of select="s0:IDTNR/text()" />
                              </BuyerPartID>
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </ItemID>
                      <ItemDetail>
                        <UnitPrice>
                          <Money>
                            <xsl:attribute name="currency">
                              <xsl:value-of select="s0:E2EDP05002GRP[1]/s0:E2EDP05002/s0:KOEIN/text()" />
                            </xsl:attribute>
                            <xsl:value-of select="s0:E2EDP05002GRP[1]/s0:E2EDP05002/s0:KRATE/text()" />
                          </Money>
                        </UnitPrice>
                        <xsl:for-each select="s0:E2EDP19002">
                          <xsl:variable name="var:vQUALFDescription" select="string(s0:QUALF/text())" />
                          <xsl:if test="string($var:vQUALFDescription)='002'">
                            <Description>
                              <xsl:attribute name="xml:lang">
                                <xsl:value-of select="'en'" />
                              </xsl:attribute>
                              <xsl:value-of select="s0:KTEXT/text()" />
                            </Description>
                          </xsl:if>
                        </xsl:for-each>

                        <xsl:if test="s0:E2EDP01007/s0:MENEE">
                          <!--<xsl:variable name="var:vUOM" select="ScriptNS0:GetInterfaceLookupData(string(E2EDP05002GRP[1]/E1EDP05/MEAUN/text()) , &quot;SAP.Lion.UOMResponse&quot;)" />-->
                          <xsl:variable name="var:vUOM" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:MENEE/text()) , &quot;SAP.Lion.UOMResponse&quot;)" />
                          <xsl:if test="string($var:vUOM)=''">
                            <xsl:message terminate="yes">
                              UOM value is missing.
                            </xsl:message>
                          </xsl:if>
                          <UnitOfMeasure>
                            <xsl:value-of select="$var:vUOM" />
                          </UnitOfMeasure>
                        </xsl:if>

                        <xsl:for-each select="s0:E2EDPT1001GRP">
                          <xsl:if test="string(s0:E2EDPT1001/s0:TDID/text())='0010'">
                            <xsl:variable name="var:vTDLINE" select="string(s0:E2EDPT1001/s0:TDLINE/text())" />
                            <PriceBasisQuantity>
                              <xsl:attribute name="conversionFactor">
                                <xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '1')" />
                              </xsl:attribute>
                              <xsl:attribute name="quantity">
                                <xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '0')" />
                              </xsl:attribute>
                              <UnitOfMeasure>
                                <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '2') , &quot;SAP.Lion.UOMResponse&quot;)" />
                              </UnitOfMeasure>
                            </PriceBasisQuantity>
                            <Classification>
                              <xsl:attribute name="domain">
                                <xsl:value-of select="'not available'" />
                              </xsl:attribute>
                              <xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '3')" />
                            </Classification>
                          </xsl:if>
                        </xsl:for-each>
                      </ItemDetail>

                      <Comments>
                        <xsl:value-of select="'Line item changed. Please check for Delivery Date or Quantity change'" />
                      </Comments>

                    </ItemIn>

                    <Comments>
                      <xsl:value-of select="'Line item changed. Please check for Delivery Date or Quantity change'" />
                    </Comments>

                  </xsl:when>
                  <xsl:when test="s0:E2EDP01007/s0:ABGRT != ''">
                    <xsl:variable name="var:vRejectCode" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:ABGRU/text()) , &quot;SAP.Lion.RejectCode&quot;)" />
                    <xsl:variable name="var:vRejectDescription" select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:ABGRU/text()) , &quot;SAP.Lion.RejectDescription&quot;)" />
                    <xsl:variable name="var:vRejectCodeEqualFlag" select="userCSharp:LogicalEq(s0:E2EDP01007/s0:ABGRU/text() , string($var:vRejectCode))" />

                    <xsl:if test="string($var:vRejectCodeEqualFlag) = 'true'">
                      <Comments xml:lang = "en-AU">
                        <xsl:value-of select="s0:E2EDP01007/s0:ABGRT/text()" />
                      </Comments>
                      <Extrinsic name="RejectionReasonComments">
                        <xsl:value-of select="'Other'" />
                      </Extrinsic>
                      <Extrinsic name="RejectionReason">
                        <xsl:value-of select="'other'" />
                      </Extrinsic>
                    </xsl:if>
                    <xsl:if test="string($var:vRejectCodeEqualFlag) = 'false'">
                      <Comments xml:lang = "en-AU">
                        <xsl:value-of select="s0:E2EDP01007/s0:ABGRT/text()" />
                      </Comments>
                      <Extrinsic name="RejectionReasonComments">
                        <xsl:value-of select="$var:vRejectDescription" />
                      </Extrinsic>
                      <Extrinsic name="RejectionReason">
                        <xsl:value-of select="$var:vRejectCode" />
                      </Extrinsic>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                  </xsl:otherwise>
                </xsl:choose>

              </ConfirmationStatus>
            </ConfirmationItem>
          </xsl:for-each>

        </ConfirmationRequest>
      </Request>

    </cXML>
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