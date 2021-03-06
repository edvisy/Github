<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://Visy.ECommerce.SAP.MASTERFOODS.EXCEPTIONRPT.ExceptionRPT" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/VISY" />
  </xsl:template>
  <xsl:template match="/VISY">
    <ns0:ExceptionRPT>
            <xsl:for-each select="//Detail[not(@F14=preceding-sibling::Detail/@F14)]/@F14">
              <Item>
                <RecordType>
                  <xsl:value-of select="'H'" />
                </RecordType>
                <CustomerID>
                  <xsl:value-of select="'MAS'" />
                </CustomerID>
                <CustomerNumber>
                </CustomerNumber>
                  <CompanyCode>
                    <xsl:value-of select="//Detail[@F14=current()]/@F2" />
                  </CompanyCode>
                  <ReferenceNumber>
                    <xsl:value-of select="current()" />
                  </ReferenceNumber>
                <CustomerProductCode>
                </CustomerProductCode>
                <QuantityReceived>
                </QuantityReceived>
                <UnitPrice>
                </UnitPrice>
                  <InvoiceAmountExcGST>
                    <xsl:value-of select="format-number(sum(//Detail[@F14=current()]/@F10), '#.##')" />
                  </InvoiceAmountExcGST>
                  <GST>
                    <xsl:value-of select="format-number(sum(//Detail[@F14=current()]/@F11), '#.##')" />
                  </GST>
                  <InvoiceAmountIncGST>
                    <xsl:value-of select="format-number(sum(//Detail[@F14=current()]/@F12), '#.##')" />
                  </InvoiceAmountIncGST>
              </Item>
            </xsl:for-each>
    </ns0:ExceptionRPT>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]></msxsl:script>
</xsl:stylesheet>