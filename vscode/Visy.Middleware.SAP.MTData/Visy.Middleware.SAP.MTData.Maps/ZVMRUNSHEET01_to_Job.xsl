<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
		xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
		xmlns:ns0="http://www.mtdata.com.au/integration/services/job/1.0.0" 
		xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ZVMRUNSHEET01//620" 
		xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ZVMRUNSHEET01//620/Receive" 
		xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
		xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
		xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
		exclude-result-prefixes="msxsl var s0 s1 s2 userCSharp ScriptNS0" >
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	
	<!-- Global variables -->
	<xsl:variable name="createStatus" select="/s1:Receive/s1:idocData/s0:ZVMRHDR000GRP/s0:ZVMRHDR000/s0:STATUS/text()" />
	<!-- Set this to 'true' when testing standalone outside of the BizTalk Mapper -->
	<xsl:variable name="standalone" select="'false'" />
	
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive/s1:idocData/s0:ZVMRHDR000GRP" />
  </xsl:template>

	<xsl:template match="*[local-name()='ZVMRHDR000GRP']">
		<ns0:Job>
			<xsl:attribute name="type">
				<xsl:value-of select="'Bin'" />
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:value-of select="1" />
			</xsl:attribute>

			<xsl:apply-templates />

			<xsl:apply-templates select="*[local-name()='ZVMRHDR000']" mode="Assignment" />
			
		</ns0:Job>
	</xsl:template>


	<xsl:template match="*[local-name()='ZVMRHDR000']">
		<DispatchId>
			<xsl:if test="$createStatus='CREATED'">
				<xsl:value-of select="-1" />
			</xsl:if>
			<xsl:if test="$createStatus!='CREATED'">
				<xsl:value-of select="number(s0:EXT_REF)" />
			</xsl:if>
		</DispatchId>
		<JobStatus>
			<xsl:if test="$createStatus='CREATED'">
				<xsl:value-of select="'New'" />
			</xsl:if>
			<xsl:if test="$createStatus!='CREATED'">
				<xsl:value-of select="string(s0:EXT_STATUS)" />
			</xsl:if>
		</JobStatus>
		<JobReference>
			<xsl:value-of select="s0:RS_NUMBER/text()" />
		</JobReference>
		<JobReferenceInt>
			<xsl:value-of select="0" />
		</JobReferenceInt>
		<Title>
			<xsl:value-of select="s0:RTE_DESC/text()" />
			<xsl:value-of select="' - '" />
			<xsl:value-of select="s0:RS_NUMBER/text()" />
			<xsl:value-of select="' - '" />
			<xsl:if test="s0:RS_DATE/text() != ''" >
				<xsl:value-of select="' '" />
				<xsl:value-of select="ScriptNS0:ConvertDateTime(string(s0:RS_DATE/text()), 'yyyyMMdd', 'dd.MM.yy')"/>
			</xsl:if>
			<xsl:if test="s0:RS_DATE_TO/text() != ''" >
				<xsl:value-of select="' '" />
				<xsl:value-of select="ScriptNS0:ConvertDateTime(string(s0:RS_DATE_TO/text()), 'yyyyMMdd', 'dd.MM.yy')" />
			</xsl:if>
		</Title>
		<CustomerGroupId>
			<xsl:value-of select="-1" />
		</CustomerGroupId>
		<CustomerGroupVersion>
			<xsl:value-of select="-1" />
		</CustomerGroupVersion>
		<CustomerId>
			<xsl:value-of select="-1" />
		</CustomerId>
		<JobBin>
			<xsl:attribute name="version">
				<xsl:value-of select="2" />
			</xsl:attribute>
			<PrepopulateActualWeight>
				<xsl:choose>
					<xsl:when test="s0:POPULATE_WGHT/text()='X'">
						<xsl:value-of select="'Yes'" />
					</xsl:when>
					<xsl:when test="s0:PROPOSE_WGHT/text()='X'">
						<xsl:value-of select="'Elsewhere'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'No'" />
					</xsl:otherwise>
				</xsl:choose>
			</PrepopulateActualWeight>
			<WeighbridgeTolerance>
				<xsl:value-of select="number(s0:TOLERANCE)" />
			</WeighbridgeTolerance>
			<IsToleranceAnError>
				<xsl:value-of select="s0:TOL_MSG_TYPE/text()='E'" />
			</IsToleranceAnError>
			<TransferStationGroupId>
				<xsl:value-of select="number(s0:PLANT_LISTID)" />
			</TransferStationGroupId>
			<TransferStationGroupVersion>
				<xsl:value-of select="-1" />
			</TransferStationGroupVersion>
			<PreferredTransferStationId>
				<xsl:value-of select="number(s0:SHIP_PNT)" />
			</PreferredTransferStationId>
			<TagLocationListId>
				<xsl:value-of select="number(s0:TAGLOC_LISTID)" />
			</TagLocationListId>
			<TagLocationListVersion>
				<xsl:value-of select="-1" />
			</TagLocationListVersion>
			<FutileListId>
				<xsl:value-of select="number(s0:FUTILE_LISTID)" />
			</FutileListId>
			<FutileListVersion>
				<xsl:value-of select="-1" />
			</FutileListVersion>
			<MissedListId>
				<xsl:value-of select="number(s0:MISSED_LISTID)" />
			</MissedListId>
			<MissedListVersion>
				<xsl:value-of select="-1" />
			</MissedListVersion>
			<MiscellaneousListId>
				<xsl:value-of select="number(s0:MISCELLANEOUS_LISTID)" />
			</MiscellaneousListId>
			<MiscellaneousListVersion>
				<xsl:value-of select="-1" />
			</MiscellaneousListVersion>
      <MaxHours>
        <xsl:value-of select="number(s0:MAXRSHOURS)" /> 
      </MaxHours>
		</JobBin>

	</xsl:template>

	<xsl:template match="*[local-name()='ZVMRITM000']">
		<Leg>
			<xsl:attribute name="type">
				<xsl:value-of select="'Simple'" />
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:value-of select="1" />
			</xsl:attribute>
      <!--
			<LegId>
				<xsl:if test="$createStatus='CREATED'">
					<xsl:value-of select="'-' "/>
					<xsl:value-of select="position()" />
				</xsl:if>
				<xsl:if test="$createStatus!='CREATED'">
					<xsl:value-of select="number(s0:EXT_ITEMID)" />
				</xsl:if>
			</LegId>
      -->
      <LegId>
        <xsl:choose>
          <xsl:when test="number(normalize-space(s0:EXT_ITEMID)) != 0">
            <xsl:value-of select="number(s0:EXT_ITEMID)" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'-' "/>
            <xsl:value-of select="position()" />
          </xsl:otherwise>
        </xsl:choose>
      </LegId>
			<LegStatus>
				<xsl:if test="$createStatus='CREATED'">
					<xsl:value-of select="'NotArrived' "/>
				</xsl:if>
				<xsl:if test="$createStatus!='CREATED'">
					<xsl:value-of select="s0:EXT_STATUS/text()" />
				</xsl:if>
			</LegStatus>
			<LegNumber>
				<xsl:value-of select="number(s0:SEQ_NO)" />
			</LegNumber>
			<Title></Title>
			<Notes>
				<xsl:value-of select="s0:NOTES1/text()" />
				<xsl:if test="s0:NOTES2/text() != ''">
					<xsl:value-of select="' '" />
					<xsl:value-of select="s0:NOTES2/text()" />
				</xsl:if>
			</Notes>
			<ExternalReference>
				<xsl:value-of select="s0:ITEM_NO/text()" />
			</ExternalReference>
			<CustomerGroupId>
				<xsl:value-of select="-1" />
			</CustomerGroupId>
			<CustomerGroupVersion>
				<xsl:value-of select="-1" />
			</CustomerGroupVersion>
			<CustomerId>
				<xsl:value-of select="-1" />
			</CustomerId>
			<LocationName>
				<xsl:value-of select="s0:CUST_NAME/text()" />
			</LocationName>
			<Address>
				<xsl:value-of select="s0:STREET/text()" />
				<xsl:value-of select="'\n'" />
				<xsl:value-of select="s0:SUBURB/text()" />
			</Address>
			<PhoneNumber><!--<xsl:value-of select="s0:TELF1/text()" />-->
      </PhoneNumber>
			<Latitude>
				<xsl:value-of select="0" />
			</Latitude>
			<Longitude>
				<xsl:value-of select="0" />
			</Longitude>
			<Radius>
				<xsl:value-of select="0" />
			</Radius>
			<EmailFlags>
				<xsl:value-of select="0" />
			</EmailFlags>
			<EmailAtDistance>
				<xsl:value-of select="-1" />
			</EmailAtDistance>
			<EmailAddress></EmailAddress>
			<ArriveTime>
				<xsl:if test="$standalone='true'">
					<xsl:value-of select="'2011-01-01T00:00:00'" />
				</xsl:if>
				<xsl:if test="$standalone!='true'">
					<xsl:value-of select="ScriptNS0:ConvertDateTime(string(s0:PICKUP_DT/text()), 'yyyyMMdd', 'yyyy-MM-ddT00:00:00')" />
				</xsl:if>
			</ArriveTime>
			<ArriveTimeTolerance>
				<xsl:value-of select="0" />
			</ArriveTimeTolerance>
			<DepartTime></DepartTime>
			<DepartTimeTolerance>
				<xsl:value-of select="0" />
			</DepartTimeTolerance>


			<!-- Create the BinPickup type LegAction node -->
			<xsl:call-template name="LegActionTemplate">
				<xsl:with-param name="type">BinPickup</xsl:with-param>
				<xsl:with-param name="legActionId">
					<xsl:if test="$createStatus='CREATED'">
						<xsl:value-of select="'-1'"/>
					</xsl:if>
					<xsl:if test="$createStatus!='CREATED'">
						<xsl:value-of select="s0:PICKUP_ACTIONID/text()"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="legActionStatus">
					<xsl:if test="$createStatus='CREATED'">
						<xsl:value-of select="'NotStarted'"/>
					</xsl:if>
					<xsl:if test="$createStatus!='CREATED'">
						<xsl:value-of select="s0:PICKUP_STATUS/text()"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="legActionNumber">0</xsl:with-param>
			</xsl:call-template>

			<!-- Create the BinPickupDrop type LegAction node -->
			<xsl:call-template name="LegActionTemplate">
				<xsl:with-param name="type">BinPickupDrop</xsl:with-param>
				<xsl:with-param name="legActionId">
					<xsl:if test="$createStatus='CREATED'">
						<xsl:value-of select="'-2'"/>
					</xsl:if>
					<xsl:if test="$createStatus!='CREATED'">
						<xsl:value-of select="s0:DROP_ACTIONID/text()"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="legActionStatus">
					<xsl:if test="$createStatus='CREATED'">
						<xsl:value-of select="'NotStarted'"/>
					</xsl:if>
					<xsl:if test="$createStatus!='CREATED'">
						<xsl:value-of select="s0:DROP_STATUS/text()"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="legActionNumber">1</xsl:with-param>
			</xsl:call-template>

			<PreviousLegs>
				<xsl:attribute name="version">
					<xsl:value-of select="1" />
				</xsl:attribute>
			</PreviousLegs>

		</Leg>
	</xsl:template>


	<xsl:template name="LegActionTemplate">
		<xsl:param name="type" />
		<xsl:param name="version" select="1" />
		<xsl:param name="legActionId" />
		<xsl:param name="legActionStatus" />
		<xsl:param name="legActionNumber" />

		<LegAction>
			<xsl:attribute name="type">
				<xsl:value-of select="$type" />
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:value-of select="$version" />
			</xsl:attribute>
			<LegActionId>
				<xsl:value-of select="number($legActionId)" />
			</LegActionId>
			<LegActionStatus>
				<xsl:value-of select="$legActionStatus" />
			</LegActionStatus>
			<LegActionNumber>
				<xsl:value-of select="number($legActionNumber)" />
			</LegActionNumber>
			<Title></Title>
			<Notes></Notes>
			<ExternalReference></ExternalReference>

			<xsl:if test="$type='BinPickup'">
				<xsl:call-template name="LegActionBinPickupTemplate" />
			</xsl:if>
			
		</LegAction>
		
	</xsl:template>


	<xsl:template name="LegActionBinPickupTemplate">
		<LegActionBinPickup>
			<xsl:attribute name="version">
				<xsl:value-of select="3" />
			</xsl:attribute>
			<Material>
				<xsl:value-of select="s0:MATERIAL/text()" />
			</Material>
			<MaterialDescription>
				<xsl:value-of select="s0:MAT_DESC/text()" />
			</MaterialDescription>
			<EstWeightKg>
				<xsl:value-of select="floor(number(s0:EST_AMT) * 1000)" />
			</EstWeightKg>
			<EstQuantity>
				<xsl:value-of select="number(s0:EST_QTY)" />
			</EstQuantity>
			<Vessel>
				<xsl:value-of select="s0:VESSEL/text()" />
			</Vessel>
			<Frequency>
				<xsl:value-of select="s0:FREQ_TEXT/text()" />
			</Frequency>
			<IsAdhocLeg>
				<xsl:value-of select="s0:IS_ADHOC='X'" />
			</IsAdhocLeg>
      <MaxVessels>
        <xsl:value-of select="s0:MAX_NO_VESSELS/text()" />
      </MaxVessels>
		</LegActionBinPickup>

	</xsl:template>

	<xsl:template match="*[local-name()='ZVMRHDR000']" mode="Assignment" >
		<Assignment>
			<FleetId>
				<xsl:value-of select="-1" />
			</FleetId>
			<VehicleId>
				<xsl:value-of select="-1" />
			</VehicleId>
			<VehicleExternalReference>
				<xsl:value-of select="s0:DEVICE_ID/text()" />
			</VehicleExternalReference>
			<Action>
				<xsl:if test="$createStatus='CREATED'">
					<xsl:value-of select="'N'" />
				</xsl:if>
				<xsl:if test="$createStatus!='CREATED'">
					<xsl:value-of select="'U'" />
				</xsl:if>
			</Action>
		</Assignment>

	</xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string StringConcat(string param0, string param1, string param2, string param3, string param4)
{
   return param0 + param1 + param2 + param3 + param4;
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


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
}


public string StringConcat(string param0, string param1)
{
   return param0 + param1;
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


public string MathMultiply(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 1;
	bool first = true;
	foreach (string obj in listValues)
	{
		double d = 0;
		if (IsNumeric(obj, ref d))
		{
			if (first)
			{
				first = false;
				ret = d;
			}
			else
			{
				ret *= d;
			}
		}
		else
		{
			return "";
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
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


]]></msxsl:script>
</xsl:stylesheet>