<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s1 s2 s3 xml s0 ScriptNS0 userCSharp"
                version="1.0"
                xmlns:s2="http://tempuri.org/cXML_1.2.031"
                xmlns:s3="uri:xades"
                xmlns:xml="http://www.w3.org/XML/1998/namespace"
                xmlns:ns0="http://Visy.Middleware.SAP.Lion.Schemas.Forecast"
                xmlns:s0="uri:ds"
                xmlns:s1="http://Visy.Middleware.SAP.Lion.Schemas.cXMLEnvelope"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:cXMLEnvelope" />
  </xsl:template>
  <xsl:template match="/s1:cXMLEnvelope">
    <xsl:variable name="var:vOrderDate" select="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest[1]/s2:OrderRequestHeader[1]/@orderDate" />
    <ns0:Forecast>
      <Header>
        <xsl:attribute name="PurchaseOrder">
          <xsl:value-of select="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@orderID" />
        </xsl:attribute>
        <xsl:attribute name="DocumentDate">
          <xsl:value-of select="userCSharp:FormatDate(string($var:vOrderDate))" />
        </xsl:attribute>
        <xsl:attribute name="FromPeriod">
          <xsl:value-of select="userCSharp:FormatDate(string(cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@effectiveDate))" />
        </xsl:attribute>
        <xsl:attribute name="ToPeriod">
          <xsl:value-of select="userCSharp:FormatDate(string(cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/@expirationDate))" />
        </xsl:attribute>
        <xsl:for-each select="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:IdReference">
          <xsl:if test="@domain='VisyAddressRefId'">
            <xsl:variable name="var:vAddressID" select="ScriptNS0:GetInterfaceLookupData(string(@identifier) , &quot;SAP.Lion.ShipTo&quot;)" />
            <xsl:attribute name="BuyerCode">
              <xsl:value-of select="$var:vAddressID" />
            </xsl:attribute>
            <xsl:attribute name="VisyBuyerCode">
              <xsl:value-of select="$var:vAddressID" />
            </xsl:attribute>
            <!--<xsl:if test="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID">-->
            <xsl:attribute name="SupplierCode">
              <xsl:value-of select="@identifier" />
            </xsl:attribute>
          </xsl:if>
        </xsl:for-each>
        <xsl:if test="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID">
          <xsl:attribute name="VisySupplierCode">
            <xsl:value-of select="cXMLs/s2:cXML[1]/s2:Request/s2:OrderRequest/s2:OrderRequestHeader/s2:ShipTo/s2:Address/@addressID" />
          </xsl:attribute>
        </xsl:if>
      </Header>
      <xsl:for-each select="cXMLs/s2:cXML/s2:Request/s2:OrderRequest/s2:ItemOut">
        <Details>
          <xsl:if test="@lineNumber">
            <xsl:attribute name="LineNo">
              <xsl:value-of select="userCSharp:MyPadding(@lineNumber)" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="s2:ItemID/s2:BuyerPartID">
            <xsl:attribute name="Material">
              <xsl:value-of select="number(s2:ItemID/s2:BuyerPartID/text())" />
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="MaterialDescription">
            <xsl:value-of select="s2:ItemDetail/s2:Description/text()" />
          </xsl:attribute>
          <xsl:for-each select="../s2:OrderRequestHeader/s2:ShipTo/s2:IdReference">
            <xsl:if test="@domain='VisyAddressRefId'">
              <xsl:variable name="var:vShipTo" select="ScriptNS0:GetInterfaceLookupData(string(@identifier) , &quot;SAP.Lion.ShipTo&quot;)" />
              <xsl:attribute name="VisyShipTo">
                <xsl:value-of select="$var:vShipTo" />
              </xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <xsl:attribute name="UOM">
            <xsl:value-of select="ScriptNS0:GetInterfaceLookupData(string(s2:ItemDetail/s2:UnitOfMeasure/text()) , &quot;SAP.Lion.UOM&quot;)" />
          </xsl:attribute>
          <xsl:for-each select="s2:ScheduleLine">
            <xsl:variable name="var:vCommitFirm" select="userCSharp:LogicalEq(string(s2:ScheduleLineReleaseInfo/@commitmentCode) , &quot;firm&quot;)" />
            <xsl:variable name="var:vCommitNotFirm" select="userCSharp:LogicalNot(string($var:vCommitFirm))" />

            <xsl:variable name="var:vCommitTradeoff" select="userCSharp:LogicalEq(string(s2:ScheduleLineReleaseInfo/@commitmentCode) , &quot;tradeoff&quot;)" />
            <xsl:variable name="var:vCommitForecast" select="userCSharp:LogicalEq(string(s2:ScheduleLineReleaseInfo/@commitmentCode) , &quot;forecast&quot;)" />
            <!--05-Nov-19 Ariba provided changes on requirements to define Bucket types-->
            <xsl:variable name="var:vBucket" select="userCSharp:LogicalEq(string(s2:Extrinsic/@name) , &quot;Bucket&quot;)" />
            <xsl:variable name="var:vBucketWeekly" select="userCSharp:LogicalEq(string(s2:Extrinsic) , &quot;W&quot;)" />
            <xsl:variable name="var:vBucketMonthly" select="userCSharp:LogicalEq(string(s2:Extrinsic) , &quot;M&quot;)" />

            <Schedules>
              <xsl:attribute name="Quantity">
                <xsl:value-of select="@quantity" />
              </xsl:attribute>
              <xsl:attribute name="Date">
                <xsl:value-of select="userCSharp:FormatDate(string(@requestedDeliveryDate))" />
              </xsl:attribute>
              <!--<xsl:if test="string($var:vCommitFirm)='true'">-->
              <xsl:if test="string($var:vBucket)='false'">
                <xsl:attribute name="Bucket">
                  <xsl:value-of select="'DAILY'" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:vBucket)='true'">
                <!--<xsl:if test="string($var:vCommitTradeoff)='true'">-->
                <xsl:if test="string($var:vBucketWeekly)='true'">
                  <xsl:attribute name="Bucket">
                    <xsl:value-of select="'WEEKLY'" />
                  </xsl:attribute>
                </xsl:if>
                <!--<xsl:if test="string($var:vCommitForecast)='true'">-->
                <xsl:if test="string($var:vBucketMonthly)='true'">
                  <xsl:attribute name="Bucket">
                    <xsl:value-of select="'MONTHLY'" />
                  </xsl:attribute>
                </xsl:if>
              </xsl:if>

              <xsl:if test="string($var:vCommitFirm)='true'">
                <xsl:variable name="var:vForecastFirm" select="&quot;FIRM&quot;" />
                <xsl:attribute name="DeliveryPlan">
                  <xsl:value-of select="$var:vForecastFirm" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:vCommitNotFirm)='true'">
                <xsl:variable name="var:vForecastPlan" select="&quot;PLAN&quot;" />
                <xsl:attribute name="DeliveryPlan">
                  <xsl:value-of select="$var:vForecastPlan" />
                </xsl:attribute>
              </xsl:if>
            </Schedules>
          </xsl:for-each>
        </Details>
      </xsl:for-each>
    </ns0:Forecast>
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


public bool LogicalNot(string val)
{
	return !ValToBool(val);
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

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}


]]>
  </msxsl:script>
</xsl:stylesheet>