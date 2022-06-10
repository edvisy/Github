<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body bgcolor="#6699ff">
				<strong style="font-size: x-large">Lion Nathan National Foods - Visy Industries</strong>
				<br />
				<br />
				<strong style="font-size: large">Delivery Forecast Report<br />
				</strong>
				<br />
				<xsl:apply-templates select="//Header"/>

				<br />

				<xsl:apply-templates select="//Details"/>

				<br />
        Please contact <a href="mailto:visyflow@visy.com.au">Visy Industries</a> if you have any questions.

			</body>
		</html>
	</xsl:template>

	<xsl:template match="Header">
		<table style="border-left-color: black; border-bottom-color: black; width: 800px;
            color: black; border-top-style: solid; border-top-color: black; border-right-style: solid;
            border-left-style: solid; border-right-color: black; border-bottom-style: solid">
			<tr>
				<td colspan="1" style="width: 90px">
                    Buyer Code</td>
				<td colspan="1" style="width: 300px">
					<xsl:value-of select="@BuyerCode"/>
				</td>
				<td colspan="1" style="width: 90px">
                    Supplier Code</td>
				<td colspan="3" style="width: 535px">
					<xsl:value-of select="@SupplierCode"/>
				</td>
				<td colspan="1">
				</td>
			</tr>
			<tr>
				<td colspan="1" style="width: 90px">
                    Visy Customer</td>
				<td colspan="1" style="width: 300px">
					<xsl:value-of select="@VisyBuyerCode"/>
				</td>
				<td colspan="1" style="width: 90px">
                    Visy Plant</td>
				<td colspan="3" style="width: 535px">
					<xsl:value-of select="@VisySupplierCode"/>
        </td>
				<td colspan="1">
				</td>
			</tr>
			<tr>
				<td colspan="1" style="width: 90px">
                    Purchase Order</td>
				<td colspan="1" style="width: 300px">
					<xsl:value-of select="@PurchaseOrder"/>
				</td>
				<td colspan="1" style="width: 90px">
                    Document Date</td>
				<td colspan="3" style="width: 535px">
					<xsl:value-of select="@DocumentDate"/>
				</td>
				<td colspan="1">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="2" style="width: 90px">
                    From Period</td>
				<td colspan="1" rowspan="2" style="width: 300px">
					<xsl:value-of select="@FromPeriod"/>
				</td>
				<td colspan="1" rowspan="2" style="width: 90px">
                    To Period</td>
				<td colspan="3" rowspan="2" style="width: 535px">
					<xsl:value-of select="@ToPeriod"/>
				</td>
				<td colspan="1" rowspan="2">
				</td>
			</tr>
			<tr>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="Schedules">
		<tr>
			<td colspan="2" rowspan="1" style="height: 21px; width: 25px;">
				<xsl:value-of select="@Date"/>
			</td>
			<td colspan="1" rowspan="1" style="height: 21px">
				<xsl:value-of select="@Quantity"/>
			</td>
			<td colspan="5" rowspan="1" style="height: 21px" align="right">
				<xsl:value-of select="@DeliveryPlan"/>
			</td>
			<td colspan="1" rowspan="1" style="height: 21px">
				<xsl:value-of select="@Bucket"/>
			</td>
			<td colspan="1" rowspan="1" style="height: 21px">
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="Details">
		<br />
		<table style="border-left-color: black; border-bottom-color: black; width: 800px;
            border-top-style: solid; border-top-color: black; border-right-style: solid;
            border-left-style: solid; border-right-color: black; border-bottom-style: solid">
			<tr>
				<td colspan="1" rowspan="3" style="width: 110px">
                    Material Code</td>
				<td colspan="2" rowspan="3" style="width: 200px">
					<xsl:value-of select="@Material"/>
				</td>
				<td colspan="4" rowspan="3" style="width: 146px">
                    Blanket Order No</td>
				<td colspan="2" rowspan="3">
					<xsl:value-of select="@BlanketOrderNo"/>
				</td>
				<td colspan="1" rowspan="3">
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="1" rowspan="3" style="width: 110px">
                    Material Description</td>
				<td colspan="2" rowspan="3" style="width: 300px">
					<xsl:value-of select="@MaterialDescription"/>
				</td>
				<td colspan="4" rowspan="3" style="width: 146px">
				</td>
				<td colspan="2" rowspan="3">					
				</td>
				<td colspan="1" rowspan="3">
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>

			<tr>
				<td colspan="1" rowspan="1" style="width: 110px">
                    Customer Ref #</td>
				<td colspan="2" rowspan="1" style="width: 200px">
					<xsl:value-of select="@CustomerRef"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px">
                    Customer Ref Period</td>
				<td colspan="2" rowspan="1">
					<xsl:value-of select="@CustomerRefPeriod"/>
				</td>
				<td colspan="1" rowspan="1">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="1" style="width: 110px; height: 21px">
                    Principal Ref #</td>
				<td colspan="2" rowspan="1" style="width: 200px; height: 21px">
					<xsl:value-of select="@PrincipalRef"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px; height: 21px">
                    Principal Ref Period</td>
				<td colspan="2" rowspan="1" style="height: 21px">
					<xsl:value-of select="@PrincipalRefPeriod"/>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="1" style="width: 110px; height: 21px">
                    Prior Cum Qty</td>
				<td colspan="2" rowspan="1" style="width: 200px; height: 21px">
					<xsl:value-of select="@PriorCumQuantity"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px; height: 21px">
                    Prior Past Net</td>
				<td colspan="2" rowspan="1" style="height: 21px">
					<xsl:value-of select="@PriorPastNet"/>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="1" style="width: 110px; height: 21px">
                    Delivery Point</td>
				<td colspan="2" rowspan="1" style="width: 200px; height: 21px">
					<xsl:value-of select="@DeliveryPoint"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px; height: 21px">
                    Visy Ship To</td>
				<td colspan="2" rowspan="1" style="height: 21px">
					<xsl:value-of select="@VisyShipTo"/>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="1" style="width: 110px; height: 21px">
                    Fabric Quantity</td>
				<td colspan="2" rowspan="1" style="width: 200px; height: 21px">
					<xsl:value-of select="@FabricQuantity"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px; height: 21px">
                    Fabric Ref Period</td>
				<td colspan="2" rowspan="1" style="height: 21px">
					<xsl:value-of select="@CustomerRefPeriod"/>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="1" rowspan="1" style="width: 110px; height: 21px">
                    Raw Quantity</td>
				<td colspan="2" rowspan="1" style="width: 200px; height: 21px">
					<xsl:value-of select="@RawQuantity"/>
				</td>
				<td colspan="4" rowspan="1" style="width: 146px; height: 21px">
                    Raw Ref Period</td>
				<td colspan="2" rowspan="1" style="height: 21px">
					<xsl:value-of select="@PrincipalRefPeriod"/>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="9" rowspan="1" style="height: 21px">
					<center>
						<strong/>
					</center>
					<center>
						<strong>
							<span style="text-decoration: underline">Schedules</span>
						</strong>
					</center>
				</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<tr>
				<td colspan="2" rowspan="1" style="height: 21px; width: 25px;">
                    Delivery Date</td>
				<td colspan="1" rowspan="1" style="height: 21px">
                    Quantity</td>
				<td colspan="5" rowspan="1" style="height: 21px" align="right">
                    Delivery</td>
				<td colspan="1" rowspan="1" style="height: 21px">
                    Type</td>
				<td colspan="1" rowspan="1" style="height: 21px">
				</td>
			</tr>
			<xsl:apply-templates select="Schedules"/>
		</table>
	</xsl:template>
</xsl:stylesheet>
