<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
                xmlns:ns0="http://JFH.Interfaces2006.Accolade.Schemas.AccoladeOrderMessage"              
                xmlns:s0="http://www.openapplications.org/oagis/10"                           
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:param name="param_divisionid"/>
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:ProcessSalesOrder" />
	</xsl:template>
	<xsl:template match="/s0:ProcessSalesOrder">  
		<!--xsl:variable name="v_Reference" select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:CustomerParty/s0:ID/text()"/-->
		<xsl:variable name="v_Reference" select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ID/text()"/>
		<AccoladeOrderMessageRoot>
			<Header>
				<SentDateTime>
					<xsl:value-of select="s0:ApplicationArea/s0:CreationDateTime/text()" />
				</SentDateTime>
				<Reference>
					<xsl:value-of select="$v_Reference" />
				</Reference>
				<Action/>
			</Header>
			<Body>
				<OrderHeader>
					<Companies>
						<warehouseid>52276</warehouseid>
						<Customer>
							<Company>
								<ID>
									<xsl:call-template name="companyvaluemapping" />
								</ID>
								<Reference>
									<xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:CustomerParty/s0:ID/text()"/>
								</Reference>
							</Company>
						</Customer>
						<ShipTo>
							<ID><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:ID/text()"/></ID>
							<Address>
								<ShippointName><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Name/text()"/></ShippointName>								
								<AddressLine1><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:AddressLine/text()"/></AddressLine1>
								<Suburb><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:CityName/text()"/></Suburb>
								<City><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:CitySubDivisionName/text()"/></City>  
								<State>
									<ID><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:CitySubDivisionName/text()"/></ID>
								</State>
								<Country>
									<ID><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:CountryCode/text()"/></ID>
								</Country>
								<PostCode><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:ShipToParty/s0:Location/s0:Address/s0:PostalCode/text()"/></PostCode>
							</Address>
						</ShipTo>
						<Supplier>
							<Company>
								<ID>
									<xsl:call-template name="companyvaluemapping" />
								</ID>
								<Reference>
									<xsl:value-of select="$v_Reference" />
								</Reference>
								<Address>
									<AddressLine1><xsl:value-of select="$param_divisionid"/></AddressLine1>
									<Town>
										<Description></Description>
									</Town>
									<State>
										<ID>SA</ID>
									</State>
									<Country>
										<ID>AU</ID>
									</Country>
									<ZipCode>5161</ZipCode>
								</Address>
							</Company>
						</Supplier>
						<Importer>
							<Company>
								<ID>1104</ID>
							</Company>
						</Importer>
						<!-- <Distributor>
							<Company>
								<ID>1104</ID>
								<Description>Accolade Wines</Description>
								<Address>
									<AddressLine1>Reynell Road</AddressLine1>
									<Town>
										<Description>REYNELLA</Description>
									</Town>
									<State>
										<ID>SA</ID>
									</State>
									<Country>
										<ID>AU</ID>
									</Country>
									<ZipCode>5161</ZipCode>
								</Address>
							</Company>
						</Distributor> -->
					</Companies>
					<TotalPackages/>
					<Commodity>
						<ID/>
						<Description/>
					</Commodity>
					<GenericDescription/>
				</OrderHeader>
				<OrderDetails>
					<xsl:for-each select="s0:DataArea/s0:SalesOrder/s0:SalesOrderLine">
						<OrderDetail>
								<ID><xsl:value-of select="s0:LineNumberID/text()" /></ID>
								<Quantity><xsl:value-of select="s0:Quantity/text()" /></Quantity>
								<CompanyProductCode><xsl:value-of select="s0:Item/s0:ID/text()" /></CompanyProductCode>
								<PackageType>
									<ID><xsl:value-of select="s0:Quantity/@unitCode/text()" /></ID>
									<Description/>
								</PackageType>
								<PackageVolume>
									<ID/>
									<Description/>
									<ItemQuantity><xsl:value-of select="s0:Quantity/text()" /></ItemQuantity>
									<ItemVolume/>
								</PackageVolume>
								<Description><xsl:value-of select="s0:Item/s0:Description/text()" /></Description>
								<CommercialValue>
									<Amount>
										<Decimal/>
									</Amount>
									<Currency>
										<ID>AUD</ID>
										<Description/>
									</Currency>
								</CommercialValue>
								<CountryCustomsCodes>
									<CountryCustomsCode>
											<CustomsCountry>
												<ID>AU</ID>
												<Description/>
											</CustomsCountry>
											<CustomsCode/>
										</CountryCustomsCode>
								</CountryCustomsCodes>
								<Action Force="true"/>
								<ApplicationSpecific>
										<Field>
											<FieldName/>
											<FieldValue><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:TransportStep/s0:GrossWeightMeasure/text()"/></FieldValue>
										</Field>
											<Field>
												<FieldName>Vintage</FieldName>
												<xsl:choose>
													<xsl:when test="s0:Item/s0:VariationID">
														<FieldValue><xsl:value-of select="s0:Item/s0:VariationID/text()" /></FieldValue>
													</xsl:when>
													<xsl:otherwise>
														<FieldValue/>														
													</xsl:otherwise>
												</xsl:choose>												
											</Field>	
																					
								</ApplicationSpecific>
							</OrderDetail>					
					</xsl:for-each>				
				</OrderDetails>
				<ShippingInstructions>
					<ShipmentDate>
						<Date><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:PromisedDeliveryDateTime/text()" /></Date>
					</ShipmentDate>
				</ShippingInstructions>
				<Ready>
					<GrossWeight>
						<Decimal><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:TransportStep/s0:GrossWeightMeasure/text()" /></Decimal>
					</GrossWeight>
					<Measurement>
						<Decimal><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:TransportStep/s0:TotalVolumeMeasure/text()" /></Decimal>
					</Measurement>
					<ReadyDate>
						<Date/>
					</ReadyDate>
				</Ready>
				<VesselBooking>
					<Involvement>
						<ExportForwarder>
							<ID/>
						</ExportForwarder>
					</Involvement>
				</VesselBooking>
				<ApplicationSpecific>
					<Field>
						<FieldName>OrderType</FieldName>
						<FieldValue><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/s0:ID/text()"/></FieldValue>						
					</Field>
					<Field>
						<FieldName>OrderCompany</FieldName>
						<FieldValue><xsl:value-of select="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:VariationID/text()"/></FieldValue>
					</Field>
					<Field>
						<FieldName>Vintage</FieldName>
						<FieldValue/>
					</Field>	
					<Field>
						<FieldName/>
						<FieldValue/>
					</Field>
					<Field>
						<FieldName/>
						<FieldValue/>
					</Field>
				</ApplicationSpecific>
			</Body>
		</AccoladeOrderMessageRoot>
	</xsl:template>
	<xsl:template name="companyvaluemapping">
		<xsl:choose>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SO'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SE'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SK'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SI'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'S7'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'ST'">
				<xsl:value-of select="'274690'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'274690'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  <xsl:template name="companynamevaluemapping">
		<xsl:choose>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SO'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SE'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SK'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'SI'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'S7'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:when test="s0:DataArea/s0:SalesOrder/s0:SalesOrderHeader/s0:DocumentReference/text() = 'ST'">
				<xsl:value-of select="'100'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'200'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>