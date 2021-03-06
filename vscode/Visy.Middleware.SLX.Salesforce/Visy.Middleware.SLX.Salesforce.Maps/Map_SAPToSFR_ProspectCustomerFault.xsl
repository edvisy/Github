<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" 
                xmlns:ns0="http://Visy.Middleware.SLX.Salesforce.Schemas.CreateProspectCustomer" 
                xmlns:s0="urn:sap-com:document:sap:rfc:functions"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Z_INF_VIPA_PROSPECTCUST_CREATE.Response" />
  </xsl:template>
  <xsl:template match="/s0:Z_INF_VIPA_PROSPECTCUST_CREATE.Response">
    <xsl:variable name="var:FaultValue"></xsl:variable>
    <xsl:for-each select="MESSAGES/item">
      <xsl:value-of select="userCSharp:ConcatFaultMessage(MESSAGE/text())"/>      
    </xsl:for-each>
    <ns0:FaultMessage>
      <xsl:value-of select="userCSharp:MyConcat()"/>
    </ns0:FaultMessage>
  </xsl:template>

    <msxsl:script language="C#" implements-prefix="userCSharp">
          <![CDATA[
    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string concatValue{get;set;}
    public void ConcatFaultMessage(string param)
    {
      concatValue = concatValue + " Error: " + param;
	    //return !String.IsNullOrEmpty(concatValue) ? concatValue + param : "" + param;
    }


    ///*Uncomment the following code for a sample Inline C# function
    //that concatenates two inputs. Change the number of parameters of
    //this function to be equal to the number of inputs connected to this functoid.*/

    public string MyConcat()
    {
	    return concatValue;
    }
    
]]>
    </msxsl:script>
 
</xsl:stylesheet>