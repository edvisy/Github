<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0" version="1.0"
                xmlns:ns0="http://Visy.Middleware.LGX.Bundaberg.Schemas.Single"
                xmlns:ns1="http://Visy.Middleware.LGX.Bundaberg.Schemas.Multiple"
                xmlns:s0="http://Visy.Middleware.LGX.Bundaberg.Schemas.StagingXml"
				xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:key use="PONumber" match="/s0:Staging/Details" name="groups"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:Staging" />
	</xsl:template>
	<xsl:template match="/s0:Staging">
		<ns1:Multiple>
			<xsl:for-each select="Details[generate-id(.)=generate-id(key('groups',PONumber))]">
				<ns0:Single>
					<PONumber>
						<xsl:value-of select="PONumber/text()" />
					</PONumber>
					<PODate>
						<xsl:value-of select="PODate/text()" />
					</PODate>
					<xsl:for-each select="key('groups',PONumber)">
						<Details>
							<DeliveryDate>
								<xsl:value-of select="DeliveryDate/text()" />
							</DeliveryDate>
							<ProductCode>
								<xsl:value-of select="ProductCode/text()" />
							</ProductCode>
							<Price>
								<xsl:value-of select="Price/text()" />
							</Price>
							<LineNumber>
								<xsl:value-of select="LineNumber/text()" />
							</LineNumber>
							<Quantity>
								<xsl:value-of select="Quantity/text()" />
							</Quantity>
							<Description>
								<xsl:value-of select="Description/text()" />
							</Description>
							<UOM>
								<xsl:value-of select="UOM/text()" />
							</UOM>
							<WHC>
								<xsl:value-of select="WHC/text()" />
							</WHC>
						</Details>
					</xsl:for-each>
				</ns0:Single>
			</xsl:for-each>
		</ns1:Multiple>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
}

public string OLEDate(string param1)
{
    double number = double.Parse(param1);
	  DateTime conv = DateTime.FromOADate(number);

    return conv.ToString("MM/dd/yyyy");
	//return conv.ToString("yyyyMMdd");
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