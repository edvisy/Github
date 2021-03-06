<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
	exclude-result-prefixes="msxsl var userCSharp ScriptNS0 ScriptNS1 ScriptNS2"
	xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0"
	xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1"
  xmlns:ScriptNS2="http://schemas.microsoft.com/BizTalk/2003/ScriptNS2"
	version="1.0"
	xmlns:ns0="http://Visy.Middleware.Common.Schemas.LGX.ORDER"
	xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/DOCUMENT" />
  </xsl:template>
  <xsl:template match="/DOCUMENT">
    <xsl:variable name="var:vCustomerEAN" select="DOCUMENTINDEX[@Name='CustomerEAN']/text()" />
    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
   
    <ns0:ORDER>
      <ns0:Header>
        <xsl:variable name="validation">
          <xsl:if test="normalize-space(string(DOCUMENTINDEX[@Name='PurchaseOrder']/text()))=''">
            <xsl:text>- PO Number~</xsl:text>           
          </xsl:if>          
          <xsl:if test="normalize-space(string(DOCUMENTINDEX[@Name='CustomerCode']/text()))=''">
            <xsl:text>- Customer Code~</xsl:text>   
          </xsl:if>
          <xsl:if test="normalize-space(string(DOCUMENTINDEX[@Name='CustomerName']/text()))=''">
            <xsl:text>- Customer Name~</xsl:text>
          </xsl:if>
          <xsl:if test="normalize-space(string(DOCUMENTINDEX[@Name='DeliveryAddress']/text()))=''">
            <xsl:text>- Delivery Address~</xsl:text>
          </xsl:if>
          <xsl:if test="TABLEINDEX/ROW[normalize-space(string(TABLEFIELD[@Name='MaterialID']/text())) = '']">
            <xsl:text>- Product Code~</xsl:text>
          </xsl:if>
          <xsl:if test="TABLEINDEX/ROW[normalize-space(string(TABLEFIELD[@Name='OrderQty']/text())) = '']">
            <xsl:text>- Quantity~</xsl:text>
          </xsl:if>
          <xsl:if test="TABLEINDEX/ROW[normalize-space(string(TABLEFIELD[@Name='DeliveryDate']/text())) = '']">
            <xsl:text>- Delivery Date~</xsl:text>
          </xsl:if>
          <xsl:if test="count(TABLEINDEX/ROW) = 0">
            <xsl:text>- Missing Line Items</xsl:text>
          </xsl:if>
        </xsl:variable>
        <xsl:if test="not($validation='')">
          <xsl:message terminate="yes">
            <xsl:value-of select="$validation" />
          </xsl:message>
        </xsl:if>
        <xsl:attribute name="order_type">
          <xsl:value-of select="'N'" />
        </xsl:attribute>
        <xsl:attribute name="application_code">
          <xsl:value-of select="'EDI'" />
        </xsl:attribute>
        <xsl:attribute name="customer_ean">
          <xsl:value-of select="$var:vCustomerEAN" />
        </xsl:attribute>
        <xsl:attribute name="customer_code">
          <xsl:value-of select="DOCUMENTINDEX[@Name='CustomerCode']/text()" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_number">
          <xsl:value-of select="DOCUMENTINDEX[@Name='PurchaseOrder']/text()" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_date">
          <xsl:value-of select="ScriptNS0:FormateDateNew(DOCUMENTINDEX[@Name='PurchaseOrderDate']/text(), &quot;yyyyMMdd&quot;, &quot;yyyyMMdd&quot;)" />
        </xsl:attribute>
        <xsl:attribute name="purchase_order_time">
          <xsl:value-of select="userCSharp:DateCurrentTime()" />
        </xsl:attribute>
        <xsl:attribute name="customer_name">
          <xsl:value-of select="DOCUMENTINDEX[@Name='CustomerName']/text()" />
        </xsl:attribute>
        <xsl:attribute name="customer_address">
          <xsl:value-of select="''" />
        </xsl:attribute>
        <xsl:attribute name="biztalk_id">
          <xsl:value-of select="ScriptNS2:GetDataValue(&quot;biztalkid&quot;)" />
        </xsl:attribute>
        <xsl:attribute name="acknowledge_document">
          <xsl:value-of select="'AC'" />
        </xsl:attribute>
      </ns0:Header>
     
      <xsl:variable name="var:noLineItemNumCnt" select="count(TABLEINDEX/ROW[normalize-space(string(TABLEFIELD[@Name='LineItemNumber']/text()))=''])" />
      <xsl:for-each select="TABLEINDEX/ROW">
        <ns0:Detail>         

          <xsl:attribute name="line_indicator">
            <xsl:value-of select="'N'" />
          </xsl:attribute>
          <xsl:attribute name="line_number">
            <xsl:choose>
              <xsl:when test="number($var:noLineItemNumCnt) > 0">
                <xsl:value-of select="position()" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="TABLEFIELD[@Name='LineItemNumber']/text()" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="product_code">
            <xsl:value-of select="TABLEFIELD[@Name='MaterialID']/text()" />
          </xsl:attribute>
          <xsl:attribute name="quantity">
            <xsl:choose>
              <xsl:when test="translate(string(TABLEFIELD[@Name='UnitOfMeasure']/text()), $lowercase, $uppercase)='EA'">
                <xsl:value-of select="number(TABLEFIELD[@Name='OrderQty']/text()) div 1000" />
              </xsl:when>
              <xsl:when test="translate(string(TABLEFIELD[@Name='UnitOfMeasure']/text()), $lowercase, $uppercase)='TH'">
                <xsl:value-of select="number(TABLEFIELD[@Name='OrderQty']/text())" />
              </xsl:when>
              <xsl:when test="translate(string(TABLEFIELD[@Name='UnitOfMeasure']/text()), $lowercase, $uppercase)=''">
                <xsl:value-of select="number(TABLEFIELD[@Name='OrderQty']/text()) div 1000" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="number(TABLEFIELD[@Name='OrderQty']/text()) div 1000" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="unit_of_measure">
            <xsl:value-of select="'TH'" />
          </xsl:attribute>
          <xsl:attribute name="price_excluding_tax">
            <xsl:variable name="var:v23" select="ScriptNS1:CustomerUOM(string($var:vCustomerEAN))" />
            <xsl:value-of select="format-number(userCSharp:unit_Price_Factor(string($var:v23),  string(TABLEFIELD[@Name='UnitPrice']/text())), '0.000')" />
          </xsl:attribute>
          <xsl:attribute name="delivery_date">
            <xsl:value-of select="ScriptNS0:FormateDateNew(TABLEFIELD[@Name='DeliveryDate']/text(), &quot;yyyyMMdd&quot;, &quot;yyyyMMdd&quot;)" />
          </xsl:attribute>
          <xsl:attribute name="delivery_time">
            <xsl:value-of select="'0000'" />
          </xsl:attribute>
          <xsl:attribute name="warehouse_code">
            <xsl:value-of select="../../DOCUMENTINDEX[@Name='DeliveryAddress']/text()" />
          </xsl:attribute>
          <xsl:attribute name="comment">
            <xsl:value-of select="normalize-space(TABLEFIELD[@Name='Comment']/text())" />
          </xsl:attribute>
        </ns0:Detail>
      </xsl:for-each>
    
      <ns0:Summary>
        <xsl:variable name="var:v28"
				              select="userCSharp:InitCumulativeSum(0)"/>
				<xsl:for-each select="TABLEINDEX/ROW/TABLEFIELD[@Name='OrderQty']">					
					<xsl:variable name="var:v30"
					              select="userCSharp:AddToCumulativeSum(0, text())"/>
				</xsl:for-each>
				<xsl:variable name="var:v31"
				              select="userCSharp:GetCumulativeSum(0)"/>
				<xsl:variable name="var:vTotalQty"
				              select="string($var:v31)"/>
			
        <xsl:attribute name="total_order_quantity">
          <xsl:choose>
            <xsl:when test="translate(string(TABLEINDEX/ROW/TABLEFIELD[@Name='UnitOfMeasure']/text()[1]), $lowercase, $uppercase)='EA'">
              <xsl:value-of select="$var:vTotalQty" />
            </xsl:when>
            <xsl:when test="translate(string(TABLEINDEX/ROW/TABLEFIELD[@Name='UnitOfMeasure']/text()[1]), $lowercase, $uppercase)='TH'">
              <xsl:value-of select="$var:vTotalQty * 1000" />
            </xsl:when>
            <xsl:when test="translate(string(TABLEINDEX/ROW/TABLEFIELD[@Name='UnitOfMeasure']/text()[1]), $lowercase, $uppercase)=''">
              <xsl:value-of select="$var:vTotalQty" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$var:vTotalQty" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </ns0:Summary>
    </ns0:ORDER>
    
  </xsl:template>

  <xsl:template name="stringbuilder">
    <xsl:param name="data"/>
    <xsl:param name="join" select="''"/>
    <xsl:for-each select="$data/*">
      <xsl:choose>
        <xsl:when test="not(position()=1)">
          <xsl:value-of select="concat($join,child::text())"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="child::text()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
   public string MathRound(string val)
    {
	    return MathRound(val, "0");
    }

    public string MathRound(string val, string decimals)
    {
	    string retval = "";
	    double v = 0;
	    double db = 0;
	    if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	    {
		    try
		    {
			    int d = (int) db;
			    double ret = Math.Round(v, d);
			    retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		    }
		    catch (Exception)
		    {
		    }
	    }
	    return retval;
    }

		//START SCRIPT: Generate GUID
		public string GetGUID()
		{
			 return "PDF" + System.Guid.NewGuid().ToString();
		}
		//END SCRIPT

		public string DateCurrentTime()
		{
			DateTime dt = DateTime.Now;
			return dt.ToString("T", System.Globalization.CultureInfo.InvariantCulture);
		}

    public decimal getQty(string qty){
      return System.Convert.ToDecimal(qty);
    }
		public float unit_Price_Factor(double upf, double price)
		{	
		 
		float newPrice;

		newPrice = Convert.ToSingle(upf*price);

		return newPrice;

		}
    public string InitCumulativeSum(int index)
    {
	    if (index >= 0)
	    {
		    if (index >= myCumulativeSumArray.Count)
		    {
			    int i = myCumulativeSumArray.Count;
			    for (; i<=index; i++)
			    {
				    myCumulativeSumArray.Add("");
			    }
		    }
		    else
		    {
			    myCumulativeSumArray[index] = "";
		    }
	    }
	    return "";
    }


    public System.Collections.ArrayList myCumulativeSumArray = new System.Collections.ArrayList();

    public string AddToCumulativeSum(int index, string val)
    {
	    if (index < 0 || index >= myCumulativeSumArray.Count)
	    {
		    return "";
        }
	    double d = 0;
	    if (IsNumeric(val, ref d))
	    {
		    if (myCumulativeSumArray[index] == "")
		    {
			    myCumulativeSumArray[index] = d;
		    }
		    else
		    {
			    myCumulativeSumArray[index] = (double)(myCumulativeSumArray[index]) + d;
		    }
	    }
	    return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
    }

    public string GetCumulativeSum(int index)
    {
	    if (index < 0 || index >= myCumulativeSumArray.Count)
	    {
		    return "";
	    }
	    return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
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