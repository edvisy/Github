<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet               
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                xmlns:date="http://exslt.org/dates-and-times" 
                exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS1 ScriptNS2" version="1.0"    
                extension-element-prefixes="date"
                xmlns:s0="http://Visy.Middleware.Common.Schemas.LGX.INVOICE.INVOICE" 
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1" 
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"              
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="no" method="xml" version="1.0" doctype-system="http://xml.cxml.org/schemas/cXML/1.2.031/InvoiceDetail.dtd" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:INVOICE" />
  </xsl:template>
  <xsl:template match="/s0:INVOICE">      
    <xsl:variable name="var:vDeliveryDate" select="./Detail[1]/DeliveryDate/text()" />
    <xsl:variable name="var:vPONumber" select="./Detail[1]/PurchaseOrderNumber/text()" />
    <xsl:variable name="var:vCurrency" select="userCSharp:StringConcat(&quot;AUD&quot;)" />
    <xsl:variable name="var:vCountryCode" select="userCSharp:StringConcat(&quot;AU&quot;)" />
    <xsl:variable name="var:vCountry" select="userCSharp:StringConcat(&quot;Australia&quot;)" />
    <xsl:variable name="var:vInvoiceNumber" select="./Header/InvoiceNumber/text()" />
    <xsl:variable name="var:vPayLoadId" select="userCSharp:PayLoadId_GenerateGUIDCM()" />
    <xsl:variable name="var:vInvoiceDate" select="ScriptNS1:FormateDateNew(userCSharp:StringConcat(./Summary/InvoiceDate/text(), ./Summary/InvoiceTime/text()) , &quot;yyyy-MM-ddTHH:mm:00+10:00&quot;, &quot;yyyyMMddHHmm&quot;)"></xsl:variable>
    <cXML>     
      <xsl:attribute name="payloadID">
        <xsl:value-of select="$var:vPayLoadId" />
      </xsl:attribute>
      <xsl:attribute name="timestamp">
        <xsl:value-of select="userCSharp:DateCurrentDateTimeCM()" />
      </xsl:attribute>
        <xsl:attribute name="version">
        <xsl:value-of select="'1.2.031'" />
      </xsl:attribute>    
      <Header>
        <From>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS2:GetInterfaceLookupData('SupplierId' , 'SLX.Kerry.cXML.Settings')" />
            </Identity>            
          </Credential>
          <!--<Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'VendorID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="'7001350'" />
            </Identity>            
          </Credential>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'PrivateID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="'7001350'" />
            </Identity>            
          </Credential>-->
        </From>
        <To>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS2:GetInterfaceLookupData('CustomerId' , 'SLX.Kerry.cXML.Settings')" />
            </Identity>           
          </Credential>
          <!--<Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'SystemID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="'EMDCLNT020'" />
            </Identity>           
          </Credential>-->
        </To>
        <Sender>
          <Credential>
            <xsl:attribute name="domain">
              <xsl:value-of select="'NetworkID'" />
            </xsl:attribute>
            <Identity>
              <xsl:value-of select="ScriptNS2:GetInterfaceLookupData('SupplierId' , 'SLX.Kerry.cXML.Settings')" />
            </Identity>
            <SharedSecret>
              <xsl:value-of select="ScriptNS2:GetInterfaceLookupData('SharedSecret' , 'SLX.Kerry.cXML.Settings')" />
            </SharedSecret>           
          </Credential>
          <UserAgent>
            <xsl:value-of select="'Supplier'" />
          </UserAgent>
        </Sender>        
      </Header>      
      <Request>
        <xsl:attribute name="deploymentMode">
          <xsl:value-of select="ScriptNS2:GetInterfaceLookupData('Environment' , 'SLX.Kerry.cXML.Settings')" />
        </xsl:attribute>       
        <InvoiceDetailRequest>
          <InvoiceDetailRequestHeader>
            <xsl:attribute name="invoiceDate">
              <xsl:value-of select="$var:vInvoiceDate" />
            </xsl:attribute>
            <xsl:attribute name="invoiceID">
              <xsl:value-of select="Summary/InvoiceNumber/text()" />
            </xsl:attribute>
            <xsl:attribute name="invoiceOrigin">
              <xsl:text>supplier</xsl:text>
            </xsl:attribute>
             <xsl:attribute name="operation">
              <xsl:text>new</xsl:text>
            </xsl:attribute>          
            <xsl:attribute name="purpose">
              <xsl:text>standard</xsl:text>
            </xsl:attribute>        
            <InvoiceDetailHeaderIndicator/>
            <InvoiceDetailLineIndicator isTaxInLine="yes"/>
            <InvoicePartner>
              <Contact role="remitTo">
                  <xsl:attribute name="addressID">
                    <xsl:value-of select="Header/CompanyCode/text()" />
                  </xsl:attribute>
                  <Name xml:lang="en">
                    <xsl:value-of select="Header/CompanyName/text()" />
                  </Name>
                  <PostalAddress>
                    <xsl:attribute name="name">
                      <xsl:value-of select="Header/CompanyName/text()" />
                    </xsl:attribute>
                    <Street>
                      <xsl:value-of select="Header/BillingStreet/text()" />
                    </Street>
                    <City>
                      <xsl:attribute name="cityCode">
                        <xsl:value-of select="Header/BillingCity/text()" />
                      </xsl:attribute>
                    </City>
                    <State>
                      <xsl:attribute name="isoStateCode">
                        <xsl:value-of select="Header/BillingState/text()" />
                      </xsl:attribute>
                    </State>
                    <PostalCode>
                      <xsl:value-of select="Header/BillingPostCode/text()" />
                    </PostalCode>
                    <Country>
                      <xsl:attribute name="isoCountryCode">
                        <xsl:value-of select="$var:vCountryCode" />
                      </xsl:attribute>
                      <xsl:value-of select="$var:vCountry" />
                    </Country>
                  </PostalAddress>
              </Contact>
              <IdReference>
                <xsl:attribute name="domain">
                  <xsl:value-of select="'supplierTaxID'" />
                 </xsl:attribute> 
                 <xsl:attribute name="identifier">
                  <xsl:value-of select="'58005787913'" />
                 </xsl:attribute>              
              </IdReference>
            </InvoicePartner>
            <InvoicePartner>
              <Contact role="billTo">
                <xsl:attribute name="addressID">
                  <xsl:value-of select="Header/CompanyCode/text()" />
                </xsl:attribute>
                <Name xml:lang="en">
                  <xsl:value-of select="Header/CompanyName/text()" />
                </Name>
                <PostalAddress>
                  <xsl:attribute name="name">
                    <xsl:value-of select="Header/CompanyName/text()" />
                  </xsl:attribute>
                  <Street>
                    <xsl:value-of select="Header/BillingStreet/text()" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/BillingCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/BillingState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/BillingPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
            </InvoicePartner>
            <InvoicePartner>
              <Contact role="from">
                <Name xml:lang="en">
                  <xsl:value-of select="Header/SupplierAddressee/text()" />
                </Name>
                <PostalAddress>
                  <Street>
                    <xsl:value-of select="userCSharp:StringConcat(string(Header/SupplierStreet1/text()) , string(Header/SupplierStreet2/text()))" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/SupplierCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/SupplierState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/SupplierPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
            </InvoicePartner>
            <InvoicePartner>
              <Contact role="billFrom">
                <Name xml:lang="en">
                  <xsl:value-of select="Header/SupplierAddressee/text()" />
                </Name>
                <PostalAddress>
                  <Street>
                    <xsl:value-of select="userCSharp:StringConcat(string(Header/SupplierStreet1/text()) , string(Header/SupplierStreet2/text()))" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/SupplierCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/SupplierState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/SupplierPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
            </InvoicePartner>
            <InvoicePartner>
              <Contact role="soldTo">
                <xsl:attribute name="addressID">
                  <xsl:value-of select="Header/CompanyCode/text()" />
                </xsl:attribute>
                <Name xml:lang="en">
                  <xsl:value-of select="Header/CompanyName/text()" />
                </Name>
                <PostalAddress>
                  <xsl:attribute name="name">
                    <xsl:value-of select="Header/CompanyName/text()" />
                  </xsl:attribute>
                  <Street>
                    <xsl:value-of select="Header/BillingStreet/text()" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/BillingCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/BillingState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/BillingPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
            </InvoicePartner>
            <InvoiceDetailShipping>
              <Contact role="shipFrom">
                <Name xml:lang="en">
                  <xsl:value-of select="Header/SupplierAddressee/text()" />
                </Name>
                <PostalAddress>
                  <Street>
                    <xsl:value-of select="userCSharp:StringConcat(string(Header/SupplierStreet1/text()) , string(Header/SupplierStreet2/text()))" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/SupplierCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/SupplierState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/SupplierPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
              <Contact role="shipTo">
                <xsl:attribute name="addressID">
                  <xsl:value-of select="Header/CompanyCode/text()" />
                </xsl:attribute>
                <Name xml:lang="en">
                  <xsl:value-of select="Header/CompanyName/text()" />
                </Name>
                <PostalAddress>
                  <xsl:attribute name="name">
                    <xsl:value-of select="Header/CompanyName/text()" />
                  </xsl:attribute>
                  <Street>
                    <xsl:value-of select="Header/BillingStreet/text()" />
                  </Street>
                  <City>
                    <xsl:attribute name="cityCode">
                      <xsl:value-of select="Header/BillingCity/text()" />
                    </xsl:attribute>
                  </City>
                  <State>
                    <xsl:attribute name="isoStateCode">
                      <xsl:value-of select="Header/BillingState/text()" />
                    </xsl:attribute>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="Header/BillingPostCode/text()" />
                  </PostalCode>
                  <Country>
                    <xsl:attribute name="isoCountryCode">
                      <xsl:value-of select="$var:vCountryCode" />
                    </xsl:attribute>
                    <xsl:value-of select="$var:vCountry" />
                  </Country>
                </PostalAddress>
              </Contact>
            </InvoiceDetailShipping>
            <PaymentTerm>
              <xsl:attribute name="payInNumberOfDays">
                <xsl:value-of select="ScriptNS2:GetInterfaceLookupData(&quot;paymentterms&quot;, &quot;SLX.Kerry.BusinessRules&quot;)" />
              </xsl:attribute>
              <Discount>
                <DiscountPercent percent="0.00"/>
              </Discount>
            </PaymentTerm>
            <Extrinsic name="TaxInvoice">This is a tax invoice</Extrinsic>
            <Extrinsic name="invoiceSourceDocument">PurchaseOrder</Extrinsic>
            <Extrinsic name="invoiceSubmissionMethod">Online</Extrinsic>            
          </InvoiceDetailRequestHeader>
          <InvoiceDetailOrder>
            <InvoiceDetailOrderInfo>
              <OrderReference>
                <xsl:attribute name="orderID">
                  <xsl:value-of select="$var:vPONumber" />
                </xsl:attribute>
                <DocumentReference> 
                  <xsl:attribute name="payloadID">
                    <!--<xsl:value-of select="$var:vPayLoadId" />-->
                    <xsl:value-of select="''" />
                  </xsl:attribute>
                </DocumentReference>
              </OrderReference>
            </InvoiceDetailOrderInfo>
            <xsl:for-each select="Detail">              
              <InvoiceDetailItem>
                <xsl:attribute name="invoiceLineNumber">
                  <xsl:value-of select="InvoiceLineNumber/text()" />
                </xsl:attribute>
                <xsl:attribute name="quantity">
                  <xsl:value-of select="Quantity/text()" />
                </xsl:attribute>
                <xsl:attribute name="referenceDate">
                  <xsl:value-of select="DeliveryDate/text()" />
                </xsl:attribute>
                <!--<xsl:attribute name="parentInvoiceLineNumber">
                  <xsl:value-of select="InvoiceLineNumber/text()" />
                </xsl:attribute>-->
                <UnitOfMeasure>
                  <xsl:value-of select="UnitOfMeasurement/text()" />
                </UnitOfMeasure>
                <UnitPrice>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="UnitPrice/text()" />
                  </Money>
                </UnitPrice>
                <!--<PriceBasisQuantity conversionFactor="1" quantity="1.0">
                  <UnitOfMeasure>
                    <xsl:value-of select="UnitOfMeasurement/text()" />
                  </UnitOfMeasure>
                  <Description xml:lang="en"/>
                </PriceBasisQuantity>-->
                <InvoiceDetailItemReference>
                  <xsl:attribute name="lineNumber">
                    <xsl:value-of select="PurchaseOrderLineNumber/text()" />
                  </xsl:attribute>
                  <ItemID>
                    <SupplierPartID>
                      <xsl:value-of select="ProductCode/text()" />
                    </SupplierPartID>
                  </ItemID>
                  <Description xml:lang="en">
                    <xsl:value-of select="ItemDescription/text()" />
                  </Description>
                </InvoiceDetailItemReference>
                <SubtotalAmount>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="InvoiceLineAmount/text()" />
                  </Money>
                </SubtotalAmount>
                <Tax>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="InvoiceLineGST/text()" />
                  </Money>
                  <Description xml:lang="en">Tax</Description>
                  <TaxDetail>
                    <xsl:attribute name="category">
                      <xsl:value-of select="'gst'" />
                    </xsl:attribute>
                    <xsl:attribute name="percentageRate">
                      <xsl:value-of select="number(TaxPercent/text())" />
                    </xsl:attribute>
                    <TaxableAmount>
                      <Money>
                        <xsl:attribute name="currency">
                          <xsl:value-of select="$var:vCurrency" />
                        </xsl:attribute>
                        <xsl:value-of select="InvoiceLineAmount/text()" />
                      </Money>
                    </TaxableAmount>
                    <TaxAmount>
                      <Money>
                        <xsl:attribute name="currency">
                          
                          <xsl:value-of select="$var:vCurrency" />
                        </xsl:attribute>
                        <xsl:value-of select="InvoiceLineGST/text()" />
                      </Money>
                    </TaxAmount>
                    <Description xml:lang="en">AU GST</Description>
                  </TaxDetail>                 
                </Tax>
                <GrossAmount>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="InvoiceLineTotal/text()" />
                  </Money>
                </GrossAmount>
                <NetAmount>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="InvoiceLineTotal/text()" />
                  </Money>
                </NetAmount>
                <Extrinsic name="punchinItemFromCatalog">no</Extrinsic>
              </InvoiceDetailItem>
            </xsl:for-each>
          </InvoiceDetailOrder>
          <InvoiceDetailSummary>
            <SubtotalAmount>
              <Money>
                <xsl:attribute name="currency">
                  <xsl:value-of select="$var:vCurrency" />
                </xsl:attribute>
                <xsl:value-of select="Header/InvoiceAmount/text()" />
               </Money>
            </SubtotalAmount>
            <Tax>
              <Money>
                <xsl:attribute name="currency">
                  <xsl:value-of select="$var:vCurrency" />
                </xsl:attribute>
                <xsl:value-of select="Header/InvoiceGST/text()" />
              </Money>
              <Description xml:lang="en">Tax</Description>
              <TaxDetail>
                <xsl:attribute name="category">
                  <xsl:value-of select="'gst'" />
                </xsl:attribute>
                <xsl:attribute name="percentageRate">
                  <xsl:value-of select="number(Header/TaxPercent/text())" />
                </xsl:attribute>
                <TaxableAmount>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="Header/InvoiceAmount/text()" />
                  </Money>
                </TaxableAmount>
                <TaxAmount>
                  <Money>
                    <xsl:attribute name="currency">
                      <xsl:value-of select="$var:vCurrency" />
                    </xsl:attribute>
                    <xsl:value-of select="Header/InvoiceGST/text()" />
                  </Money>
                </TaxAmount>
                <Description xml:lang="en">AU GST</Description>
              </TaxDetail>
            </Tax>
            <GrossAmount>
              <Money>
                <xsl:attribute name="currency">
                  <xsl:value-of select="$var:vCurrency" />
                </xsl:attribute>
                <xsl:value-of select="Header/InvoiceTotal/text()" />
              </Money>
            </GrossAmount>
            <NetAmount>
              <Money>
                <xsl:attribute name="currency">
                  <xsl:value-of select="$var:vCurrency" />
                </xsl:attribute>
                <xsl:value-of select="Header/InvoiceTotal/text()" />
              </Money>
            </NetAmount>
            <DueAmount>
              <Money>
                <xsl:attribute name="currency">
                  <xsl:value-of select="$var:vCurrency" />
                </xsl:attribute>
                <xsl:value-of select="Header/InvoiceTotal/text()" />
              </Money>
            </DueAmount>
          </InvoiceDetailSummary>
        </InvoiceDetailRequest>
      </Request>
    </cXML>   
  </xsl:template> 
  
  
    <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
  public string StringConcat(string param0)
  {
     return param0;
  }


  public string DateCurrentDateTimeCM()
  {
	  DateTime dt = DateTime.Now;
	  string curdate = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
	  string curtime = dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
	  string retval = curdate + "T" + curtime;
	  return retval;
  }


  public string StringConcat(string param0, string param1)
  {
     return param0 + param1;
  }
  
  public string PayLoadId_GenerateGUIDCM()
  {
       return System.Guid.NewGuid().ToString();
  }


]]></msxsl:script>
</xsl:stylesheet>