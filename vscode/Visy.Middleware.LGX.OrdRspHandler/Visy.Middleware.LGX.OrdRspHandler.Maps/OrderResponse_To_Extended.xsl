<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var userCSharp"
                version="1.0"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes"
	            method="xml"
	            version="1.0"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/VisyOrderResponse"/>
  </xsl:template>
  <xsl:template match="/VisyOrderResponse">
    <VisyOrderResponse>
      <OrderResponse>
        <xsl:for-each select="OrderResponse/Header">
          <xsl:variable name="var:v1"
					              select="../../OrderResponse[1]/Detail[1]/@warehouse_code"/>
          <xsl:variable name="var:v2"
					              select="../Detail/@reject_message"/>
          <xsl:variable name="var:v3"
					              select="userCSharp:StringTrimLeft(string($var:v2))"/>
          <xsl:variable name="var:v4"
					              select="userCSharp:StringTrimRight(string($var:v3))"/>
          <xsl:variable name="var:v5"
					              select="userCSharp:StringSize(string($var:v4))"/>
          <xsl:variable name="var:v6"
					              select="userCSharp:LogicalEq(string($var:v5) , &quot;0&quot;)"/>
          <xsl:variable name="var:v8"
					              select="userCSharp:LogicalGt(string($var:v5) , &quot;0&quot;)"/>
          <Header>
            <xsl:attribute name="trading_partner_code">
              <xsl:value-of select="@trading_partner_code"/>
            </xsl:attribute>
            <xsl:attribute name="customer_ean">
              <xsl:value-of select="@customer_ean"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_number">
              <xsl:value-of select="@purchase_order_response_number"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_date">
              <xsl:value-of select="@purchase_order_response_date"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_time">
              <xsl:value-of select="@purchase_order_response_time"/>
            </xsl:attribute>
            <xsl:if test="@sap_customer_code">
              <xsl:attribute name="sap_customer_code">
                <xsl:value-of select="@sap_customer_code"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="logistics_code">
              <xsl:value-of select="@logistics_code"/>
            </xsl:attribute>
            <xsl:attribute name="customer_name">
              <xsl:value-of select="@customer_name"/>
            </xsl:attribute>
            <xsl:attribute name="customer_address">
              <xsl:value-of select="$var:v1"/>
            </xsl:attribute>
            <xsl:if test="@customer_contact_name">
              <xsl:attribute name="customer_contact_name">
                <xsl:value-of select="@customer_contact_name"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@customer_contact_dept">
              <xsl:attribute name="customer_contact_dept">
                <xsl:value-of select="@customer_contact_dept"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@customer_contact_phone">
              <xsl:attribute name="customer_contact_phone">
                <xsl:value-of select="@customer_contact_phone"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@supplier_number">
              <xsl:attribute name="supplier_number">
                <xsl:value-of select="@supplier_number"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@supplier_contact">
              <xsl:attribute name="supplier_contact">
                <xsl:value-of select="@supplier_contact"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@supplier_phone">
              <xsl:attribute name="supplier_phone">
                <xsl:value-of select="@supplier_phone"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@tax_exemption_code">
              <xsl:attribute name="tax_exemption_code">
                <xsl:value-of select="@tax_exemption_code"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="purchase_order_number">
              <xsl:value-of select="@purchase_order_number"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_date">
              <xsl:value-of select="@purchase_order_date"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_status">
              <xsl:value-of select="@purchase_order_status"/>
            </xsl:attribute>
            <xsl:if test="@purchase_order_indicator">
              <xsl:attribute name="purchase_order_indicator">
                <xsl:value-of select="@purchase_order_indicator"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="biztalk_id">
              <xsl:value-of select="@biztalk_id"/>
            </xsl:attribute>
            <xsl:if test="string($var:v6)='true'">
              <xsl:variable name="var:v7"
							              select="&quot;empty&quot;"/>
              <xsl:attribute name="reject_message">
                <xsl:value-of select="$var:v7"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="string($var:v8)='true'">
              <xsl:attribute name="reject_message">
                <xsl:value-of select="$var:v2"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="./text()"/>
          </Header>
        </xsl:for-each>
        <xsl:for-each select="OrderResponse/Detail">
          <Detail>
            <xsl:attribute name="trading_partner_code">
              <xsl:value-of select="@trading_partner_code"/>
            </xsl:attribute>
            <xsl:attribute name="customer_ean">
              <xsl:value-of select="@customer_ean"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_number">
              <xsl:value-of select="@purchase_order_response_number"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_date">
              <xsl:value-of select="@purchase_order_response_date"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_time">
              <xsl:value-of select="@purchase_order_response_time"/>
            </xsl:attribute>
            <xsl:attribute name="order_line_no">
              <xsl:value-of select="@order_line_no"/>
            </xsl:attribute>
            <xsl:attribute name="item_number">
              <xsl:value-of select="@item_number"/>
            </xsl:attribute>
            <xsl:if test="@contract_number">
              <xsl:attribute name="contract_number">
                <xsl:value-of select="@contract_number"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="quantity">
              <xsl:value-of select="@quantity"/>
            </xsl:attribute>
            <xsl:attribute name="unit_of_measure">
              <xsl:value-of select="@unit_of_measure"/>
            </xsl:attribute>
            <xsl:if test="@price_excluding_tax">
              <xsl:attribute name="price_excluding_tax">
                <xsl:value-of select="@price_excluding_tax"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@price_including_tax">
              <xsl:attribute name="price_including_tax">
                <xsl:value-of select="@price_including_tax"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@currency">
              <xsl:attribute name="currency">
                <xsl:value-of select="@currency"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@contract_price_per_unit">
              <xsl:attribute name="contract_price_per_unit">
                <xsl:value-of select="@contract_price_per_unit"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@contract_currency">
              <xsl:attribute name="contract_currency">
                <xsl:value-of select="@contract_currency"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="warehouse_code">
              <xsl:value-of select="@warehouse_code"/>
            </xsl:attribute>
            <xsl:if test="@warehouse_name">
              <xsl:attribute name="warehouse_name">
                <xsl:value-of select="@warehouse_name"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@delivery_dock_number">
              <xsl:attribute name="delivery_dock_number">
                <xsl:value-of select="@delivery_dock_number"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="delivery_date">
              <xsl:value-of select="@delivery_date"/>
            </xsl:attribute>
            <xsl:if test="@delivery_time">
              <xsl:attribute name="delivery_time">
                <xsl:value-of select="@delivery_time"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@line_indicator">
              <xsl:attribute name="line_indicator">
                <xsl:value-of select="@line_indicator"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@line_status">
              <xsl:attribute name="line_status">
                <xsl:value-of select="@line_status"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@number_of_pallets">
              <xsl:attribute name="number_of_pallets">
                <xsl:value-of select="@number_of_pallets"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@reject_message">
              <xsl:attribute name="reject_message">
                <xsl:value-of select="@reject_message"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@product_desc">
              <xsl:attribute name="product_desc">
                <xsl:value-of select="@product_desc"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@address1">
              <xsl:attribute name="address1">
                <xsl:value-of select="@address1"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@address2">
              <xsl:attribute name="address2">
                <xsl:value-of select="@address2"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@addressee">
              <xsl:attribute name="addressee">
                <xsl:value-of select="@addressee"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@city">
              <xsl:attribute name="city">
                <xsl:value-of select="@city"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@state_code">
              <xsl:attribute name="state_code">
                <xsl:value-of select="@state_code"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@postcode">
              <xsl:attribute name="postcode">
                <xsl:value-of select="@postcode"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@customer_code">
              <xsl:attribute name="customer_code">
                <xsl:value-of select="@customer_code"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@factord_id">
              <xsl:attribute name="factord_id">
                <xsl:value-of select="@factord_id"/>
              </xsl:attribute>
            </xsl:if>
          </Detail>
        </xsl:for-each>
        <xsl:for-each select="OrderResponse/Summary">
          <Summary>
            <xsl:attribute name="trading_partner_code">
              <xsl:value-of select="@trading_partner_code"/>
            </xsl:attribute>
            <xsl:attribute name="customer_ean">
              <xsl:value-of select="@customer_ean"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_number">
              <xsl:value-of select="@purchase_order_response_number"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_date">
              <xsl:value-of select="@purchase_order_response_date"/>
            </xsl:attribute>
            <xsl:attribute name="purchase_order_response_time">
              <xsl:value-of select="@purchase_order_response_time"/>
            </xsl:attribute>
            <xsl:if test="@total_order_quantity">
              <xsl:attribute name="total_order_quantity">
                <xsl:value-of select="@total_order_quantity"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@total_price_excluding_tax">
              <xsl:attribute name="total_price_excluding_tax">
                <xsl:value-of select="@total_price_excluding_tax"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@total_price_including_tax">
              <xsl:attribute name="total_price_including_tax">
                <xsl:value-of select="@total_price_including_tax"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="./text()"/>
          </Summary>
        </xsl:for-each>
        <xsl:value-of select="OrderResponse/text()"/>
      </OrderResponse>
    </VisyOrderResponse>
  </xsl:template>
  <msxsl:script language="C#"
	              implements-prefix="userCSharp">
    <![CDATA[
public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
}


public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
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


public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
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