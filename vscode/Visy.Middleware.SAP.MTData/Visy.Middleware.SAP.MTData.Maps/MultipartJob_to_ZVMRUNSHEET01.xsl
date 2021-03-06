<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:msxsl="urn:schemas-microsoft-com:xslt"
		xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
		exclude-result-prefixes="msxsl var s0 s2 s1 userCSharp ScriptNS0"
		version="1.0"
		xmlns:ns1="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZVMRUNSHEET01//620"
		xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/"
		xmlns:s0="http://www.mtdata.com.au/integration/services/job/1.0.0"
		xmlns:s1="http://ecommerce.visy.com.au/integration/services/logisticswebservice/messageheader/1.0.0"
		xmlns:s2="http://schemas.microsoft.com/BizTalk/2003/aggschema"
		xmlns:ns3="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
		xmlns:ns0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZVMRUNSHEET01//620/Send"
		xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
		xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />

	<xsl:template match="/">
		<xsl:apply-templates select="/s2:Root" />
	</xsl:template>

	<xsl:template match="/s2:Root">
		<xsl:variable name="var:v5" select="string(InputMessagePart_0/s1:MessageHeader/Recipient/text())" />
		<xsl:variable name="var:v9" select="userCSharp:StringUpperCase(string(InputMessagePart_1/s0:Job/Assignment/VehicleExternalReference/text()))" />
		<xsl:variable name="var:v29" select="string(InputMessagePart_0/s1:MessageHeader/InterchangeID/text())" />
		<ns0:Send>
			<ns0:idocData>
				<ns1:EDI_DC40>
					<ns3:IDOCTYP>
						<xsl:value-of select="'ZVMRUNSHEET01'" />
					</ns3:IDOCTYP>
					<ns3:MESTYP>
						<xsl:value-of select="'ZVMRUNSHEET'" />
					</ns3:MESTYP>
          <ns3:SNDPOR>
            <xsl:value-of select="userCSharp:SenderPort(string(InputMessagePart_0/s1:MessageHeader/Recipient/text()))" />
          </ns3:SNDPOR>
					<ns3:SNDPRT>
						<xsl:value-of select="'LS'" />
					</ns3:SNDPRT>
          <ns3:SNDPRN>
            <xsl:value-of select="InputMessagePart_0/s1:MessageHeader/Sender/text()" />
          </ns3:SNDPRN>
          <xsl:variable name="var:v6" select="userCSharp:RecipientPartnerNo($var:v5)" />
					<ns3:RCVPOR>
						<xsl:value-of select="$var:v6" />
					</ns3:RCVPOR>
					<ns3:RCVPRT>
						<xsl:value-of select="'LS'" />
					</ns3:RCVPRT>
					<ns3:RCVPFC>
						<xsl:value-of select="'LS'" />
					</ns3:RCVPFC>
          <xsl:variable name="var:v7" select="userCSharp:RecipientPort($var:v5)" />
					<ns3:RCVPRN>
						<xsl:value-of select="$var:v7" />
					</ns3:RCVPRN>
					<ns3:REFMES>
						<xsl:value-of select="InputMessagePart_1/s0:Job/JobReference/text()" />
					</ns3:REFMES>
					<ns3:ARCKEY>
						<xsl:value-of select="ScriptNS0:FormatGuid(string(InputMessagePart_0/s1:MessageHeader/InterchangeID/text()))" />
					</ns3:ARCKEY>
					<ns3:SERIAL>
						<xsl:value-of select="userCSharp:GetDate(string(InputMessagePart_0/s1:MessageHeader/CreatedDateTime/text()))" />
					</ns3:SERIAL>
				</ns1:EDI_DC40>
				<ns1:ZVMRHDR000GRP>
					<ns1:ZVMRHDR000>
						<ns1:DATAHEADERCOLUMN_SEGNAM>
							<xsl:text>ZVMRHDR000</xsl:text>
						</ns1:DATAHEADERCOLUMN_SEGNAM>
						<ns1:RS_NUMBER>
							<xsl:value-of select="InputMessagePart_1/s0:Job/JobReference/text()" />
						</ns1:RS_NUMBER>
						<ns1:EXT_REF>
							<xsl:value-of select="InputMessagePart_1/s0:Job/DispatchId/text()" />
						</ns1:EXT_REF>
						<ns1:EXT_STATUS>
							<xsl:value-of select="InputMessagePart_1/s0:Job/JobStatus/text()" />
						</ns1:EXT_STATUS>
						<ns1:DEVICE_ID>
							<xsl:value-of select="$var:v9" />
						</ns1:DEVICE_ID>
					</ns1:ZVMRHDR000>
					<xsl:for-each select="InputMessagePart_1/s0:Job/Leg">

						<xsl:variable name="var:v14" select="userCSharp:MathDivide(string(LegAction/CompletedLegActionBinPickup/ActualWeightKg/text()) , &quot;1000&quot;)" />
						<xsl:variable name="var:v15" select="userCSharp:LogicalEq(string(LegAction/@type) , &quot;BinPickup&quot;)" />
						<xsl:variable name="var:v17" select="string(LegAction/@type)" />
						<xsl:variable name="var:v18" select="userCSharp:LogicalEq($var:v17 , &quot;BinPickup&quot;)" />
						<xsl:variable name="var:v20" select="userCSharp:LogicalEq($var:v17 , &quot;BinPickupDrop&quot;)" />
						<xsl:variable name="var:v23" select="userCSharp:StringConcat(&quot;true&quot;)" />
						<xsl:variable name="var:v24" select="userCSharp:LogicalEq(string(LegAction/LegActionBinPickup/IsAdhocLeg/text()) , string($var:v23))" />
						<xsl:variable name="var:v26" select="string(LegAction/LegActionBinPickup/IsAdhocLeg/text())" />
						<xsl:variable name="var:v27" select="userCSharp:LogicalNe($var:v26 , string($var:v23))" />
            <xsl:variable name="externalReferenceCheck" select="normalize-space(ExternalReference)" />

						<xsl:if test="$externalReferenceCheck != ''" >
							<ns1:ZVMRITM000>
								<ns1:DATAHEADERCOLUMN_SEGNAM>
									<xsl:text>ZVMRITM000</xsl:text>
								</ns1:DATAHEADERCOLUMN_SEGNAM>
								<ns1:RS_NUMBER>
									<xsl:value-of select="../JobReference/text()" />
								</ns1:RS_NUMBER>
								<ns1:ITEM_NO>
									<xsl:value-of select="ExternalReference/text()" />
								</ns1:ITEM_NO>

								<ns1:LIFSP>
									<xsl:if test="number(LegAction/CompletedLegActionBinPickup/FutileId) != -1">
										<xsl:value-of select="LegAction/CompletedLegActionBinPickup/FutileCode/text()" />
									</xsl:if>
									<xsl:if test="number(LegAction/CompletedLegActionBinPickup/MissedId) != -1">
										<xsl:value-of select="LegAction/CompletedLegActionBinPickup/MissedCode/text()" />
									</xsl:if>
									<xsl:if test="number(LegAction/CompletedLegActionBinPickup/MiscellaneousId) != -1">
										<xsl:value-of select="LegAction/CompletedLegActionBinPickup/MiscellaneousCode/text()" />
									</xsl:if>
								</ns1:LIFSP>

								<ns1:ACT_QTY>
									<xsl:value-of select="LegAction/CompletedLegActionBinPickup/ActualQuantity/text()" />
								</ns1:ACT_QTY>
								<ns1:ACT_AMT>
									<xsl:value-of select="$var:v14" />
								</ns1:ACT_AMT>

								<ns1:EXT_ITEMID>
									<xsl:value-of select="LegId/text()" />
								</ns1:EXT_ITEMID>
								<ns1:EXT_STATUS>
									<xsl:value-of select="LegStatus/text()" />
								</ns1:EXT_STATUS>
								<xsl:if test="string($var:v15)='true'">
									<xsl:variable name="var:v16" select="LegAction/LegActionId/text()" />
									<ns1:PICKUP_ACTIONID>
										<xsl:value-of select="$var:v16" />
									</ns1:PICKUP_ACTIONID>
								</xsl:if>
								<xsl:if test="string($var:v18)='true'">
									<xsl:variable name="var:v19" select="LegAction/LegActionStatus/text()" />
									<ns1:PICKUP_STATUS>
										<xsl:value-of select="$var:v19" />
									</ns1:PICKUP_STATUS>
								</xsl:if>
								<xsl:if test="string($var:v20)='true'">
									<xsl:variable name="var:v21" select="LegAction/LegActionId/text()" />
									<ns1:DROP_ACTIONID>
										<xsl:value-of select="$var:v21" />
									</ns1:DROP_ACTIONID>
								</xsl:if>
								<xsl:if test="string($var:v20)='true'">
									<xsl:variable name="var:v22" select="LegAction/LegActionStatus/text()" />
									<ns1:DROP_STATUS>
										<xsl:value-of select="$var:v22" />
									</ns1:DROP_STATUS>
								</xsl:if>
								<!--
								<xsl:if test="string($var:v24)='true'">
									<xsl:variable name="var:v25" select="&quot;X&quot;" />
									<ns1:IS_ADHOC>
										<xsl:value-of select="$var:v25" />
									</ns1:IS_ADHOC>
								</xsl:if>
								<xsl:if test="string($var:v27)='true'">
								-->
								<ns1:IS_ADHOC>
									<xsl:value-of select="&quot;&quot;" />
								</ns1:IS_ADHOC>
								<!--
								</xsl:if>
								-->
								<xsl:if test="boolean(LegAction/CompletedLegActionBinDrop)">
									<ns1:WB_DCKT_LEGID>
										<xsl:value-of select="number(LegAction/CompletedLegActionBinDrop/LegId)" />
									</ns1:WB_DCKT_LEGID>
								</xsl:if>
                <ns1:COMMENTS_LONG>
                  <xsl:value-of select="LegAction/CompletedLegActionBinPickup/Comments/text()" />
                </ns1:COMMENTS_LONG>
							</ns1:ZVMRITM000>
						</xsl:if>
						
					</xsl:for-each>

				</ns1:ZVMRHDR000GRP>

				<xsl:for-each select="InputMessagePart_1/s0:Job/Leg">
					<xsl:variable name="externalReferenceCheck" select="normalize-space(ExternalReference)" />
					<!-- We create ZVMRDOCKET nodes only where we don't have an External Reference against the Leg -->
					<xsl:if test="$externalReferenceCheck = ''" >
						<xsl:if test="boolean(LegAction/CompletedLegActionBinTransferStation)" >
							<ns1:ZVMRDOCKET000>
								<ns1:DATAHEADERCOLUMN_SEGNAM>
									<xsl:text>ZVMRDOCKET000</xsl:text>
								</ns1:DATAHEADERCOLUMN_SEGNAM>
								<ns1:LEGID>
									<xsl:value-of select="LegId/text()" />
								</ns1:LEGID>
								<ns1:WB_DOCKET>
									<xsl:value-of select="LegAction/CompletedLegActionBinTransferStation/WeighBridgeDocket/text()" />
								</ns1:WB_DOCKET>

								<ns1:HOURS>
									<xsl:value-of select="number(LegAction/CompletedLegActionBinTransferStation/Hours)" />
								</ns1:HOURS>

								<ns1:WB_WEIGHT>
									<xsl:value-of select="number(LegAction/CompletedLegActionBinTransferStation/WeightKg) div 1000" />
								</ns1:WB_WEIGHT>
								<ns1:PLANT_CODE>
									<xsl:value-of select="LegAction/CompletedLegActionBinTransferStation/PlantCode/text()" />
								</ns1:PLANT_CODE>
                <ns1:WASTE_TYPE>
                  <xsl:value-of select="LegAction/CompletedLegActionBinTransferStation/WasteType/text()" />
                </ns1:WASTE_TYPE>

              </ns1:ZVMRDOCKET000>
						</xsl:if>
						
					</xsl:if>
				</xsl:for-each>
			</ns0:idocData>
			<xsl:variable name="var:v30" select="ScriptNS0:FormatGuid($var:v29)" />
			<ns0:guid>
				<xsl:value-of select="$var:v30" />
			</ns0:guid>
		</ns0:Send>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
public string StringConcat(string param0)
{
   return param0;
}

public string GetDate(string dateTime)
{
	DateTime tempDateTime = DateTime.Parse(dateTime);
	return tempDateTime.ToString("yyyyMMddHHmmssfff");
}

public string SenderPort(string recipient)
{
  string portName = "UNKNOWN";
  switch (recipient.ToUpper())
  {
    case "VISYDEV":
      portName = "BIZTALKDEV";
      break;
    case "VISYTEST":
      portName = "BIZTALKUAT";
      break;
    case "VISYPROD":
      portName = "BIZTALKPRD";
      break;
  }
  return portName;
}

public string RecipientPartnerNo(string recipient)
{
  string partnerNo = "UNKNOWN";
  switch (recipient.ToUpper())
  {
    case "VISYDEV":
      partnerNo = "SD1210";
      break;
    case "VISYTEST":
      partnerNo = "ST1330";
      break;
    case "VISYPROD":
      partnerNo = "SP1330";
      break;
  }
  return partnerNo;
}

public string RecipientPort(string recipient)
{
  string portName = "UNKNOWN";
  switch (recipient.ToUpper())
  {
    case "VISYDEV":
      portName = "SAPSD1";
      break;
    case "VISYTEST":
      portName = "SAPST1";
      break;
    case "VISYPROD":
      portName = "SAPSP1";
      break;
  }
  return portName;
}

public string StringUpperCase(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.ToUpper(System.Globalization.CultureInfo.InvariantCulture);
}


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
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


public string MathDivide(string val1, string val2)
{
	string retval = "";
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		if (d2 != 0)
		{
			double ret = d1 / d2;
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
	}
	return retval;
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