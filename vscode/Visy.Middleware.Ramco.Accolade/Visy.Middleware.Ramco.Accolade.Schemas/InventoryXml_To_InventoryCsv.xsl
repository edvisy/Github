<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://Visy.Middleware.Ramco.Accolade.Schemas.InventoryCsv" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/Root" />
  </xsl:template>
  <xsl:template match="/Root">
    <ns0:Inventory>
        <Header>
          <Warehouse_x0020_Number>Warehouse Number</Warehouse_x0020_Number>
          <Item_x0020_Number>Item Number</Item_x0020_Number>
          <Description>Description</Description>
          <Item_x0020_Lot>Item Lot</Item_x0020_Lot>
          <Item_x0020_Quantity>Item Quantity</Item_x0020_Quantity>
          <Item_x0020_UOM>Item UOM</Item_x0020_UOM>
          <Item_x0020_Status>Item Status</Item_x0020_Status>
          <Alcohol_x0020__x0025_>Alcohol %</Alcohol_x0020__x0025_>
          <Lot_x0020_Grade_x0020__x0028_Vintage_x0029_>Lot Grade (Vintage)</Lot_x0020_Grade_x0020__x0028_Vintage_x0029_>
          <Lot_x0020_Status>Lot Status</Lot_x0020_Status>
          <Manufacture_x0020_Date>Manufacture Date</Manufacture_x0020_Date>
          <Additional1>Additional1</Additional1>
          <Additional2>Additional2</Additional2>
         </Header>
        <xsl:for-each select="Batch/OnHand">
          <xsl:variable name="var:vWarehouseCode" select="userCSharp:StringConcat(&quot;1167&quot;)" />
          <xsl:variable name="var:vUOM" select="userCSharp:StringConcat(&quot;CA&quot;)" />
      
          <Details>
            <Warehouse_x0020_Number>
              <xsl:value-of select="$var:vWarehouseCode" />
            </Warehouse_x0020_Number>
            <Item_x0020_Number>
              <xsl:value-of select="ItemCode/text()" />
            </Item_x0020_Number>
            <Item_x0020_Lot>
              <xsl:value-of select="BatchLot/text()" />
            </Item_x0020_Lot>
            <Item_x0020_Quantity>
              <xsl:value-of select="SOH/text()" />
            </Item_x0020_Quantity>
            <Item_x0020_UOM>
              <xsl:value-of select="$var:vUOM" />
            </Item_x0020_UOM>
            <Item_x0020_Status>
              <xsl:choose>
                <xsl:when test="number(Available) > 0">
                  <xsl:value-of select="'AV'"/>
                </xsl:when>
                <xsl:when test="number(Quarantine) > 0">
                  <xsl:value-of select="'AV'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="''"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:value-of select="$var:vUOM" />
            </Item_x0020_Status>
          </Details>
        </xsl:for-each>
    </ns0:Inventory>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]></msxsl:script>
</xsl:stylesheet>