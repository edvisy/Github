<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	exclude-result-prefixes="msxsl var s2 s1 s0 userCSharp ScriptNS0"
	version="1.0"
	xmlns:ns0="http://Visy.Middleware.VBAM.VisyBoard.ORDER"
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
  <xsl:variable name="var:customerCode" select="string(ScriptNS0:GetLookupData(string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN) , &quot;VBAM.VisyBoard.CustomerCode&quot;))" />
    <ns0:ORDER>
      <ns0:Header>        
        <xsl:attribute name="order_type">N</xsl:attribute>
        <xsl:attribute name="application_code">EDI</xsl:attribute>
        <!-- EAN for Visy Board -->
        <xsl:if test="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:LIFNR">
          <xsl:variable name="lifnr" select="number(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:LIFNR)" />
          <xsl:attribute name="customer_ean">
            <xsl:value-of select="'9399999001596'"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="customer_code">
          <xsl:value-of select="$var:customerCode" />
        </xsl:attribute>
        <xsl:if test="s0:E2EDK01005/s0:BELNR">
          <xsl:attribute name="purchase_order_number">
            <xsl:value-of select="s0:E2EDK01005/s0:BELNR" />
          </xsl:attribute>
        </xsl:if>
        <!-- Purchase Order date/time-->
        <xsl:if test="s0:E2EDK02[s0:QUALF = '001']">
          <xsl:attribute name="purchase_order_date">
            <xsl:value-of select="s0:E2EDK02[s0:QUALF = '001']/s0:DATUM" />
          </xsl:attribute>
          <xsl:attribute name="purchase_order_time">
            <xsl:choose>
              <xsl:when test="s0:E2EDK02[s0:QUALF = '001']/s0:UZEIT != ''">
                <xsl:value-of select="substring(s0:E2EDK02[s0:QUALF = '001']/s0:UZEIT, 1, 4)" />
              </xsl:when>
              <xsl:otherwise>0000</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </xsl:if>
        <!-- Customer Name -->
        
            <xsl:attribute name="customer_name">
              <xsl:value-of select="'Visy Boxes &amp; More'"/>
            </xsl:attribute>
         
      
        <!-- Customer Address -->
        <xsl:if test="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS != ''">
          <xsl:attribute name="customer_address">
            <!--required to removed-->
            <!--<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:ORT01" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:PSTLZ" />-->
          </xsl:attribute>
        </xsl:if>
        <!-- BizTalk Id not really appropriate, as we are not using an Orchestration, but we need to suppl a unique Id, so concatenate PO Number and Serial No -->
        <xsl:attribute name="biztalk_id">
          <xsl:value-of select="ScriptNS0:GetDataValue(&quot;BizTalkId&quot;)" />        
        </xsl:attribute>       
        <!-- We don't want to acknowledge the document back from LGX -->
        <xsl:attribute name="acknowledge_document">AC</xsl:attribute>
      </ns0:Header>
      <!-- Process the individual lines -->
      <xsl:apply-templates select="s0:E2EDP01007GRP[not(contains(string(ScriptNS0:GetLookupData(&quot;ProductCodes&quot;, &quot;VBAM.VisyBoard.ExcludedMaterial&quot;)), s0:E2EDP01007/s0:MATNR))]" />
      <ns0:Summary>
        <xsl:attribute name="total_order_quantity">
          <xsl:value-of select="sum(s0:E2EDP01007GRP/s0:E2EDP20001/s0:WMENG)" />
          <!-- If Unit Of Measure is 'TH' (Thousands), we need to multiply the eaches by 1000 in the Total       <xsl:if test="//s0:E2EDP01007/s0:MENEE/text() = 'TH'">000</xsl:if>-->
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
  </xsl:template>
  <xsl:template match="*[local-name()='E2EDP01007GRP']">
    <xsl:variable name="var:plantCode" select="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN" />
    <ns0:Detail>
      <xsl:attribute name="line_indicator">N</xsl:attribute>
      <xsl:if test="s0:E2EDP01007/s0:POSEX">
        <xsl:attribute name="line_number">
          <xsl:value-of select="number(s0:E2EDP01007/s0:POSEX)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="s0:E2EDP01007/s0:MATNR">
        <xsl:attribute name="product_code">
          <xsl:value-of select="s0:E2EDP01007/s0:MATNR" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="s0:E2EDP20001/s0:WMENG">
        <xsl:attribute name="quantity">
          <xsl:value-of select="number(round(s0:E2EDP20001/s0:WMENG) div 1000)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="s0:E2EDP01007/s0:MENEE">
        <xsl:attribute name="unit_of_measure">TH</xsl:attribute>
      </xsl:if>
      <xsl:if test="s0:E2EDP01007/s0:VPREI">
        <xsl:attribute name="price_excluding_tax">
          <xsl:value-of select="s0:E2EDP01007/s0:VPREI" />
        </xsl:attribute>
      </xsl:if>
      <!-- Delivery Date (and optionally Time) -->
      <xsl:if test="s0:E2EDP20001/s0:EDATU">
        <xsl:attribute name="delivery_date">
          <xsl:value-of select="s0:E2EDP20001/s0:EDATU" />
        </xsl:attribute>
        <xsl:attribute name="delivery_time">
          <xsl:choose>
            <xsl:when test="s0:E2EDP20001/s0:EZEIT != ''">
              <xsl:value-of select="substring(s0:E2EDP20001/s0:EZEIT, 1, 4)" />
            </xsl:when>
            <xsl:otherwise>0000</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <!-- Warehouse Code is comprised of the Buyer's Identifier and the last 7 digits of the Supplier's Partner Number -->
      <xsl:attribute name="warehouse_code">
        <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS)= ''">        
          <xsl:value-of select="concat(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN
                        , substring(//s0:E2EDP01007GRP[1]/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:NAME1, 1, 5)
                        , substring(//s0:E2EDP01007GRP[1]/s0:E2EDPA1003GRP/s0:E2EDPA1003[s0:PARVW = 'WE']/s0:STRAS, 1, 10))"/>
        </xsl:if>
        <xsl:if test="string(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS) != ''">
          <xsl:value-of select="concat(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'AG']/s0:PARTN
                        , substring(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:NAME1, 1, 5)
                        , substring(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS, 1, 10))"/>
        </xsl:if>
      
      </xsl:attribute>
      <!--<xsl:if test="s0:E2EDP19001[s0:QUALF = '001']">
				<xsl:attribute name="comment">-</xsl:attribute>
			</xsl:if>-->
      <xsl:attribute name="comment">
        <!--<xsl:apply-templates select ="s0:E2EDPT1001GRP/s0:E2EDPT2001" />-->
      </xsl:attribute>      
   
    </ns0:Detail>
  </xsl:template>

  <xsl:template match="s0:E2EDPT1001GRP/s0:E2EDPT2001">
    <xsl:if test="position()>1">
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="s0:TDLINE/text()" />
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