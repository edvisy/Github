<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0" xmlns:ns1="http://schemas.xmlsoap.org/soap/encoding/" xmlns:ns0="urn:Magento">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/ns0:salesOrderInfoResponse" />
  </xsl:template>
  <xsl:template match="/ns0:salesOrderInfoResponse">
    <ns0:salesOrderInfoResponse>
      <result>
        <xsl:if test="result/increment_id">
          <increment_id>
            <xsl:value-of select="result/increment_id/text()" />
          </increment_id>
        </xsl:if>
        <xsl:if test="result/parent_id">
          <parent_id>
            <xsl:value-of select="result/parent_id/text()" />
          </parent_id>
        </xsl:if>
        <xsl:if test="result/store_id">
          <store_id>
            <xsl:value-of select="result/store_id/text()" />
          </store_id>
        </xsl:if>
        <xsl:if test="result/created_at">
          <created_at>
            <xsl:value-of select="result/created_at/text()" />
          </created_at>
        </xsl:if>
        <xsl:if test="result/updated_at">
          <updated_at>
            <xsl:value-of select="result/updated_at/text()" />
          </updated_at>
        </xsl:if>
        <xsl:if test="result/is_active">
          <is_active>
            <xsl:value-of select="result/is_active/text()" />
          </is_active>
        </xsl:if>
        <xsl:if test="result/customer_id">
          <customer_id>
            <xsl:value-of select="result/customer_id/text()" />
          </customer_id>
        </xsl:if>
        <xsl:if test="result/tax_amount">
          <tax_amount>
            <xsl:value-of select="result/tax_amount/text()" />
          </tax_amount>
        </xsl:if>
        <xsl:if test="result/shipping_amount">
          <shipping_amount>
            <xsl:value-of select="result/shipping_amount/text()" />
          </shipping_amount>
        </xsl:if>
        <xsl:if test="result/discount_amount">
          <discount_amount>
            <xsl:value-of select="result/discount_amount/text()" />
          </discount_amount>
        </xsl:if>
        <xsl:if test="result/subtotal">
          <subtotal>
            <xsl:value-of select="result/subtotal/text()" />
          </subtotal>
        </xsl:if>
        <xsl:if test="result/grand_total">
          <grand_total>
            <xsl:value-of select="result/grand_total/text()" />
          </grand_total>
        </xsl:if>
        <xsl:if test="result/total_paid">
          <total_paid>
            <xsl:value-of select="result/total_paid/text()" />
          </total_paid>
        </xsl:if>
        <xsl:if test="result/total_refunded">
          <total_refunded>
            <xsl:value-of select="result/total_refunded/text()" />
          </total_refunded>
        </xsl:if>
        <xsl:if test="result/total_qty_ordered">
          <total_qty_ordered>
            <xsl:value-of select="result/total_qty_ordered/text()" />
          </total_qty_ordered>
        </xsl:if>
        <xsl:if test="result/total_canceled">
          <total_canceled>
            <xsl:value-of select="result/total_canceled/text()" />
          </total_canceled>
        </xsl:if>
        <xsl:if test="result/total_invoiced">
          <total_invoiced>
            <xsl:value-of select="result/total_invoiced/text()" />
          </total_invoiced>
        </xsl:if>
        <xsl:if test="result/total_online_refunded">
          <total_online_refunded>
            <xsl:value-of select="result/total_online_refunded/text()" />
          </total_online_refunded>
        </xsl:if>
        <xsl:if test="result/total_offline_refunded">
          <total_offline_refunded>
            <xsl:value-of select="result/total_offline_refunded/text()" />
          </total_offline_refunded>
        </xsl:if>
        <xsl:if test="result/base_tax_amount">
          <base_tax_amount>
            <xsl:value-of select="result/base_tax_amount/text()" />
          </base_tax_amount>
        </xsl:if>
        <xsl:if test="result/base_shipping_amount">
          <base_shipping_amount>
            <xsl:value-of select="result/base_shipping_amount/text()" />
          </base_shipping_amount>
        </xsl:if>
        <xsl:if test="result/base_discount_amount">
          <base_discount_amount>
            <xsl:value-of select="result/base_discount_amount/text()" />
          </base_discount_amount>
        </xsl:if>
        <xsl:if test="result/base_subtotal">
          <base_subtotal>
            <xsl:value-of select="result/base_subtotal/text()" />
          </base_subtotal>
        </xsl:if>
        <xsl:if test="result/base_grand_total">
          <base_grand_total>
            <xsl:value-of select="result/base_grand_total/text()" />
          </base_grand_total>
        </xsl:if>
        <xsl:if test="result/base_total_paid">
          <base_total_paid>
            <xsl:value-of select="result/base_total_paid/text()" />
          </base_total_paid>
        </xsl:if>
        <xsl:if test="result/base_total_refunded">
          <base_total_refunded>
            <xsl:value-of select="result/base_total_refunded/text()" />
          </base_total_refunded>
        </xsl:if>
        <xsl:if test="result/base_total_qty_ordered">
          <base_total_qty_ordered>
            <xsl:value-of select="result/base_total_qty_ordered/text()" />
          </base_total_qty_ordered>
        </xsl:if>
        <xsl:if test="result/base_total_canceled">
          <base_total_canceled>
            <xsl:value-of select="result/base_total_canceled/text()" />
          </base_total_canceled>
        </xsl:if>
        <xsl:if test="result/base_total_invoiced">
          <base_total_invoiced>
            <xsl:value-of select="result/base_total_invoiced/text()" />
          </base_total_invoiced>
        </xsl:if>
        <xsl:if test="result/base_total_online_refunded">
          <base_total_online_refunded>
            <xsl:value-of select="result/base_total_online_refunded/text()" />
          </base_total_online_refunded>
        </xsl:if>
        <xsl:if test="result/base_total_offline_refunded">
          <base_total_offline_refunded>
            <xsl:value-of select="result/base_total_offline_refunded/text()" />
          </base_total_offline_refunded>
        </xsl:if>
        <xsl:if test="result/billing_address_id">
          <billing_address_id>
            <xsl:value-of select="result/billing_address_id/text()" />
          </billing_address_id>
        </xsl:if>
        <xsl:if test="result/billing_firstname">
          <billing_firstname>
            <xsl:value-of select="result/billing_firstname/text()" />
          </billing_firstname>
        </xsl:if>
        <xsl:if test="result/billing_lastname">
          <billing_lastname>
            <xsl:value-of select="result/billing_lastname/text()" />
          </billing_lastname>
        </xsl:if>
        <xsl:if test="result/shipping_address_id">
          <shipping_address_id>
            <xsl:value-of select="result/shipping_address_id/text()" />
          </shipping_address_id>
        </xsl:if>
        <xsl:if test="result/shipping_firstname">
          <shipping_firstname>
            <xsl:value-of select="result/shipping_firstname/text()" />
          </shipping_firstname>
        </xsl:if>
        <xsl:if test="result/shipping_lastname">
          <shipping_lastname>
            <xsl:value-of select="result/shipping_lastname/text()" />
          </shipping_lastname>
        </xsl:if>
        <xsl:if test="result/billing_name">
          <billing_name>
            <xsl:value-of select="result/billing_name/text()" />
          </billing_name>
        </xsl:if>
        <xsl:if test="result/shipping_name">
          <shipping_name>
            <xsl:value-of select="result/shipping_name/text()" />
          </shipping_name>
        </xsl:if>
        <xsl:if test="result/store_to_base_rate">
          <store_to_base_rate>
            <xsl:value-of select="result/store_to_base_rate/text()" />
          </store_to_base_rate>
        </xsl:if>
        <xsl:if test="result/store_to_order_rate">
          <store_to_order_rate>
            <xsl:value-of select="result/store_to_order_rate/text()" />
          </store_to_order_rate>
        </xsl:if>
        <xsl:if test="result/base_to_global_rate">
          <base_to_global_rate>
            <xsl:value-of select="result/base_to_global_rate/text()" />
          </base_to_global_rate>
        </xsl:if>
        <xsl:if test="result/base_to_order_rate">
          <base_to_order_rate>
            <xsl:value-of select="result/base_to_order_rate/text()" />
          </base_to_order_rate>
        </xsl:if>
        <xsl:if test="result/weight">
          <weight>
            <xsl:value-of select="result/weight/text()" />
          </weight>
        </xsl:if>
        <xsl:if test="result/store_name">
          <store_name>
            <xsl:value-of select="result/store_name/text()" />
          </store_name>
        </xsl:if>
        <xsl:if test="result/remote_ip">
          <remote_ip>
            <xsl:value-of select="result/remote_ip/text()" />
          </remote_ip>
        </xsl:if>
        <xsl:if test="result/status">
          <status>
            <xsl:value-of select="result/status/text()" />
          </status>
        </xsl:if>
        <xsl:if test="result/state">
          <state>
            <xsl:value-of select="result/state/text()" />
          </state>
        </xsl:if>
        <xsl:if test="result/applied_rule_ids">
          <applied_rule_ids>
            <xsl:value-of select="result/applied_rule_ids/text()" />
          </applied_rule_ids>
        </xsl:if>
        <xsl:if test="result/global_currency_code">
          <global_currency_code>
            <xsl:value-of select="result/global_currency_code/text()" />
          </global_currency_code>
        </xsl:if>
        <xsl:if test="result/base_currency_code">
          <base_currency_code>
            <xsl:value-of select="result/base_currency_code/text()" />
          </base_currency_code>
        </xsl:if>
        <xsl:if test="result/store_currency_code">
          <store_currency_code>
            <xsl:value-of select="result/store_currency_code/text()" />
          </store_currency_code>
        </xsl:if>
        <xsl:if test="result/order_currency_code">
          <order_currency_code>
            <xsl:value-of select="result/order_currency_code/text()" />
          </order_currency_code>
        </xsl:if>
        <xsl:if test="result/shipping_method">
          <shipping_method>
            <xsl:value-of select="result/shipping_method/text()" />
          </shipping_method>
        </xsl:if>
        <xsl:if test="result/shipping_description">
          <shipping_description>
            <xsl:value-of select="result/shipping_description/text()" />
          </shipping_description>
        </xsl:if>
        <xsl:if test="result/customer_email">
          <customer_email>
            <xsl:value-of select="result/customer_email/text()" />
          </customer_email>
        </xsl:if>
        <xsl:if test="result/customer_firstname">
          <customer_firstname>
            <xsl:value-of select="result/customer_firstname/text()" />
          </customer_firstname>
        </xsl:if>
        <xsl:if test="result/customer_lastname">
          <customer_lastname>
            <xsl:value-of select="result/customer_lastname/text()" />
          </customer_lastname>
        </xsl:if>
        <xsl:if test="result/quote_id">
          <quote_id>
            <xsl:value-of select="result/quote_id/text()" />
          </quote_id>
        </xsl:if>
        <xsl:if test="result/is_virtual">
          <is_virtual>
            <xsl:value-of select="result/is_virtual/text()" />
          </is_virtual>
        </xsl:if>
        <xsl:if test="result/customer_group_id">
          <customer_group_id>
            <xsl:value-of select="result/customer_group_id/text()" />
          </customer_group_id>
        </xsl:if>
        <xsl:if test="result/customer_note_notify">
          <customer_note_notify>
            <xsl:value-of select="result/customer_note_notify/text()" />
          </customer_note_notify>
        </xsl:if>
        <xsl:if test="result/customer_is_guest">
          <customer_is_guest>
            <xsl:value-of select="result/customer_is_guest/text()" />
          </customer_is_guest>
        </xsl:if>
        <xsl:if test="result/email_sent">
          <email_sent>
            <xsl:value-of select="result/email_sent/text()" />
          </email_sent>
        </xsl:if>
        <xsl:if test="result/order_id">
          <order_id>
            <xsl:value-of select="result/order_id/text()" />
          </order_id>
        </xsl:if>
        <xsl:if test="result/gift_message_id">
          <gift_message_id>
            <xsl:value-of select="result/gift_message_id/text()" />
          </gift_message_id>
        </xsl:if>
        <xsl:if test="result/gift_message">
          <gift_message>
            <xsl:value-of select="result/gift_message/text()" />
          </gift_message>
        </xsl:if>
        <shipping_address>
          <xsl:if test="result/shipping_address/increment_id">
            <increment_id>
              <xsl:value-of select="result/shipping_address/increment_id/text()" />
            </increment_id>
          </xsl:if>
          <xsl:if test="result/shipping_address/parent_id">
            <parent_id>
              <xsl:value-of select="result/shipping_address/parent_id/text()" />
            </parent_id>
          </xsl:if>
          <xsl:if test="result/shipping_address/created_at">
            <created_at>
              <xsl:value-of select="result/shipping_address/created_at/text()" />
            </created_at>
          </xsl:if>
          <xsl:if test="result/shipping_address/updated_at">
            <updated_at>
              <xsl:value-of select="result/shipping_address/updated_at/text()" />
            </updated_at>
          </xsl:if>
          <xsl:if test="result/shipping_address/is_active">
            <is_active>
              <xsl:value-of select="result/shipping_address/is_active/text()" />
            </is_active>
          </xsl:if>
          <xsl:if test="result/shipping_address/address_type">
            <address_type>
              <xsl:value-of select="result/shipping_address/address_type/text()" />
            </address_type>
          </xsl:if>
          <xsl:if test="result/shipping_address/firstname">
            <firstname>
              <xsl:value-of select="result/shipping_address/firstname/text()" />
            </firstname>
          </xsl:if>
          <xsl:if test="result/shipping_address/lastname">
            <lastname>
              <xsl:value-of select="result/shipping_address/lastname/text()" />
            </lastname>
          </xsl:if>
          <xsl:if test="result/shipping_address/company">
            <company>
              <xsl:value-of select="result/shipping_address/company/text()" />
            </company>
          </xsl:if>
          <xsl:if test="result/shipping_address/street">
            <street>
              <xsl:value-of select="result/shipping_address/street/text()" />
            </street>
          </xsl:if>
          <xsl:if test="result/shipping_address/city">
            <city>
              <xsl:value-of select="result/shipping_address/city/text()" />
            </city>
          </xsl:if>
          <xsl:if test="result/shipping_address/region">
            <region>
              <xsl:value-of select="result/shipping_address/region/text()" />
            </region>
          </xsl:if>
          <xsl:if test="result/shipping_address/postcode">
            <postcode>
              <xsl:value-of select="result/shipping_address/postcode/text()" />
            </postcode>
          </xsl:if>
          <xsl:if test="result/shipping_address/country_id">
            <country_id>
              <xsl:value-of select="result/shipping_address/country_id/text()" />
            </country_id>
          </xsl:if>
          <xsl:if test="result/shipping_address/telephone">
            <telephone>
              <xsl:value-of select="result/shipping_address/telephone/text()" />
            </telephone>
          </xsl:if>
          <xsl:if test="result/shipping_address/fax">
            <fax>
              <xsl:value-of select="result/shipping_address/fax/text()" />
            </fax>
          </xsl:if>
          <xsl:if test="result/shipping_address/region_id">
            <region_id>
              <xsl:value-of select="result/shipping_address/region_id/text()" />
            </region_id>
          </xsl:if>
          <xsl:if test="result/shipping_address/address_id">
            <address_id>
              <xsl:value-of select="result/shipping_address/address_id/text()" />
            </address_id>
          </xsl:if>
          <xsl:value-of select="result/shipping_address/text()" />
        </shipping_address>
        <billing_address>
          <xsl:if test="result/billing_address/increment_id">
            <increment_id>
              <xsl:value-of select="result/billing_address/increment_id/text()" />
            </increment_id>
          </xsl:if>
          <xsl:if test="result/billing_address/parent_id">
            <parent_id>
              <xsl:value-of select="result/billing_address/parent_id/text()" />
            </parent_id>
          </xsl:if>
          <xsl:if test="result/billing_address/created_at">
            <created_at>
              <xsl:value-of select="result/billing_address/created_at/text()" />
            </created_at>
          </xsl:if>
          <xsl:if test="result/billing_address/updated_at">
            <updated_at>
              <xsl:value-of select="result/billing_address/updated_at/text()" />
            </updated_at>
          </xsl:if>
          <xsl:if test="result/billing_address/is_active">
            <is_active>
              <xsl:value-of select="result/billing_address/is_active/text()" />
            </is_active>
          </xsl:if>
          <xsl:if test="result/billing_address/address_type">
            <address_type>
              <xsl:value-of select="result/billing_address/address_type/text()" />
            </address_type>
          </xsl:if>
          <xsl:if test="result/billing_address/firstname">
            <firstname>
              <xsl:value-of select="result/billing_address/firstname/text()" />
            </firstname>
          </xsl:if>
          <xsl:if test="result/billing_address/lastname">
            <lastname>
              <xsl:value-of select="result/billing_address/lastname/text()" />
            </lastname>
          </xsl:if>
          <xsl:if test="result/billing_address/company">
            <company>
              <xsl:value-of select="result/billing_address/company/text()" />
            </company>
          </xsl:if>
          <xsl:if test="result/billing_address/street">
            <street>
              <xsl:value-of select="result/billing_address/street/text()" />
            </street>
          </xsl:if>
          <xsl:if test="result/billing_address/city">
            <city>
              <xsl:value-of select="result/billing_address/city/text()" />
            </city>
          </xsl:if>
          <xsl:if test="result/billing_address/region">
            <region>
              <xsl:value-of select="result/billing_address/region/text()" />
            </region>
          </xsl:if>
          <xsl:if test="result/billing_address/postcode">
            <postcode>
              <xsl:value-of select="result/billing_address/postcode/text()" />
            </postcode>
          </xsl:if>
          <xsl:if test="result/billing_address/country_id">
            <country_id>
              <xsl:value-of select="result/billing_address/country_id/text()" />
            </country_id>
          </xsl:if>
          <xsl:if test="result/billing_address/telephone">
            <telephone>
              <xsl:value-of select="result/billing_address/telephone/text()" />
            </telephone>
          </xsl:if>
          <xsl:if test="result/billing_address/fax">
            <fax>
              <xsl:value-of select="result/billing_address/fax/text()" />
            </fax>
          </xsl:if>
          <xsl:if test="result/billing_address/region_id">
            <region_id>
              <xsl:value-of select="result/billing_address/region_id/text()" />
            </region_id>
          </xsl:if>
          <xsl:if test="result/billing_address/address_id">
            <address_id>
              <xsl:value-of select="result/billing_address/address_id/text()" />
            </address_id>
          </xsl:if>
          <xsl:value-of select="result/billing_address/text()" />
        </billing_address>
        <items>        
          <xsl:for-each select="result/items/item">
            <item>
              <xsl:if test="item_id">
                <item_id>
                  <xsl:value-of select="item_id/text()" />
                </item_id>
              </xsl:if>
              <xsl:if test="order_id">
                <order_id>
                  <xsl:value-of select="order_id/text()" />
                </order_id>
              </xsl:if>
              <xsl:if test="quote_item_id">
                <quote_item_id>
                  <xsl:value-of select="quote_item_id/text()" />
                </quote_item_id>
              </xsl:if>
              <xsl:if test="created_at">
                <created_at>
                  <xsl:value-of select="created_at/text()" />
                </created_at>
              </xsl:if>
              <xsl:if test="updated_at">
                <updated_at>
                  <xsl:value-of select="updated_at/text()" />
                </updated_at>
              </xsl:if>
              <xsl:if test="product_id">
                <product_id>
                  <xsl:value-of select="product_id/text()" />
                </product_id>
              </xsl:if>
              <xsl:if test="product_type">
                <product_type>
                  <xsl:value-of select="product_type/text()" />
                </product_type>
              </xsl:if>
              <xsl:if test="product_options">
                <product_options>
                  <xsl:value-of select="product_options/text()" />
                </product_options>
              </xsl:if>
              <xsl:if test="weight">
                <weight>
                  <xsl:value-of select="weight/text()" />
                </weight>
              </xsl:if>
              <xsl:if test="is_virtual">
                <is_virtual>
                  <xsl:value-of select="is_virtual/text()" />
                </is_virtual>
              </xsl:if>
              <xsl:if test="sku">
                <sku>
                  <xsl:value-of select="sku/text()" />
                </sku>
              </xsl:if>
              <xsl:if test="name">
                <name>
                  <xsl:value-of select="name/text()" />
                </name>
              </xsl:if>
              <xsl:if test="applied_rule_ids">
                <applied_rule_ids>
                  <xsl:value-of select="applied_rule_ids/text()" />
                </applied_rule_ids>
              </xsl:if>
              <xsl:if test="free_shipping">
                <free_shipping>
                  <xsl:value-of select="free_shipping/text()" />
                </free_shipping>
              </xsl:if>
              <xsl:if test="is_qty_decimal">
                <is_qty_decimal>
                  <xsl:value-of select="is_qty_decimal/text()" />
                </is_qty_decimal>
              </xsl:if>
              <xsl:if test="no_discount">
                <no_discount>
                  <xsl:value-of select="no_discount/text()" />
                </no_discount>
              </xsl:if>
              <xsl:if test="qty_canceled">
                <qty_canceled>
                  <xsl:value-of select="qty_canceled/text()" />
                </qty_canceled>
              </xsl:if>
              <xsl:if test="qty_invoiced">
                <qty_invoiced>
                  <xsl:value-of select="qty_invoiced/text()" />
                </qty_invoiced>
              </xsl:if>
              <xsl:if test="qty_ordered">
                <qty_ordered>
                  <xsl:value-of select="qty_ordered/text()" />
                </qty_ordered>
              </xsl:if>
              <xsl:if test="qty_refunded">
                <qty_refunded>
                  <xsl:value-of select="qty_refunded/text()" />
                </qty_refunded>
              </xsl:if>
              <xsl:if test="qty_shipped">
                <qty_shipped>
                  <xsl:value-of select="qty_shipped/text()" />
                </qty_shipped>
              </xsl:if>
              <xsl:if test="cost">
                <cost>
                  <xsl:value-of select="cost/text()" />
                </cost>
              </xsl:if>
              <xsl:if test="price">
                <price>
                  <xsl:value-of select="price/text()" />
                </price>
              </xsl:if>
              <xsl:if test="base_price">
                <base_price>
                  <xsl:value-of select="base_price/text()" />
                </base_price>
              </xsl:if>
              <xsl:if test="original_price">
                <original_price>
                  <xsl:value-of select="original_price/text()" />
                </original_price>
              </xsl:if>
              <xsl:if test="base_original_price">
                <base_original_price>
                  <xsl:value-of select="base_original_price/text()" />
                </base_original_price>
              </xsl:if>
              <xsl:if test="tax_percent">
                <tax_percent>
                  <xsl:value-of select="tax_percent/text()" />
                </tax_percent>
              </xsl:if>
              <xsl:if test="tax_amount">
                <tax_amount>
                  <xsl:value-of select="tax_amount/text()" />
                </tax_amount>
              </xsl:if>
              <xsl:if test="base_tax_amount">
                <base_tax_amount>
                  <xsl:value-of select="base_tax_amount/text()" />
                </base_tax_amount>
              </xsl:if>
              <xsl:if test="tax_invoiced">
                <tax_invoiced>
                  <xsl:value-of select="tax_invoiced/text()" />
                </tax_invoiced>
              </xsl:if>
              <xsl:if test="base_tax_invoiced">
                <base_tax_invoiced>
                  <xsl:value-of select="base_tax_invoiced/text()" />
                </base_tax_invoiced>
              </xsl:if>
              <xsl:if test="discount_percent">
                <discount_percent>
                  <xsl:value-of select="discount_percent/text()" />
                </discount_percent>
              </xsl:if>
              <xsl:if test="discount_amount">
                <discount_amount>
                  <xsl:value-of select="discount_amount/text()" />
                </discount_amount>
              </xsl:if>
              <xsl:if test="base_discount_amount">
                <base_discount_amount>
                  <xsl:value-of select="base_discount_amount/text()" />
                </base_discount_amount>
              </xsl:if>
              <xsl:if test="discount_invoiced">
                <discount_invoiced>
                  <xsl:value-of select="discount_invoiced/text()" />
                </discount_invoiced>
              </xsl:if>
              <xsl:if test="base_discount_invoiced">
                <base_discount_invoiced>
                  <xsl:value-of select="base_discount_invoiced/text()" />
                </base_discount_invoiced>
              </xsl:if>
              <xsl:if test="amount_refunded">
                <amount_refunded>
                  <xsl:value-of select="amount_refunded/text()" />
                </amount_refunded>
              </xsl:if>
              <xsl:if test="base_amount_refunded">
                <base_amount_refunded>
                  <xsl:value-of select="base_amount_refunded/text()" />
                </base_amount_refunded>
              </xsl:if>
              <xsl:if test="row_total">
                <row_total>
                  <xsl:value-of select="row_total/text()" />
                </row_total>
              </xsl:if>
              <xsl:if test="base_row_total">
                <base_row_total>
                  <xsl:value-of select="base_row_total/text()" />
                </base_row_total>
              </xsl:if>
              <xsl:if test="row_invoiced">
                <row_invoiced>
                  <xsl:value-of select="row_invoiced/text()" />
                </row_invoiced>
              </xsl:if>
              <xsl:if test="base_row_invoiced">
                <base_row_invoiced>
                  <xsl:value-of select="base_row_invoiced/text()" />
                </base_row_invoiced>
              </xsl:if>
              <xsl:if test="row_weight">
                <row_weight>
                  <xsl:value-of select="row_weight/text()" />
                </row_weight>
              </xsl:if>
              <xsl:if test="gift_message_id">
                <gift_message_id>
                  <xsl:value-of select="gift_message_id/text()" />
                </gift_message_id>
              </xsl:if>
              <xsl:if test="gift_message">
                <gift_message>
                  <xsl:value-of select="gift_message/text()" />
                </gift_message>
              </xsl:if>
              <xsl:if test="gift_message_available">
                <gift_message_available>
                  <xsl:value-of select="gift_message_available/text()" />
                </gift_message_available>
              </xsl:if>
              <xsl:if test="base_tax_before_discount">
                <base_tax_before_discount>
                  <xsl:value-of select="base_tax_before_discount/text()" />
                </base_tax_before_discount>
              </xsl:if>
              <xsl:if test="tax_before_discount">
                <tax_before_discount>
                  <xsl:value-of select="tax_before_discount/text()" />
                </tax_before_discount>
              </xsl:if>
              <xsl:if test="weee_tax_applied">
                <weee_tax_applied>
                  <xsl:value-of select="weee_tax_applied/text()" />
                </weee_tax_applied>
              </xsl:if>
              <xsl:if test="weee_tax_applied_amount">
                <weee_tax_applied_amount>
                  <xsl:value-of select="weee_tax_applied_amount/text()" />
                </weee_tax_applied_amount>
              </xsl:if>
              <xsl:if test="weee_tax_applied_row_amount">
                <weee_tax_applied_row_amount>
                  <xsl:value-of select="weee_tax_applied_row_amount/text()" />
                </weee_tax_applied_row_amount>
              </xsl:if>
              <xsl:if test="base_weee_tax_applied_amount">
                <base_weee_tax_applied_amount>
                  <xsl:value-of select="base_weee_tax_applied_amount/text()" />
                </base_weee_tax_applied_amount>
              </xsl:if>
              <xsl:if test="base_weee_tax_applied_row_amount">
                <base_weee_tax_applied_row_amount>
                  <xsl:value-of select="base_weee_tax_applied_row_amount/text()" />
                </base_weee_tax_applied_row_amount>
              </xsl:if>
              <xsl:if test="weee_tax_disposition">
                <weee_tax_disposition>
                  <xsl:value-of select="weee_tax_disposition/text()" />
                </weee_tax_disposition>
              </xsl:if>
              <xsl:if test="weee_tax_row_disposition">
                <weee_tax_row_disposition>
                  <xsl:value-of select="weee_tax_row_disposition/text()" />
                </weee_tax_row_disposition>
              </xsl:if>
              <xsl:if test="base_weee_tax_disposition">
                <base_weee_tax_disposition>
                  <xsl:value-of select="base_weee_tax_disposition/text()" />
                </base_weee_tax_disposition>
              </xsl:if>
              <xsl:if test="base_weee_tax_row_disposition">
                <base_weee_tax_row_disposition>
                  <xsl:value-of select="base_weee_tax_row_disposition/text()" />
                </base_weee_tax_row_disposition>
              </xsl:if>
              <xsl:if test="product_sku">
                <product_sku>
                  <xsl:value-of select="product_sku/text()" />
                </product_sku>
              </xsl:if>
              <xsl:if test="product_option_sku">
                <product_option_sku>
                  <xsl:value-of select="product_option_sku/text()" />
                </product_option_sku>
              </xsl:if>
            </item>
          </xsl:for-each>
          <xsl:value-of select="result/items/text()" />
        </items>
        <payment>
          <xsl:if test="result/payment/increment_id">
            <increment_id>
              <xsl:value-of select="result/payment/increment_id/text()" />
            </increment_id>
          </xsl:if>
          <xsl:if test="result/payment/parent_id">
            <parent_id>
              <xsl:value-of select="result/payment/parent_id/text()" />
            </parent_id>
          </xsl:if>
          <xsl:if test="result/payment/created_at">
            <created_at>
              <xsl:value-of select="result/payment/created_at/text()" />
            </created_at>
          </xsl:if>
          <xsl:if test="result/payment/updated_at">
            <updated_at>
              <xsl:value-of select="result/payment/updated_at/text()" />
            </updated_at>
          </xsl:if>
          <xsl:if test="result/payment/is_active">
            <is_active>
              <xsl:value-of select="result/payment/is_active/text()" />
            </is_active>
          </xsl:if>
          <xsl:if test="result/payment/amount_ordered">
            <amount_ordered>
              <xsl:value-of select="result/payment/amount_ordered/text()" />
            </amount_ordered>
          </xsl:if>
          <xsl:if test="result/payment/shipping_amount">
            <shipping_amount>
              <xsl:value-of select="result/payment/shipping_amount/text()" />
            </shipping_amount>
          </xsl:if>
          <xsl:if test="result/payment/base_amount_ordered">
            <base_amount_ordered>
              <xsl:value-of select="result/payment/base_amount_ordered/text()" />
            </base_amount_ordered>
          </xsl:if>
          <xsl:if test="result/payment/base_shipping_amount">
            <base_shipping_amount>
              <xsl:value-of select="result/payment/base_shipping_amount/text()" />
            </base_shipping_amount>
          </xsl:if>
          <xsl:if test="result/payment/method">
            <method>
              <xsl:value-of select="result/payment/method/text()" />
            </method>
          </xsl:if>
          <xsl:if test="result/payment/po_number">
            <po_number>
              <xsl:value-of select="result/payment/po_number/text()" />
            </po_number>
          </xsl:if>
          <xsl:if test="result/payment/cc_type">
            <cc_type>
              <xsl:value-of select="result/payment/cc_type/text()" />
            </cc_type>
          </xsl:if>
          <xsl:if test="result/payment/cc_number_enc">
            <cc_number_enc>
              <xsl:value-of select="result/payment/cc_number_enc/text()" />
            </cc_number_enc>
          </xsl:if>
          <xsl:if test="result/payment/cc_last4">
            <cc_last4>
              <xsl:value-of select="result/payment/cc_last4/text()" />
            </cc_last4>
          </xsl:if>
          <xsl:if test="result/payment/cc_owner">
            <cc_owner>
              <xsl:value-of select="result/payment/cc_owner/text()" />
            </cc_owner>
          </xsl:if>
          <xsl:if test="result/payment/cc_exp_month">
            <cc_exp_month>
              <xsl:value-of select="result/payment/cc_exp_month/text()" />
            </cc_exp_month>
          </xsl:if>
          <xsl:if test="result/payment/cc_exp_year">
            <cc_exp_year>
              <xsl:value-of select="result/payment/cc_exp_year/text()" />
            </cc_exp_year>
          </xsl:if>
          <xsl:if test="result/payment/cc_ss_start_month">
            <cc_ss_start_month>
              <xsl:value-of select="result/payment/cc_ss_start_month/text()" />
            </cc_ss_start_month>
          </xsl:if>
          <xsl:if test="result/payment/cc_ss_start_year">
            <cc_ss_start_year>
              <xsl:value-of select="result/payment/cc_ss_start_year/text()" />
            </cc_ss_start_year>
          </xsl:if>
          <xsl:if test="result/payment/payment_id">
            <payment_id>
              <xsl:value-of select="result/payment/payment_id/text()" />
            </payment_id>
          </xsl:if>
          <xsl:if test="result/payment/division">
            <division>
              <xsl:value-of select="result/payment/division/text()" />
            </division>
          </xsl:if>
          <xsl:if test="result/payment/sub_division">
            <sub_division>
              <xsl:value-of select="result/payment/sub_division/text()" />
            </sub_division>
          </xsl:if>
          <xsl:if test="result/payment/business_area">
            <business_area>
              <xsl:value-of select="result/payment/business_area/text()" />
            </business_area>
          </xsl:if>
          <xsl:if test="result/payment/cost_center">
            <cost_center>
              <xsl:value-of select="result/payment/cost_center/text()" />
            </cost_center>
          </xsl:if>
          <xsl:value-of select="result/payment/text()" />
        </payment>
        <status_history>
          <xsl:for-each select="result/status_history/item">
            <item>
              <xsl:if test="increment_id">
                <increment_id>
                  <xsl:value-of select="increment_id/text()" />
                </increment_id>
              </xsl:if>
              <xsl:if test="parent_id">
                <parent_id>
                  <xsl:value-of select="parent_id/text()" />
                </parent_id>
              </xsl:if>
              <xsl:if test="created_at">
                <created_at>
                  <xsl:value-of select="created_at/text()" />
                </created_at>
              </xsl:if>
              <xsl:if test="updated_at">
                <updated_at>
                  <xsl:value-of select="updated_at/text()" />
                </updated_at>
              </xsl:if>
              <xsl:if test="is_active">
                <is_active>
                  <xsl:value-of select="is_active/text()" />
                </is_active>
              </xsl:if>
              <xsl:if test="is_customer_notified">
                <is_customer_notified>
                  <xsl:value-of select="is_customer_notified/text()" />
                </is_customer_notified>
              </xsl:if>
              <xsl:if test="status">
                <status>
                  <xsl:value-of select="status/text()" />
                </status>
              </xsl:if>
              <xsl:if test="comment">
                <comment>
                  <xsl:value-of select="comment/text()" />
                </comment>
              </xsl:if>
              <xsl:value-of select="text()" />
            </item>
          </xsl:for-each>
          <xsl:value-of select="result/status_history/text()" />
        </status_history>
        <xsl:if test="result/due_date">
          <due_date>
            <xsl:value-of select="result/due_date/text()" />
          </due_date>
        </xsl:if>
        <xsl:if test="result/division_request_date">
          <division_request_date>
            <xsl:value-of select="result/division_request_date/text()" />
          </division_request_date>
        </xsl:if>
        <xsl:if test="result/division_remarks">
          <division_remarks>
            <xsl:value-of select="result/division_remarks/text()" />
          </division_remarks>
        </xsl:if>
        <xsl:if test="result/division_raised_by">
          <division_raised_by>
            <xsl:value-of select="result/division_raised_by/text()" />
          </division_raised_by>
        </xsl:if>
        <xsl:if test="result/custom_purchase_number">
          <custom_purchase_number>
            <xsl:value-of select="result/custom_purchase_number/text()" />
          </custom_purchase_number>
        </xsl:if>
        <xsl:if test="result/division_deliver_to">
          <division_deliver_to>
            <xsl:value-of select="result/division_deliver_to/text()" />
          </division_deliver_to>
        </xsl:if>
        <delivery_date>
          <xsl:value-of select="result/delivery_date/text()" />
        </delivery_date>
        <shipping_comment>
          <xsl:value-of select="result/shipping_comment/text()" />
        </shipping_comment>
        <sap_customer_code>
          <xsl:value-of select="result/sap_customer_code/text()" />
        </sap_customer_code>
        <xsl:value-of select="result/text()" />
      </result>
    </ns0:salesOrderInfoResponse>
  </xsl:template>
</xsl:stylesheet>