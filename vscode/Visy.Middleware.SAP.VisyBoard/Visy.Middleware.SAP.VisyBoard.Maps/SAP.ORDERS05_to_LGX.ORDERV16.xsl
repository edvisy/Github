<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER" 
				xmlns:s0="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/3/ORDERS05//620" 
				xmlns:s1="http://Microsoft.LobServices.Sap/2007/03/Idoc/3/ORDERS05//620/Receive" 
				xmlns:s2="http://Microsoft.LobServices.Sap/2007/03/Types/Idoc/Common/" 
				exclude-result-prefixes="s2 s0 s1" >
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="/s1:Receive/s1:idocData" />
	</xsl:template>
	
	<xsl:template match="/s1:Receive/s1:idocData">
		<ns0:ORDER>
			<ns0:Header>
				<xsl:attribute name="order_type">N</xsl:attribute>
				<xsl:attribute name="application_code">EDI</xsl:attribute>
				
				<!-- EAN for Visy Board -->

				<xsl:if test="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:LIFNR">
					<xsl:variable name="lifnr" select="number(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:LIFNR)" />
					<xsl:attribute name="customer_ean">						
						<xsl:choose>						
						<!-- EAN For ALTO -->
						<xsl:when test="$lifnr = '2382'">9310096000008</xsl:when>
						<xsl:when test="$lifnr = '2383'">9310096000008</xsl:when>
						<xsl:when test="$lifnr = '2385'">9310096000008</xsl:when>
						<!-- WR00636 - Summit -->
						<xsl:when test="$lifnr = '2386'">9399999002074</xsl:when> 
						<xsl:when test="$lifnr = '2387'">9399999002074</xsl:when> 

						<xsl:when test="$lifnr = '2636'">9399999002005</xsl:when>
						<xsl:when test="$lifnr = '2634'">9999999999999</xsl:when>
						<xsl:when test="$lifnr = '2633'">9999999999999</xsl:when>
						<xsl:when test="$lifnr = '2632'">9399999002005</xsl:when>
						<xsl:when test="$lifnr = '2629'">9399999002005</xsl:when>
						<xsl:when test="$lifnr = '2628'">9399999002005</xsl:when>
						<xsl:when test="$lifnr = '2627'">9399999002005</xsl:when>
						<xsl:when test="$lifnr = '2622'">9999999999999</xsl:when>

						<!-- EAN For VisyBoard -->
						<xsl:when test="$lifnr = '2611'">9399999000476</xsl:when>
						<xsl:when test="$lifnr = '2604'">9999999999999</xsl:when>

						<!-- EAN For VisyBoard -->
						<xsl:otherwise>9316894000004</xsl:otherwise>							
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				
				
				<!--
				<xsl:attribute name="customer_ean">9316894000004</xsl:attribute>
				-->
				
				<!-- Plant Code comes from the Buyer address segment -->
				<!--
				<xsl:if test="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']">
					<xsl:attribute name="plant_code">
						<xsl:value-of select="'AU'"/>
					</xsl:attribute>
				</xsl:if>
				-->
				
				<!-- Customer Code is mapped from the Buyer details section -->
				<!--
				<xsl:if test="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'LF']/s0:PARTN">
					<xsl:variable name="partn" select="number(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'LF']/s0:PARTN)" />
					<xsl:attribute name="customer_code">
						<xsl:choose>
							<xsl:when test="$partn = '10062'">A537</xsl:when>
							<xsl:when test="$partn = '11415'">S1006</xsl:when>
							<xsl:when test="$partn = '16975'">R12</xsl:when>
							<xsl:when test="$partn = '18540'">M58</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				-->
				
				<xsl:if test="s0:E2EDK01005/s0:BELNR">
					<xsl:attribute name="purchase_order_number">
						<xsl:value-of select="s0:E2EDK01005/s0:BELNR" />
					</xsl:attribute>
				</xsl:if>
				
				<!-- Purchase Order date/time-->
				<xsl:if test="s0:E2EDK02[s0:QUALF = '001']">
					<xsl:attribute name="purchase_order_date">
						<xsl:value-of select="s0:E2EDK02[s0:QUALF = '001']/s0:DATUM" />
					</xsl:attribute>

					<xsl:attribute name="purchase_order_time">
						<xsl:choose>
							<xsl:when test="s0:E2EDK02[s0:QUALF = '001']/s0:UZEIT != ''">
								<xsl:value-of select="substring(s0:E2EDK02[s0:QUALF = '001']/s0:UZEIT, 1, 4)" />
							</xsl:when>
							<xsl:otherwise>0000</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				
				<!-- Customer Name -->
				<xsl:if test="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:NAME1 != ''">
					<xsl:attribute name="customer_name">
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:NAME1" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:NAME2" />
					</xsl:attribute>
				</xsl:if>
				
				<!-- Customer Address -->
				<xsl:if test="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS != ''">
					<xsl:attribute name="customer_address">
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:STRAS" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:ORT01" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:PSTLZ" />
					</xsl:attribute>
				</xsl:if>

				<!-- BizTalk Id not really appropriate, as we are not using an Orchestration, but we need to suppl a unique Id, so concatenate PO Number and Serial No -->
				<xsl:attribute name="biztalk_id">
					<xsl:value-of select="s0:E2EDK01005/s0:BELNR"/>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="s0:EDI_DC40/s2:SERIAL"/>
				</xsl:attribute>
				
				
				<!-- We don't want to acknowledge the document back from LGX -->
				<xsl:attribute name="acknowledge_document">AC</xsl:attribute>
			</ns0:Header>

			<!-- Process the individual lines -->
			<xsl:apply-templates select="s0:E2EDP01006GRP" />

			<ns0:Summary>
				<xsl:attribute name="total_order_quantity">
					<xsl:value-of select="sum(s0:E2EDP01006GRP/s0:E2EDP20001/s0:WMENG)" />
					
					<!-- If Unit Of Measure is 'TH' (Thousands), we need to multiply the eaches by 1000 in the Total 
					<xsl:if test="//s0:E2EDP01006/s0:MENEE/text() = 'TH'">000</xsl:if>-->
				</xsl:attribute>
			</ns0:Summary>
		</ns0:ORDER>

	</xsl:template>

	<xsl:template match="*[local-name()='E2EDP01006GRP']">
		
		<ns0:Detail>
			<xsl:attribute name="line_indicator">N</xsl:attribute>

			<xsl:if test="s0:E2EDP01006/s0:POSEX">
				<xsl:attribute name="line_number">
					<xsl:value-of select="number(s0:E2EDP01006/s0:POSEX)" />
				</xsl:attribute>
			</xsl:if>
			
			<xsl:if test="s0:E2EDP01006/s0:MATNR">
				<xsl:attribute name="product_code">
					<xsl:value-of select="s0:E2EDP01006/s0:MATNR" />
				</xsl:attribute>
			</xsl:if>
			
			<xsl:if test="s0:E2EDP20001/s0:WMENG">
				<xsl:attribute name="quantity">
					<xsl:value-of select="number(round(s0:E2EDP20001/s0:WMENG) div 1000)" />
				</xsl:attribute>
			</xsl:if>
			
			<xsl:if test="s0:E2EDP01006/s0:MENEE">
				<xsl:attribute name="unit_of_measure">TH</xsl:attribute>
			</xsl:if>
			
			<!-- Delivery Date (and optionally Time) -->
			<xsl:if test="s0:E2EDP20001/s0:EDATU">
				<xsl:attribute name="delivery_date">
					<xsl:value-of select="s0:E2EDP20001/s0:EDATU" />
				</xsl:attribute>
				
				<xsl:attribute name="delivery_time">
					<xsl:choose>
						<xsl:when test="s0:E2EDP20001/s0:EZEIT != ''">
							<xsl:value-of select="substring(s0:E2EDP20001/s0:EZEIT, 1, 4)" />
						</xsl:when>
						<xsl:otherwise>0000</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<!-- Warehouse Code is comprised of the Buyer's Identifier and the last 7 digits of the Supplier's Partner Number -->
			<xsl:attribute name="warehouse_code">
				<xsl:value-of select="//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'WE']/s0:LIFNR" />
				<xsl:text>-</xsl:text>
				<xsl:value-of select="substring(//s0:E2EDKA1003GRP/s0:E2EDKA1003[s0:PARVW = 'LF']/s0:PARTN, 4, 7)"/>
			</xsl:attribute>
			
			
			<xsl:if test="s0:E2EDP19001[s0:QUALF = '001']">
				<xsl:attribute name="comment">-</xsl:attribute>
			</xsl:if>
		</ns0:Detail>
	</xsl:template>

</xsl:stylesheet>