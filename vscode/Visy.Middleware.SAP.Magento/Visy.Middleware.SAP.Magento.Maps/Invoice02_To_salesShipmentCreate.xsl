<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                exclude-result-prefixes="msxsl var s0 s1 s2 userCSharp ScriptNS0"
                version="1.0"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/INVOIC02//620"
                xmlns:ns1="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/INVOIC02//620/Receive"
                xmlns:ns0="urn:Magento"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive" />
  </xsl:template>
  <xsl:template match="/s1:Receive">
    <ns0:salesOrderShipmentCreate>
      <sessionId>
        <xsl:value-of select="ScriptNS0:GetDataValue('SessionId')" />
      </sessionId>
      <xsl:if test="s1:idocData/s0:E2EDK02[s0:QUALF='001']/s0:BELNR">
        <orderIncrementId>
          <xsl:value-of select="s1:idocData/s0:E2EDK02[s0:QUALF='001']/s0:BELNR/text()" />
        </orderIncrementId>
      </xsl:if>
      <itemsQty>
        <xsl:for-each select="s1:idocData/s0:E2EDP01007GRP">
          <item>
            <xsl:variable name="var:vZeile" select="string(s0:E2EDP02001[s0:QUALF='001']/s0:ZEILE/text())" />
            <order_item_id>
              <xsl:value-of select="$var:vZeile" />
            </order_item_id>
            <qty>
              <xsl:value-of select="string(s0:E2EDP01007/s0:MENGE/text())" />
            </qty>
          </item>
        </xsl:for-each>
      </itemsQty>
      <xsl:if test="s1:idocData/s0:E2EDK01005/s0:BELNR">
        <comment>
          <xsl:value-of select="s1:idocData/s0:E2EDKT1002GRP/s0:E2EDKT2001/s0:TDLINE/text()" />
        </comment>
      </xsl:if>
      <!--<email></email>
      <includecomment></includecomment>-->
    </ns0:salesOrderShipmentCreate>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

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