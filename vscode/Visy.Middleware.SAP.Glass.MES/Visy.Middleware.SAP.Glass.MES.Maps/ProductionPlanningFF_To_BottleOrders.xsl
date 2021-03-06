<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0 ScriptNS1" version="1.0" xmlns:s0="http://Visy.Middleware.SAP.Glass.MES.Schemas.ProductionPlanningFF" xmlns:ns0="http://ws.xi.productionplanner.oi.com/wsdl" xmlns:ns1="http://ws.xi.productionplanner.oi.com/types" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:ProductionPlanning" />
	</xsl:template>
	<xsl:template match="/s0:ProductionPlanning">
		<xsl:variable name="var:v60" select="userCSharp:StringConcat(&quot;15&quot;)" />
		<ns0:updateBottleOrders>
			<xsl:for-each select="Details[(string(OrderType/text())='ZP02') or (string(OrderType/text())='LA' and substring(MaterialNumber/text(), 1, 1)='2' and substring(WorkCenter/text(), 5, 1)='H')]">
				<ns0:bottleOrders>
					<ns1:id>
						<xsl:value-of select="OrderNumber/text()" />
					</ns1:id>					
					<ns1:plant>
						<xsl:value-of select="ScriptNS0:GetInterfaceLookupData(string(Plant/text()) , &quot;SAP.Glass.MES.PlantId&quot;)" />
					</ns1:plant>
					<ns1:workCentre>
						<xsl:value-of select="userCSharp:StringConcat(string(ScriptNS0:GetInterfaceLookupData(string(Plant/text()) , &quot;SAP.Glass.MES.PlantId&quot;)) , string(Line/text()))"  />
					</ns1:workCentre>
					<ns1:glassContainer>
						<xsl:value-of select="MaterialNumber/text()" />
					</ns1:glassContainer>
					<ns1:start>
						<xsl:value-of select="userCSharp:StringConcat(ScriptNS1:FormateDateNew(string(BasicStartDate/text()),
                       &quot;yyyy-MM-dd&quot; , &quot;dd.MM.yyyy&quot;) , &quot;T&quot; , string(BasicStartTime/text()))"/>
					</ns1:start>
					<ns1:end>
						<xsl:value-of select="userCSharp:StringConcat(ScriptNS1:FormateDateNew(string(BasicFinDate/text()),
                       &quot;yyyy-MM-dd&quot; , &quot;dd.MM.yyyy&quot;) , &quot;T&quot; , string(BasicFinishTime/text()))"/>
					</ns1:end>
					<ns1:quantity>
						<xsl:value-of select="userCSharp:MathInt(string(TargetQuantity/text()))" />
					</ns1:quantity>
					<ns1:quantityUnits>
						<xsl:value-of select="Unit/text()" />
					</ns1:quantityUnits>
					<ns1:planSpeed>
						<xsl:value-of select="normalize-space(Speed/text())" />
					</ns1:planSpeed>
					<ns1:planEfficiency>
						<xsl:value-of select="normalize-space(Efficiency/text())" />
					</ns1:planEfficiency>
					<ns1:planWeight>
						<xsl:value-of select="Weight/text()" />
					</ns1:planWeight>
					<ns1:mouldSet>
						<xsl:value-of select="MouldMaterialDesc/text()" />
					</ns1:mouldSet>
					<ns1:blankSet>
						<xsl:value-of select="BlankMaterialDesc/text()" />
					</ns1:blankSet>
					<ns1:colour>
						<xsl:value-of select="Colour/text()" />
					</ns1:colour>						
					<xsl:choose>
						<xsl:when test="string(OrderType/text())='LA' and substring(MaterialNumber/text(), 1, 1)='2' and substring(WorkCenter/text(), 5, 1)='H'">
							<ns1:process>
								<xsl:value-of select="ProcessCode/text()" />
							</ns1:process>
						</xsl:when>
						<xsl:when test="string(OrderType/text())='ZP02'  and string(MaterialNumber/text()) != '2200560'">
							<xsl:variable name="var:v51" select="string(Sections/text())" />
							<xsl:variable name="var:v52" select="userCSharp:MathInt($var:v51)" />
							<xsl:variable name="var:v53" select="userCSharp:LogicalEq(string($var:v52) , &quot;0&quot;)" />
							<xsl:variable name="var:v54" select="userCSharp:LogicalNot(string($var:v53))" />
							<xsl:choose>
								<xsl:when test="string($var:v54)='true'">
									<xsl:variable name="var:v55" select="string(ProcessCode/text())" />
									<xsl:variable name="var:v56" select="userCSharp:StringSize($var:v55)" />
									<xsl:variable name="var:v57" select="userCSharp:MathSubtract(string($var:v56) , &quot;3&quot;)" />
									<xsl:variable name="var:v58" select="userCSharp:StringSubstring($var:v55 , string($var:v57) , string($var:v56))" />
									<xsl:variable name="var:v59" select="userCSharp:StringConcat(string($var:v52) , string($var:v58))" />
									<ns1:process>
										<xsl:value-of select="substring(concat('000000', $var:v59),  string-length($var:v59) + 1,  6)" />
									</ns1:process>            
								</xsl:when>
								<xsl:otherwise>
									<ns1:process>
										<xsl:value-of select='000000' />
									</ns1:process>
								</xsl:otherwise>
							</xsl:choose>							 
						</xsl:when>
						<xsl:otherwise>
							<ns1:process>
								<xsl:value-of select='000000' />
							</ns1:process>
						</xsl:otherwise>
					</xsl:choose>					
				</ns0:bottleOrders>

			</xsl:for-each>
			<ns0:source>
				<xsl:value-of select="$var:v60" />
			</ns0:source>
		</ns0:updateBottleOrders>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
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


public bool LogicalOr(string param0, string param1)
{
	return ValToBool(param0) || ValToBool(param1);
	return false;
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


public bool LogicalAnd(string param0, string param1, string param2, string param3)
{
	return ValToBool(param0) && ValToBool(param1) && ValToBool(param2) && ValToBool(param3);
	return false;
}


public string StringConcat(string param0, string param1)
{
   return param0 + param1;
}


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
}


public string DateCurrentDateTime()
{
	DateTime dt = DateTime.Now;
	string curdate = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
	string curtime = dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
	string retval = curdate + "T" + curtime;
	return retval;
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


public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
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


public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
}


public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
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