<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp ScriptNS0 ScriptNS1" version="1.0" xmlns:ns0="http://Visy.Middleware.SAP.Common.Schemas.FileStructures.BaseForeCast" xmlns:s0="http://Visy.Middleware.SAP.LionNathan.Delfor.Schemas.Forecast" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:ScriptNS1="http://schemas.microsoft.com/BizTalk/2003/ScriptNS1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Forecast" />
  </xsl:template>
  <xsl:template match="/s0:Forecast">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;Lion Nathan&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;205&quot;)" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;3&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;52&quot;)" />
    <xsl:variable name="var:v5" select="Details/Schedules/@Date" />
    <xsl:variable name="var:v7" select="Details/Schedules[2]/@Date" />
    <xsl:variable name="var:v8" select="userCSharp:StringSize(string($var:v7))" />
    <xsl:variable name="var:v9" select="userCSharp:LogicalGt(string($var:v8) , &quot;0&quot;)" />
    <xsl:variable name="var:v11" select="userCSharp:LogicalNot(string($var:v9))" />
    <xsl:variable name="var:v13" select="Details/Schedules[3]/@Date" />
    <xsl:variable name="var:v14" select="userCSharp:StringSize(string($var:v13))" />
    <xsl:variable name="var:v15" select="userCSharp:LogicalGt(string($var:v14) , &quot;0&quot;)" />
    <xsl:variable name="var:v17" select="userCSharp:LogicalNot(string($var:v15))" />
    <xsl:variable name="var:v19" select="Details/Schedules[4]/@Date" />
    <xsl:variable name="var:v20" select="userCSharp:StringSize(string($var:v19))" />
    <xsl:variable name="var:v21" select="userCSharp:LogicalGt(string($var:v20) , &quot;0&quot;)" />
    <xsl:variable name="var:v23" select="userCSharp:LogicalNot(string($var:v21))" />
    <xsl:variable name="var:v25" select="Details/Schedules[5]/@Date" />
    <xsl:variable name="var:v26" select="userCSharp:StringSize(string($var:v25))" />
    <xsl:variable name="var:v27" select="userCSharp:LogicalGt(string($var:v26) , &quot;0&quot;)" />
    <xsl:variable name="var:v28" select="userCSharp:LogicalNot(string($var:v27))" />
    <xsl:variable name="var:v31" select="Details/Schedules[6]/@Date" />
    <xsl:variable name="var:v32" select="userCSharp:StringSize(string($var:v31))" />
    <xsl:variable name="var:v33" select="userCSharp:LogicalGt(string($var:v32) , &quot;0&quot;)" />
    <xsl:variable name="var:v35" select="userCSharp:LogicalNot(string($var:v33))" />
    <xsl:variable name="var:v37" select="Details/Schedules[7]/@Date" />
    <xsl:variable name="var:v38" select="userCSharp:StringSize(string($var:v37))" />
    <xsl:variable name="var:v39" select="userCSharp:LogicalGt(string($var:v38) , &quot;0&quot;)" />
    <xsl:variable name="var:v41" select="userCSharp:LogicalNot(string($var:v39))" />
    <xsl:variable name="var:v43" select="Details/Schedules[8]/@Date" />
    <xsl:variable name="var:v44" select="userCSharp:StringSize(string($var:v43))" />
    <xsl:variable name="var:v45" select="userCSharp:LogicalGt(string($var:v44) , &quot;0&quot;)" />
    <xsl:variable name="var:v47" select="userCSharp:LogicalNot(string($var:v45))" />
    <xsl:variable name="var:v49" select="Details/Schedules[9]/@Date" />
    <xsl:variable name="var:v50" select="userCSharp:StringSize(string($var:v49))" />
    <xsl:variable name="var:v51" select="userCSharp:LogicalGt(string($var:v50) , &quot;0&quot;)" />
    <xsl:variable name="var:v53" select="userCSharp:LogicalNot(string($var:v51))" />
    <xsl:variable name="var:v55" select="Details/Schedules[10]/@Date" />
    <xsl:variable name="var:v56" select="userCSharp:StringSize(string($var:v55))" />
    <xsl:variable name="var:v57" select="userCSharp:LogicalGt(string($var:v56) , &quot;0&quot;)" />
    <xsl:variable name="var:v59" select="userCSharp:LogicalNot(string($var:v57))" />
    <xsl:variable name="var:v61" select="Details/Schedules[11]/@Date" />
    <xsl:variable name="var:v62" select="userCSharp:StringSize(string($var:v61))" />
    <xsl:variable name="var:v63" select="userCSharp:LogicalGt(string($var:v62) , &quot;0&quot;)" />
    <xsl:variable name="var:v65" select="userCSharp:LogicalNot(string($var:v63))" />
    <xsl:variable name="var:v67" select="Details/Schedules[12]/@Date" />
    <xsl:variable name="var:v68" select="userCSharp:StringSize(string($var:v67))" />
    <xsl:variable name="var:v69" select="userCSharp:LogicalGt(string($var:v68) , &quot;0&quot;)" />
    <xsl:variable name="var:v71" select="userCSharp:LogicalNot(string($var:v69))" />
    <xsl:variable name="var:v73" select="Details/Schedules[13]/@Date" />
    <xsl:variable name="var:v74" select="userCSharp:StringSize(string($var:v73))" />
    <xsl:variable name="var:v75" select="userCSharp:LogicalGt(string($var:v74) , &quot;0&quot;)" />
    <xsl:variable name="var:v77" select="userCSharp:LogicalNot(string($var:v75))" />
    <xsl:variable name="var:v79" select="Details/Schedules[14]/@Date" />
    <xsl:variable name="var:v80" select="userCSharp:StringSize(string($var:v79))" />
    <xsl:variable name="var:v81" select="userCSharp:LogicalGt(string($var:v80) , &quot;0&quot;)" />
    <xsl:variable name="var:v83" select="userCSharp:LogicalNot(string($var:v81))" />
    <xsl:variable name="var:v85" select="Details/Schedules[15]/@Date" />
    <xsl:variable name="var:v86" select="userCSharp:StringSize(string($var:v85))" />
    <xsl:variable name="var:v87" select="userCSharp:LogicalGt(string($var:v86) , &quot;0&quot;)" />
    <xsl:variable name="var:v89" select="userCSharp:LogicalNot(string($var:v87))" />
    <xsl:variable name="var:v91" select="Details/Schedules[16]/@Date" />
    <xsl:variable name="var:v92" select="userCSharp:StringSize(string($var:v91))" />
    <xsl:variable name="var:v93" select="userCSharp:LogicalGt(string($var:v92) , &quot;0&quot;)" />
    <xsl:variable name="var:v95" select="userCSharp:LogicalNot(string($var:v93))" />
    <xsl:variable name="var:v97" select="Details/Schedules[17]/@Date" />
    <xsl:variable name="var:v98" select="userCSharp:StringSize(string($var:v97))" />
    <xsl:variable name="var:v99" select="userCSharp:LogicalGt(string($var:v98) , &quot;0&quot;)" />
    <xsl:variable name="var:v101" select="userCSharp:LogicalNot(string($var:v99))" />
    <xsl:variable name="var:v103" select="Details/Schedules[18]/@Date" />
    <xsl:variable name="var:v104" select="userCSharp:StringSize(string($var:v103))" />
    <xsl:variable name="var:v105" select="userCSharp:LogicalGt(string($var:v104) , &quot;0&quot;)" />
    <xsl:variable name="var:v107" select="userCSharp:LogicalNot(string($var:v105))" />
    <xsl:variable name="var:v109" select="Details/Schedules[19]/@Date" />
    <xsl:variable name="var:v110" select="userCSharp:StringSize(string($var:v109))" />
    <xsl:variable name="var:v111" select="userCSharp:LogicalGt(string($var:v110) , &quot;0&quot;)" />
    <xsl:variable name="var:v113" select="userCSharp:LogicalNot(string($var:v111))" />
    <xsl:variable name="var:v115" select="Details/Schedules[20]/@Date" />
    <xsl:variable name="var:v116" select="userCSharp:StringSize(string($var:v115))" />
    <xsl:variable name="var:v117" select="userCSharp:LogicalGt(string($var:v116) , &quot;0&quot;)" />
    <xsl:variable name="var:v119" select="userCSharp:LogicalNot(string($var:v117))" />
    <xsl:variable name="var:v121" select="Details/Schedules[21]/@Date" />
    <xsl:variable name="var:v122" select="userCSharp:StringSize(string($var:v121))" />
    <xsl:variable name="var:v123" select="userCSharp:LogicalGt(string($var:v122) , &quot;0&quot;)" />
    <xsl:variable name="var:v125" select="userCSharp:LogicalNot(string($var:v123))" />
    <xsl:variable name="var:v127" select="Details/Schedules[22]/@Date" />
    <xsl:variable name="var:v128" select="userCSharp:StringSize(string($var:v127))" />
    <xsl:variable name="var:v129" select="userCSharp:LogicalGt(string($var:v128) , &quot;0&quot;)" />
    <xsl:variable name="var:v131" select="userCSharp:LogicalNot(string($var:v129))" />
    <xsl:variable name="var:v133" select="Details/Schedules[23]/@Date" />
    <xsl:variable name="var:v134" select="userCSharp:StringSize(string($var:v133))" />
    <xsl:variable name="var:v135" select="userCSharp:LogicalGt(string($var:v134) , &quot;0&quot;)" />
    <xsl:variable name="var:v137" select="userCSharp:LogicalNot(string($var:v135))" />
    <xsl:variable name="var:v139" select="Details/Schedules[24]/@Date" />
    <xsl:variable name="var:v140" select="userCSharp:StringSize(string($var:v139))" />
    <xsl:variable name="var:v141" select="userCSharp:LogicalGt(string($var:v140) , &quot;0&quot;)" />
    <xsl:variable name="var:v143" select="userCSharp:LogicalNot(string($var:v141))" />
    <xsl:variable name="var:v145" select="Details/Schedules[25]/@Date" />
    <xsl:variable name="var:v146" select="userCSharp:StringSize(string($var:v145))" />
    <xsl:variable name="var:v147" select="userCSharp:LogicalGt(string($var:v146) , &quot;0&quot;)" />
    <xsl:variable name="var:v149" select="userCSharp:LogicalNot(string($var:v147))" />
    <xsl:variable name="var:v151" select="Details/Schedules[26]/@Date" />
    <xsl:variable name="var:v152" select="userCSharp:StringSize(string($var:v151))" />
    <xsl:variable name="var:v153" select="userCSharp:LogicalGt(string($var:v152) , &quot;0&quot;)" />
    <xsl:variable name="var:v155" select="userCSharp:LogicalNot(string($var:v153))" />
    <xsl:variable name="var:v157" select="Details/Schedules[27]/@Date" />
    <xsl:variable name="var:v158" select="userCSharp:StringSize(string($var:v157))" />
    <xsl:variable name="var:v159" select="userCSharp:LogicalGt(string($var:v158) , &quot;0&quot;)" />
    <xsl:variable name="var:v161" select="userCSharp:LogicalNot(string($var:v159))" />
    <xsl:variable name="var:v163" select="Details/Schedules[28]/@Date" />
    <xsl:variable name="var:v164" select="userCSharp:StringSize(string($var:v163))" />
    <xsl:variable name="var:v165" select="userCSharp:LogicalGt(string($var:v164) , &quot;0&quot;)" />
    <xsl:variable name="var:v167" select="userCSharp:LogicalNot(string($var:v165))" />
    <xsl:variable name="var:v169" select="Details/Schedules[29]/@Date" />
    <xsl:variable name="var:v170" select="userCSharp:StringSize(string($var:v169))" />
    <xsl:variable name="var:v171" select="userCSharp:LogicalGt(string($var:v170) , &quot;0&quot;)" />
    <xsl:variable name="var:v173" select="userCSharp:LogicalNot(string($var:v171))" />
    <xsl:variable name="var:v175" select="Details/Schedules[30]/@Date" />
    <xsl:variable name="var:v176" select="userCSharp:StringSize(string($var:v175))" />
    <xsl:variable name="var:v177" select="userCSharp:LogicalGt(string($var:v176) , &quot;0&quot;)" />
    <xsl:variable name="var:v179" select="userCSharp:LogicalNot(string($var:v177))" />
    <xsl:variable name="var:v181" select="Details/Schedules[31]/@Date" />
    <xsl:variable name="var:v182" select="userCSharp:StringSize(string($var:v181))" />
    <xsl:variable name="var:v183" select="userCSharp:LogicalGt(string($var:v182) , &quot;0&quot;)" />
    <xsl:variable name="var:v185" select="userCSharp:LogicalNot(string($var:v183))" />
    <xsl:variable name="var:v187" select="Details/Schedules[32]/@Date" />
    <xsl:variable name="var:v188" select="userCSharp:StringSize(string($var:v187))" />
    <xsl:variable name="var:v189" select="userCSharp:LogicalGt(string($var:v188) , &quot;0&quot;)" />
    <xsl:variable name="var:v191" select="userCSharp:LogicalNot(string($var:v189))" />
    <xsl:variable name="var:v193" select="Details/Schedules[33]/@Date" />
    <xsl:variable name="var:v194" select="userCSharp:StringSize(string($var:v193))" />
    <xsl:variable name="var:v195" select="userCSharp:LogicalGt(string($var:v194) , &quot;0&quot;)" />
    <xsl:variable name="var:v197" select="userCSharp:LogicalNot(string($var:v195))" />
    <xsl:variable name="var:v199" select="Details/Schedules[34]/@Date" />
    <xsl:variable name="var:v200" select="userCSharp:StringSize(string($var:v199))" />
    <xsl:variable name="var:v201" select="userCSharp:LogicalGt(string($var:v200) , &quot;0&quot;)" />
    <xsl:variable name="var:v203" select="userCSharp:LogicalNot(string($var:v201))" />
    <xsl:variable name="var:v205" select="Details/Schedules[35]/@Date" />
    <xsl:variable name="var:v206" select="userCSharp:StringSize(string($var:v205))" />
    <xsl:variable name="var:v207" select="userCSharp:LogicalGt(string($var:v206) , &quot;0&quot;)" />
    <xsl:variable name="var:v209" select="userCSharp:LogicalNot(string($var:v207))" />
    <xsl:variable name="var:v211" select="Details/Schedules[36]/@Date" />
    <xsl:variable name="var:v212" select="userCSharp:StringSize(string($var:v211))" />
    <xsl:variable name="var:v213" select="userCSharp:LogicalGt(string($var:v212) , &quot;0&quot;)" />
    <xsl:variable name="var:v215" select="userCSharp:LogicalNot(string($var:v213))" />
    <xsl:variable name="var:v217" select="Details/Schedules[37]/@Date" />
    <xsl:variable name="var:v218" select="userCSharp:StringSize(string($var:v217))" />
    <xsl:variable name="var:v219" select="userCSharp:LogicalGt(string($var:v218) , &quot;0&quot;)" />
    <xsl:variable name="var:v221" select="userCSharp:LogicalNot(string($var:v219))" />
    <xsl:variable name="var:v223" select="Details/Schedules[38]/@Date" />
    <xsl:variable name="var:v224" select="userCSharp:StringSize(string($var:v223))" />
    <xsl:variable name="var:v225" select="userCSharp:LogicalGt(string($var:v224) , &quot;0&quot;)" />
    <xsl:variable name="var:v227" select="userCSharp:LogicalNot(string($var:v225))" />
    <xsl:variable name="var:v229" select="Details/Schedules[39]/@Date" />
    <xsl:variable name="var:v230" select="userCSharp:StringSize(string($var:v229))" />
    <xsl:variable name="var:v231" select="userCSharp:LogicalGt(string($var:v230) , &quot;0&quot;)" />
    <xsl:variable name="var:v233" select="userCSharp:LogicalNot(string($var:v231))" />
    <xsl:variable name="var:v235" select="Details/Schedules[40]/@Date" />
    <xsl:variable name="var:v236" select="userCSharp:StringSize(string($var:v235))" />
    <xsl:variable name="var:v237" select="userCSharp:LogicalGt(string($var:v236) , &quot;0&quot;)" />
    <xsl:variable name="var:v239" select="userCSharp:LogicalNot(string($var:v237))" />
    <xsl:variable name="var:v241" select="Details/Schedules[41]/@Date" />
    <xsl:variable name="var:v242" select="userCSharp:StringSize(string($var:v241))" />
    <xsl:variable name="var:v243" select="userCSharp:LogicalGt(string($var:v242) , &quot;0&quot;)" />
    <xsl:variable name="var:v245" select="userCSharp:LogicalNot(string($var:v243))" />
    <xsl:variable name="var:v247" select="Details/Schedules[42]/@Date" />
    <xsl:variable name="var:v248" select="userCSharp:StringSize(string($var:v247))" />
    <xsl:variable name="var:v249" select="userCSharp:LogicalGt(string($var:v248) , &quot;0&quot;)" />
    <xsl:variable name="var:v251" select="userCSharp:LogicalNot(string($var:v249))" />
    <xsl:variable name="var:v253" select="Details/Schedules[43]/@Date" />
    <xsl:variable name="var:v254" select="userCSharp:StringSize(string($var:v253))" />
    <xsl:variable name="var:v255" select="userCSharp:LogicalGt(string($var:v254) , &quot;0&quot;)" />
    <xsl:variable name="var:v257" select="userCSharp:LogicalNot(string($var:v255))" />
    <xsl:variable name="var:v259" select="Details/Schedules[44]/@Date" />
    <xsl:variable name="var:v260" select="userCSharp:StringSize(string($var:v259))" />
    <xsl:variable name="var:v261" select="userCSharp:LogicalGt(string($var:v260) , &quot;0&quot;)" />
    <xsl:variable name="var:v263" select="userCSharp:LogicalNot(string($var:v261))" />
    <xsl:variable name="var:v265" select="Details/Schedules[45]/@Date" />
    <xsl:variable name="var:v266" select="userCSharp:StringSize(string($var:v265))" />
    <xsl:variable name="var:v267" select="userCSharp:LogicalGt(string($var:v266) , &quot;0&quot;)" />
    <xsl:variable name="var:v269" select="userCSharp:LogicalNot(string($var:v267))" />
    <xsl:variable name="var:v271" select="Details/Schedules[46]/@Date" />
    <xsl:variable name="var:v272" select="userCSharp:StringSize(string($var:v271))" />
    <xsl:variable name="var:v273" select="userCSharp:LogicalGt(string($var:v272) , &quot;0&quot;)" />
    <xsl:variable name="var:v275" select="userCSharp:LogicalNot(string($var:v273))" />
    <xsl:variable name="var:v277" select="Details/Schedules[47]/@Date" />
    <xsl:variable name="var:v278" select="userCSharp:StringSize(string($var:v277))" />
    <xsl:variable name="var:v279" select="userCSharp:LogicalGt(string($var:v278) , &quot;0&quot;)" />
    <xsl:variable name="var:v281" select="userCSharp:LogicalNot(string($var:v279))" />
    <xsl:variable name="var:v283" select="Details/Schedules[48]/@Date" />
    <xsl:variable name="var:v284" select="userCSharp:StringSize(string($var:v283))" />
    <xsl:variable name="var:v285" select="userCSharp:LogicalGt(string($var:v284) , &quot;0&quot;)" />
    <xsl:variable name="var:v287" select="userCSharp:LogicalNot(string($var:v285))" />
    <xsl:variable name="var:v289" select="Details/Schedules[49]/@Date" />
    <xsl:variable name="var:v290" select="userCSharp:StringSize(string($var:v289))" />
    <xsl:variable name="var:v291" select="userCSharp:LogicalGt(string($var:v290) , &quot;0&quot;)" />
    <xsl:variable name="var:v293" select="userCSharp:LogicalNot(string($var:v291))" />
    <xsl:variable name="var:v295" select="Details/Schedules[50]/@Date" />
    <xsl:variable name="var:v296" select="userCSharp:StringSize(string($var:v295))" />
    <xsl:variable name="var:v297" select="userCSharp:LogicalGt(string($var:v296) , &quot;0&quot;)" />
    <xsl:variable name="var:v299" select="userCSharp:LogicalNot(string($var:v297))" />
    <xsl:variable name="var:v301" select="Details/Schedules[51]/@Date" />
    <xsl:variable name="var:v302" select="userCSharp:StringSize(string($var:v301))" />
    <xsl:variable name="var:v303" select="userCSharp:LogicalGt(string($var:v302) , &quot;0&quot;)" />
    <xsl:variable name="var:v305" select="userCSharp:LogicalNot(string($var:v303))" />
    <xsl:variable name="var:v307" select="Details/Schedules[52]/@Date" />
    <xsl:variable name="var:v308" select="userCSharp:StringSize(string($var:v307))" />
    <xsl:variable name="var:v309" select="userCSharp:LogicalGt(string($var:v308) , &quot;0&quot;)" />
    <xsl:variable name="var:v311" select="userCSharp:LogicalNot(string($var:v309))" />
    <ns0:Forecast>
      <CustomerName>
        <xsl:value-of select="$var:v1" />
      </CustomerName>
      <xsl:if test="Header/@VisyBuyerCode">
        <CustomerSAPCode>
          <xsl:value-of select="Header/@VisyBuyerCode" />
        </CustomerSAPCode>
      </xsl:if>
      <xsl:if test="Header/@VisySupplierCode">
        <PlantCode>
          <xsl:value-of select="Header/@VisySupplierCode" />
        </PlantCode>
      </xsl:if>
      <xsl:if test="Details/@VisyShipTo">
        <ShipToCode>
          <xsl:value-of select="Details/@VisyShipTo" />
        </ShipToCode>
      </xsl:if>
      <ForecastVersion>
        <xsl:value-of select="$var:v2" />
      </ForecastVersion>
      <PlanningPeriod>
        <xsl:value-of select="$var:v3" />
      </PlanningPeriod>
      <TotalPeriod>
        <xsl:value-of select="$var:v4" />
      </TotalPeriod>
      <ForecastDateRecord>
        <xsl:variable name="var:v6" select="ScriptNS0:FormateDateNew(string($var:v5), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
        <FCDate1>
          <xsl:value-of select="$var:v6" />
        </FCDate1>
        <xsl:if test="string($var:v9)='true'">
          <xsl:variable name="var:v10" select="ScriptNS0:FormateDateNew(string($var:v7), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate2>
            <xsl:value-of select="$var:v10" />
          </FCDate2>
        </xsl:if>
        <xsl:if test="string($var:v11)='true'">
          <xsl:variable name="var:v12" select="&quot;&quot;" />
          <FCDate2>
            <xsl:value-of select="$var:v12" />
          </FCDate2>
        </xsl:if>
        <xsl:if test="string($var:v15)='true'">
          <xsl:variable name="var:v16" select="ScriptNS0:FormateDateNew(string($var:v13), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate3>
            <xsl:value-of select="$var:v16" />
          </FCDate3>
        </xsl:if>
        <xsl:if test="string($var:v17)='true'">
          <xsl:variable name="var:v18" select="&quot;&quot;" />
          <FCDate3>
            <xsl:value-of select="$var:v18" />
          </FCDate3>
        </xsl:if>
        <xsl:if test="string($var:v21)='true'">
          <xsl:variable name="var:v22" select="ScriptNS0:FormateDateNew(string($var:v19), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate4>
            <xsl:value-of select="$var:v22" />
          </FCDate4>
        </xsl:if>
        <xsl:if test="string($var:v23)='true'">
          <xsl:variable name="var:v24" select="&quot;&quot;" />
          <FCDate4>
            <xsl:value-of select="$var:v24" />
          </FCDate4>
        </xsl:if>
        <xsl:if test="string($var:v28)='true'">
          <xsl:variable name="var:v29" select="&quot;&quot;" />
          <FCDate5>
            <xsl:value-of select="$var:v29" />
          </FCDate5>
        </xsl:if>
        <xsl:if test="string($var:v27)='true'">
          <xsl:variable name="var:v30" select="ScriptNS0:FormateDateNew(string($var:v25), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate5>
            <xsl:value-of select="$var:v30" />
          </FCDate5>
        </xsl:if>
        <xsl:if test="string($var:v33)='true'">
          <xsl:variable name="var:v34" select="ScriptNS0:FormateDateNew(string($var:v31), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate6>
            <xsl:value-of select="$var:v34" />
          </FCDate6>
        </xsl:if>
        <xsl:if test="string($var:v35)='true'">
          <xsl:variable name="var:v36" select="&quot;&quot;" />
          <FCDate6>
            <xsl:value-of select="$var:v36" />
          </FCDate6>
        </xsl:if>
        <xsl:if test="string($var:v39)='true'">
          <xsl:variable name="var:v40" select="ScriptNS0:FormateDateNew(string($var:v37), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate7>
            <xsl:value-of select="$var:v40" />
          </FCDate7>
        </xsl:if>
        <xsl:if test="string($var:v41)='true'">
          <xsl:variable name="var:v42" select="&quot;&quot;" />
          <FCDate7>
            <xsl:value-of select="$var:v42" />
          </FCDate7>
        </xsl:if>
        <xsl:if test="string($var:v45)='true'">
          <xsl:variable name="var:v46" select="ScriptNS0:FormateDateNew(string($var:v43), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate8>
            <xsl:value-of select="$var:v46" />
          </FCDate8>
        </xsl:if>
        <xsl:if test="string($var:v47)='true'">
          <xsl:variable name="var:v48" select="&quot;&quot;" />
          <FCDate8>
            <xsl:value-of select="$var:v48" />
          </FCDate8>
        </xsl:if>
        <xsl:if test="string($var:v51)='true'">
          <xsl:variable name="var:v52" select="ScriptNS0:FormateDateNew(string($var:v49), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate9>
            <xsl:value-of select="$var:v52" />
          </FCDate9>
        </xsl:if>
        <xsl:if test="string($var:v53)='true'">
          <xsl:variable name="var:v54" select="&quot;&quot;" />
          <FCDate9>
            <xsl:value-of select="$var:v54" />
          </FCDate9>
        </xsl:if>
        <xsl:if test="string($var:v57)='true'">
          <xsl:variable name="var:v58" select="ScriptNS0:FormateDateNew(string($var:v55), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate10>
            <xsl:value-of select="$var:v58" />
          </FCDate10>
        </xsl:if>
        <xsl:if test="string($var:v59)='true'">
          <xsl:variable name="var:v60" select="&quot;&quot;" />
          <FCDate10>
            <xsl:value-of select="$var:v60" />
          </FCDate10>
        </xsl:if>
        <xsl:if test="string($var:v63)='true'">
          <xsl:variable name="var:v64" select="ScriptNS0:FormateDateNew(string($var:v61), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate11>
            <xsl:value-of select="$var:v64" />
          </FCDate11>
        </xsl:if>
        <xsl:if test="string($var:v65)='true'">
          <xsl:variable name="var:v66" select="&quot;&quot;" />
          <FCDate11>
            <xsl:value-of select="$var:v66" />
          </FCDate11>
        </xsl:if>
        <xsl:if test="string($var:v69)='true'">
          <xsl:variable name="var:v70" select="ScriptNS0:FormateDateNew(string($var:v67), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate12>
            <xsl:value-of select="$var:v70" />
          </FCDate12>
        </xsl:if>
        <xsl:if test="string($var:v71)='true'">
          <xsl:variable name="var:v72" select="&quot;&quot;" />
          <FCDate12>
            <xsl:value-of select="$var:v72" />
          </FCDate12>
        </xsl:if>
        <xsl:if test="string($var:v75)='true'">
          <xsl:variable name="var:v76" select="ScriptNS0:FormateDateNew(string($var:v73), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate13>
            <xsl:value-of select="$var:v76" />
          </FCDate13>
        </xsl:if>
        <xsl:if test="string($var:v77)='true'">
          <xsl:variable name="var:v78" select="&quot;&quot;" />
          <FCDate13>
            <xsl:value-of select="$var:v78" />
          </FCDate13>
        </xsl:if>
        <xsl:if test="string($var:v81)='true'">
          <xsl:variable name="var:v82" select="ScriptNS0:FormateDateNew(string($var:v79), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate14>
            <xsl:value-of select="$var:v82" />
          </FCDate14>
        </xsl:if>
        <xsl:if test="string($var:v83)='true'">
          <xsl:variable name="var:v84" select="&quot;&quot;" />
          <FCDate14>
            <xsl:value-of select="$var:v84" />
          </FCDate14>
        </xsl:if>
        <xsl:if test="string($var:v87)='true'">
          <xsl:variable name="var:v88" select="ScriptNS0:FormateDateNew(string($var:v85), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate15>
            <xsl:value-of select="$var:v88" />
          </FCDate15>
        </xsl:if>
        <xsl:if test="string($var:v89)='true'">
          <xsl:variable name="var:v90" select="&quot;&quot;" />
          <FCDate15>
            <xsl:value-of select="$var:v90" />
          </FCDate15>
        </xsl:if>
        <xsl:if test="string($var:v93)='true'">
          <xsl:variable name="var:v94" select="ScriptNS0:FormateDateNew(string($var:v91), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate16>
            <xsl:value-of select="$var:v94" />
          </FCDate16>
        </xsl:if>
        <xsl:if test="string($var:v95)='true'">
          <xsl:variable name="var:v96" select="&quot;&quot;" />
          <FCDate16>
            <xsl:value-of select="$var:v96" />
          </FCDate16>
        </xsl:if>
        <xsl:if test="string($var:v99)='true'">
          <xsl:variable name="var:v100" select="ScriptNS0:FormateDateNew(string($var:v97), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate17>
            <xsl:value-of select="$var:v100" />
          </FCDate17>
        </xsl:if>
        <xsl:if test="string($var:v101)='true'">
          <xsl:variable name="var:v102" select="&quot;&quot;" />
          <FCDate17>
            <xsl:value-of select="$var:v102" />
          </FCDate17>
        </xsl:if>
        <xsl:if test="string($var:v105)='true'">
          <xsl:variable name="var:v106" select="ScriptNS0:FormateDateNew(string($var:v103), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate18>
            <xsl:value-of select="$var:v106" />
          </FCDate18>
        </xsl:if>
        <xsl:if test="string($var:v107)='true'">
          <xsl:variable name="var:v108" select="&quot;&quot;" />
          <FCDate18>
            <xsl:value-of select="$var:v108" />
          </FCDate18>
        </xsl:if>
        <xsl:if test="string($var:v111)='true'">
          <xsl:variable name="var:v112" select="ScriptNS0:FormateDateNew(string($var:v109), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate19>
            <xsl:value-of select="$var:v112" />
          </FCDate19>
        </xsl:if>
        <xsl:if test="string($var:v113)='true'">
          <xsl:variable name="var:v114" select="&quot;&quot;" />
          <FCDate19>
            <xsl:value-of select="$var:v114" />
          </FCDate19>
        </xsl:if>
        <xsl:if test="string($var:v117)='true'">
          <xsl:variable name="var:v118" select="ScriptNS0:FormateDateNew(string($var:v115), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate20>
            <xsl:value-of select="$var:v118" />
          </FCDate20>
        </xsl:if>
        <xsl:if test="string($var:v119)='true'">
          <xsl:variable name="var:v120" select="&quot;&quot;" />
          <FCDate20>
            <xsl:value-of select="$var:v120" />
          </FCDate20>
        </xsl:if>
        <xsl:if test="string($var:v123)='true'">
          <xsl:variable name="var:v124" select="ScriptNS0:FormateDateNew(string($var:v121), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate21>
            <xsl:value-of select="$var:v124" />
          </FCDate21>
        </xsl:if>
        <xsl:if test="string($var:v125)='true'">
          <xsl:variable name="var:v126" select="&quot;&quot;" />
          <FCDate21>
            <xsl:value-of select="$var:v126" />
          </FCDate21>
        </xsl:if>
        <xsl:if test="string($var:v129)='true'">
          <xsl:variable name="var:v130" select="ScriptNS0:FormateDateNew(string($var:v127), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate22>
            <xsl:value-of select="$var:v130" />
          </FCDate22>
        </xsl:if>
        <xsl:if test="string($var:v131)='true'">
          <xsl:variable name="var:v132" select="&quot;&quot;" />
          <FCDate22>
            <xsl:value-of select="$var:v132" />
          </FCDate22>
        </xsl:if>
        <xsl:if test="string($var:v135)='true'">
          <xsl:variable name="var:v136" select="ScriptNS0:FormateDateNew(string($var:v133), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate23>
            <xsl:value-of select="$var:v136" />
          </FCDate23>
        </xsl:if>
        <xsl:if test="string($var:v137)='true'">
          <xsl:variable name="var:v138" select="&quot;&quot;" />
          <FCDate23>
            <xsl:value-of select="$var:v138" />
          </FCDate23>
        </xsl:if>
        <xsl:if test="string($var:v141)='true'">
          <xsl:variable name="var:v142" select="ScriptNS0:FormateDateNew(string($var:v139), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate24>
            <xsl:value-of select="$var:v142" />
          </FCDate24>
        </xsl:if>
        <xsl:if test="string($var:v143)='true'">
          <xsl:variable name="var:v144" select="&quot;&quot;" />
          <FCDate24>
            <xsl:value-of select="$var:v144" />
          </FCDate24>
        </xsl:if>
        <xsl:if test="string($var:v147)='true'">
          <xsl:variable name="var:v148" select="ScriptNS0:FormateDateNew(string($var:v145), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate25>
            <xsl:value-of select="$var:v148" />
          </FCDate25>
        </xsl:if>
        <xsl:if test="string($var:v149)='true'">
          <xsl:variable name="var:v150" select="&quot;&quot;" />
          <FCDate25>
            <xsl:value-of select="$var:v150" />
          </FCDate25>
        </xsl:if>
        <xsl:if test="string($var:v153)='true'">
          <xsl:variable name="var:v154" select="ScriptNS0:FormateDateNew(string($var:v151), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate26>
            <xsl:value-of select="$var:v154" />
          </FCDate26>
        </xsl:if>
        <xsl:if test="string($var:v155)='true'">
          <xsl:variable name="var:v156" select="&quot;&quot;" />
          <FCDate26>
            <xsl:value-of select="$var:v156" />
          </FCDate26>
        </xsl:if>
        <xsl:if test="string($var:v159)='true'">
          <xsl:variable name="var:v160" select="ScriptNS0:FormateDateNew(string($var:v157), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate27>
            <xsl:value-of select="$var:v160" />
          </FCDate27>
        </xsl:if>
        <xsl:if test="string($var:v161)='true'">
          <xsl:variable name="var:v162" select="&quot;&quot;" />
          <FCDate27>
            <xsl:value-of select="$var:v162" />
          </FCDate27>
        </xsl:if>
        <xsl:if test="string($var:v165)='true'">
          <xsl:variable name="var:v166" select="ScriptNS0:FormateDateNew(string($var:v163), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate28>
            <xsl:value-of select="$var:v166" />
          </FCDate28>
        </xsl:if>
        <xsl:if test="string($var:v167)='true'">
          <xsl:variable name="var:v168" select="&quot;&quot;" />
          <FCDate28>
            <xsl:value-of select="$var:v168" />
          </FCDate28>
        </xsl:if>
        <xsl:if test="string($var:v171)='true'">
          <xsl:variable name="var:v172" select="ScriptNS0:FormateDateNew(string($var:v169), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate29>
            <xsl:value-of select="$var:v172" />
          </FCDate29>
        </xsl:if>
        <xsl:if test="string($var:v173)='true'">
          <xsl:variable name="var:v174" select="&quot;&quot;" />
          <FCDate29>
            <xsl:value-of select="$var:v174" />
          </FCDate29>
        </xsl:if>
        <xsl:if test="string($var:v177)='true'">
          <xsl:variable name="var:v178" select="ScriptNS0:FormateDateNew(string($var:v175), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate30>
            <xsl:value-of select="$var:v178" />
          </FCDate30>
        </xsl:if>
        <xsl:if test="string($var:v179)='true'">
          <xsl:variable name="var:v180" select="&quot;&quot;" />
          <FCDate30>
            <xsl:value-of select="$var:v180" />
          </FCDate30>
        </xsl:if>
        <xsl:if test="string($var:v183)='true'">
          <xsl:variable name="var:v184" select="ScriptNS0:FormateDateNew(string($var:v181), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate31>
            <xsl:value-of select="$var:v184" />
          </FCDate31>
        </xsl:if>
        <xsl:if test="string($var:v185)='true'">
          <xsl:variable name="var:v186" select="&quot;&quot;" />
          <FCDate31>
            <xsl:value-of select="$var:v186" />
          </FCDate31>
        </xsl:if>
        <xsl:if test="string($var:v189)='true'">
          <xsl:variable name="var:v190" select="ScriptNS0:FormateDateNew(string($var:v187), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate32>
            <xsl:value-of select="$var:v190" />
          </FCDate32>
        </xsl:if>
        <xsl:if test="string($var:v191)='true'">
          <xsl:variable name="var:v192" select="&quot;&quot;" />
          <FCDate32>
            <xsl:value-of select="$var:v192" />
          </FCDate32>
        </xsl:if>
        <xsl:if test="string($var:v195)='true'">
          <xsl:variable name="var:v196" select="ScriptNS0:FormateDateNew(string($var:v193), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate33>
            <xsl:value-of select="$var:v196" />
          </FCDate33>
        </xsl:if>
        <xsl:if test="string($var:v197)='true'">
          <xsl:variable name="var:v198" select="&quot;&quot;" />
          <FCDate33>
            <xsl:value-of select="$var:v198" />
          </FCDate33>
        </xsl:if>
        <xsl:if test="string($var:v201)='true'">
          <xsl:variable name="var:v202" select="ScriptNS0:FormateDateNew(string($var:v199), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate34>
            <xsl:value-of select="$var:v202" />
          </FCDate34>
        </xsl:if>
        <xsl:if test="string($var:v203)='true'">
          <xsl:variable name="var:v204" select="&quot;&quot;" />
          <FCDate34>
            <xsl:value-of select="$var:v204" />
          </FCDate34>
        </xsl:if>
        <xsl:if test="string($var:v207)='true'">
          <xsl:variable name="var:v208" select="ScriptNS0:FormateDateNew(string($var:v205), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate35>
            <xsl:value-of select="$var:v208" />
          </FCDate35>
        </xsl:if>
        <xsl:if test="string($var:v209)='true'">
          <xsl:variable name="var:v210" select="&quot;&quot;" />
          <FCDate35>
            <xsl:value-of select="$var:v210" />
          </FCDate35>
        </xsl:if>
        <xsl:if test="string($var:v213)='true'">
          <xsl:variable name="var:v214" select="ScriptNS0:FormateDateNew(string($var:v211), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate36>
            <xsl:value-of select="$var:v214" />
          </FCDate36>
        </xsl:if>
        <xsl:if test="string($var:v215)='true'">
          <xsl:variable name="var:v216" select="&quot;&quot;" />
          <FCDate36>
            <xsl:value-of select="$var:v216" />
          </FCDate36>
        </xsl:if>
        <xsl:if test="string($var:v219)='true'">
          <xsl:variable name="var:v220" select="ScriptNS0:FormateDateNew(string($var:v217), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate37>
            <xsl:value-of select="$var:v220" />
          </FCDate37>
        </xsl:if>
        <xsl:if test="string($var:v221)='true'">
          <xsl:variable name="var:v222" select="&quot;&quot;" />
          <FCDate37>
            <xsl:value-of select="$var:v222" />
          </FCDate37>
        </xsl:if>
        <xsl:if test="string($var:v225)='true'">
          <xsl:variable name="var:v226" select="ScriptNS0:FormateDateNew(string($var:v223), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate38>
            <xsl:value-of select="$var:v226" />
          </FCDate38>
        </xsl:if>
        <xsl:if test="string($var:v227)='true'">
          <xsl:variable name="var:v228" select="&quot;&quot;" />
          <FCDate38>
            <xsl:value-of select="$var:v228" />
          </FCDate38>
        </xsl:if>
        <xsl:if test="string($var:v231)='true'">
          <xsl:variable name="var:v232" select="ScriptNS0:FormateDateNew(string($var:v229), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate39>
            <xsl:value-of select="$var:v232" />
          </FCDate39>
        </xsl:if>
        <xsl:if test="string($var:v233)='true'">
          <xsl:variable name="var:v234" select="&quot;&quot;" />
          <FCDate39>
            <xsl:value-of select="$var:v234" />
          </FCDate39>
        </xsl:if>
        <xsl:if test="string($var:v237)='true'">
          <xsl:variable name="var:v238" select="ScriptNS0:FormateDateNew(string($var:v235), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate40>
            <xsl:value-of select="$var:v238" />
          </FCDate40>
        </xsl:if>
        <xsl:if test="string($var:v239)='true'">
          <xsl:variable name="var:v240" select="&quot;&quot;" />
          <FCDate40>
            <xsl:value-of select="$var:v240" />
          </FCDate40>
        </xsl:if>
        <xsl:if test="string($var:v243)='true'">
          <xsl:variable name="var:v244" select="ScriptNS0:FormateDateNew(string($var:v241), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate41>
            <xsl:value-of select="$var:v244" />
          </FCDate41>
        </xsl:if>
        <xsl:if test="string($var:v245)='true'">
          <xsl:variable name="var:v246" select="&quot;&quot;" />
          <FCDate41>
            <xsl:value-of select="$var:v246" />
          </FCDate41>
        </xsl:if>
        <xsl:if test="string($var:v249)='true'">
          <xsl:variable name="var:v250" select="ScriptNS0:FormateDateNew(string($var:v247), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate42>
            <xsl:value-of select="$var:v250" />
          </FCDate42>
        </xsl:if>
        <xsl:if test="string($var:v251)='true'">
          <xsl:variable name="var:v252" select="&quot;&quot;" />
          <FCDate42>
            <xsl:value-of select="$var:v252" />
          </FCDate42>
        </xsl:if>
        <xsl:if test="string($var:v255)='true'">
          <xsl:variable name="var:v256" select="ScriptNS0:FormateDateNew(string($var:v253), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate43>
            <xsl:value-of select="$var:v256" />
          </FCDate43>
        </xsl:if>
        <xsl:if test="string($var:v257)='true'">
          <xsl:variable name="var:v258" select="&quot;&quot;" />
          <FCDate43>
            <xsl:value-of select="$var:v258" />
          </FCDate43>
        </xsl:if>
        <xsl:if test="string($var:v261)='true'">
          <xsl:variable name="var:v262" select="ScriptNS0:FormateDateNew(string($var:v259), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate44>
            <xsl:value-of select="$var:v262" />
          </FCDate44>
        </xsl:if>
        <xsl:if test="string($var:v263)='true'">
          <xsl:variable name="var:v264" select="&quot;&quot;" />
          <FCDate44>
            <xsl:value-of select="$var:v264" />
          </FCDate44>
        </xsl:if>
        <xsl:if test="string($var:v267)='true'">
          <xsl:variable name="var:v268" select="ScriptNS0:FormateDateNew(string($var:v265), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate45>
            <xsl:value-of select="$var:v268" />
          </FCDate45>
        </xsl:if>
        <xsl:if test="string($var:v269)='true'">
          <xsl:variable name="var:v270" select="&quot;&quot;" />
          <FCDate45>
            <xsl:value-of select="$var:v270" />
          </FCDate45>
        </xsl:if>
        <xsl:if test="string($var:v273)='true'">
          <xsl:variable name="var:v274" select="ScriptNS0:FormateDateNew(string($var:v271), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate46>
            <xsl:value-of select="$var:v274" />
          </FCDate46>
        </xsl:if>
        <xsl:if test="string($var:v275)='true'">
          <xsl:variable name="var:v276" select="&quot;&quot;" />
          <FCDate46>
            <xsl:value-of select="$var:v276" />
          </FCDate46>
        </xsl:if>
        <xsl:if test="string($var:v279)='true'">
          <xsl:variable name="var:v280" select="ScriptNS0:FormateDateNew(string($var:v277), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate47>
            <xsl:value-of select="$var:v280" />
          </FCDate47>
        </xsl:if>
        <xsl:if test="string($var:v281)='true'">
          <xsl:variable name="var:v282" select="&quot;&quot;" />
          <FCDate47>
            <xsl:value-of select="$var:v282" />
          </FCDate47>
        </xsl:if>
        <xsl:if test="string($var:v285)='true'">
          <xsl:variable name="var:v286" select="ScriptNS0:FormateDateNew(string($var:v283), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate48>
            <xsl:value-of select="$var:v286" />
          </FCDate48>
        </xsl:if>
        <xsl:if test="string($var:v287)='true'">
          <xsl:variable name="var:v288" select="&quot;&quot;" />
          <FCDate48>
            <xsl:value-of select="$var:v288" />
          </FCDate48>
        </xsl:if>
        <xsl:if test="string($var:v291)='true'">
          <xsl:variable name="var:v292" select="ScriptNS0:FormateDateNew(string($var:v289), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate49>
            <xsl:value-of select="$var:v292" />
          </FCDate49>
        </xsl:if>
        <xsl:if test="string($var:v293)='true'">
          <xsl:variable name="var:v294" select="&quot;&quot;" />
          <FCDate49>
            <xsl:value-of select="$var:v294" />
          </FCDate49>
        </xsl:if>
        <xsl:if test="string($var:v297)='true'">
          <xsl:variable name="var:v298" select="ScriptNS0:FormateDateNew(string($var:v295), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate50>
            <xsl:value-of select="$var:v298" />
          </FCDate50>
        </xsl:if>
        <xsl:if test="string($var:v299)='true'">
          <xsl:variable name="var:v300" select="&quot;&quot;" />
          <FCDate50>
            <xsl:value-of select="$var:v300" />
          </FCDate50>
        </xsl:if>
        <xsl:if test="string($var:v303)='true'">
          <xsl:variable name="var:v304" select="ScriptNS0:FormateDateNew(string($var:v301), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate51>
            <xsl:value-of select="$var:v304" />
          </FCDate51>
        </xsl:if>
        <xsl:if test="string($var:v305)='true'">
          <xsl:variable name="var:v306" select="&quot;&quot;" />
          <FCDate51>
            <xsl:value-of select="$var:v306" />
          </FCDate51>
        </xsl:if>
        <xsl:if test="string($var:v309)='true'">
          <xsl:variable name="var:v310" select="ScriptNS0:FormateDateNew(string($var:v307), &quot;MM/dd/yyyy&quot; , &quot;yyyyMMdd&quot;)" />
          <FCDate52>
            <xsl:value-of select="$var:v310" />
          </FCDate52>
        </xsl:if>
        <xsl:if test="string($var:v311)='true'">
          <xsl:variable name="var:v312" select="&quot;&quot;" />
          <FCDate52>
            <xsl:value-of select="$var:v312" />
          </FCDate52>
        </xsl:if>
      </ForecastDateRecord>
      <xsl:for-each select="Details">
        <xsl:variable name="var:v313" select="count(/s0:Forecast/Details/Schedules)" />
        <xsl:variable name="var:v314" select="userCSharp:LogicalGt(string($var:v313) , &quot;0&quot;)" />
        <xsl:if test="$var:v314">
          <xsl:variable name="var:v316" select="userCSharp:StringConcat(&quot;EA&quot;)" />
          <xsl:variable name="var:v317" select="./Schedules[1]/@Quantity" />
          <xsl:variable name="var:v318" select="./Schedules[2]/@Quantity" />
          <xsl:variable name="var:v319" select="userCSharp:StringSize(string($var:v318))" />
          <xsl:variable name="var:v320" select="userCSharp:LogicalGt(string($var:v319) , &quot;0&quot;)" />
          <xsl:variable name="var:v321" select="userCSharp:LogicalNot(string($var:v320))" />
          <xsl:variable name="var:v323" select="./Schedules[3]/@Quantity" />
          <xsl:variable name="var:v324" select="userCSharp:StringSize(string($var:v323))" />
          <xsl:variable name="var:v325" select="userCSharp:LogicalGt(string($var:v324) , &quot;0&quot;)" />
          <xsl:variable name="var:v326" select="userCSharp:LogicalNot(string($var:v325))" />
          <xsl:variable name="var:v328" select="./Schedules[4]/@Quantity" />
          <xsl:variable name="var:v329" select="userCSharp:StringSize(string($var:v328))" />
          <xsl:variable name="var:v330" select="userCSharp:LogicalGt(string($var:v329) , &quot;0&quot;)" />
          <xsl:variable name="var:v331" select="userCSharp:LogicalNot(string($var:v330))" />
          <xsl:variable name="var:v333" select="./Schedules[5]/@Quantity" />
          <xsl:variable name="var:v334" select="userCSharp:StringSize(string($var:v333))" />
          <xsl:variable name="var:v335" select="userCSharp:LogicalGt(string($var:v334) , &quot;0&quot;)" />
          <xsl:variable name="var:v336" select="userCSharp:LogicalNot(string($var:v335))" />
          <xsl:variable name="var:v338" select="./Schedules[6]/@Quantity" />
          <xsl:variable name="var:v339" select="userCSharp:StringSize(string($var:v338))" />
          <xsl:variable name="var:v340" select="userCSharp:LogicalGt(string($var:v339) , &quot;0&quot;)" />
          <xsl:variable name="var:v341" select="userCSharp:LogicalNot(string($var:v340))" />
          <xsl:variable name="var:v343" select="./Schedules[7]/@Quantity" />
          <xsl:variable name="var:v344" select="userCSharp:StringSize(string($var:v343))" />
          <xsl:variable name="var:v345" select="userCSharp:LogicalGt(string($var:v344) , &quot;0&quot;)" />
          <xsl:variable name="var:v346" select="userCSharp:LogicalNot(string($var:v345))" />
          <xsl:variable name="var:v348" select="./Schedules[8]/@Quantity" />
          <xsl:variable name="var:v349" select="userCSharp:StringSize(string($var:v348))" />
          <xsl:variable name="var:v350" select="userCSharp:LogicalGt(string($var:v349) , &quot;0&quot;)" />
          <xsl:variable name="var:v351" select="userCSharp:LogicalNot(string($var:v350))" />
          <xsl:variable name="var:v353" select="./Schedules[9]/@Quantity" />
          <xsl:variable name="var:v354" select="userCSharp:StringSize(string($var:v353))" />
          <xsl:variable name="var:v355" select="userCSharp:LogicalGt(string($var:v354) , &quot;0&quot;)" />
          <xsl:variable name="var:v356" select="userCSharp:LogicalNot(string($var:v355))" />
          <xsl:variable name="var:v358" select="./Schedules[10]/@Quantity" />
          <xsl:variable name="var:v359" select="userCSharp:StringSize(string($var:v358))" />
          <xsl:variable name="var:v360" select="userCSharp:LogicalGt(string($var:v359) , &quot;0&quot;)" />
          <xsl:variable name="var:v361" select="userCSharp:LogicalNot(string($var:v360))" />
          <xsl:variable name="var:v363" select="./Schedules[11]/@Quantity" />
          <xsl:variable name="var:v364" select="userCSharp:StringSize(string($var:v363))" />
          <xsl:variable name="var:v365" select="userCSharp:LogicalGt(string($var:v364) , &quot;0&quot;)" />
          <xsl:variable name="var:v366" select="userCSharp:LogicalNot(string($var:v365))" />
          <xsl:variable name="var:v368" select="./Schedules[12]/@Quantity" />
          <xsl:variable name="var:v369" select="userCSharp:StringSize(string($var:v368))" />
          <xsl:variable name="var:v370" select="userCSharp:LogicalGt(string($var:v369) , &quot;0&quot;)" />
          <xsl:variable name="var:v371" select="userCSharp:LogicalNot(string($var:v370))" />
          <xsl:variable name="var:v373" select="./Schedules[13]/@Quantity" />
          <xsl:variable name="var:v374" select="userCSharp:StringSize(string($var:v373))" />
          <xsl:variable name="var:v375" select="userCSharp:LogicalGt(string($var:v374) , &quot;0&quot;)" />
          <xsl:variable name="var:v376" select="userCSharp:LogicalNot(string($var:v375))" />
          <xsl:variable name="var:v378" select="./Schedules[14]/@Quantity" />
          <xsl:variable name="var:v379" select="userCSharp:StringSize(string($var:v378))" />
          <xsl:variable name="var:v380" select="userCSharp:LogicalGt(string($var:v379) , &quot;0&quot;)" />
          <xsl:variable name="var:v381" select="userCSharp:LogicalNot(string($var:v380))" />
          <xsl:variable name="var:v383" select="./Schedules[15]/@Quantity" />
          <xsl:variable name="var:v384" select="userCSharp:StringSize(string($var:v383))" />
          <xsl:variable name="var:v385" select="userCSharp:LogicalGt(string($var:v384) , &quot;0&quot;)" />
          <xsl:variable name="var:v386" select="userCSharp:LogicalNot(string($var:v385))" />
          <xsl:variable name="var:v388" select="./Schedules[16]/@Quantity" />
          <xsl:variable name="var:v389" select="userCSharp:StringSize(string($var:v388))" />
          <xsl:variable name="var:v390" select="userCSharp:LogicalGt(string($var:v389) , &quot;0&quot;)" />
          <xsl:variable name="var:v391" select="userCSharp:LogicalNot(string($var:v390))" />
          <xsl:variable name="var:v393" select="./Schedules[17]/@Quantity" />
          <xsl:variable name="var:v394" select="userCSharp:StringSize(string($var:v393))" />
          <xsl:variable name="var:v395" select="userCSharp:LogicalGt(string($var:v394) , &quot;0&quot;)" />
          <xsl:variable name="var:v396" select="userCSharp:LogicalNot(string($var:v395))" />
          <xsl:variable name="var:v398" select="./Schedules[18]/@Quantity" />
          <xsl:variable name="var:v399" select="userCSharp:StringSize(string($var:v398))" />
          <xsl:variable name="var:v400" select="userCSharp:LogicalGt(string($var:v399) , &quot;0&quot;)" />
          <xsl:variable name="var:v401" select="userCSharp:LogicalNot(string($var:v400))" />
          <xsl:variable name="var:v403" select="./Schedules[19]/@Quantity" />
          <xsl:variable name="var:v404" select="userCSharp:StringSize(string($var:v403))" />
          <xsl:variable name="var:v405" select="userCSharp:LogicalGt(string($var:v404) , &quot;0&quot;)" />
          <xsl:variable name="var:v406" select="userCSharp:LogicalNot(string($var:v405))" />
          <xsl:variable name="var:v408" select="./Schedules[20]/@Quantity" />
          <xsl:variable name="var:v409" select="userCSharp:StringSize(string($var:v408))" />
          <xsl:variable name="var:v410" select="userCSharp:LogicalGt(string($var:v409) , &quot;0&quot;)" />
          <xsl:variable name="var:v411" select="userCSharp:LogicalNot(string($var:v410))" />
          <xsl:variable name="var:v413" select="./Schedules[21]/@Quantity" />
          <xsl:variable name="var:v414" select="userCSharp:StringSize(string($var:v413))" />
          <xsl:variable name="var:v415" select="userCSharp:LogicalGt(string($var:v414) , &quot;0&quot;)" />
          <xsl:variable name="var:v416" select="userCSharp:LogicalNot(string($var:v415))" />
          <xsl:variable name="var:v418" select="./Schedules[22]/@Quantity" />
          <xsl:variable name="var:v419" select="userCSharp:StringSize(string($var:v418))" />
          <xsl:variable name="var:v420" select="userCSharp:LogicalGt(string($var:v419) , &quot;0&quot;)" />
          <xsl:variable name="var:v421" select="userCSharp:LogicalNot(string($var:v420))" />
          <xsl:variable name="var:v423" select="./Schedules[23]/@Quantity" />
          <xsl:variable name="var:v424" select="userCSharp:StringSize(string($var:v423))" />
          <xsl:variable name="var:v425" select="userCSharp:LogicalGt(string($var:v424) , &quot;0&quot;)" />
          <xsl:variable name="var:v426" select="userCSharp:LogicalNot(string($var:v425))" />
          <xsl:variable name="var:v428" select="./Schedules[24]/@Quantity" />
          <xsl:variable name="var:v429" select="userCSharp:StringSize(string($var:v428))" />
          <xsl:variable name="var:v430" select="userCSharp:LogicalGt(string($var:v429) , &quot;0&quot;)" />
          <xsl:variable name="var:v431" select="userCSharp:LogicalNot(string($var:v430))" />
          <xsl:variable name="var:v433" select="./Schedules[25]/@Quantity" />
          <xsl:variable name="var:v434" select="userCSharp:StringSize(string($var:v433))" />
          <xsl:variable name="var:v435" select="userCSharp:LogicalGt(string($var:v434) , &quot;0&quot;)" />
          <xsl:variable name="var:v436" select="userCSharp:LogicalNot(string($var:v435))" />
          <xsl:variable name="var:v438" select="./Schedules[26]/@Quantity" />
          <xsl:variable name="var:v439" select="userCSharp:StringSize(string($var:v438))" />
          <xsl:variable name="var:v440" select="userCSharp:LogicalGt(string($var:v439) , &quot;0&quot;)" />
          <xsl:variable name="var:v441" select="userCSharp:LogicalNot(string($var:v440))" />
          <xsl:variable name="var:v443" select="./Schedules[27]/@Quantity" />
          <xsl:variable name="var:v444" select="userCSharp:StringSize(string($var:v443))" />
          <xsl:variable name="var:v445" select="userCSharp:LogicalGt(string($var:v444) , &quot;0&quot;)" />
          <xsl:variable name="var:v446" select="userCSharp:LogicalNot(string($var:v445))" />
          <xsl:variable name="var:v448" select="./Schedules[28]/@Quantity" />
          <xsl:variable name="var:v449" select="userCSharp:StringSize(string($var:v448))" />
          <xsl:variable name="var:v450" select="userCSharp:LogicalGt(string($var:v449) , &quot;0&quot;)" />
          <xsl:variable name="var:v451" select="userCSharp:LogicalNot(string($var:v450))" />
          <xsl:variable name="var:v453" select="./Schedules[29]/@Quantity" />
          <xsl:variable name="var:v454" select="userCSharp:StringSize(string($var:v453))" />
          <xsl:variable name="var:v455" select="userCSharp:LogicalGt(string($var:v454) , &quot;0&quot;)" />
          <xsl:variable name="var:v456" select="userCSharp:LogicalNot(string($var:v455))" />
          <xsl:variable name="var:v458" select="./Schedules[30]/@Quantity" />
          <xsl:variable name="var:v459" select="userCSharp:StringSize(string($var:v458))" />
          <xsl:variable name="var:v460" select="userCSharp:LogicalGt(string($var:v459) , &quot;0&quot;)" />
          <xsl:variable name="var:v461" select="userCSharp:LogicalNot(string($var:v460))" />
          <xsl:variable name="var:v463" select="./Schedules[31]/@Quantity" />
          <xsl:variable name="var:v464" select="userCSharp:StringSize(string($var:v463))" />
          <xsl:variable name="var:v465" select="userCSharp:LogicalGt(string($var:v464) , &quot;0&quot;)" />
          <xsl:variable name="var:v466" select="userCSharp:LogicalNot(string($var:v465))" />
          <xsl:variable name="var:v468" select="./Schedules[32]/@Quantity" />
          <xsl:variable name="var:v469" select="userCSharp:StringSize(string($var:v468))" />
          <xsl:variable name="var:v470" select="userCSharp:LogicalGt(string($var:v469) , &quot;0&quot;)" />
          <xsl:variable name="var:v471" select="userCSharp:LogicalNot(string($var:v470))" />
          <xsl:variable name="var:v473" select="./Schedules[33]/@Quantity" />
          <xsl:variable name="var:v474" select="userCSharp:StringSize(string($var:v473))" />
          <xsl:variable name="var:v475" select="userCSharp:LogicalGt(string($var:v474) , &quot;0&quot;)" />
          <xsl:variable name="var:v476" select="userCSharp:LogicalNot(string($var:v475))" />
          <xsl:variable name="var:v478" select="./Schedules[34]/@Quantity" />
          <xsl:variable name="var:v479" select="userCSharp:StringSize(string($var:v478))" />
          <xsl:variable name="var:v480" select="userCSharp:LogicalGt(string($var:v479) , &quot;0&quot;)" />
          <xsl:variable name="var:v481" select="userCSharp:LogicalNot(string($var:v480))" />
          <xsl:variable name="var:v483" select="./Schedules[35]/@Quantity" />
          <xsl:variable name="var:v484" select="userCSharp:StringSize(string($var:v483))" />
          <xsl:variable name="var:v485" select="userCSharp:LogicalGt(string($var:v484) , &quot;0&quot;)" />
          <xsl:variable name="var:v486" select="userCSharp:LogicalNot(string($var:v485))" />
          <xsl:variable name="var:v488" select="./Schedules[36]/@Quantity" />
          <xsl:variable name="var:v489" select="userCSharp:StringSize(string($var:v488))" />
          <xsl:variable name="var:v490" select="userCSharp:LogicalGt(string($var:v489) , &quot;0&quot;)" />
          <xsl:variable name="var:v491" select="userCSharp:LogicalNot(string($var:v490))" />
          <xsl:variable name="var:v493" select="./Schedules[37]/@Quantity" />
          <xsl:variable name="var:v494" select="userCSharp:StringSize(string($var:v493))" />
          <xsl:variable name="var:v495" select="userCSharp:LogicalGt(string($var:v494) , &quot;0&quot;)" />
          <xsl:variable name="var:v496" select="userCSharp:LogicalNot(string($var:v495))" />
          <xsl:variable name="var:v498" select="./Schedules[38]/@Quantity" />
          <xsl:variable name="var:v499" select="userCSharp:StringSize(string($var:v498))" />
          <xsl:variable name="var:v500" select="userCSharp:LogicalGt(string($var:v499) , &quot;0&quot;)" />
          <xsl:variable name="var:v501" select="userCSharp:LogicalNot(string($var:v500))" />
          <xsl:variable name="var:v503" select="./Schedules[39]/@Quantity" />
          <xsl:variable name="var:v504" select="userCSharp:StringSize(string($var:v503))" />
          <xsl:variable name="var:v505" select="userCSharp:LogicalGt(string($var:v504) , &quot;0&quot;)" />
          <xsl:variable name="var:v506" select="userCSharp:LogicalNot(string($var:v505))" />
          <xsl:variable name="var:v508" select="./Schedules[40]/@Quantity" />
          <xsl:variable name="var:v509" select="userCSharp:StringSize(string($var:v508))" />
          <xsl:variable name="var:v510" select="userCSharp:LogicalGt(string($var:v509) , &quot;0&quot;)" />
          <xsl:variable name="var:v511" select="userCSharp:LogicalNot(string($var:v510))" />
          <xsl:variable name="var:v513" select="./Schedules[41]/@Quantity" />
          <xsl:variable name="var:v514" select="userCSharp:StringSize(string($var:v513))" />
          <xsl:variable name="var:v515" select="userCSharp:LogicalGt(string($var:v514) , &quot;0&quot;)" />
          <xsl:variable name="var:v516" select="userCSharp:LogicalNot(string($var:v515))" />
          <xsl:variable name="var:v518" select="./Schedules[42]/@Quantity" />
          <xsl:variable name="var:v519" select="userCSharp:StringSize(string($var:v518))" />
          <xsl:variable name="var:v520" select="userCSharp:LogicalGt(string($var:v519) , &quot;0&quot;)" />
          <xsl:variable name="var:v521" select="userCSharp:LogicalNot(string($var:v520))" />
          <xsl:variable name="var:v523" select="./Schedules[43]/@Quantity" />
          <xsl:variable name="var:v524" select="userCSharp:StringSize(string($var:v523))" />
          <xsl:variable name="var:v525" select="userCSharp:LogicalGt(string($var:v524) , &quot;0&quot;)" />
          <xsl:variable name="var:v526" select="userCSharp:LogicalNot(string($var:v525))" />
          <xsl:variable name="var:v528" select="./Schedules[44]/@Quantity" />
          <xsl:variable name="var:v529" select="userCSharp:StringSize(string($var:v528))" />
          <xsl:variable name="var:v530" select="userCSharp:LogicalGt(string($var:v529) , &quot;0&quot;)" />
          <xsl:variable name="var:v531" select="userCSharp:LogicalNot(string($var:v530))" />
          <xsl:variable name="var:v533" select="./Schedules[45]/@Quantity" />
          <xsl:variable name="var:v534" select="userCSharp:StringSize(string($var:v533))" />
          <xsl:variable name="var:v535" select="userCSharp:LogicalGt(string($var:v534) , &quot;0&quot;)" />
          <xsl:variable name="var:v536" select="userCSharp:LogicalNot(string($var:v535))" />
          <xsl:variable name="var:v538" select="./Schedules[46]/@Quantity" />
          <xsl:variable name="var:v539" select="userCSharp:StringSize(string($var:v538))" />
          <xsl:variable name="var:v540" select="userCSharp:LogicalGt(string($var:v539) , &quot;0&quot;)" />
          <xsl:variable name="var:v541" select="userCSharp:LogicalNot(string($var:v540))" />
          <xsl:variable name="var:v543" select="./Schedules[47]/@Quantity" />
          <xsl:variable name="var:v544" select="userCSharp:StringSize(string($var:v543))" />
          <xsl:variable name="var:v545" select="userCSharp:LogicalGt(string($var:v544) , &quot;0&quot;)" />
          <xsl:variable name="var:v546" select="userCSharp:LogicalNot(string($var:v545))" />
          <xsl:variable name="var:v548" select="./Schedules[48]/@Quantity" />
          <xsl:variable name="var:v549" select="userCSharp:StringSize(string($var:v548))" />
          <xsl:variable name="var:v550" select="userCSharp:LogicalGt(string($var:v549) , &quot;0&quot;)" />
          <xsl:variable name="var:v551" select="userCSharp:LogicalNot(string($var:v550))" />
          <xsl:variable name="var:v553" select="./Schedules[49]/@Quantity" />
          <xsl:variable name="var:v554" select="userCSharp:StringSize(string($var:v553))" />
          <xsl:variable name="var:v555" select="userCSharp:LogicalGt(string($var:v554) , &quot;0&quot;)" />
          <xsl:variable name="var:v556" select="userCSharp:LogicalNot(string($var:v555))" />
          <xsl:variable name="var:v558" select="./Schedules[50]/@Quantity" />
          <xsl:variable name="var:v559" select="userCSharp:StringSize(string($var:v558))" />
          <xsl:variable name="var:v560" select="userCSharp:LogicalGt(string($var:v559) , &quot;0&quot;)" />
          <xsl:variable name="var:v561" select="userCSharp:LogicalNot(string($var:v560))" />
          <xsl:variable name="var:v563" select="./Schedules[51]/@Quantity" />
          <xsl:variable name="var:v564" select="userCSharp:StringSize(string($var:v563))" />
          <xsl:variable name="var:v565" select="userCSharp:LogicalGt(string($var:v564) , &quot;0&quot;)" />
          <xsl:variable name="var:v566" select="userCSharp:LogicalNot(string($var:v565))" />
          <xsl:variable name="var:v568" select="./Schedules[52]/@Quantity" />
          <xsl:variable name="var:v569" select="userCSharp:StringSize(string($var:v568))" />
          <xsl:variable name="var:v570" select="userCSharp:LogicalGt(string($var:v569) , &quot;0&quot;)" />
          <xsl:variable name="var:v571" select="userCSharp:LogicalNot(string($var:v570))" />
          <Product>
            <xsl:if test="@Material">
              <MaterialID>
                <xsl:value-of select="@Material" />
              </MaterialID>
            </xsl:if>
            <xsl:variable name="var:v315" select="ScriptNS1:ReplaceString(string(@MaterialDescription) , &quot;~&quot; , &quot;_&quot;)" />
            <ProductDescription>
              <xsl:value-of select="$var:v315" />
            </ProductDescription>
            <UOM>
              <xsl:value-of select="$var:v316" />
            </UOM>
            <Qty1>
              <xsl:value-of select="$var:v317" />
            </Qty1>
            <xsl:if test="string($var:v320)='true'">
              <Qty2>
                <xsl:value-of select="$var:v318" />
              </Qty2>
            </xsl:if>
            <xsl:if test="string($var:v321)='true'">
              <xsl:variable name="var:v322" select="&quot;&quot;" />
              <Qty2>
                <xsl:value-of select="$var:v322" />
              </Qty2>
            </xsl:if>
            <xsl:if test="string($var:v325)='true'">
              <Qty3>
                <xsl:value-of select="$var:v323" />
              </Qty3>
            </xsl:if>
            <xsl:if test="string($var:v326)='true'">
              <xsl:variable name="var:v327" select="&quot;&quot;" />
              <Qty3>
                <xsl:value-of select="$var:v327" />
              </Qty3>
            </xsl:if>
            <xsl:if test="string($var:v330)='true'">
              <Qty4>
                <xsl:value-of select="$var:v328" />
              </Qty4>
            </xsl:if>
            <xsl:if test="string($var:v331)='true'">
              <xsl:variable name="var:v332" select="&quot;&quot;" />
              <Qty4>
                <xsl:value-of select="$var:v332" />
              </Qty4>
            </xsl:if>
            <xsl:if test="string($var:v335)='true'">
              <Qty5>
                <xsl:value-of select="$var:v333" />
              </Qty5>
            </xsl:if>
            <xsl:if test="string($var:v336)='true'">
              <xsl:variable name="var:v337" select="&quot;&quot;" />
              <Qty5>
                <xsl:value-of select="$var:v337" />
              </Qty5>
            </xsl:if>
            <xsl:if test="string($var:v340)='true'">
              <Qty6>
                <xsl:value-of select="$var:v338" />
              </Qty6>
            </xsl:if>
            <xsl:if test="string($var:v341)='true'">
              <xsl:variable name="var:v342" select="&quot;&quot;" />
              <Qty6>
                <xsl:value-of select="$var:v342" />
              </Qty6>
            </xsl:if>
            <xsl:if test="string($var:v345)='true'">
              <Qty7>
                <xsl:value-of select="$var:v343" />
              </Qty7>
            </xsl:if>
            <xsl:if test="string($var:v346)='true'">
              <xsl:variable name="var:v347" select="&quot;&quot;" />
              <Qty7>
                <xsl:value-of select="$var:v347" />
              </Qty7>
            </xsl:if>
            <xsl:if test="string($var:v350)='true'">
              <Qty8>
                <xsl:value-of select="$var:v348" />
              </Qty8>
            </xsl:if>
            <xsl:if test="string($var:v351)='true'">
              <xsl:variable name="var:v352" select="&quot;&quot;" />
              <Qty8>
                <xsl:value-of select="$var:v352" />
              </Qty8>
            </xsl:if>
            <xsl:if test="string($var:v355)='true'">
              <Qty9>
                <xsl:value-of select="$var:v353" />
              </Qty9>
            </xsl:if>
            <xsl:if test="string($var:v356)='true'">
              <xsl:variable name="var:v357" select="&quot;&quot;" />
              <Qty9>
                <xsl:value-of select="$var:v357" />
              </Qty9>
            </xsl:if>
            <xsl:if test="string($var:v360)='true'">
              <Qty10>
                <xsl:value-of select="$var:v358" />
              </Qty10>
            </xsl:if>
            <xsl:if test="string($var:v361)='true'">
              <xsl:variable name="var:v362" select="&quot;&quot;" />
              <Qty10>
                <xsl:value-of select="$var:v362" />
              </Qty10>
            </xsl:if>
            <xsl:if test="string($var:v365)='true'">
              <Qty11>
                <xsl:value-of select="$var:v363" />
              </Qty11>
            </xsl:if>
            <xsl:if test="string($var:v366)='true'">
              <xsl:variable name="var:v367" select="&quot;&quot;" />
              <Qty11>
                <xsl:value-of select="$var:v367" />
              </Qty11>
            </xsl:if>
            <xsl:if test="string($var:v370)='true'">
              <Qty12>
                <xsl:value-of select="$var:v368" />
              </Qty12>
            </xsl:if>
            <xsl:if test="string($var:v371)='true'">
              <xsl:variable name="var:v372" select="&quot;&quot;" />
              <Qty12>
                <xsl:value-of select="$var:v372" />
              </Qty12>
            </xsl:if>
            <xsl:if test="string($var:v375)='true'">
              <Qty13>
                <xsl:value-of select="$var:v373" />
              </Qty13>
            </xsl:if>
            <xsl:if test="string($var:v376)='true'">
              <xsl:variable name="var:v377" select="&quot;&quot;" />
              <Qty13>
                <xsl:value-of select="$var:v377" />
              </Qty13>
            </xsl:if>
            <xsl:if test="string($var:v380)='true'">
              <Qty14>
                <xsl:value-of select="$var:v378" />
              </Qty14>
            </xsl:if>
            <xsl:if test="string($var:v381)='true'">
              <xsl:variable name="var:v382" select="&quot;&quot;" />
              <Qty14>
                <xsl:value-of select="$var:v382" />
              </Qty14>
            </xsl:if>
            <xsl:if test="string($var:v385)='true'">
              <Qty15>
                <xsl:value-of select="$var:v383" />
              </Qty15>
            </xsl:if>
            <xsl:if test="string($var:v386)='true'">
              <xsl:variable name="var:v387" select="&quot;&quot;" />
              <Qty15>
                <xsl:value-of select="$var:v387" />
              </Qty15>
            </xsl:if>
            <xsl:if test="string($var:v390)='true'">
              <Qty16>
                <xsl:value-of select="$var:v388" />
              </Qty16>
            </xsl:if>
            <xsl:if test="string($var:v391)='true'">
              <xsl:variable name="var:v392" select="&quot;&quot;" />
              <Qty16>
                <xsl:value-of select="$var:v392" />
              </Qty16>
            </xsl:if>
            <xsl:if test="string($var:v395)='true'">
              <Qty17>
                <xsl:value-of select="$var:v393" />
              </Qty17>
            </xsl:if>
            <xsl:if test="string($var:v396)='true'">
              <xsl:variable name="var:v397" select="&quot;&quot;" />
              <Qty17>
                <xsl:value-of select="$var:v397" />
              </Qty17>
            </xsl:if>
            <xsl:if test="string($var:v400)='true'">
              <Qty18>
                <xsl:value-of select="$var:v398" />
              </Qty18>
            </xsl:if>
            <xsl:if test="string($var:v401)='true'">
              <xsl:variable name="var:v402" select="&quot;&quot;" />
              <Qty18>
                <xsl:value-of select="$var:v402" />
              </Qty18>
            </xsl:if>
            <xsl:if test="string($var:v405)='true'">
              <Qty19>
                <xsl:value-of select="$var:v403" />
              </Qty19>
            </xsl:if>
            <xsl:if test="string($var:v406)='true'">
              <xsl:variable name="var:v407" select="&quot;&quot;" />
              <Qty19>
                <xsl:value-of select="$var:v407" />
              </Qty19>
            </xsl:if>
            <xsl:if test="string($var:v410)='true'">
              <Qty20>
                <xsl:value-of select="$var:v408" />
              </Qty20>
            </xsl:if>
            <xsl:if test="string($var:v411)='true'">
              <xsl:variable name="var:v412" select="&quot;&quot;" />
              <Qty20>
                <xsl:value-of select="$var:v412" />
              </Qty20>
            </xsl:if>
            <xsl:if test="string($var:v415)='true'">
              <Qty21>
                <xsl:value-of select="$var:v413" />
              </Qty21>
            </xsl:if>
            <xsl:if test="string($var:v416)='true'">
              <xsl:variable name="var:v417" select="&quot;&quot;" />
              <Qty21>
                <xsl:value-of select="$var:v417" />
              </Qty21>
            </xsl:if>
            <xsl:if test="string($var:v420)='true'">
              <Qty22>
                <xsl:value-of select="$var:v418" />
              </Qty22>
            </xsl:if>
            <xsl:if test="string($var:v421)='true'">
              <xsl:variable name="var:v422" select="&quot;&quot;" />
              <Qty22>
                <xsl:value-of select="$var:v422" />
              </Qty22>
            </xsl:if>
            <xsl:if test="string($var:v425)='true'">
              <Qty23>
                <xsl:value-of select="$var:v423" />
              </Qty23>
            </xsl:if>
            <xsl:if test="string($var:v426)='true'">
              <xsl:variable name="var:v427" select="&quot;&quot;" />
              <Qty23>
                <xsl:value-of select="$var:v427" />
              </Qty23>
            </xsl:if>
            <xsl:if test="string($var:v430)='true'">
              <Qty24>
                <xsl:value-of select="$var:v428" />
              </Qty24>
            </xsl:if>
            <xsl:if test="string($var:v431)='true'">
              <xsl:variable name="var:v432" select="&quot;&quot;" />
              <Qty24>
                <xsl:value-of select="$var:v432" />
              </Qty24>
            </xsl:if>
            <xsl:if test="string($var:v435)='true'">
              <Qty25>
                <xsl:value-of select="$var:v433" />
              </Qty25>
            </xsl:if>
            <xsl:if test="string($var:v436)='true'">
              <xsl:variable name="var:v437" select="&quot;&quot;" />
              <Qty25>
                <xsl:value-of select="$var:v437" />
              </Qty25>
            </xsl:if>
            <xsl:if test="string($var:v440)='true'">
              <Qty26>
                <xsl:value-of select="$var:v438" />
              </Qty26>
            </xsl:if>
            <xsl:if test="string($var:v441)='true'">
              <xsl:variable name="var:v442" select="&quot;&quot;" />
              <Qty26>
                <xsl:value-of select="$var:v442" />
              </Qty26>
            </xsl:if>
            <xsl:if test="string($var:v445)='true'">
              <Qty27>
                <xsl:value-of select="$var:v443" />
              </Qty27>
            </xsl:if>
            <xsl:if test="string($var:v446)='true'">
              <xsl:variable name="var:v447" select="&quot;&quot;" />
              <Qty27>
                <xsl:value-of select="$var:v447" />
              </Qty27>
            </xsl:if>
            <xsl:if test="string($var:v450)='true'">
              <Qty28>
                <xsl:value-of select="$var:v448" />
              </Qty28>
            </xsl:if>
            <xsl:if test="string($var:v451)='true'">
              <xsl:variable name="var:v452" select="&quot;&quot;" />
              <Qty28>
                <xsl:value-of select="$var:v452" />
              </Qty28>
            </xsl:if>
            <xsl:if test="string($var:v455)='true'">
              <Qty29>
                <xsl:value-of select="$var:v453" />
              </Qty29>
            </xsl:if>
            <xsl:if test="string($var:v456)='true'">
              <xsl:variable name="var:v457" select="&quot;&quot;" />
              <Qty29>
                <xsl:value-of select="$var:v457" />
              </Qty29>
            </xsl:if>
            <xsl:if test="string($var:v460)='true'">
              <Qty30>
                <xsl:value-of select="$var:v458" />
              </Qty30>
            </xsl:if>
            <xsl:if test="string($var:v461)='true'">
              <xsl:variable name="var:v462" select="&quot;&quot;" />
              <Qty30>
                <xsl:value-of select="$var:v462" />
              </Qty30>
            </xsl:if>
            <xsl:if test="string($var:v465)='true'">
              <Qty31>
                <xsl:value-of select="$var:v463" />
              </Qty31>
            </xsl:if>
            <xsl:if test="string($var:v466)='true'">
              <xsl:variable name="var:v467" select="&quot;&quot;" />
              <Qty31>
                <xsl:value-of select="$var:v467" />
              </Qty31>
            </xsl:if>
            <xsl:if test="string($var:v470)='true'">
              <Qty32>
                <xsl:value-of select="$var:v468" />
              </Qty32>
            </xsl:if>
            <xsl:if test="string($var:v471)='true'">
              <xsl:variable name="var:v472" select="&quot;&quot;" />
              <Qty32>
                <xsl:value-of select="$var:v472" />
              </Qty32>
            </xsl:if>
            <xsl:if test="string($var:v475)='true'">
              <Qty33>
                <xsl:value-of select="$var:v473" />
              </Qty33>
            </xsl:if>
            <xsl:if test="string($var:v476)='true'">
              <xsl:variable name="var:v477" select="&quot;&quot;" />
              <Qty33>
                <xsl:value-of select="$var:v477" />
              </Qty33>
            </xsl:if>
            <xsl:if test="string($var:v480)='true'">
              <Qty34>
                <xsl:value-of select="$var:v478" />
              </Qty34>
            </xsl:if>
            <xsl:if test="string($var:v481)='true'">
              <xsl:variable name="var:v482" select="&quot;&quot;" />
              <Qty34>
                <xsl:value-of select="$var:v482" />
              </Qty34>
            </xsl:if>
            <xsl:if test="string($var:v485)='true'">
              <Qty35>
                <xsl:value-of select="$var:v483" />
              </Qty35>
            </xsl:if>
            <xsl:if test="string($var:v486)='true'">
              <xsl:variable name="var:v487" select="&quot;&quot;" />
              <Qty35>
                <xsl:value-of select="$var:v487" />
              </Qty35>
            </xsl:if>
            <xsl:if test="string($var:v490)='true'">
              <Qty36>
                <xsl:value-of select="$var:v488" />
              </Qty36>
            </xsl:if>
            <xsl:if test="string($var:v491)='true'">
              <xsl:variable name="var:v492" select="&quot;&quot;" />
              <Qty36>
                <xsl:value-of select="$var:v492" />
              </Qty36>
            </xsl:if>
            <xsl:if test="string($var:v495)='true'">
              <Qty37>
                <xsl:value-of select="$var:v493" />
              </Qty37>
            </xsl:if>
            <xsl:if test="string($var:v496)='true'">
              <xsl:variable name="var:v497" select="&quot;&quot;" />
              <Qty37>
                <xsl:value-of select="$var:v497" />
              </Qty37>
            </xsl:if>
            <xsl:if test="string($var:v500)='true'">
              <Qty38>
                <xsl:value-of select="$var:v498" />
              </Qty38>
            </xsl:if>
            <xsl:if test="string($var:v501)='true'">
              <xsl:variable name="var:v502" select="&quot;&quot;" />
              <Qty38>
                <xsl:value-of select="$var:v502" />
              </Qty38>
            </xsl:if>
            <xsl:if test="string($var:v505)='true'">
              <Qty39>
                <xsl:value-of select="$var:v503" />
              </Qty39>
            </xsl:if>
            <xsl:if test="string($var:v506)='true'">
              <xsl:variable name="var:v507" select="&quot;&quot;" />
              <Qty39>
                <xsl:value-of select="$var:v507" />
              </Qty39>
            </xsl:if>
            <xsl:if test="string($var:v510)='true'">
              <Qty40>
                <xsl:value-of select="$var:v508" />
              </Qty40>
            </xsl:if>
            <xsl:if test="string($var:v511)='true'">
              <xsl:variable name="var:v512" select="&quot;&quot;" />
              <Qty40>
                <xsl:value-of select="$var:v512" />
              </Qty40>
            </xsl:if>
            <xsl:if test="string($var:v515)='true'">
              <Qty41>
                <xsl:value-of select="$var:v513" />
              </Qty41>
            </xsl:if>
            <xsl:if test="string($var:v516)='true'">
              <xsl:variable name="var:v517" select="&quot;&quot;" />
              <Qty41>
                <xsl:value-of select="$var:v517" />
              </Qty41>
            </xsl:if>
            <xsl:if test="string($var:v520)='true'">
              <Qty42>
                <xsl:value-of select="$var:v518" />
              </Qty42>
            </xsl:if>
            <xsl:if test="string($var:v521)='true'">
              <xsl:variable name="var:v522" select="&quot;&quot;" />
              <Qty42>
                <xsl:value-of select="$var:v522" />
              </Qty42>
            </xsl:if>
            <xsl:if test="string($var:v525)='true'">
              <Qty43>
                <xsl:value-of select="$var:v523" />
              </Qty43>
            </xsl:if>
            <xsl:if test="string($var:v526)='true'">
              <xsl:variable name="var:v527" select="&quot;&quot;" />
              <Qty43>
                <xsl:value-of select="$var:v527" />
              </Qty43>
            </xsl:if>
            <xsl:if test="string($var:v530)='true'">
              <Qty44>
                <xsl:value-of select="$var:v528" />
              </Qty44>
            </xsl:if>
            <xsl:if test="string($var:v531)='true'">
              <xsl:variable name="var:v532" select="&quot;&quot;" />
              <Qty44>
                <xsl:value-of select="$var:v532" />
              </Qty44>
            </xsl:if>
            <xsl:if test="string($var:v535)='true'">
              <Qty45>
                <xsl:value-of select="$var:v533" />
              </Qty45>
            </xsl:if>
            <xsl:if test="string($var:v536)='true'">
              <xsl:variable name="var:v537" select="&quot;&quot;" />
              <Qty45>
                <xsl:value-of select="$var:v537" />
              </Qty45>
            </xsl:if>
            <xsl:if test="string($var:v540)='true'">
              <Qty46>
                <xsl:value-of select="$var:v538" />
              </Qty46>
            </xsl:if>
            <xsl:if test="string($var:v541)='true'">
              <xsl:variable name="var:v542" select="&quot;&quot;" />
              <Qty46>
                <xsl:value-of select="$var:v542" />
              </Qty46>
            </xsl:if>
            <xsl:if test="string($var:v545)='true'">
              <Qty47>
                <xsl:value-of select="$var:v543" />
              </Qty47>
            </xsl:if>
            <xsl:if test="string($var:v546)='true'">
              <xsl:variable name="var:v547" select="&quot;&quot;" />
              <Qty47>
                <xsl:value-of select="$var:v547" />
              </Qty47>
            </xsl:if>
            <xsl:if test="string($var:v550)='true'">
              <Qty48>
                <xsl:value-of select="$var:v548" />
              </Qty48>
            </xsl:if>
            <xsl:if test="string($var:v551)='true'">
              <xsl:variable name="var:v552" select="&quot;&quot;" />
              <Qty48>
                <xsl:value-of select="$var:v552" />
              </Qty48>
            </xsl:if>
            <xsl:if test="string($var:v555)='true'">
              <Qty49>
                <xsl:value-of select="$var:v553" />
              </Qty49>
            </xsl:if>
            <xsl:if test="string($var:v556)='true'">
              <xsl:variable name="var:v557" select="&quot;&quot;" />
              <Qty49>
                <xsl:value-of select="$var:v557" />
              </Qty49>
            </xsl:if>
            <xsl:if test="string($var:v560)='true'">
              <Qty50>
                <xsl:value-of select="$var:v558" />
              </Qty50>
            </xsl:if>
            <xsl:if test="string($var:v561)='true'">
              <xsl:variable name="var:v562" select="&quot;&quot;" />
              <Qty50>
                <xsl:value-of select="$var:v562" />
              </Qty50>
            </xsl:if>
            <xsl:if test="string($var:v565)='true'">
              <Qty51>
                <xsl:value-of select="$var:v563" />
              </Qty51>
            </xsl:if>
            <xsl:if test="string($var:v566)='true'">
              <xsl:variable name="var:v567" select="&quot;&quot;" />
              <Qty51>
                <xsl:value-of select="$var:v567" />
              </Qty51>
            </xsl:if>
            <xsl:if test="string($var:v570)='true'">
              <Qty52>
                <xsl:value-of select="$var:v568" />
              </Qty52>
            </xsl:if>
            <xsl:if test="string($var:v571)='true'">
              <xsl:variable name="var:v572" select="&quot;&quot;" />
              <Qty52>
                <xsl:value-of select="$var:v572" />
              </Qty52>
            </xsl:if>
          </Product>
        </xsl:if>
      </xsl:for-each>
    </ns0:Forecast>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
public string StringConcat(string param0)
{
 return param0;
}


public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
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

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}




]]>
  </msxsl:script>
</xsl:stylesheet>