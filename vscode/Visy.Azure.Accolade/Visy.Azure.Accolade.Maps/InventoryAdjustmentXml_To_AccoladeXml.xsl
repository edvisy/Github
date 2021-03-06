<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:ns0="http://www.openapplications.org/oagis/10"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
	<xsl:output omit-xml-declaration="yes"
	            method="xml"
	            version="1.0"
	            indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/Inventoryadjust"/>
	</xsl:template>
	<xsl:template match="/Inventoryadjust">
		<ns0:ProcessMoveInventory xmlns:ns0="http://www.openapplications.org/oagis/10">
			<ns0:ApplicationArea>
				<ns0:Sender>
					<ns0:LogicalID>http://www.3PLTechincalName.com</ns0:LogicalID>
					<ns0:ComponentID>3PL Name</ns0:ComponentID>
					<ns0:ReferenceID>3PL's reference</ns0:ReferenceID>
				</ns0:Sender>
				<ns0:Receiver>
					<ns0:LogicalID>http://www.accoladewines.com</ns0:LogicalID>
					<ns0:ComponentID>Accolade</ns0:ComponentID>
				</ns0:Receiver>
				<ns0:CreationDateTime>
					<xsl:value-of select="Header/DocumentDateTime/text()"/>
				</ns0:CreationDateTime>
				<ns0:BODID>
					<xsl:value-of select="Header/Uniqueid/text()"/>
				</ns0:BODID>
			</ns0:ApplicationArea>
			<ns0:DataArea>
				<ns0:Process>
					<ns0:ActionCriteria>
						<ns0:ActionExpression>INVADJ</ns0:ActionExpression>
					</ns0:ActionCriteria>
				</ns0:Process>
				<ns0:MoveInventory>
					<ns0:MoveInventoryHeader>
						<ns0:DocumentDateTime>
							<xsl:value-of select="Header/DocumentDateTime/text()"/>
						</ns0:DocumentDateTime>
						<ns0:DocumentReference>
							<ns0:ID/>
						</ns0:DocumentReference>
						<ns0:VariationID/>
					</ns0:MoveInventoryHeader>
					<xsl:for-each select="ItemList/Item">
						<ns0:MoveInventoryLine>
							<ns0:DocumentReference>
								<ns0:ID/>
							</ns0:DocumentReference>
							<ns0:ItemInstance>
								<ns0:ID>
									<xsl:value-of select="Itemnumber/text()"/>
								</ns0:ID>
								<ns0:Lot>
									<ns0:ID>
										<xsl:value-of select="Itembatch/text()"/>
									</ns0:ID>
								</ns0:Lot>
								<ns0:Quantity>
									<xsl:attribute name="unitCode"
									               select="Itemuom/text()"/>
									<xsl:value-of select="Itemquantity/text()"/>
								</ns0:Quantity>
								<ns0:Classification>
									<ns0:ID>
										<xsl:value-of select="Itemtostatus/text()"/>
									</ns0:ID>
								</ns0:Classification>
							</ns0:ItemInstance>
							<ns0:Facility>
								<ns0:ID>1167</ns0:ID>
							</ns0:Facility>
							<ns0:ReasonCode>
								<xsl:value-of select="Reasondesc/text()"/>
							</ns0:ReasonCode>
						</ns0:MoveInventoryLine>
					</xsl:for-each>
				</ns0:MoveInventory>
			</ns0:DataArea>
		</ns0:ProcessMoveInventory>
	</xsl:template>
	<xsl:template name="uomvaluemapping">
		<xsl:choose>
			<xsl:when test="OrderUOM = 'CS'">
				<xsl:value-of select="'CA'"/>
			</xsl:when>
			<xsl:when test="OrderUOM = 'EA'">
				<xsl:value-of select="'EA'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'CA'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>