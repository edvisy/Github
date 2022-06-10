<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s1 s0 s2 userCSharp ScriptNS0" 
                version="1.0" xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/DEBMAS07//740/Receive" 
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/DEBMAS07//740" 
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
                xmlns:ns1="urn:sobject.enterprise.soap.sforce.com" 
                xmlns:ns0="urn:enterprise.soap.sforce.com" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
              xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Billing_External_ID__c&quot;)" />
    
    <ns0:upsert>
      <ns0:externalIDFieldName>
        <xsl:value-of select="$var:v1" />
      </ns0:externalIDFieldName>
      <xsl:for-each select="s1:idocData">
        <xsl:for-each select="s0:E2KNA1M005GRP/s0:E2KNKKM001GRP">
          <xsl:variable name="var:v7" select="string(../s0:E2KNA1M005/s0:LAND1/text())" />
          <xsl:variable name="var:v25" select="userCSharp:StringConcat(&quot;Customer&quot;)" />
          <ns0:sObjects>
            <xsl:attribute name="xsi:type">
              <xsl:value-of select="'ns1:Account'" />
            </xsl:attribute>
            <xsl:if test="../s0:E2KNA1M005/s0:STCEG">
              <xsl:variable name="var:v2" select="string(../s0:E2KNA1M005/s0:STCEG/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v2)='true'">
                <ns1:ABN__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:ABN__c>
              </xsl:if>
              <xsl:if test="string($var:v2)='false'">
                <ns1:ABN__c>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:STCEG/text()" />
                </ns1:ABN__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:KUNNR">
              <xsl:variable name="var:v3" select="string(../s0:E2KNA1M005/s0:KUNNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v3)='true'">
                <ns1:AccountNumber>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:AccountNumber>
              </xsl:if>
              <xsl:if test="string($var:v3)='false'">
                <ns1:AccountNumber>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:KUNNR/text()" />
                </ns1:AccountNumber>                
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:ORT01">
              <xsl:variable name="var:v4" select="string(../s0:E2KNA1M005/s0:ORT01/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v4)='true'">
                <ns1:BillingCity>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:BillingCity>
              </xsl:if>
              <xsl:if test="string($var:v4)='false'">
                <ns1:BillingCity>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:ORT01/text()" />
                </ns1:BillingCity>
              </xsl:if>
            </xsl:if>
            <xsl:variable name="var:v5" select="ScriptNS0:GetCountryNameFromCode(string(../s0:E2KNA1M005/s0:LAND1/text()))" />
            <ns1:BillingCountry>
              <xsl:value-of select="$var:v5" />
            </ns1:BillingCountry>
            <xsl:if test="../s0:E2KNA1M005/s0:PSTLZ">
              <xsl:variable name="var:v6" select="string(../s0:E2KNA1M005/s0:PSTLZ/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v6)='true'">
                <ns1:BillingPostalCode>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:BillingPostalCode>
              </xsl:if>
              <xsl:if test="string($var:v6)='false'">
                <ns1:BillingPostalCode>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:PSTLZ/text()" />
                </ns1:BillingPostalCode>
              </xsl:if>
            </xsl:if>
            <xsl:variable name="var:v8" select="ScriptNS0:GetRegionNameFromCode($var:v7 , string(../s0:E2KNA1M005/s0:REGIO/text()))" />
            <ns1:BillingState>
              <xsl:value-of select="$var:v8" />
            </ns1:BillingState>
            <xsl:if test="../s0:E2KNA1M005/s0:STRAS">
              <xsl:variable name="var:v9" select="string(../s0:E2KNA1M005/s0:STRAS/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v9)='true'">
                <ns1:BillingStreet>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:BillingStreet>
              </xsl:if>
              <xsl:if test="string($var:v9)='false'">
                <ns1:BillingStreet>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:STRAS/text()" />
                </ns1:BillingStreet>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:KUNNR">
              <xsl:variable name="var:v10" select="string(../s0:E2KNA1M005/s0:KUNNR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v10)='true'">
                <ns1:Billing_External_ID__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Billing_External_ID__c>
              </xsl:if>
              <xsl:if test="string($var:v10)='false'">
                <ns1:Billing_External_ID__c>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:KUNNR/text()" />
                </ns1:Billing_External_ID__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="s0:E2KNKKM001/s0:DBPAY">
              <xsl:variable name="var:v11" select="string(s0:E2KNKKM001/s0:DBPAY/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v11)='true'">
                <ns1:Credit_Status__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Credit_Status__c>
              </xsl:if>
              <xsl:if test="string($var:v11)='false'">
                <ns1:Credit_Status__c>
                  <xsl:value-of select="s0:E2KNKKM001/s0:DBPAY/text()" />
                </ns1:Credit_Status__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNB1M008GRP/s0:E2KNB1M008/s0:SMTP_ADDR">
              <xsl:variable name="var:v12" select="string(../s0:E2KNB1M008GRP/s0:E2KNB1M008/s0:SMTP_ADDR/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v12)='true'">
                <ns1:Email__c>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Email__c>
              </xsl:if>
              <xsl:if test="string($var:v12)='false'">
                <ns1:Email__c>
                  <xsl:value-of select="../s0:E2KNB1M008GRP/s0:E2KNB1M008/s0:SMTP_ADDR/text()" />
                </ns1:Email__c>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:TELFX">
              <xsl:variable name="var:v13" select="string(../s0:E2KNA1M005/s0:TELFX/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v13)='true'">
                <ns1:Fax>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Fax>
              </xsl:if>
              <xsl:if test="string($var:v13)='false'">
                <ns1:Fax>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:TELFX/text()" />
                </ns1:Fax>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:NAME1">
              <xsl:variable name="var:v14" select="string(../s0:E2KNA1M005/s0:NAME1/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v14)='true'">
                <ns1:Name>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Name>
              </xsl:if>
              <xsl:if test="string($var:v14)='false'">
                <ns1:Name>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:NAME1/text()" />
                </ns1:Name>
              </xsl:if>
            </xsl:if>
            <xsl:if test="../s0:E2KNA1M005/s0:TELF1">
              <xsl:variable name="var:v15" select="string(../s0:E2KNA1M005/s0:TELF1/@xsi:nil) = 'true'" />
              <xsl:if test="string($var:v15)='true'">
                <ns1:Phone>
                  <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="'true'" />
                  </xsl:attribute>
                </ns1:Phone>
              </xsl:if>
              <xsl:if test="string($var:v15)='false'">
                <ns1:Phone>
                  <xsl:value-of select="../s0:E2KNA1M005/s0:TELF1/text()" />
                </ns1:Phone>
              </xsl:if>
            </xsl:if>
            <!--<xsl:for-each select="..">
              <xsl:for-each select="s0:E2KNVVM008GRP">
                <xsl:variable name="varMainCustomer" select="string(../s0:E2KNA1M005/s0:KUNNR/text())" />
                <xsl:for-each select="s0:E2KNVPM002[string(s0:PARVW/text()) = 'RE' and string(s0:KUNN2/text()) != $varMainCustomer]">
                  <xsl:if test="position() = 1">
                  <ns1:Sale_Account_del__r>
                      <xsl:variable name="var:v23" select="s0:KUNN2/text()" />                     
                        <ns1:Billing_External_ID__c>
                          <xsl:value-of select="$var:v23" />
                        </ns1:Billing_External_ID__c>
                  </ns1:Sale_Account_del__r>
                  </xsl:if>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:for-each>-->
            <ns1:Type>
              <xsl:value-of select="$var:v25" />
            </ns1:Type>
          </ns0:sObjects>
        </xsl:for-each>
      </xsl:for-each>
    </ns0:upsert>
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


public bool getCount( int param1)  
  {
	if (param1 == 1)
                      return true;
                else
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


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


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