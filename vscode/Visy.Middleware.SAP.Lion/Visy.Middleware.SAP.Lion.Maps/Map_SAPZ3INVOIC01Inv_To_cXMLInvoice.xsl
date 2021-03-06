<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
                exclude-result-prefixes="msxsl var s0 s1 s2 userCSharp ScriptNS0 ScriptNS1 ScriptNS2 ScriptNS3"
                version="1.0"
                xmlns:xml="http://www.w3.org/XML/1998/namespace"
                xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/INVOIC02/Z3INVOIC02/620/Receive"
                xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/INVOIC02/Z3INVOIC02/620"
                xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/"
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"
                xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
                xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
                xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
                xmlns:ScriptNS3="http://schemas.microsoft.com/BizTalk/2003/ScriptNS3">
	<xsl:output omit-xml-declaration="no"
	            method="xml"
	            version="1.0"
	            doctype-system="http://xml.cxml.org/schemas/cXML/1.2.031/InvoiceDetail.dtd"/>
  
	<xsl:template match="/">
		<xsl:apply-templates select="/s1:Receive"/>
	</xsl:template>
	<xsl:template match="/s1:Receive">
		<xsl:variable name="var:vPONumber"
		              select="string(s1:idocData/s0:E2EDK02[s0:QUALF/text()='001']/s0:BELNR/text())"/>
		<xsl:variable name="var:vPayLoadId"
		              select="userCSharp:PayLoadId_GenerateGUID()"/>
		<xsl:variable name="var:vInvoiceDate"
		              select="ScriptNS2:FormateDateNew(string(s1:idocData/s0:E2EDK03[s0:IDDAT/text()='012']/s0:DATUM/text()), &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)"/>
		<xsl:variable name="var:vInvoiceID"
		              select="string(s1:idocData/s0:E2EDK02[s0:QUALF/text()='009']/s0:BELNR/text())"/>
		<xsl:variable name="var:vCurrency"
		              select="string(s1:idocData/s0:E2EDK01005GRP[1]/s0:E2EDK01005/s0:CURCY/text())"/>
		<xsl:variable name="var:vTaxId"
		              select="translate(s1:idocData/s0:E2EDK01005GRP[1]/s0:E2EDK01005/s0:EIGENUINR/text(), '-', '')"/>
		<cXML>
			<xsl:attribute name="payloadID">
				<xsl:value-of select="$var:vPayLoadId"/>
			</xsl:attribute>
			<xsl:attribute name="timestamp">
				<xsl:value-of select="userCSharp:DateCurrentDateTime()"/>
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:text>1.2.031</xsl:text>
			</xsl:attribute>
			<Header>
				<From>
					<Credential>
						<xsl:attribute name="domain">
							<xsl:value-of select="'NetworkID'"/>
						</xsl:attribute>
						<Identity>
							<xsl:value-of select="ScriptNS1:GetLookupValue('SupplierId' , 'SAP.Lion.cXML.Settings')"/>
						</Identity>
					</Credential>
				</From>
				<To>
					<Credential>
						<xsl:attribute name="domain">
							<xsl:value-of select="'NetworkID'"/>
						</xsl:attribute>
						<Identity>
							<xsl:value-of select="ScriptNS1:GetLookupValue('CustomerId' , 'SAP.Lion.cXML.Settings')"/>
						</Identity>
					</Credential>
				</To>
				<Sender>
					<Credential>
						<xsl:attribute name="domain">
							<xsl:value-of select="'NetworkID'"/>
						</xsl:attribute>
						<Identity>
							<xsl:value-of select="ScriptNS1:GetLookupValue('SupplierId' , 'SAP.Lion.cXML.Settings')"/>
						</Identity>
						<SharedSecret>
							<xsl:value-of select="ScriptNS1:GetLookupValue('SharedSecret' , 'SAP.Lion.cXML.Settings')"/>
						</SharedSecret>
					</Credential>
					<UserAgent>
						<xsl:value-of select="'Supplier'"/>
					</UserAgent>
				</Sender>
			</Header>
			<Request>
				<xsl:attribute name="deploymentMode">
					<xsl:value-of select="ScriptNS1:GetLookupValue('Environment' , 'SAP.Lion.cXML.Settings')"/>
				</xsl:attribute>
				<InvoiceDetailRequest>
					<InvoiceDetailRequestHeader>
						<!--<xsl:for-each select="E1EDK03">               <xsl:variable name="var:vIDDAT012" select="string(IDDAT/text())" />               <xsl:if test="string($var:vIDDAT012)='012'">                 <xsl:variable name="var:vInvoiceDate" select="ScriptNS2:FormateDateNew(DATUM/text() , &quot;yyyy-MM-ddTHH:mm:sszzz&quot;, &quot;yyyyMMdd&quot;)"/>                                 <xsl:attribute name="invoiceDate">                   <xsl:value-of select="$var:vInvoiceDate" />                 </xsl:attribute>               </xsl:if>             </xsl:for-each>-->
						<xsl:attribute name="invoiceDate">
							<xsl:value-of select="$var:vInvoiceDate"/>
						</xsl:attribute>
						<xsl:attribute name="invoiceID">
							<xsl:value-of select="$var:vInvoiceID"/>
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
						<!--remitTo-->
						<InvoicePartner>
							<Contact role="remitTo">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
							<IdReference>
								<xsl:attribute name="domain">
									<xsl:value-of select="'supplierTaxID'"/>
								</xsl:attribute>
								<xsl:attribute name="identifier">
									<xsl:value-of select="$var:vTaxId"/>
								</xsl:attribute>
							</IdReference>
						</InvoicePartner>
						<!--billTo-->
						<InvoicePartner>
							<Contact role="billTo">
								<xsl:attribute name="addressID">
									<xsl:value-of select="substring-before(ScriptNS0:GetInterfaceLookupData(number(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:PARTN/text()) , 'SAP.Lion.Invoice.AddressId'), '|')"/>
								</xsl:attribute>
								<Name xml:lang="en">
									<xsl:value-of select="substring-after(ScriptNS0:GetInterfaceLookupData(number(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:PARTN/text()) , 'SAP.Lion.Invoice.AddressId'), '|')"/>
									<!--<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:NAME1/text())" />-->
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='RE']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
						</InvoicePartner>
						<!--from - copy rules from billFrom-->
						<InvoicePartner>
							<Contact role="from">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
						</InvoicePartner>
						<!--billFrom-->
						<InvoicePartner>
							<Contact role="billFrom">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
						</InvoicePartner>
						<!--soldTo-->
						<InvoicePartner>
							<Contact role="soldTo">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
						</InvoicePartner>
						<InvoiceDetailShipping>
							<!--shipFrom  - copy rules from billFrom-->
							<Contact role="shipFrom">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='BK']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
							<!--shipTo-->
							<Contact role="shipTo">
								<Name xml:lang="en">
									<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:NAME1/text())"/>
								</Name>
								<PostalAddress>
									<Street>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:STRAS/text())"/>
									</Street>
									<City>
										<xsl:attribute name="cityCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:ORT01/text())"/>
										</xsl:attribute>
									</City>
									<State>
										<xsl:attribute name="isoStateCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:REGIO/text())"/>
										</xsl:attribute>
									</State>
									<PostalCode>
										<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:PSTLZ/text())"/>
									</PostalCode>
									<Country>
										<xsl:attribute name="isoCountryCode">
											<xsl:value-of select="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())"/>
										</xsl:attribute>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())='AU'">
											<xsl:text>Australia</xsl:text>
										</xsl:if>
										<xsl:if test="string(s1:idocData/s0:E2EDKA1003[s0:PARVW/text()='AG']/s0:LAND1/text())='NZ'">
											<xsl:text>New Zealand</xsl:text>
										</xsl:if>
									</Country>
								</PostalAddress>
							</Contact>
						</InvoiceDetailShipping>
						<ShipNoticeIDInfo>
							<xsl:attribute name="shipNoticeID">
								<xsl:for-each select="s1:idocData/s0:E2EDK02[s0:QUALF/text()='012']">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<xsl:value-of select="s0:BELNR/text()"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text> </xsl:text>
											<xsl:value-of select="s0:BELNR/text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</xsl:attribute>
						</ShipNoticeIDInfo>
						<PaymentTerm>
							<xsl:attribute name="payInNumberOfDays">
								<xsl:value-of select="translate(s1:idocData/s0:E2EDK18[s0:QUALF/text()='005']/s0:ZTERM_TXT/text(), translate(s1:idocData/s0:E2EDK18[s0:QUALF/text()='005']/s0:ZTERM_TXT/text(),'0123456789',''), '')"/>
							</xsl:attribute>
							<Discount>
								<DiscountPercent>
									<xsl:attribute name="percent">
										<xsl:value-of select="string(s1:idocData/s0:E2EDK18[s0:QUALF/text()='001']/s0:PRZNT/text())"/>
									</xsl:attribute>
								</DiscountPercent>
							</Discount>
						</PaymentTerm>
						<Extrinsic name="TaxInvoice">This is a tax invoice</Extrinsic>
						<Extrinsic name="invoiceSourceDocument">PurchaseOrder</Extrinsic>
						<Extrinsic name="invoiceSubmissionMethod">cXML</Extrinsic>
						<Extrinsic name="supplierVatID">
							<xsl:value-of select="$var:vTaxId"/>
						</Extrinsic>
						<Extrinsic name="DeliveryNoteNumber">
							<xsl:for-each select="s1:idocData/s0:E2EDK02[s0:QUALF/text()='012']">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<xsl:value-of select="s0:BELNR/text()"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text> </xsl:text>
										<xsl:value-of select="s0:BELNR/text()"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</Extrinsic>
					</InvoiceDetailRequestHeader>
					<xsl:for-each select="s1:idocData/s0:E2EDP01007GRP">
						<InvoiceDetailOrder>
							<InvoiceDetailOrderInfo>
								<OrderReference>
									<xsl:attribute name="orderID">
										<xsl:value-of select="s0:E2EDP02001/s0:BELNR"/>
									</xsl:attribute>
									<DocumentReference>
										<xsl:attribute name="payloadID">
											<xsl:value-of select="''"/>
										</xsl:attribute>
									</DocumentReference>
								</OrderReference>
								<xsl:if test="s0:E2EDP02001/s0:BELNR[contains(text(), 'JIT')]">
									<MasterAgreementIDInfo>
										<xsl:attribute name="agreementID">
											<xsl:value-of select="substring(s0:E2EDP02001/s0:BELNR/text(), 1, 10)"/>
										</xsl:attribute>
										<xsl:attribute name="agreementType">
											<xsl:value-of select="'scheduling_agreement'"/>
										</xsl:attribute>
									</MasterAgreementIDInfo>
								</xsl:if>
							</InvoiceDetailOrderInfo>
							<InvoiceDetailItem>
								<xsl:attribute name="invoiceLineNumber">
									<xsl:value-of select="position()"/>
								</xsl:attribute>
								<xsl:attribute name="quantity">
									<xsl:choose>
										<xsl:when test="string(s0:E2EDP01007/s0:MENEE/text())='TH'">
											<xsl:value-of select="number(s0:E2EDP01007/s0:MENGE/text())*1000"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="number(s0:E2EDP01007/s0:MENGE/text())"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:if test="s0:E2EDP01007/s0:MENEE">
									<xsl:variable name="var:vUOM"
									              select="ScriptNS0:GetInterfaceLookupData(string(s0:E2EDP01007/s0:MENEE/text()) , &quot;SAP.Lion.UOMResponse&quot;)"/>
									<xsl:if test="string($var:vUOM)=''">
										<xsl:message terminate="yes">                         UOM value is missing.                       </xsl:message>
									</xsl:if>
									<UnitOfMeasure>
										<xsl:value-of select="$var:vUOM"/>
									</UnitOfMeasure>
								</xsl:if>
								<xsl:variable name="var:vTDLINE"
								              select="string(s0:E2EDPT1001GRP[s0:E2EDPT1001/s0:TDID/text()='0010']/s0:E2EDPT2001/s0:TDLINE/text())"/>
								<UnitPrice>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(string(s0:E2EDP26[s0:QUALF/text()='001']/s0:BETRG/text()), '0.00')"/>
									</Money>
								</UnitPrice>
								<PriceBasisQuantity>
									<xsl:attribute name="conversionFactor">
										<xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '1')"/>
									</xsl:attribute>
									<xsl:attribute name="quantity">
										<xsl:choose>
											<xsl:when test="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '2')='TH'">
												<xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '0')*1000"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '0')"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<UnitOfMeasure>
										<xsl:value-of select="ScriptNS0:GetInterfaceLookupData(ScriptNS3:GetValueFromDelimeteredList($var:vTDLINE, '~', '2') , &quot;SAP.Lion.UOMResponse&quot;)"/>
									</UnitOfMeasure>
								</PriceBasisQuantity>
								<InvoiceDetailItemReference>
									<xsl:attribute name="lineNumber">
										<xsl:value-of select="number(s0:E2EDP02001[s0:QUALF/text()='001']/s0:ZEILE/text())"/>
									</xsl:attribute>
									<ItemID>
										<SupplierPartID/>
										<BuyerPartID>
											<xsl:value-of select="string(s0:E2EDP19002[s0:QUALF/text()='001']/s0:IDTNR/text())"/>
										</BuyerPartID>
									</ItemID>
									<Description>
										<xsl:attribute name="xml:lang">
											<xsl:value-of select="'en'"/>
										</xsl:attribute>
										<xsl:value-of select="string(s0:E2EDP19002[s0:QUALF/text()='002']/s0:KTEXT/text())"/>
									</Description>
									<xsl:for-each select="s0:E2EDPT1001GRP">
										<xsl:if test="string(s0:E2EDPT1001/s0:TDID/text())='0010'">
											<Classification>
												<xsl:attribute name="domain">
													<xsl:value-of select="'not available'"/>
												</xsl:attribute>
												<xsl:value-of select="ScriptNS3:GetValueFromDelimeteredList(s0:E2EDPT2001/s0:TDLINE/text(), '~', '3')"/>
											</Classification>
										</xsl:if>
									</xsl:for-each>
								</InvoiceDetailItemReference>
								<SubtotalAmount>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<!--<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text())" />-->
										<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='012']/s0:BETRG/text())"/>
									</Money>
								</SubtotalAmount>
								<Tax>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(s0:E2EDP26[s0:QUALF/text()='004']/s0:BETRG/text() - s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text(), '0.00')"/>
									</Money>
									<Description xml:lang="en">Tax</Description>
									<TaxDetail>
										<xsl:attribute name="category">
											<xsl:value-of select="'GST'"/>
										</xsl:attribute>
										<xsl:attribute name="percentageRate">
											<xsl:value-of select="format-number(((s0:E2EDP26[s0:QUALF/text()='004']/s0:BETRG/text() - s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text())                         div s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text()) * 100,  '0.000')"/>
										</xsl:attribute>
										<TaxableAmount>
											<Money>
												<xsl:attribute name="currency">
													<xsl:value-of select="$var:vCurrency"/>
												</xsl:attribute>
												<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text())"/>
											</Money>
										</TaxableAmount>
										<TaxAmount>
											<Money>
												<xsl:attribute name="currency">
													<xsl:value-of select="$var:vCurrency"/>
												</xsl:attribute>
												<xsl:value-of select="format-number(s0:E2EDP26[s0:QUALF/text()='004']/s0:BETRG/text() - s0:E2EDP26[s0:QUALF/text()='003']/s0:BETRG/text(), '0.00')"/>
											</Money>
										</TaxAmount>
										<Description xml:lang="en">
											<xsl:value-of select="concat('', '', 'GST')"/>
										</Description>
									</TaxDetail>
								</Tax>
								<GrossAmount>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='004']/s0:BETRG/text())"/>
									</Money>
								</GrossAmount>
								<NetAmount>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<!--<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='012']/s0:BETRG/text())" />-->
										<xsl:value-of select="string(s0:E2EDP26[s0:QUALF/text()='004']/s0:BETRG/text())"/>
									</Money>
								</NetAmount>
							</InvoiceDetailItem>
						</InvoiceDetailOrder>
					</xsl:for-each>
					<InvoiceDetailSummary>
						<SubtotalAmount>
							<Money>
								<xsl:attribute name="currency">
									<xsl:value-of select="$var:vCurrency"/>
								</xsl:attribute>
								<!--<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='012']/s0:SUMME/text())" />-->
								<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='010']/s0:SUMME/text())"/>
							</Money>
						</SubtotalAmount>
						<Tax>
							<Money>
								<xsl:attribute name="currency">
									<xsl:value-of select="$var:vCurrency"/>
								</xsl:attribute>
								<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='005']/s0:SUMME/text())"/>
							</Money>
							<Description xml:lang="en">               </Description>
							<TaxDetail>
								<xsl:attribute name="category">
									<xsl:value-of select="'gst'"/>
								</xsl:attribute>
								<xsl:attribute name="percentageRate">
									<xsl:value-of select="format-number((s1:idocData/s0:E2EDS01[s0:SUMID/text()='005']/s0:SUMME/text()                        div s1:idocData/s0:E2EDS01[s0:SUMID/text()='010']/s0:SUMME/text()) * 100, '0.000')"/>
								</xsl:attribute>
								<xsl:attribute name="purpose">
									<xsl:value-of select="'tax'"/>
								</xsl:attribute>
								<TaxableAmount>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='012']/s0:SUMME/text())"/>
									</Money>
								</TaxableAmount>
								<TaxAmount>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="$var:vCurrency"/>
										</xsl:attribute>
										<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='005']/s0:SUMME/text())"/>
									</Money>
								</TaxAmount>
								<Description xml:lang="en">
									<xsl:value-of select="concat('', '', 'GST')"/>
								</Description>
							</TaxDetail>
						</Tax>
						<GrossAmount>
							<Money>
								<xsl:attribute name="currency">
									<xsl:value-of select="$var:vCurrency"/>
								</xsl:attribute>
								<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='011']/s0:SUMME/text())"/>
							</Money>
						</GrossAmount>
						<NetAmount>
							<Money>
								<xsl:attribute name="currency">
									<xsl:value-of select="$var:vCurrency"/>
								</xsl:attribute>
								<!--<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='010']/s0:SUMME/text())" />-->
								<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='011']/s0:SUMME/text())"/>
							</Money>
						</NetAmount>
						<DueAmount>
							<Money>
								<xsl:attribute name="currency">
									<xsl:value-of select="$var:vCurrency"/>
								</xsl:attribute>
								<xsl:value-of select="string(s1:idocData/s0:E2EDS01[s0:SUMID/text()='011']/s0:SUMME/text())"/>
							</Money>
						</DueAmount>
					</InvoiceDetailSummary>
				</InvoiceDetailRequest>
			</Request>
		</cXML>
	</xsl:template>
	<msxsl:script language="C#"
	              implements-prefix="userCSharp">     <![CDATA[   public string StringConcat(string param0)   {      return param0;   }     public string DateCurrentDateTime()   {    DateTime dt = DateTime.Now;    string curdate = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);    string curtime = dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);    string retval = curdate + "T" + curtime;    return retval;   }     public string StringConcat(string param0, string param1)   {      return param0 + param1;   }      public string PayLoadId_GenerateGUID()   {        return System.Guid.NewGuid().ToString();   }   ]]></msxsl:script>
</xsl:stylesheet>