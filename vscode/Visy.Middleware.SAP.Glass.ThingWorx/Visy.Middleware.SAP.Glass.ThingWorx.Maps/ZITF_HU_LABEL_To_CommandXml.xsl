<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var userCSharp"               
                version="1.0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="no" method="xml" version="1.0"  />
  <xsl:template match="/">
    <xsl:apply-templates select="/ZITF_HU_LABEL" />
  </xsl:template>
  <xsl:template match="/ZITF_HU_LABEL">
    <xsl:variable name="var:v1" select="IDOC/E1BPOUTPDEVEXT[1]/OUTPUT_DEVICE/text()" />
    <Command>
      <WriteTagData>
        <xsl:attribute name="readerID">
          <xsl:value-of select="$var:v1" />
        </xsl:attribute>
        <xsl:for-each select="IDOC">
          <xsl:variable name="var:v2" select="userCSharp:MathAbs(string(EDI_DC40/DOCNUM/text()))" />
          <xsl:variable name="var:v3" select="userCSharp:MathAbs(string(E1BPHUKEY/HU_EXID/text()))" />
          <xsl:variable name="var:jobName" select="userCSharp:StringConcat(string($var:v2) , &quot;_&quot; , string($var:v3))" />
          <Item>
            <FieldList>
              <xsl:attribute name="jobName">
                <xsl:value-of select="$var:jobName" />
              </xsl:attribute>
              <xsl:attribute name="quantity">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/COPIES/text()" />
              </xsl:attribute>
              <xsl:attribute name="format">
                <xsl:value-of select="concat(E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/TAG/text(), '.BTW')" />
              </xsl:attribute>
              <Field name="PlantNo">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/PLANT" />
              </Field>
              <Field name="PlantName">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/PLANT_NAME" />
              </Field>
              <Field name="SKU">
                <xsl:value-of select="number(E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/MATERIAL)" />
              </Field>
              <Field name="Batch">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/BATCH" />
              </Field>
              <Field name="DateCalendar">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/GR_DATE" />
              </Field>
              <Field name="DateJulian">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/MATERIAL_VERSION" />
              </Field>
              <Field name="Qty">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_NUM_EA_PACK']/ATWRT" />
              </Field>
              <Field name="QTYL">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_LAYERS']/ATWRT" />
              </Field>
              <Field name="QTYBCU">
                <xsl:value-of select="number(E1BPHUHDRPROPOSAL/E1BPHUITEM/PACK_QTY)" />
              </Field>
              <Field name="Line">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/PRODUCTION_LINE" />
              </Field>
              <Field name="Shift">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/SHIFT" />
              </Field>
              <Field name="HU">
                <xsl:value-of select="number(E1BPHUHDRPROPOSAL/HU_EXID)" />
              </Field>
              <Field name="Container">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_GLASS_DESIGN_CODE']/ATWRT" />
              </Field>
              <Field name="Category">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_CATEGORY']/ATWRT_TXT" />
              </Field>
              <Field name="FinishNum">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_FINISH_NUM']/ATWRT" />
              </Field>
              <Field name="FinishType">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_FINISH_TYPE']/ATWRT" />
              </Field>
              <Field name="Color">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_COLOUR']/ATWRT" />
              </Field>
              <Field name="MatDesc">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/MATEIRAL_DESCRIPTION" />
              </Field>
              <Field name="Customer">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/CUSTOMER" />
              </Field>
              <Field name="CustomerName">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/CUSTOMER_NAME" />
              </Field>
              <Field name="CustSKU">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/MATERIAL_PARTNER" />
              </Field>
              <Field name="CustPO">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_CUSTOMER_PO']/ATWRT" />
              </Field>
              <Field name="ExpDate">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITMPROPOSAL/EXPIRYDATE" />
              </Field>
              <Field name="ProdOrder">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/PRODUCTION_ORDER" />
              </Field>
              <Field name="PrdOrdType">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/PRODUCTION_ORDER_TYPE" />
              </Field>
              <Field name="Printer">
                <xsl:value-of select="E1BPOUTPDEVEXT/OUTPUT_DEVICE" />
              </Field>
              <Field name="TagFormat">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/TAG" />
              </Field>
              <Field name="NOC">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/COPIES" />
              </Field>
              <Field name="EAN11">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/EAN11" />
              </Field>
              <Field name="BulkCase">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_BULK_CARTON_INDICATOR']/ATWRT" />
              </Field>
              <Field name="MillerPalletID">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/MILLER_PALLET_ID" />
              </Field>
              <Field name="ColorDesc">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_COLOUR']/ATWRT_TXT" />
              </Field>
              <Field name="PRODUCT_HIERARCHY">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/PRODUCT_HIERARCHY" />
              </Field>
              <Field name="NTC_CODE">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/NTC_CODE" />
              </Field>
              <Field name="LONGDESCRIPTION">
                <xsl:value-of select="concat(E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/DESCRIPTION, E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/DESCRIPTION1)" />
              </Field>
              <Field name="SHORTDESCRIPTION">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/SHORT_TEXT" />
              </Field>
              <Field name="MouldNum">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_MOULD_NUM']/ATWRT" />
              </Field>
              <Field name="BodyNum">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_BODY_NUM']/ATWRT" />
              </Field>
              <Field name="CUSTOMER_SKU_DESCRIPTION">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/CUSTOMER_SKU_DESCRIPTION" />
              </Field>
              <Field name="EAxBOX">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_EACHES_PER_MASTER_BOX']/ATWRT" />
              </Field>
              <Field name="PalletWeight">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_PALLET_GROSS_WT']/ATWRT" />
              </Field>
              <Field name="SKU_ORDER_QUANT">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/TOTAL_ORDER_QUANTITY" />
              </Field>
              <Field name="PalletBinding">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/Z_PALLET_BIND" />
              </Field>
              <Field name="SKU_ORDER_START">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/ZITF_PR_ORDER_INFO/BASIC_START_DATE" />
              </Field>
              <Field name="PalletHeight">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_TOTAL_PALLET_HEIGHT']/ATWRT" />
              </Field>
              <Field name="OldMatNum">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_OLD_MATERIAL_NUM']/ATWRT" />
              </Field>
              <Field name="PackCode">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_PACKAGING_CODE']/ATWRT" />
              </Field>
              <Field name="LoadPattern">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_LOAD_PATTERN']/ATWRT" />
              </Field>
              <Field name="DrawingNumber">
                <xsl:value-of select="E1BPHUHDRPROPOSAL/E1BPHUITEM/E1WTADDI12[ATNAM='Z_DRAWING_NUM']/ATWRT" />
              </Field>
            </FieldList>
          </Item>
        </xsl:for-each>
      </WriteTagData>
    </Command>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string MathAbs(string val)
{
	string retval = "";
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		double abs = Math.Abs(d);
		retval = abs.ToString(System.Globalization.CultureInfo.InvariantCulture);
	}
	return retval;
}


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
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