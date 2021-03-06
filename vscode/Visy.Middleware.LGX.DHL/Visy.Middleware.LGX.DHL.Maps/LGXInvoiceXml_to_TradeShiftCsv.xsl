<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE" xmlns:ns0="http://Visy.Middleware.LGX.DHL.Schemas.InvoiceCsv" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">
    <ns0:InvoiceCsv>
      <Header>
        <DocumentType>
          <xsl:text>Document Type</xsl:text>
        </DocumentType>
        <SupplierName>
          <xsl:text>Supplier Name</xsl:text>
        </SupplierName>
        <SupplierStreetName>
          <xsl:text>Supplier Street Name</xsl:text>
        </SupplierStreetName>
        <SupplierCityName>
          <xsl:text>Supplier City Name</xsl:text>
        </SupplierCityName>
        <SupplierPostalCode>
          <xsl:text>Supplier Postal Code</xsl:text>
        </SupplierPostalCode>
        <SupplierState>
          <xsl:text>Supplier State</xsl:text>
        </SupplierState>
        <SupplierCountry>
          <xsl:text>Supplier Country</xsl:text>
        </SupplierCountry>
        <SupplierTaxNo>
          <xsl:text>Supplier Tax No</xsl:text>
        </SupplierTaxNo>
        <PONumber>
          <xsl:text>PO Number</xsl:text>
        </PONumber>
        <CostCentreNumber>
          <xsl:text>Cost Centre Number</xsl:text>
        </CostCentreNumber>
        <DocumentNo>
          <xsl:text>Document No</xsl:text>
        </DocumentNo>
        <DocumentDate>
          <xsl:text>Document Date</xsl:text>
        </DocumentDate>
        <TaxInvoiceRef>
          <xsl:text>Tax Invoice Ref</xsl:text>
        </TaxInvoiceRef>
        <ReceiverName>
          <xsl:text>Receiver Name</xsl:text>
        </ReceiverName>
        <ReceiverStreetName>
          <xsl:text>Receiver Street Name</xsl:text>
        </ReceiverStreetName>
        <ReceiverCityName>
          <xsl:text>Receiver City Name</xsl:text>
        </ReceiverCityName>
        <ReceiverPostalCode>
          <xsl:text>Receiver Postal Code</xsl:text>
        </ReceiverPostalCode>
        <ReceiverState>
          <xsl:text>Receiver State</xsl:text>
        </ReceiverState>
        <ReceiverCountry>
          <xsl:text>Receiver Country</xsl:text>
        </ReceiverCountry>
        <ReceiverTaxNo>
          <xsl:text>Receiver Tax No</xsl:text>
        </ReceiverTaxNo>
        <ReceiverCustomerNumber>
          <xsl:text>ReceiverCustomerNumber</xsl:text>
        </ReceiverCustomerNumber>
        <DeliveryAddressLine1>
          <xsl:text>DeliveryAddressLine1</xsl:text>
        </DeliveryAddressLine1>
        <DeliveryAddressPostalCode>
          <xsl:text>DeliveryAddressPostalCode</xsl:text>
        </DeliveryAddressPostalCode>
        <DeliveryAddressState>
          <xsl:text>DeliveryAddressState</xsl:text>
        </DeliveryAddressState>
        <DeliveryAddressCountry>
          <xsl:text>DeliveryAddressCountry</xsl:text>
        </DeliveryAddressCountry>
        <InvoiceCurrency>
          <xsl:text>Invoice Currency</xsl:text>
        </InvoiceCurrency>
        <ItemDescription>
          <xsl:text>Item Description</xsl:text>
        </ItemDescription>
        <ItemCode>
          <xsl:text>Item Code</xsl:text>
        </ItemCode>
        <Quantity>
          <xsl:text>Quantity</xsl:text>
        </Quantity>
        <UnitofMeasure>
          <xsl:text>Unit of Measure</xsl:text>
        </UnitofMeasure>
        <UnitPrice>
          <xsl:text>Unit Price</xsl:text>
        </UnitPrice>
        <InvoiceLineAmount>
          <xsl:text>InvoiceLineAmount</xsl:text>
        </InvoiceLineAmount>
        <TaxPercentage>
          <xsl:text>TaxPercentage</xsl:text>
        </TaxPercentage>
        <InvoiceLineTaxAmount>
          <xsl:text>InvoiceLineTaxAmount</xsl:text>
        </InvoiceLineTaxAmount>
        <InvoiceLineTotalAmount>
          <xsl:text>InvoiceLineTotalAmount</xsl:text>
        </InvoiceLineTotalAmount>
        <InvoiceTotalLineAmount>
          <xsl:text>InvoiceTotalLineAmount</xsl:text>
        </InvoiceTotalLineAmount>
        <InvoiceTaxTotal>
          <xsl:text>InvoiceTaxTotal</xsl:text>
        </InvoiceTaxTotal>
        <InvoiceTotal>
          <xsl:text>InvoiceTotal</xsl:text>
        </InvoiceTotal>
      </Header>
      <xsl:for-each select="Detail">
        <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Invoice&quot;)" />
        <xsl:variable name="var:v2" select="userCSharp:StringConcat(string(../Header/SupplierStreet1/text()) , &quot; &quot; , string(../Header/SupplierStreet2/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;Australia&quot;)" />
        <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;58005787913&quot;)" />
        <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;DHL Express (Australia) Pty Ltd&quot;)" />
        <Details>
          <DocumentType>
            <xsl:value-of select="$var:v1" />
          </DocumentType>
          <SupplierName>
            <xsl:value-of select="../Header/SupplierAddressee/text()" />
          </SupplierName>
          <SupplierStreetName>
            <xsl:value-of select="$var:v2" />
          </SupplierStreetName>
          <SupplierCityName>
            <xsl:value-of select="../Header/SupplierCity/text()" />
          </SupplierCityName>
          <SupplierPostalCode>
            <xsl:value-of select="../Header/SupplierPostCode/text()" />
          </SupplierPostalCode>
          <SupplierState>
            <xsl:value-of select="../Header/SupplierState/text()" />
          </SupplierState>
          <SupplierCountry>
            <xsl:value-of select="$var:v3" />
          </SupplierCountry>
          <SupplierTaxNo>
            <xsl:value-of select="$var:v4" />
          </SupplierTaxNo>
          <PONumber>
            <xsl:value-of select="PurchaseOrderNumber/text()" />
          </PONumber>
          <CostCentreNumber></CostCentreNumber>
          <DocumentNo>
            <xsl:value-of select="../Header/InvoiceNumber/text()" />
          </DocumentNo>
          <DocumentDate>
            <xsl:value-of select="../Header/InvoiceDate/text()" />
          </DocumentDate>
          <TaxInvoiceRef>
            <xsl:value-of select="../Header/InvoiceNumber/text()" />
          </TaxInvoiceRef>
          <ReceiverName>
            <xsl:value-of select="$var:v5" />
          </ReceiverName>
          <ReceiverStreetName>
            <xsl:value-of select="../Header/BillingStreet/text()" />
          </ReceiverStreetName>
          <ReceiverCityName>
            <xsl:value-of select="../Header/BillingCity/text()" />
          </ReceiverCityName>
          <ReceiverPostalCode>
            <xsl:value-of select="../Header/BillingPostCode/text()" />
          </ReceiverPostalCode>
          <ReceiverState>
            <xsl:value-of select="../Header/BillingState/text()" />
          </ReceiverState>
          <ReceiverCountry>
            <xsl:value-of select="$var:v3" />
          </ReceiverCountry>
          <ReceiverTaxNo>
            <xsl:value-of select="../Header/CustomerABN/text()" />
          </ReceiverTaxNo>
          <ReceiverCustomerNumber>
            <xsl:value-of select="../Header/CompanyCode/text()" />
          </ReceiverCustomerNumber>
          <DeliveryAddressLine1>
            <xsl:value-of select="../Header/DeliveryStreet1/text()" />
          </DeliveryAddressLine1>
          <DeliveryAddressPostalCode>
            <xsl:value-of select="../Header/DeliveryPostCode/text()" />
          </DeliveryAddressPostalCode>
          <DeliveryAddressState>
            <xsl:value-of select="../Header/DeliveryState/text()" />
          </DeliveryAddressState>
          <DeliveryAddressCountry>
            <xsl:value-of select="$var:v3" />
          </DeliveryAddressCountry>
          <InvoiceCurrency>
            <xsl:value-of select="../Header/InvoiceCurrency/text()" />
          </InvoiceCurrency>
          <ItemDescription>
            <xsl:value-of select="ItemDescription/text()" />
          </ItemDescription>
          <xsl:variable name="var:v6" select="userCSharp:GetInvItemCode(string(ProductCode/text()) , string(SundryItemCode/text()))" />
          <ItemCode>
            <xsl:value-of select="$var:v6" />
          </ItemCode>
          <Quantity>
            <xsl:value-of select="Quantity/text()" />
          </Quantity>
          <UnitofMeasure>
            <xsl:value-of select="UnitOfMeasurement/text()" />
          </UnitofMeasure>
          <UnitPrice>
            <xsl:value-of select="UnitPrice/text()" />
          </UnitPrice>
          <InvoiceLineAmount>
            <xsl:value-of select="InvoiceLineAmount/text()" />
          </InvoiceLineAmount>
          <TaxPercentage>
            <xsl:value-of select="TaxPercent/text()" />
          </TaxPercentage>
          <InvoiceLineTaxAmount>
            <xsl:value-of select="InvoiceLineGST/text()" />
          </InvoiceLineTaxAmount>
          <InvoiceLineTotalAmount>
            <xsl:value-of select="InvoiceLineTotal/text()" />
          </InvoiceLineTotalAmount>
          <InvoiceTotalLineAmount>
            <xsl:value-of select="../Header/InvoiceAmount/text()" />
          </InvoiceTotalLineAmount>
          <InvoiceTaxTotal>
            <xsl:value-of select="../Header/InvoiceGST/text()" />
          </InvoiceTaxTotal>
          <InvoiceTotal>
            <xsl:value-of select="../Header/InvoiceTotal/text()" />
          </InvoiceTotal>
        </Details>
      </xsl:for-each>
    </ns0:InvoiceCsv>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
}


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetInvItemCode(string itemcode, string sundryitemcode){

    return sundryitemcode.Trim() != "" ? sundryitemcode : itemcode;

}



]]></msxsl:script>
</xsl:stylesheet>