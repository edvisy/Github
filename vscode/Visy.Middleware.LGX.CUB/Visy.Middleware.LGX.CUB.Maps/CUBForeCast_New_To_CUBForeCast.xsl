<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
  exclude-result-prefixes="msxsl var s0 userCSharp" 
  version="1.0" 
  xmlns:s0="http://Visy.Middleware.LGX.CUB.Schemas.CUBForeCastXML_New" 
  xmlns:ns0="http://Visy.Middleware.LGX.CUB.Schemas.CUBForeCastXML"
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:key use="s0:FieldA" match="/s0:CUBForeCast_New/s0:Details" name="groups"/> 
   
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:CUBForeCast_New" />
	</xsl:template>
	<xsl:template match="/s0:CUBForeCast_New">
		<ns0:CUBForeCast>
			<ns0:Header>
				<ns0:FieldA>Material</ns0:FieldA>
				<ns0:FieldC>UOM</ns0:FieldC>
				<ns0:FieldD>Plant</ns0:FieldD>
				<ns0:FieldE>Calendar year / week</ns0:FieldE>
				<xsl:variable name="materialNoHeader">
					<xsl:value-of select="/s0:CUBForeCast_New/s0:Details/s0:FieldA/text()[1]" />
				</xsl:variable>        
        <xsl:for-each select="/s0:CUBForeCast_New/s0:Details[s0:FieldA/text()=$materialNoHeader]">
					<xsl:sort select="s0:FieldG" />
					<xsl:if test="position()=1">
						<ns0:FieldF>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldF>
					</xsl:if>
					<xsl:if test="position()=2">
						<ns0:FieldG>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldG>
					</xsl:if>          
					<xsl:if test="position()=3">
						<ns0:FieldH>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldH>
					</xsl:if>
					<xsl:if test="position()=4">
						<ns0:FieldI>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldI>
					</xsl:if>          
					<xsl:if test="position()=5">
						<ns0:FieldJ>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldJ>
					</xsl:if>
					<xsl:if test="position()=6">
						<ns0:FieldK>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldK>
					</xsl:if>          
					<xsl:if test="position()=7">
						<ns0:FieldL>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldL>
					</xsl:if>
					<xsl:if test="position()=8">
						<ns0:FieldM>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldM>
					</xsl:if>    
					<xsl:if test="position()=9">
						<ns0:FieldN>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldN>
					</xsl:if>
					<xsl:if test="position()=10">
						<ns0:FieldO>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldO>
					</xsl:if>
					<xsl:if test="position()=11">
						<ns0:FieldP>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldP>
					</xsl:if>
					<xsl:if test="position()=12">
						<ns0:FieldQ>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldQ>
					</xsl:if>
					<xsl:if test="position()=13">
						<ns0:FieldR>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldR>
					</xsl:if>
					<xsl:if test="position()=14">
						<ns0:FieldS>
							<xsl:value-of select="s0:FieldG/text()" />
						</ns0:FieldS>
					</xsl:if>
				</xsl:for-each>
       <ns0:FieldT>Overall Result</ns0:FieldT>
			</ns0:Header>
			<xsl:for-each select="/s0:CUBForeCast_New/s0:Details[generate-id(.)=generate-id(key('groups',s0:FieldA))]">
				<ns0:Details>
					<xsl:variable name="materialNo">
						<xsl:value-of select="s0:FieldA/text()" />
					</xsl:variable>
					<ns0:FieldA>
						<xsl:value-of select="$materialNo" />
					</ns0:FieldA>
					<ns0:FieldB>
						<xsl:value-of select="s0:FieldB/text()" />
					</ns0:FieldB>
					<ns0:FieldC>
						<xsl:value-of select="s0:FieldC/text()" />
					</ns0:FieldC>
					<ns0:FieldD>
						<xsl:value-of select="s0:FieldD/text()" />
					</ns0:FieldD>
					<ns0:FieldE>
						<xsl:value-of select="s0:FieldE/text()" />
					</ns0:FieldE>
          <xsl:variable name="var:v1" select="userCSharp:InitCumulativeSum(0)" />          
					<xsl:for-each select="/s0:CUBForeCast_New/s0:Details[s0:FieldA/text()=$materialNo]">
						<xsl:sort select="s0:FieldG" />          
						<xsl:if test="position()=1">             
							<ns0:FieldF>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldF>
						</xsl:if>
						<xsl:if test="position()=2">
							<ns0:FieldG>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldG>
						</xsl:if>          
						<xsl:if test="position()=3">
							<ns0:FieldH>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldH>
						</xsl:if>
						<xsl:if test="position()=4">
							<ns0:FieldI>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldI>
						</xsl:if>          
						<xsl:if test="position()=5">
							<ns0:FieldJ>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldJ>
						</xsl:if>
						<xsl:if test="position()=6">
							<ns0:FieldK>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldK>
						</xsl:if>          
						<xsl:if test="position()=7">
							<ns0:FieldL>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldL>
						</xsl:if>
						<xsl:if test="position()=8">
							<ns0:FieldM>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldM>
						</xsl:if>    
						<xsl:if test="position()=9">
							<ns0:FieldN>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldN>
						</xsl:if>
						<xsl:if test="position()=10">
							<ns0:FieldO>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldO>
						</xsl:if>
						<xsl:if test="position()=11">
							<ns0:FieldP>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldP>
						</xsl:if>
						<xsl:if test="position()=12">
							<ns0:FieldQ>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldQ>
						</xsl:if>
						<xsl:if test="position()=13">
							<ns0:FieldR>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldR>
						</xsl:if>
            	<xsl:if test="position()=14">
							<ns0:FieldS>
								<xsl:value-of select="s0:FieldF/text()" />
							</ns0:FieldS>
						</xsl:if>
           
            <xsl:variable name="var:v2" select="userCSharp:AddToCumulativeSum(0,string(s0:FieldF/text()),&quot;1000&quot;)" />
					</xsl:for-each>
          
          <xsl:variable name="var:totalSum" select="userCSharp:GetCumulativeSum(0)" />
					
          <ns0:FieldT>					 					
							  <xsl:value-of select="$var:totalSum"/>					
          </ns0:FieldT>
				</ns0:Details>
			</xsl:for-each>
		</ns0:CUBForeCast>
	</xsl:template>


  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string InitCumulativeSum(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeSumArray.Count)
		{
			int i = myCumulativeSumArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeSumArray.Add("");
			}
		}
		else
		{
			myCumulativeSumArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeSumArray = new System.Collections.ArrayList();

public string AddToCumulativeSum(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
    }
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		if (myCumulativeSumArray[index] == "")
		{
			myCumulativeSumArray[index] = d;
		}
		else
		{
			myCumulativeSumArray[index] = (double)(myCumulativeSumArray[index]) + d;
		}
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
}

public string GetCumulativeSum(int index)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
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

