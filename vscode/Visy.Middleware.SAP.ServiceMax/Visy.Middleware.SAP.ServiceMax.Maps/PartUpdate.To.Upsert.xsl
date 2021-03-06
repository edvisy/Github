<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s4 s3 s5 s2 s1 s0 userCSharp ScriptNS0" 
                version="1.0" 
                xmlns:ns1="urn:sobject.enterprise.soap.sforce.com" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/CLFMAS02/ZCLFMAS02/620/Receive" 
                xmlns:s3="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:s4="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/MATMAS05//620" 
                xmlns:s5="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/CLFMAS02/ZCLFMAS02/620" 
                xmlns:s2="http://schemas.microsoft.com/BizTalk/2003/aggschema" 
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/MATMAS05//620/Receive" 
                xmlns:ns0="urn:enterprise.soap.sforce.com" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s2:Root" />
  </xsl:template>
  <xsl:template match="/s2:Root">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Product_External_ID__c&quot;)" />
    <ns0:upsert>
      <ns0:externalIDFieldName>
        <xsl:value-of select="$var:v1" />
      </ns0:externalIDFieldName>
      <xsl:for-each select="InputMessagePart_1/s0:Receive/s0:idocData">
        <!--<xsl:for-each select="s5:E2OCLFM001GRP/s5:E2KSSKMGRP">-->
        <xsl:for-each select="s5:E2OCLFM001GRP/s5:E2OCLFM001">
          <xsl:variable name="var:v27" select="userCSharp:StringConcat(&quot;Part&quot;)" />
          <ns0:sObjects>
            <xsl:attribute name="xsi:type">
              <xsl:value-of select="'ns1:Product2'" />
            </xsl:attribute>
            <xsl:for-each select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData">
              <xsl:for-each select="s4:E2MARAM005GRP">
                <xsl:for-each select="s4:E2MTXHM001GRP">
                  <xsl:variable name="var:v2" select="userCSharp:LogicalEq(string(s4:E2MTXHM001/s4:TDOBJECT/text()) , &quot;MATERIAL&quot;)" />
                  <xsl:variable name="var:v3" select="userCSharp:LogicalEq(string(s4:E2MTXHM001/s4:TDID/text()) , &quot;BEST&quot;)" />
                  <xsl:variable name="var:v4" select="userCSharp:LogicalAnd(string($var:v2) , string($var:v3))" />
                  <xsl:if test="$var:v4">
                    <xsl:variable name="var:v5" select="string(s4:E2MTXHM001/s4:TDOBJECT/text())" />
                    <xsl:variable name="var:v6" select="userCSharp:LogicalEq($var:v5 , &quot;MATERIAL&quot;)" />
                    <xsl:variable name="var:v7" select="string(s4:E2MTXHM001/s4:TDID/text())" />
                    <xsl:variable name="var:v8" select="userCSharp:LogicalEq($var:v7 , &quot;BEST&quot;)" />
                    <xsl:variable name="var:v9" select="userCSharp:LogicalAnd(string($var:v6) , string($var:v8))" />
                    <xsl:variable name="var:v10" select="userCSharp:InitCumulativeConcat(0)" />
                    <xsl:for-each select="./s4:E2MTXLM">
                      <xsl:variable name="var:v11" select="userCSharp:AddToCumulativeConcat(0,userCSharp:StringConcat(string(s4:TDLINE/text()),&quot; &quot;),&quot;1000&quot;)" />
                    </xsl:for-each>
                    <xsl:variable name="var:v12" select="userCSharp:GetCumulativeConcat(0)" />
                    <xsl:if test="string($var:v9)='true'">
                      <xsl:variable name="var:v13" select="string($var:v12)" />
                      <xsl:if test="$var:v13 != ''">
                      <ns1:Buy_Description__c>
                        <xsl:value-of select="$var:v13" />
                      </ns1:Buy_Description__c>
                      </xsl:if>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="..">
              <xsl:for-each select="s5:E2AUSPM001[string(s5:ATNAM/text()) = 'COLLOQUIAL']">
                <xsl:if test="position() = 1">
                  <xsl:variable name="var:v17" select="s5:ATWRT/text()" />
                  <ns1:Colloquial_Description__c>
                    <xsl:value-of select="$var:v17" />
                  </ns1:Colloquial_Description__c>                  
                  </xsl:if>              
              </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData">
              <xsl:for-each select="s4:E2MARAM005GRP">
                <xsl:for-each select="s4:E2MTXHM001GRP">
                  <xsl:variable name="var:v18" select="string(s4:E2MTXHM001/s4:TDOBJECT/text())" />
                  <xsl:variable name="var:v19" select="userCSharp:LogicalEq($var:v18 , &quot;MVKE&quot;)" />
                  <xsl:variable name="var:v20" select="string(s4:E2MTXHM001/s4:TDID/text())" />
                  <xsl:variable name="var:v21" select="userCSharp:LogicalEq($var:v20 , &quot;0001&quot;)" />
                  <xsl:variable name="var:v22" select="userCSharp:LogicalAnd(string($var:v19) , string($var:v21))" />
                  <xsl:if test="$var:v22">
                    <xsl:variable name="var:v23" select="userCSharp:InitCumulativeConcat(1)" />
                    <xsl:for-each select="./s4:E2MTXLM">
                      <xsl:variable name="var:v24" select="userCSharp:AddToCumulativeConcat(1,userCSharp:StringConcat(string(s4:TDLINE/text()),&quot; &quot;),&quot;1000&quot;)" />
                    </xsl:for-each>
                    <xsl:variable name="var:v25" select="userCSharp:GetCumulativeConcat(1)" />
                    <xsl:if test="string($var:v22)='true'">
                      <xsl:variable name="var:v26" select="string($var:v25)" />
                      <xsl:if test="$var:v26 != ''">
                      <ns1:Description>
                        <xsl:value-of select="$var:v26" />
                      </ns1:Description>
                      </xsl:if>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:for-each>
            <ns1:Family>
              <xsl:value-of select="$var:v27" />
            </ns1:Family>
            <!--<xsl:if test="s5:E2KSSKM/s5:CLASS">-->
            <!--<xsl:if test="../s5:E2KSSKMGRP/s5:E2KSSKM/s5:CLASS">-->
            <!--<xsl:variable name="var:v28" select="string(../s5:E2KSSKMGRP/s5:E2KSSKM/s5:CLASS/@xsi:nil) = 'true'" />-->
            <!--<xsl:if test="string($var:v28)='true'">
                <ns1:INC__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:INC__c>
              </xsl:if>
              <xsl:if test="string($var:v28)='false'">-->
            <xsl:variable name="var:v28" select="../../../../../InputMessagePart_1/s0:Receive/s0:idocData/s5:E2OCLFM001GRP/s5:E2KSSKMGRP/s5:E2KSSKM[1]/s5:CLASS/text()" />
            <ns1:INC__c>
              <!--<xsl:value-of select="$var:v28" />-->
              <xsl:value-of select="normalize-space($var:v28)"/>
            </ns1:INC__c>
            <!--</xsl:if>
            </xsl:if>-->
            <xsl:variable name="var:v29" select="userCSharp:GetIsActive(string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:LVORM/text()))" />
            <ns1:IsActive>
              <xsl:value-of select="$var:v29" />
            </ns1:IsActive>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATKL">
              <xsl:variable name="var:v30" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATKL/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v30)='true'">
                <ns1:NSC__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:NSC__c>
              </xsl:if>
              <xsl:if test="string($var:v30)='false'">
                <ns1:NSC__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATKL/text()" />
                </ns1:NSC__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MAKTM001/s4:MAKTX">
              <xsl:variable name="var:v31" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MAKTM001/s4:MAKTX/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v31)='true'">
                <ns1:Name>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Name>
              </xsl:if>
              <xsl:if test="string($var:v31)='false'">
                <ns1:Name>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MAKTM001/s4:MAKTX/text()" />
                </ns1:Name>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRPN">
              <xsl:variable name="var:v32" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRPN/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v32)='true'">
                <ns1:OEM_Part_Number__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:OEM_Part_Number__c>
              </xsl:if>
              <xsl:if test="string($var:v32)='false'">
                <ns1:OEM_Part_Number__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRPN/text()" />
                </ns1:OEM_Part_Number__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRNR">
              <xsl:variable name="var:v33" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v33)='true'">
                <ns1:OEM_Supplier__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:OEM_Supplier__c>
              </xsl:if>
              <xsl:if test="string($var:v33)='false'">
                <ns1:OEM_Supplier__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MFRNR/text()" />
                </ns1:OEM_Supplier__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR">
              <xsl:variable name="var:v34" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v34)='true'">
                <ns1:ProductCode>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:ProductCode>
              </xsl:if>
              <xsl:if test="string($var:v34)='false'">
                <ns1:ProductCode>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR/text()" />
                </ns1:ProductCode>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR">
              <xsl:variable name="var:v35" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v35)='true'">
                <ns1:Product_External_ID__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Product_External_ID__c>
              </xsl:if>
              <xsl:if test="string($var:v35)='false'">
                <ns1:Product_External_ID__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MATNR/text()" />
                </ns1:Product_External_ID__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:BISMT">
              <xsl:variable name="var:v36" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:BISMT/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v36)='true'">
                <ns1:Previous_Product_Number__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Previous_Product_Number__c>
              </xsl:if>
              <xsl:if test="string($var:v36)='false'">
                <ns1:Previous_Product_Number__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:BISMT/text()" />
                </ns1:Previous_Product_Number__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MBEWM001/s4:VERPR">
              <xsl:variable name="var:v37" select="string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MBEWM001/s4:VERPR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v37)='true'">
                <ns1:SVMXC__Product_Cost__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:SVMXC__Product_Cost__c>
              </xsl:if>
              <xsl:if test="string($var:v37)='false'">
                <ns1:SVMXC__Product_Cost__c>
                  <xsl:value-of select="../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MBEWM001/s4:VERPR/text()" />
                </ns1:SVMXC__Product_Cost__c>
              </xsl:if>
            </xsl:if>
            <xsl:variable name="var:v38" select="ScriptNS0:GetUOMDescriptionFromShortCode(string(../../../../../InputMessagePart_0/s1:Receive/s1:idocData/s4:E2MARAM005GRP/s4:E2MARAM005/s4:MEINS/text()))" />
            <ns1:SVMXC__Unit_Of_Measure__c>
              <xsl:value-of select="$var:v38" />
            </ns1:SVMXC__Unit_Of_Measure__c>
          </ns0:sObjects>
        </xsl:for-each>
      </xsl:for-each>
    </ns0:upsert>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public bool GetIsActive(string LVORM)
  {
 	if (LVORM == "X")
                  return false;
                else if (LVORM == string.Empty)
                   return true;
                 else
                    return false;
     
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


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
}


public string InitCumulativeConcat(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeConcatArray.Count)
		{
			int i = myCumulativeConcatArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeConcatArray.Add("");
			}
		}
		else
		{
			myCumulativeConcatArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeConcatArray = new System.Collections.ArrayList();

public string AddToCumulativeConcat(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	myCumulativeConcatArray[index] = (string)(myCumulativeConcatArray[index]) + val;
	return myCumulativeConcatArray[index].ToString();
}

public string GetCumulativeConcat(int index)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	return myCumulativeConcatArray[index].ToString();
}

public string StringConcat(string param0)
{
   return param0;
}

public string StringConcat(string param0,string param1)
{
   return param0 + param1;
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