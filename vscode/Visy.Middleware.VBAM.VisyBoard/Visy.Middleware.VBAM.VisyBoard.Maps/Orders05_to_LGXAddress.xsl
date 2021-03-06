<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	exclude-result-prefixes="msxsl var s2 s1 s0 userCSharp ScriptNS0"
	version="1.0"
	xmlns:ns0="http://Visy.Middleware.VBAM.VisyBoard.Schemas.Address"
	xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
	xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//620/Receive"
	xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//620"
	xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" 
  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
 
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s1:Receive/s1:idocData" />
  </xsl:template>
  <xsl:template match="/s1:Receive/s1:idocData">
    <!-- validation-->

    <xsl:if test="string(ScriptNS0:GetLookupData(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN) , &quot;VBAM.VisyBoard.CustomerCode&quot;))= string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN)">
      <xsl:message terminate="yes">
        <xsl:value-of select="concat(string(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN)), ' does not have matching LGX Customer Code')"/>
      </xsl:message>
    </xsl:if>
    
    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS)= ''">
      <xsl:if test="count(//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:STRAS) = 0">
        <xsl:message terminate="yes">
          Ship To Address is required.
        </xsl:message>
      </xsl:if>
      <xsl:for-each select="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
        <xsl:if test="string(s0:STRAS)= ''">
          <xsl:message terminate="yes">
            Ship To Address is required.
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    
    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:NAME1)= ''">
      <xsl:if test="count(//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:NAME1) = 0">
        <xsl:message terminate="yes">
          Ship To Name is missing.
        </xsl:message>
      </xsl:if>
      <xsl:for-each select="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
        <xsl:if test="string(s0:NAME1)= ''">
          <xsl:message terminate="yes">
            Ship To Name is missing.
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:PSTLZ)= ''">
      <xsl:if test="count(//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:PSTLZ) = 0">
        <xsl:message terminate="yes">
          Ship To Postal Code is missing.
        </xsl:message>
      </xsl:if>
      <xsl:for-each select="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
        <xsl:if test="string(s0:PSTLZ)= ''">
          <xsl:message terminate="yes">
            Ship To Postal Code is missing.
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:ORT01)= ''">
      <xsl:if test="count(//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:ORT01) = 0">
        <xsl:message terminate="yes">
          Ship To City is missing.
        </xsl:message>
      </xsl:if>
      <xsl:for-each select="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
        <xsl:if test="string(s0:ORT01)= ''">
          <xsl:message terminate="yes">
            Ship To City is missing.
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:REGIO)= ''">
      <xsl:if test="count(//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:REGIO) = 0">
        <xsl:message terminate="yes">
          Ship To Region is missing.
        </xsl:message>
      </xsl:if>
      <xsl:for-each select="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
        <xsl:if test="string(s0:REGIO)= ''">
          <xsl:message terminate="yes">
            Ship To Region is missing.
          </xsl:message>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN)= ''">
      <xsl:message terminate="yes">
        PLant code is missing.
      </xsl:message>
    </xsl:if>
    
    <xsl:if test="count(s0:E2EDP01007GRP[not(contains(string(ScriptNS0:GetLookupData(&quot;ProductCodes&quot;, &quot;VBAM.VisyBoard.ExcludedMaterial&quot;)), s0:E2EDP01007/s0:MATNR))]) = 0">
      <xsl:message terminate="yes">
        Missing Line Items
      </xsl:message>
    </xsl:if>   
    <!-- end validation-->
    <ns0:Address>
      <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS)= ''">
        <xsl:apply-templates select="//s0:E2EDP01007GRP[1]/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']"/>
      </xsl:if>
      <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS) != ''">
        <xsl:apply-templates select="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']"/>
      </xsl:if>
      <ns0:Trailer>
        <xsl:element name="record_type">
          <xsl:value-of select="'90'" />
        </xsl:element>
      </ns0:Trailer>
    </ns0:Address>   
  </xsl:template>

  <xsl:template match="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']">
    <xsl:variable name="var:customerCode" select="string(ScriptNS0:GetLookupData(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN) , &quot;VBAM.VisyBoard.CustomerCode&quot;))" />
    <ns0:Details>
      <xsl:element name="record_type">50</xsl:element>
      <xsl:element name="customer_ean">
        <xsl:value-of select="'9399999001596'"/>
      </xsl:element>
      <xsl:element name="plant_code">
        <xsl:value-of select="''" />
      </xsl:element>
      <xsl:element name="customer_code">
        <xsl:value-of select="$var:customerCode" />
      </xsl:element>
      <xsl:element name="address1">
        <xsl:value-of select="s0:STRAS" />
      </xsl:element>
      <xsl:element name="address2">
        <xsl:if test="s0:STRS2">
          <xsl:value-of select="s0:STRS2" />
        </xsl:if>
      </xsl:element>
      <xsl:element name="addressee">
        <xsl:value-of select="concat(s0:NAME1, ' ', s0:NAME2)" />
      </xsl:element>
      <xsl:element name="city">
        <xsl:value-of select="s0:ORT01" />
      </xsl:element>
      <xsl:element name="state_code">
        <xsl:value-of select="s0:REGIO" />
      </xsl:element>
      <xsl:element name="post_code">
        <xsl:value-of select="s0:PSTLZ" />
      </xsl:element>
      <xsl:element name="phone">
        <xsl:value-of select="s0:TELF1" />
      </xsl:element>
      <xsl:element name="fax">
        <xsl:value-of select="s0:TELFX" />
      </xsl:element>
      <xsl:element name="country_code">
        <xsl:value-of select="s0:LAND1" />
      </xsl:element>
      <xsl:element name="warehouse_code">
            <xsl:value-of select="concat(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN
                        , substring(s0:NAME1, 1, 5)
                        , substring(s0:STRAS, 1, 10))"/>
      </xsl:element>
      <xsl:element name="application_code">
        <xsl:value-of select="'EDI'"/>
      </xsl:element>
      <xsl:element name="biztalk_id">
        <xsl:value-of select="ScriptNS0:GetDataValue(&quot;BizTalkId&quot;)" />
      </xsl:element>
    </ns0:Details>
  </xsl:template>

  <xsl:template match="//s0:E2EDP01007GRP/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']">
    <xsl:variable name="var:customerCode" select="string(ScriptNS0:GetLookupData(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN) , &quot;VBAM.VisyBoard.CustomerCode&quot;))" />
    <ns0:Details>
      <xsl:element name="record_type">50</xsl:element>
      <xsl:element name="customer_ean">
        <xsl:value-of select="'9399999001596'"/>
      </xsl:element>
      <xsl:element name="plant_code">
        <xsl:value-of select="''" />
      </xsl:element>
      <xsl:element name="customer_code">
        <xsl:value-of select="$var:customerCode" />
      </xsl:element>
      <xsl:element name="address1">
        <xsl:value-of select="s0:STRAS" />
      </xsl:element>
      <xsl:element name="address2">
        <xsl:if test="s0:STRS2">
          <xsl:value-of select="s0:STRS2" />
        </xsl:if>
      </xsl:element>
      <xsl:element name="addressee">
        <xsl:value-of select="concat(s0:NAME1, ' ', s0:NAME2)" />
      </xsl:element>
      <xsl:element name="city">
        <xsl:value-of select="s0:ORT01" />
      </xsl:element>
      <xsl:element name="state_code">
        <xsl:value-of select="s0:REGIO" />
      </xsl:element>
      <xsl:element name="post_code">
        <xsl:value-of select="s0:PSTLZ" />
      </xsl:element>
      <xsl:element name="phone">
        <xsl:value-of select="s0:TELF1" />
      </xsl:element>
      <xsl:element name="fax">
        <xsl:value-of select="s0:TELFX" />
      </xsl:element>
      <xsl:element name="country_code">
        <xsl:value-of select="s0:LAND1" />
      </xsl:element>
      <xsl:element name="warehouse_code">
        <xsl:value-of select="concat(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN
                        , substring(s0:NAME1, 1, 5)
                        , substring(s0:STRAS, 1, 10))"/>
      </xsl:element>
      <xsl:element name="application_code">
        <xsl:value-of select="'EDI'"/>
      </xsl:element>
      <xsl:element name="biztalk_id">
        <xsl:value-of select="ScriptNS0:GetDataValue(&quot;BizTalkId&quot;)" />
      </xsl:element>
    </ns0:Details>   
  </xsl:template>
  
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string GetGuid()
    {
	    return  System.Guid.NewGuid().ToString();
    }
    ]]>
  </msxsl:script>
</xsl:stylesheet>