<?xml version="1.0" encoding="UTF-16" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" 
                exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" 
                xmlns:s0="http://Visy.Middleware.SAP.Common.Schemas.FileStructures.BaseForeCast" 
                xmlns:ns0="http://Visy.Middleware.SAP.Common.Schemas.FileStructures.ForeCast52W" 
                xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Forecast" />
  </xsl:template>
  <xsl:template match="/s0:Forecast">
    <xsl:variable name="var:v1" select="userCSharp:StringSize(string(ForecastDateRecord/FCDate1/text()))" />
    <xsl:variable name="var:v2" select="userCSharp:LogicalNe(string($var:v1) , &quot;0&quot;)" />
    <xsl:variable name="var:v5" select="string(ForecastDateRecord/FCDate1/text())" />
    <xsl:variable name="var:v7" select="userCSharp:StringConcat(&quot;Month/Year:&quot;)" />
    <xsl:variable name="var:v10" select="userCSharp:LogicalEq(string($var:v1) , &quot;0&quot;)" />
    <xsl:variable name="var:v12" select="string(ForecastDateRecord/FCDate2/text())" />
    <xsl:variable name="var:v13" select="userCSharp:StringSize($var:v12)" />
    <xsl:variable name="var:v14" select="userCSharp:LogicalNe(string($var:v13) , &quot;0&quot;)" />
    <xsl:variable name="var:v17" select="userCSharp:LogicalEq(string($var:v13) , &quot;0&quot;)" />
    <xsl:variable name="var:v19" select="string(ForecastDateRecord/FCDate3/text())" />
    <xsl:variable name="var:v20" select="userCSharp:StringSize($var:v19)" />
    <xsl:variable name="var:v21" select="userCSharp:LogicalNe(string($var:v20) , &quot;0&quot;)" />
    <xsl:variable name="var:v24" select="userCSharp:LogicalEq(string($var:v20) , &quot;0&quot;)" />
    <xsl:variable name="var:v26" select="string(ForecastDateRecord/FCDate4/text())" />
    <xsl:variable name="var:v27" select="userCSharp:StringSize($var:v26)" />
    <xsl:variable name="var:v28" select="userCSharp:LogicalNe(string($var:v27) , &quot;0&quot;)" />
    <xsl:variable name="var:v31" select="userCSharp:LogicalEq(string($var:v27) , &quot;0&quot;)" />
    <xsl:variable name="var:v33" select="string(ForecastDateRecord/FCDate5/text())" />
    <xsl:variable name="var:v34" select="userCSharp:StringSize($var:v33)" />
    <xsl:variable name="var:v35" select="userCSharp:LogicalNe(string($var:v34) , &quot;0&quot;)" />
    <xsl:variable name="var:v38" select="userCSharp:LogicalEq(string($var:v34) , &quot;0&quot;)" />
    <xsl:variable name="var:v40" select="string(ForecastDateRecord/FCDate6/text())" />
    <xsl:variable name="var:v41" select="userCSharp:StringSize($var:v40)" />
    <xsl:variable name="var:v42" select="userCSharp:LogicalNe(string($var:v41) , &quot;0&quot;)" />
    <xsl:variable name="var:v45" select="userCSharp:LogicalEq(string($var:v41) , &quot;0&quot;)" />
    <xsl:variable name="var:v47" select="string(ForecastDateRecord/FCDate7/text())" />
    <xsl:variable name="var:v48" select="userCSharp:StringSize($var:v47)" />
    <xsl:variable name="var:v49" select="userCSharp:LogicalNe(string($var:v48) , &quot;0&quot;)" />
    <xsl:variable name="var:v52" select="userCSharp:LogicalEq(string($var:v48) , &quot;0&quot;)" />
    <xsl:variable name="var:v54" select="string(ForecastDateRecord/FCDate8/text())" />
    <xsl:variable name="var:v55" select="userCSharp:StringSize($var:v54)" />
    <xsl:variable name="var:v56" select="userCSharp:LogicalNe(string($var:v55) , &quot;0&quot;)" />
    <xsl:variable name="var:v59" select="userCSharp:LogicalEq(string($var:v55) , &quot;0&quot;)" />
    <xsl:variable name="var:v61" select="string(ForecastDateRecord/FCDate9/text())" />
    <xsl:variable name="var:v62" select="userCSharp:StringSize($var:v61)" />
    <xsl:variable name="var:v63" select="userCSharp:LogicalNe(string($var:v62) , &quot;0&quot;)" />
    <xsl:variable name="var:v66" select="userCSharp:LogicalEq(string($var:v62) , &quot;0&quot;)" />
    <xsl:variable name="var:v68" select="string(ForecastDateRecord/FCDate10/text())" />
    <xsl:variable name="var:v69" select="userCSharp:StringSize($var:v68)" />
    <xsl:variable name="var:v70" select="userCSharp:LogicalNe(string($var:v69) , &quot;0&quot;)" />
    <xsl:variable name="var:v73" select="userCSharp:LogicalEq(string($var:v69) , &quot;0&quot;)" />
    <xsl:variable name="var:v75" select="string(ForecastDateRecord/FCDate11/text())" />
    <xsl:variable name="var:v76" select="userCSharp:StringSize($var:v75)" />
    <xsl:variable name="var:v77" select="userCSharp:LogicalNe(string($var:v76) , &quot;0&quot;)" />
    <xsl:variable name="var:v80" select="userCSharp:LogicalEq(string($var:v76) , &quot;0&quot;)" />
    <xsl:variable name="var:v82" select="string(ForecastDateRecord/FCDate12/text())" />
    <xsl:variable name="var:v83" select="userCSharp:StringSize($var:v82)" />
    <xsl:variable name="var:v84" select="userCSharp:LogicalNe(string($var:v83) , &quot;0&quot;)" />
    <xsl:variable name="var:v87" select="userCSharp:LogicalEq(string($var:v83) , &quot;0&quot;)" />
    <xsl:variable name="var:v89" select="string(ForecastDateRecord/FCDate13/text())" />
    <xsl:variable name="var:v90" select="userCSharp:StringSize($var:v89)" />
    <xsl:variable name="var:v91" select="userCSharp:LogicalNe(string($var:v90) , &quot;0&quot;)" />
    <xsl:variable name="var:v94" select="userCSharp:LogicalEq(string($var:v90) , &quot;0&quot;)" />
    <xsl:variable name="var:v96" select="string(ForecastDateRecord/FCDate14/text())" />
    <xsl:variable name="var:v97" select="userCSharp:StringSize($var:v96)" />
    <xsl:variable name="var:v98" select="userCSharp:LogicalNe(string($var:v97) , &quot;0&quot;)" />
    <xsl:variable name="var:v101" select="userCSharp:LogicalEq(string($var:v97) , &quot;0&quot;)" />
    <xsl:variable name="var:v103" select="string(ForecastDateRecord/FCDate15/text())" />
    <xsl:variable name="var:v104" select="userCSharp:StringSize($var:v103)" />
    <xsl:variable name="var:v105" select="userCSharp:LogicalNe(string($var:v104) , &quot;0&quot;)" />
    <xsl:variable name="var:v108" select="userCSharp:LogicalEq(string($var:v104) , &quot;0&quot;)" />
    <xsl:variable name="var:v110" select="string(ForecastDateRecord/FCDate16/text())" />
    <xsl:variable name="var:v111" select="userCSharp:StringSize($var:v110)" />
    <xsl:variable name="var:v112" select="userCSharp:LogicalNe(string($var:v111) , &quot;0&quot;)" />
    <xsl:variable name="var:v115" select="userCSharp:LogicalEq(string($var:v111) , &quot;0&quot;)" />
    <xsl:variable name="var:v117" select="string(ForecastDateRecord/FCDate17/text())" />
    <xsl:variable name="var:v118" select="userCSharp:StringSize($var:v117)" />
    <xsl:variable name="var:v119" select="userCSharp:LogicalNe(string($var:v118) , &quot;0&quot;)" />
    <xsl:variable name="var:v122" select="userCSharp:LogicalEq(string($var:v118) , &quot;0&quot;)" />
    <xsl:variable name="var:v124" select="string(ForecastDateRecord/FCDate18/text())" />
    <xsl:variable name="var:v125" select="userCSharp:StringSize($var:v124)" />
    <xsl:variable name="var:v126" select="userCSharp:LogicalNe(string($var:v125) , &quot;0&quot;)" />
    <xsl:variable name="var:v129" select="userCSharp:LogicalEq(string($var:v125) , &quot;0&quot;)" />
    <xsl:variable name="var:v131" select="string(ForecastDateRecord/FCDate19/text())" />
    <xsl:variable name="var:v132" select="userCSharp:StringSize($var:v131)" />
    <xsl:variable name="var:v133" select="userCSharp:LogicalNe(string($var:v132) , &quot;0&quot;)" />
    <xsl:variable name="var:v136" select="userCSharp:LogicalEq(string($var:v132) , &quot;0&quot;)" />
    <xsl:variable name="var:v138" select="string(ForecastDateRecord/FCDate20/text())" />
    <xsl:variable name="var:v139" select="userCSharp:StringSize($var:v138)" />
    <xsl:variable name="var:v140" select="userCSharp:LogicalNe(string($var:v139) , &quot;0&quot;)" />
    <xsl:variable name="var:v143" select="userCSharp:LogicalEq(string($var:v139) , &quot;0&quot;)" />
    <xsl:variable name="var:v145" select="string(ForecastDateRecord/FCDate21/text())" />
    <xsl:variable name="var:v146" select="userCSharp:StringSize($var:v145)" />
    <xsl:variable name="var:v147" select="userCSharp:LogicalNe(string($var:v146) , &quot;0&quot;)" />
    <xsl:variable name="var:v150" select="userCSharp:LogicalEq(string($var:v146) , &quot;0&quot;)" />
    <xsl:variable name="var:v152" select="string(ForecastDateRecord/FCDate22/text())" />
    <xsl:variable name="var:v153" select="userCSharp:StringSize($var:v152)" />
    <xsl:variable name="var:v154" select="userCSharp:LogicalNe(string($var:v153) , &quot;0&quot;)" />
    <xsl:variable name="var:v157" select="userCSharp:LogicalEq(string($var:v153) , &quot;0&quot;)" />
    <xsl:variable name="var:v159" select="string(ForecastDateRecord/FCDate23/text())" />
    <xsl:variable name="var:v160" select="userCSharp:StringSize($var:v159)" />
    <xsl:variable name="var:v161" select="userCSharp:LogicalNe(string($var:v160) , &quot;0&quot;)" />
    <xsl:variable name="var:v164" select="userCSharp:LogicalEq(string($var:v160) , &quot;0&quot;)" />
    <xsl:variable name="var:v166" select="string(ForecastDateRecord/FCDate24/text())" />
    <xsl:variable name="var:v167" select="userCSharp:StringSize($var:v166)" />
    <xsl:variable name="var:v168" select="userCSharp:LogicalNe(string($var:v167) , &quot;0&quot;)" />
    <xsl:variable name="var:v171" select="userCSharp:LogicalEq(string($var:v167) , &quot;0&quot;)" />
    <xsl:variable name="var:v173" select="string(ForecastDateRecord/FCDate25/text())" />
    <xsl:variable name="var:v174" select="userCSharp:StringSize($var:v173)" />
    <xsl:variable name="var:v175" select="userCSharp:LogicalNe(string($var:v174) , &quot;0&quot;)" />
    <xsl:variable name="var:v178" select="userCSharp:LogicalEq(string($var:v174) , &quot;0&quot;)" />
    <xsl:variable name="var:v180" select="string(ForecastDateRecord/FCDate26/text())" />
    <xsl:variable name="var:v181" select="userCSharp:StringSize($var:v180)" />
    <xsl:variable name="var:v182" select="userCSharp:LogicalNe(string($var:v181) , &quot;0&quot;)" />
    <xsl:variable name="var:v185" select="userCSharp:LogicalEq(string($var:v181) , &quot;0&quot;)" />
    <xsl:variable name="var:v187" select="string(ForecastDateRecord/FCDate27/text())" />
    <xsl:variable name="var:v188" select="userCSharp:StringSize($var:v187)" />
    <xsl:variable name="var:v189" select="userCSharp:LogicalNe(string($var:v188) , &quot;0&quot;)" />
    <xsl:variable name="var:v192" select="userCSharp:LogicalEq(string($var:v188) , &quot;0&quot;)" />
    <xsl:variable name="var:v194" select="string(ForecastDateRecord/FCDate28/text())" />
    <xsl:variable name="var:v195" select="userCSharp:StringSize($var:v194)" />
    <xsl:variable name="var:v196" select="userCSharp:LogicalNe(string($var:v195) , &quot;0&quot;)" />
    <xsl:variable name="var:v199" select="userCSharp:LogicalEq(string($var:v195) , &quot;0&quot;)" />
    <xsl:variable name="var:v201" select="string(ForecastDateRecord/FCDate29/text())" />
    <xsl:variable name="var:v202" select="userCSharp:StringSize($var:v201)" />
    <xsl:variable name="var:v203" select="userCSharp:LogicalNe(string($var:v202) , &quot;0&quot;)" />
    <xsl:variable name="var:v206" select="userCSharp:LogicalEq(string($var:v202) , &quot;0&quot;)" />
    <xsl:variable name="var:v208" select="string(ForecastDateRecord/FCDate30/text())" />
    <xsl:variable name="var:v209" select="userCSharp:StringSize($var:v208)" />
    <xsl:variable name="var:v210" select="userCSharp:LogicalNe(string($var:v209) , &quot;0&quot;)" />
    <xsl:variable name="var:v213" select="userCSharp:LogicalEq(string($var:v209) , &quot;0&quot;)" />
    <xsl:variable name="var:v215" select="string(ForecastDateRecord/FCDate31/text())" />
    <xsl:variable name="var:v216" select="userCSharp:StringSize($var:v215)" />
    <xsl:variable name="var:v217" select="userCSharp:LogicalNe(string($var:v216) , &quot;0&quot;)" />
    <xsl:variable name="var:v220" select="userCSharp:LogicalEq(string($var:v216) , &quot;0&quot;)" />
    <xsl:variable name="var:v222" select="string(ForecastDateRecord/FCDate32/text())" />
    <xsl:variable name="var:v223" select="userCSharp:StringSize($var:v222)" />
    <xsl:variable name="var:v224" select="userCSharp:LogicalNe(string($var:v223) , &quot;0&quot;)" />
    <xsl:variable name="var:v227" select="userCSharp:LogicalEq(string($var:v223) , &quot;0&quot;)" />
    <xsl:variable name="var:v229" select="string(ForecastDateRecord/FCDate33/text())" />
    <xsl:variable name="var:v230" select="userCSharp:StringSize($var:v229)" />
    <xsl:variable name="var:v231" select="userCSharp:LogicalNe(string($var:v230) , &quot;0&quot;)" />
    <xsl:variable name="var:v234" select="userCSharp:LogicalEq(string($var:v230) , &quot;0&quot;)" />
    <xsl:variable name="var:v236" select="string(ForecastDateRecord/FCDate34/text())" />
    <xsl:variable name="var:v237" select="userCSharp:StringSize($var:v236)" />
    <xsl:variable name="var:v238" select="userCSharp:LogicalNe(string($var:v237) , &quot;0&quot;)" />
    <xsl:variable name="var:v241" select="userCSharp:LogicalEq(string($var:v237) , &quot;0&quot;)" />
    <xsl:variable name="var:v243" select="string(ForecastDateRecord/FCDate35/text())" />
    <xsl:variable name="var:v244" select="userCSharp:StringSize($var:v243)" />
    <xsl:variable name="var:v245" select="userCSharp:LogicalNe(string($var:v244) , &quot;0&quot;)" />
    <xsl:variable name="var:v248" select="userCSharp:LogicalEq(string($var:v244) , &quot;0&quot;)" />
    <xsl:variable name="var:v250" select="string(ForecastDateRecord/FCDate36/text())" />
    <xsl:variable name="var:v251" select="userCSharp:StringSize($var:v250)" />
    <xsl:variable name="var:v252" select="userCSharp:LogicalNe(string($var:v251) , &quot;0&quot;)" />
    <xsl:variable name="var:v255" select="userCSharp:LogicalEq(string($var:v251) , &quot;0&quot;)" />
    <xsl:variable name="var:v257" select="string(ForecastDateRecord/FCDate37/text())" />
    <xsl:variable name="var:v258" select="userCSharp:StringSize($var:v257)" />
    <xsl:variable name="var:v259" select="userCSharp:LogicalNe(string($var:v258) , &quot;0&quot;)" />
    <xsl:variable name="var:v262" select="userCSharp:LogicalEq(string($var:v258) , &quot;0&quot;)" />
    <xsl:variable name="var:v264" select="string(ForecastDateRecord/FCDate38/text())" />
    <xsl:variable name="var:v265" select="userCSharp:StringSize($var:v264)" />
    <xsl:variable name="var:v266" select="userCSharp:LogicalNe(string($var:v265) , &quot;0&quot;)" />
    <xsl:variable name="var:v269" select="userCSharp:LogicalEq(string($var:v265) , &quot;0&quot;)" />
    <xsl:variable name="var:v271" select="string(ForecastDateRecord/FCDate39/text())" />
    <xsl:variable name="var:v272" select="userCSharp:StringSize($var:v271)" />
    <xsl:variable name="var:v273" select="userCSharp:LogicalNe(string($var:v272) , &quot;0&quot;)" />
    <xsl:variable name="var:v276" select="userCSharp:LogicalEq(string($var:v272) , &quot;0&quot;)" />
    <xsl:variable name="var:v278" select="string(ForecastDateRecord/FCDate40/text())" />
    <xsl:variable name="var:v279" select="userCSharp:StringSize($var:v278)" />
    <xsl:variable name="var:v280" select="userCSharp:LogicalNe(string($var:v279) , &quot;0&quot;)" />
    <xsl:variable name="var:v283" select="userCSharp:LogicalEq(string($var:v279) , &quot;0&quot;)" />
    <xsl:variable name="var:v285" select="string(ForecastDateRecord/FCDate41/text())" />
    <xsl:variable name="var:v286" select="userCSharp:StringSize($var:v285)" />
    <xsl:variable name="var:v287" select="userCSharp:LogicalNe(string($var:v286) , &quot;0&quot;)" />
    <xsl:variable name="var:v290" select="userCSharp:LogicalEq(string($var:v286) , &quot;0&quot;)" />
    <xsl:variable name="var:v292" select="string(ForecastDateRecord/FCDate42/text())" />
    <xsl:variable name="var:v293" select="userCSharp:StringSize($var:v292)" />
    <xsl:variable name="var:v294" select="userCSharp:LogicalNe(string($var:v293) , &quot;0&quot;)" />
    <xsl:variable name="var:v297" select="userCSharp:LogicalEq(string($var:v293) , &quot;0&quot;)" />
    <xsl:variable name="var:v299" select="string(ForecastDateRecord/FCDate43/text())" />
    <xsl:variable name="var:v300" select="userCSharp:StringSize($var:v299)" />
    <xsl:variable name="var:v301" select="userCSharp:LogicalNe(string($var:v300) , &quot;0&quot;)" />
    <xsl:variable name="var:v304" select="userCSharp:LogicalEq(string($var:v300) , &quot;0&quot;)" />
    <xsl:variable name="var:v306" select="string(ForecastDateRecord/FCDate44/text())" />
    <xsl:variable name="var:v307" select="userCSharp:StringSize($var:v306)" />
    <xsl:variable name="var:v308" select="userCSharp:LogicalNe(string($var:v307) , &quot;0&quot;)" />
    <xsl:variable name="var:v311" select="userCSharp:LogicalEq(string($var:v307) , &quot;0&quot;)" />
    <xsl:variable name="var:v313" select="string(ForecastDateRecord/FCDate45/text())" />
    <xsl:variable name="var:v314" select="userCSharp:StringSize($var:v313)" />
    <xsl:variable name="var:v315" select="userCSharp:LogicalNe(string($var:v314) , &quot;0&quot;)" />
    <xsl:variable name="var:v318" select="userCSharp:LogicalEq(string($var:v314) , &quot;0&quot;)" />
    <xsl:variable name="var:v320" select="string(ForecastDateRecord/FCDate46/text())" />
    <xsl:variable name="var:v321" select="userCSharp:StringSize($var:v320)" />
    <xsl:variable name="var:v322" select="userCSharp:LogicalNe(string($var:v321) , &quot;0&quot;)" />
    <xsl:variable name="var:v325" select="userCSharp:LogicalEq(string($var:v321) , &quot;0&quot;)" />
    <xsl:variable name="var:v327" select="string(ForecastDateRecord/FCDate47/text())" />
    <xsl:variable name="var:v328" select="userCSharp:StringSize($var:v327)" />
    <xsl:variable name="var:v329" select="userCSharp:LogicalNe(string($var:v328) , &quot;0&quot;)" />
    <xsl:variable name="var:v332" select="userCSharp:LogicalEq(string($var:v328) , &quot;0&quot;)" />
    <xsl:variable name="var:v334" select="string(ForecastDateRecord/FCDate48/text())" />
    <xsl:variable name="var:v335" select="userCSharp:StringSize($var:v334)" />
    <xsl:variable name="var:v336" select="userCSharp:LogicalNe(string($var:v335) , &quot;0&quot;)" />
    <xsl:variable name="var:v339" select="userCSharp:LogicalEq(string($var:v335) , &quot;0&quot;)" />
    <xsl:variable name="var:v341" select="string(ForecastDateRecord/FCDate49/text())" />
    <xsl:variable name="var:v342" select="userCSharp:StringSize($var:v341)" />
    <xsl:variable name="var:v343" select="userCSharp:LogicalNe(string($var:v342) , &quot;0&quot;)" />
    <xsl:variable name="var:v346" select="userCSharp:LogicalEq(string($var:v342) , &quot;0&quot;)" />
    <xsl:variable name="var:v348" select="string(ForecastDateRecord/FCDate50/text())" />
    <xsl:variable name="var:v349" select="userCSharp:StringSize($var:v348)" />
    <xsl:variable name="var:v350" select="userCSharp:LogicalNe(string($var:v349) , &quot;0&quot;)" />
    <xsl:variable name="var:v353" select="string(ForecastDateRecord/FCDate51/text())" />
    <xsl:variable name="var:v354" select="userCSharp:StringSize($var:v353)" />
    <xsl:variable name="var:v355" select="userCSharp:LogicalNe(string($var:v354) , &quot;0&quot;)" />
    <xsl:variable name="var:v358" select="userCSharp:LogicalEq(string($var:v354) , &quot;0&quot;)" />
    <xsl:variable name="var:v360" select="string(ForecastDateRecord/FCDate52/text())" />
    <xsl:variable name="var:v361" select="userCSharp:StringSize($var:v360)" />
    <xsl:variable name="var:v362" select="userCSharp:LogicalNe(string($var:v361) , &quot;0&quot;)" />
    <xsl:variable name="var:v365" select="userCSharp:LogicalEq(string($var:v361) , &quot;0&quot;)" />
    <xsl:variable name="var:v367" select="userCSharp:StringConcat(&quot;Week from-to:&quot;)" />
    <xsl:variable name="var:v369" select="string(TotalPeriod/text())" />
    <xsl:variable name="var:v370" select="userCSharp:LogicalLte($var:v369 , &quot;1&quot;)" />
    <xsl:variable name="var:v373" select="userCSharp:LogicalLte($var:v369 , &quot;2&quot;)" />
    <xsl:variable name="var:v376" select="userCSharp:LogicalLte($var:v369 , &quot;3&quot;)" />
    <xsl:variable name="var:v379" select="userCSharp:LogicalLte($var:v369 , &quot;4&quot;)" />
    <xsl:variable name="var:v382" select="userCSharp:LogicalLte($var:v369 , &quot;5&quot;)" />
    <xsl:variable name="var:v385" select="userCSharp:LogicalLte($var:v369 , &quot;6&quot;)" />
    <xsl:variable name="var:v388" select="userCSharp:LogicalLte($var:v369 , &quot;7&quot;)" />
    <xsl:variable name="var:v391" select="userCSharp:LogicalLte($var:v369 , &quot;8&quot;)" />
    <xsl:variable name="var:v394" select="userCSharp:LogicalLte($var:v369 , &quot;9&quot;)" />
    <xsl:variable name="var:v397" select="userCSharp:LogicalLte($var:v369 , &quot;10&quot;)" />
    <xsl:variable name="var:v400" select="userCSharp:LogicalLte($var:v369 , &quot;11&quot;)" />
    <xsl:variable name="var:v403" select="userCSharp:LogicalLte($var:v369 , &quot;12&quot;)" />
    <xsl:variable name="var:v406" select="userCSharp:LogicalLte($var:v369 , &quot;13&quot;)" />
    <xsl:variable name="var:v409" select="userCSharp:LogicalLte($var:v369 , &quot;14&quot;)" />
    <xsl:variable name="var:v412" select="userCSharp:LogicalLte($var:v369 , &quot;15&quot;)" />
    <xsl:variable name="var:v415" select="userCSharp:LogicalLte($var:v369 , &quot;16&quot;)" />
    <xsl:variable name="var:v418" select="userCSharp:LogicalLte($var:v369 , &quot;17&quot;)" />
    <xsl:variable name="var:v421" select="userCSharp:LogicalLte($var:v369 , &quot;18&quot;)" />
    <xsl:variable name="var:v424" select="userCSharp:LogicalLte($var:v369 , &quot;19&quot;)" />
    <xsl:variable name="var:v427" select="userCSharp:LogicalLte($var:v369 , &quot;20&quot;)" />
    <xsl:variable name="var:v430" select="userCSharp:LogicalLte($var:v369 , &quot;21&quot;)" />
    <xsl:variable name="var:v433" select="userCSharp:LogicalLte($var:v369 , &quot;22&quot;)" />
    <xsl:variable name="var:v436" select="userCSharp:LogicalLte($var:v369 , &quot;23&quot;)" />
    <xsl:variable name="var:v439" select="userCSharp:LogicalLte($var:v369 , &quot;24&quot;)" />
    <xsl:variable name="var:v442" select="userCSharp:LogicalLte($var:v369 , &quot;25&quot;)" />
    <xsl:variable name="var:v445" select="userCSharp:LogicalLte($var:v369 , &quot;26&quot;)" />
    <xsl:variable name="var:v448" select="userCSharp:LogicalLte($var:v369 , &quot;27&quot;)" />
    <xsl:variable name="var:v451" select="userCSharp:LogicalLte($var:v369 , &quot;28&quot;)" />
    <xsl:variable name="var:v454" select="userCSharp:LogicalLte($var:v369 , &quot;29&quot;)" />
    <xsl:variable name="var:v457" select="userCSharp:LogicalLte($var:v369 , &quot;30&quot;)" />
    <xsl:variable name="var:v460" select="userCSharp:LogicalLte($var:v369 , &quot;31&quot;)" />
    <xsl:variable name="var:v463" select="userCSharp:LogicalLte($var:v369 , &quot;32&quot;)" />
    <xsl:variable name="var:v466" select="userCSharp:LogicalLte($var:v369 , &quot;33&quot;)" />
    <xsl:variable name="var:v469" select="userCSharp:LogicalLte($var:v369 , &quot;34&quot;)" />
    <xsl:variable name="var:v472" select="userCSharp:LogicalLte($var:v369 , &quot;35&quot;)" />
    <xsl:variable name="var:v475" select="userCSharp:LogicalLte($var:v369 , &quot;36&quot;)" />
    <xsl:variable name="var:v478" select="userCSharp:LogicalLte($var:v369 , &quot;37&quot;)" />
    <xsl:variable name="var:v481" select="userCSharp:LogicalLte($var:v369 , &quot;38&quot;)" />
    <xsl:variable name="var:v484" select="userCSharp:LogicalLte($var:v369 , &quot;39&quot;)" />
    <xsl:variable name="var:v487" select="userCSharp:LogicalLte($var:v369 , &quot;40&quot;)" />
    <xsl:variable name="var:v490" select="userCSharp:LogicalLte($var:v369 , &quot;41&quot;)" />
    <xsl:variable name="var:v493" select="userCSharp:LogicalLte($var:v369 , &quot;42&quot;)" />
    <xsl:variable name="var:v496" select="userCSharp:LogicalLte($var:v369 , &quot;43&quot;)" />
    <xsl:variable name="var:v499" select="userCSharp:LogicalLte($var:v369 , &quot;44&quot;)" />
    <xsl:variable name="var:v502" select="userCSharp:LogicalLte($var:v369 , &quot;45&quot;)" />
    <xsl:variable name="var:v505" select="userCSharp:LogicalLte($var:v369 , &quot;46&quot;)" />
    <xsl:variable name="var:v508" select="userCSharp:LogicalLte($var:v369 , &quot;47&quot;)" />
    <xsl:variable name="var:v511" select="userCSharp:LogicalLte($var:v369 , &quot;48&quot;)" />
    <xsl:variable name="var:v513" select="userCSharp:LogicalEq(string($var:v349) , &quot;0&quot;)" />
    <xsl:variable name="var:v515" select="userCSharp:LogicalLte($var:v369 , &quot;49&quot;)" />
    <xsl:variable name="var:v518" select="userCSharp:LogicalLte($var:v369 , &quot;50&quot;)" />
    <xsl:variable name="var:v521" select="userCSharp:LogicalLte($var:v369 , &quot;51&quot;)" />
    <xsl:variable name="var:v523" select="userCSharp:LogicalLte($var:v369 , &quot;52&quot;)" />
    <xsl:variable name="var:v525" select="userCSharp:StringConcat(&quot;Customer&quot;)" />
    <xsl:variable name="var:v526" select="userCSharp:StringConcat(&quot;Name&quot;)" />
    <xsl:variable name="var:v527" select="userCSharp:StringConcat(&quot;ShipTo&quot;)" />
    <xsl:variable name="var:v528" select="userCSharp:StringConcat(&quot;Product&quot;)" />
    <xsl:variable name="var:v529" select="userCSharp:StringConcat(&quot;Description&quot;)" />
    <xsl:variable name="var:v530" select="userCSharp:StringConcat(&quot;Qty&quot;)" />
    <ns0:VP_BSS_Upload>
      <ns0:VP_SAP_UPLOAD>
        <ns0:Header1>
          <xsl:attribute name="Plant">
            <xsl:value-of select="PlantCode/text()" />
          </xsl:attribute>
          <xsl:attribute name="Version">
            <xsl:value-of select="ForecastVersion/text()" />
          </xsl:attribute>
          <xsl:attribute name="Planning_Period">
            <xsl:value-of select="PlanningPeriod/text()" />
          </xsl:attribute>
          <xsl:if test="string($var:v2)='true'">
            <xsl:variable name="var:v3" select="ForecastDateRecord/FCDate1/text()" />
            <xsl:variable name="var:v4" select="userCSharp:FromPeriod(string($var:v3))" />
            <xsl:attribute name="From_Period">
              <xsl:value-of select="$var:v4" />
            </xsl:attribute>
          </xsl:if>
          <xsl:variable name="var:v6" select="userCSharp:ToPeriod($var:v5 , string(ForecastDateRecord/FCDate2/text()) , string(ForecastDateRecord/FCDate3/text()) , string(ForecastDateRecord/FCDate4/text()) , string(ForecastDateRecord/FCDate5/text()) , string(ForecastDateRecord/FCDate6/text()) , string(ForecastDateRecord/FCDate7/text()) , string(ForecastDateRecord/FCDate8/text()) , string(ForecastDateRecord/FCDate9/text()) , string(ForecastDateRecord/FCDate10/text()) , string(ForecastDateRecord/FCDate11/text()) , string(ForecastDateRecord/FCDate12/text()) , string(ForecastDateRecord/FCDate13/text()) , string(ForecastDateRecord/FCDate14/text()) , string(ForecastDateRecord/FCDate15/text()) , string(ForecastDateRecord/FCDate16/text()) , string(ForecastDateRecord/FCDate17/text()) , string(ForecastDateRecord/FCDate18/text()) , string(ForecastDateRecord/FCDate19/text()) , string(ForecastDateRecord/FCDate20/text()) , string(ForecastDateRecord/FCDate21/text()) , string(ForecastDateRecord/FCDate22/text()) , string(ForecastDateRecord/FCDate23/text()) , string(ForecastDateRecord/FCDate24/text()) , string(ForecastDateRecord/FCDate25/text()) , string(ForecastDateRecord/FCDate26/text()) , string(ForecastDateRecord/FCDate27/text()) , string(ForecastDateRecord/FCDate28/text()) , string(ForecastDateRecord/FCDate29/text()) , string(ForecastDateRecord/FCDate30/text()) , string(ForecastDateRecord/FCDate31/text()) , string(ForecastDateRecord/FCDate32/text()) , string(ForecastDateRecord/FCDate33/text()) , string(ForecastDateRecord/FCDate34/text()) , string(ForecastDateRecord/FCDate35/text()) , string(ForecastDateRecord/FCDate36/text()) , string(ForecastDateRecord/FCDate37/text()) , string(ForecastDateRecord/FCDate38/text()) , string(ForecastDateRecord/FCDate39/text()) , string(ForecastDateRecord/FCDate40/text()) , string(ForecastDateRecord/FCDate41/text()) , string(ForecastDateRecord/FCDate42/text()) , string(ForecastDateRecord/FCDate43/text()) , string(ForecastDateRecord/FCDate44/text()) , string(ForecastDateRecord/FCDate45/text()) , string(ForecastDateRecord/FCDate46/text()) , string(ForecastDateRecord/FCDate47/text()) , string(ForecastDateRecord/FCDate48/text()) , string(ForecastDateRecord/FCDate49/text()) , string(ForecastDateRecord/FCDate50/text()) , string(ForecastDateRecord/FCDate51/text()) , string(ForecastDateRecord/FCDate52/text()) , string(TotalPeriod/text()))" />
          <xsl:attribute name="To_Period">
            <xsl:value-of select="$var:v6" />
          </xsl:attribute>
          <xsl:attribute name="Customer">
            <xsl:value-of select="CustomerSAPCode/text()" />
          </xsl:attribute>
          <xsl:attribute name="Month_Year">
            <xsl:value-of select="$var:v7" />
          </xsl:attribute>
          <xsl:if test="string($var:v2)='true'">
            <xsl:variable name="var:v8" select="ForecastDateRecord/FCDate1/text()" />
            <xsl:variable name="var:v9" select="userCSharp:H1From(string($var:v8))" />
            <xsl:attribute name="Date1">
              <xsl:value-of select="$var:v9" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v10)='true'">
            <xsl:variable name="var:v11" select="&quot;&quot;" />
            <xsl:attribute name="Date1">
              <xsl:value-of select="$var:v11" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v14)='true'">
            <xsl:variable name="var:v15" select="ForecastDateRecord/FCDate2/text()" />
            <xsl:variable name="var:v16" select="userCSharp:H1Date2(string($var:v15))" />
            <xsl:attribute name="Date2">
              <xsl:value-of select="$var:v16" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v17)='true'">
            <xsl:variable name="var:v18" select="&quot;&quot;" />
            <xsl:attribute name="Date2">
              <xsl:value-of select="$var:v18" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v21)='true'">
            <xsl:variable name="var:v22" select="ForecastDateRecord/FCDate3/text()" />
            <xsl:variable name="var:v23" select="userCSharp:H1Date3(string($var:v22))" />
            <xsl:attribute name="Date3">
              <xsl:value-of select="$var:v23" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v24)='true'">
            <xsl:variable name="var:v25" select="&quot;&quot;" />
            <xsl:attribute name="Date3">
              <xsl:value-of select="$var:v25" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v28)='true'">
            <xsl:variable name="var:v29" select="ForecastDateRecord/FCDate4/text()" />
            <xsl:variable name="var:v30" select="userCSharp:H1Date4(string($var:v29))" />
            <xsl:attribute name="Date4">
              <xsl:value-of select="$var:v30" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v31)='true'">
            <xsl:variable name="var:v32" select="&quot;&quot;" />
            <xsl:attribute name="Date4">
              <xsl:value-of select="$var:v32" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v35)='true'">
            <xsl:variable name="var:v36" select="ForecastDateRecord/FCDate5/text()" />
            <xsl:variable name="var:v37" select="userCSharp:H1Date5(string($var:v36))" />
            <xsl:attribute name="Date5">
              <xsl:value-of select="$var:v37" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v38)='true'">
            <xsl:variable name="var:v39" select="&quot;&quot;" />
            <xsl:attribute name="Date5">
              <xsl:value-of select="$var:v39" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v42)='true'">
            <xsl:variable name="var:v43" select="ForecastDateRecord/FCDate6/text()" />
            <xsl:variable name="var:v44" select="userCSharp:H1Date6(string($var:v43))" />
            <xsl:attribute name="Date6">
              <xsl:value-of select="$var:v44" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v45)='true'">
            <xsl:variable name="var:v46" select="&quot;&quot;" />
            <xsl:attribute name="Date6">
              <xsl:value-of select="$var:v46" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v49)='true'">
            <xsl:variable name="var:v50" select="ForecastDateRecord/FCDate7/text()" />
            <xsl:variable name="var:v51" select="userCSharp:H1Date7(string($var:v50))" />
            <xsl:attribute name="Date7">
              <xsl:value-of select="$var:v51" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v52)='true'">
            <xsl:variable name="var:v53" select="&quot;&quot;" />
            <xsl:attribute name="Date7">
              <xsl:value-of select="$var:v53" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v56)='true'">
            <xsl:variable name="var:v57" select="ForecastDateRecord/FCDate8/text()" />
            <xsl:variable name="var:v58" select="userCSharp:H1Date8(string($var:v57))" />
            <xsl:attribute name="Date8">
              <xsl:value-of select="$var:v58" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v59)='true'">
            <xsl:variable name="var:v60" select="&quot;&quot;" />
            <xsl:attribute name="Date8">
              <xsl:value-of select="$var:v60" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v63)='true'">
            <xsl:variable name="var:v64" select="ForecastDateRecord/FCDate9/text()" />
            <xsl:variable name="var:v65" select="userCSharp:H1Date9(string($var:v64))" />
            <xsl:attribute name="Date9">
              <xsl:value-of select="$var:v65" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v66)='true'">
            <xsl:variable name="var:v67" select="&quot;&quot;" />
            <xsl:attribute name="Date9">
              <xsl:value-of select="$var:v67" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v70)='true'">
            <xsl:variable name="var:v71" select="ForecastDateRecord/FCDate10/text()" />
            <xsl:variable name="var:v72" select="userCSharp:H1Date10(string($var:v71))" />
            <xsl:attribute name="Date10">
              <xsl:value-of select="$var:v72" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v73)='true'">
            <xsl:variable name="var:v74" select="&quot;&quot;" />
            <xsl:attribute name="Date10">
              <xsl:value-of select="$var:v74" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v77)='true'">
            <xsl:variable name="var:v78" select="ForecastDateRecord/FCDate11/text()" />
            <xsl:variable name="var:v79" select="userCSharp:H1Date11(string($var:v78))" />
            <xsl:attribute name="Date11">
              <xsl:value-of select="$var:v79" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v80)='true'">
            <xsl:variable name="var:v81" select="&quot;&quot;" />
            <xsl:attribute name="Date11">
              <xsl:value-of select="$var:v81" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v84)='true'">
            <xsl:variable name="var:v85" select="ForecastDateRecord/FCDate12/text()" />
            <xsl:variable name="var:v86" select="userCSharp:H1Date12(string($var:v85))" />
            <xsl:attribute name="Date12">
              <xsl:value-of select="$var:v86" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v87)='true'">
            <xsl:variable name="var:v88" select="&quot;&quot;" />
            <xsl:attribute name="Date12">
              <xsl:value-of select="$var:v88" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v91)='true'">
            <xsl:variable name="var:v92" select="ForecastDateRecord/FCDate13/text()" />
            <xsl:variable name="var:v93" select="userCSharp:H1Date13(string($var:v92))" />
            <xsl:attribute name="Date13">
              <xsl:value-of select="$var:v93" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v94)='true'">
            <xsl:variable name="var:v95" select="&quot;&quot;" />
            <xsl:attribute name="Date13">
              <xsl:value-of select="$var:v95" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v98)='true'">
            <xsl:variable name="var:v99" select="ForecastDateRecord/FCDate14/text()" />
            <xsl:variable name="var:v100" select="userCSharp:H1Date14(string($var:v99))" />
            <xsl:attribute name="Date14">
              <xsl:value-of select="$var:v100" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v101)='true'">
            <xsl:variable name="var:v102" select="&quot;&quot;" />
            <xsl:attribute name="Date14">
              <xsl:value-of select="$var:v102" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v105)='true'">
            <xsl:variable name="var:v106" select="ForecastDateRecord/FCDate15/text()" />
            <xsl:variable name="var:v107" select="userCSharp:H1Date15(string($var:v106))" />
            <xsl:attribute name="Date15">
              <xsl:value-of select="$var:v107" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v108)='true'">
            <xsl:variable name="var:v109" select="&quot;&quot;" />
            <xsl:attribute name="Date15">
              <xsl:value-of select="$var:v109" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v112)='true'">
            <xsl:variable name="var:v113" select="ForecastDateRecord/FCDate16/text()" />
            <xsl:variable name="var:v114" select="userCSharp:H1Date16(string($var:v113))" />
            <xsl:attribute name="Date16">
              <xsl:value-of select="$var:v114" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v115)='true'">
            <xsl:variable name="var:v116" select="&quot;&quot;" />
            <xsl:attribute name="Date16">
              <xsl:value-of select="$var:v116" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v119)='true'">
            <xsl:variable name="var:v120" select="ForecastDateRecord/FCDate17/text()" />
            <xsl:variable name="var:v121" select="userCSharp:H1Date17(string($var:v120))" />
            <xsl:attribute name="Date17">
              <xsl:value-of select="$var:v121" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v122)='true'">
            <xsl:variable name="var:v123" select="&quot;&quot;" />
            <xsl:attribute name="Date17">
              <xsl:value-of select="$var:v123" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v126)='true'">
            <xsl:variable name="var:v127" select="ForecastDateRecord/FCDate18/text()" />
            <xsl:variable name="var:v128" select="userCSharp:H1Date18(string($var:v127))" />
            <xsl:attribute name="Date18">
              <xsl:value-of select="$var:v128" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v129)='true'">
            <xsl:variable name="var:v130" select="&quot;&quot;" />
            <xsl:attribute name="Date18">
              <xsl:value-of select="$var:v130" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v133)='true'">
            <xsl:variable name="var:v134" select="ForecastDateRecord/FCDate19/text()" />
            <xsl:variable name="var:v135" select="userCSharp:H1Date19(string($var:v134))" />
            <xsl:attribute name="Date19">
              <xsl:value-of select="$var:v135" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v136)='true'">
            <xsl:variable name="var:v137" select="&quot;&quot;" />
            <xsl:attribute name="Date19">
              <xsl:value-of select="$var:v137" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v140)='true'">
            <xsl:variable name="var:v141" select="ForecastDateRecord/FCDate20/text()" />
            <xsl:variable name="var:v142" select="userCSharp:H1Date20(string($var:v141))" />
            <xsl:attribute name="Date20">
              <xsl:value-of select="$var:v142" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v143)='true'">
            <xsl:variable name="var:v144" select="&quot;&quot;" />
            <xsl:attribute name="Date20">
              <xsl:value-of select="$var:v144" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v147)='true'">
            <xsl:variable name="var:v148" select="ForecastDateRecord/FCDate21/text()" />
            <xsl:variable name="var:v149" select="userCSharp:H1Date21(string($var:v148))" />
            <xsl:attribute name="Date21">
              <xsl:value-of select="$var:v149" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v150)='true'">
            <xsl:variable name="var:v151" select="&quot;&quot;" />
            <xsl:attribute name="Date21">
              <xsl:value-of select="$var:v151" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v154)='true'">
            <xsl:variable name="var:v155" select="ForecastDateRecord/FCDate22/text()" />
            <xsl:variable name="var:v156" select="userCSharp:H1Date22(string($var:v155))" />
            <xsl:attribute name="Date22">
              <xsl:value-of select="$var:v156" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v157)='true'">
            <xsl:variable name="var:v158" select="&quot;&quot;" />
            <xsl:attribute name="Date22">
              <xsl:value-of select="$var:v158" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v161)='true'">
            <xsl:variable name="var:v162" select="ForecastDateRecord/FCDate23/text()" />
            <xsl:variable name="var:v163" select="userCSharp:H1Date23(string($var:v162))" />
            <xsl:attribute name="Date23">
              <xsl:value-of select="$var:v163" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v164)='true'">
            <xsl:variable name="var:v165" select="&quot;&quot;" />
            <xsl:attribute name="Date23">
              <xsl:value-of select="$var:v165" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v168)='true'">
            <xsl:variable name="var:v169" select="ForecastDateRecord/FCDate24/text()" />
            <xsl:variable name="var:v170" select="userCSharp:H1Date24(string($var:v169))" />
            <xsl:attribute name="Date24">
              <xsl:value-of select="$var:v170" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v171)='true'">
            <xsl:variable name="var:v172" select="&quot;&quot;" />
            <xsl:attribute name="Date24">
              <xsl:value-of select="$var:v172" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v175)='true'">
            <xsl:variable name="var:v176" select="ForecastDateRecord/FCDate25/text()" />
            <xsl:variable name="var:v177" select="userCSharp:H1Date25(string($var:v176))" />
            <xsl:attribute name="Date25">
              <xsl:value-of select="$var:v177" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v178)='true'">
            <xsl:variable name="var:v179" select="&quot;&quot;" />
            <xsl:attribute name="Date25">
              <xsl:value-of select="$var:v179" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v182)='true'">
            <xsl:variable name="var:v183" select="ForecastDateRecord/FCDate26/text()" />
            <xsl:variable name="var:v184" select="userCSharp:H1Date26(string($var:v183))" />
            <xsl:attribute name="Date26">
              <xsl:value-of select="$var:v184" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v185)='true'">
            <xsl:variable name="var:v186" select="&quot;&quot;" />
            <xsl:attribute name="Date26">
              <xsl:value-of select="$var:v186" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v189)='true'">
            <xsl:variable name="var:v190" select="ForecastDateRecord/FCDate27/text()" />
            <xsl:variable name="var:v191" select="userCSharp:H1Date27(string($var:v190))" />
            <xsl:attribute name="Date27">
              <xsl:value-of select="$var:v191" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v192)='true'">
            <xsl:variable name="var:v193" select="&quot;&quot;" />
            <xsl:attribute name="Date27">
              <xsl:value-of select="$var:v193" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v196)='true'">
            <xsl:variable name="var:v197" select="ForecastDateRecord/FCDate28/text()" />
            <xsl:variable name="var:v198" select="userCSharp:H1Date28(string($var:v197))" />
            <xsl:attribute name="Date28">
              <xsl:value-of select="$var:v198" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v199)='true'">
            <xsl:variable name="var:v200" select="&quot;&quot;" />
            <xsl:attribute name="Date28">
              <xsl:value-of select="$var:v200" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v203)='true'">
            <xsl:variable name="var:v204" select="ForecastDateRecord/FCDate29/text()" />
            <xsl:variable name="var:v205" select="userCSharp:H1Date29(string($var:v204))" />
            <xsl:attribute name="Date29">
              <xsl:value-of select="$var:v205" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v206)='true'">
            <xsl:variable name="var:v207" select="&quot;&quot;" />
            <xsl:attribute name="Date29">
              <xsl:value-of select="$var:v207" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v210)='true'">
            <xsl:variable name="var:v211" select="ForecastDateRecord/FCDate30/text()" />
            <xsl:variable name="var:v212" select="userCSharp:H1Date30(string($var:v211))" />
            <xsl:attribute name="Date30">
              <xsl:value-of select="$var:v212" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v213)='true'">
            <xsl:variable name="var:v214" select="&quot;&quot;" />
            <xsl:attribute name="Date30">
              <xsl:value-of select="$var:v214" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v217)='true'">
            <xsl:variable name="var:v218" select="ForecastDateRecord/FCDate31/text()" />
            <xsl:variable name="var:v219" select="userCSharp:H1Date31(string($var:v218))" />
            <xsl:attribute name="Date31">
              <xsl:value-of select="$var:v219" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v220)='true'">
            <xsl:variable name="var:v221" select="&quot;&quot;" />
            <xsl:attribute name="Date31">
              <xsl:value-of select="$var:v221" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v224)='true'">
            <xsl:variable name="var:v225" select="ForecastDateRecord/FCDate32/text()" />
            <xsl:variable name="var:v226" select="userCSharp:H1Date32(string($var:v225))" />
            <xsl:attribute name="Date32">
              <xsl:value-of select="$var:v226" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v227)='true'">
            <xsl:variable name="var:v228" select="&quot;&quot;" />
            <xsl:attribute name="Date32">
              <xsl:value-of select="$var:v228" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v231)='true'">
            <xsl:variable name="var:v232" select="ForecastDateRecord/FCDate33/text()" />
            <xsl:variable name="var:v233" select="userCSharp:H1Date33(string($var:v232))" />
            <xsl:attribute name="Date33">
              <xsl:value-of select="$var:v233" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v234)='true'">
            <xsl:variable name="var:v235" select="&quot;&quot;" />
            <xsl:attribute name="Date33">
              <xsl:value-of select="$var:v235" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v238)='true'">
            <xsl:variable name="var:v239" select="ForecastDateRecord/FCDate34/text()" />
            <xsl:variable name="var:v240" select="userCSharp:H1Date34(string($var:v239))" />
            <xsl:attribute name="Date34">
              <xsl:value-of select="$var:v240" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v241)='true'">
            <xsl:variable name="var:v242" select="&quot;&quot;" />
            <xsl:attribute name="Date34">
              <xsl:value-of select="$var:v242" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v245)='true'">
            <xsl:variable name="var:v246" select="ForecastDateRecord/FCDate35/text()" />
            <xsl:variable name="var:v247" select="userCSharp:H1Date35(string($var:v246))" />
            <xsl:attribute name="Date35">
              <xsl:value-of select="$var:v247" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v248)='true'">
            <xsl:variable name="var:v249" select="&quot;&quot;" />
            <xsl:attribute name="Date35">
              <xsl:value-of select="$var:v249" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v252)='true'">
            <xsl:variable name="var:v253" select="ForecastDateRecord/FCDate36/text()" />
            <xsl:variable name="var:v254" select="userCSharp:H1Date36(string($var:v253))" />
            <xsl:attribute name="Date36">
              <xsl:value-of select="$var:v254" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v255)='true'">
            <xsl:variable name="var:v256" select="&quot;&quot;" />
            <xsl:attribute name="Date36">
              <xsl:value-of select="$var:v256" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v259)='true'">
            <xsl:variable name="var:v260" select="ForecastDateRecord/FCDate37/text()" />
            <xsl:variable name="var:v261" select="userCSharp:H1Date37(string($var:v260))" />
            <xsl:attribute name="Date37">
              <xsl:value-of select="$var:v261" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v262)='true'">
            <xsl:variable name="var:v263" select="&quot;&quot;" />
            <xsl:attribute name="Date37">
              <xsl:value-of select="$var:v263" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v266)='true'">
            <xsl:variable name="var:v267" select="ForecastDateRecord/FCDate38/text()" />
            <xsl:variable name="var:v268" select="userCSharp:H1Date38(string($var:v267))" />
            <xsl:attribute name="Date38">
              <xsl:value-of select="$var:v268" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v269)='true'">
            <xsl:variable name="var:v270" select="&quot;&quot;" />
            <xsl:attribute name="Date38">
              <xsl:value-of select="$var:v270" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v273)='true'">
            <xsl:variable name="var:v274" select="ForecastDateRecord/FCDate39/text()" />
            <xsl:variable name="var:v275" select="userCSharp:H1Date39(string($var:v274))" />
            <xsl:attribute name="Date39">
              <xsl:value-of select="$var:v275" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v276)='true'">
            <xsl:variable name="var:v277" select="&quot;&quot;" />
            <xsl:attribute name="Date39">
              <xsl:value-of select="$var:v277" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v280)='true'">
            <xsl:variable name="var:v281" select="ForecastDateRecord/FCDate40/text()" />
            <xsl:variable name="var:v282" select="userCSharp:H1Date40(string($var:v281))" />
            <xsl:attribute name="Date40">
              <xsl:value-of select="$var:v282" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v283)='true'">
            <xsl:variable name="var:v284" select="&quot;&quot;" />
            <xsl:attribute name="Date40">
              <xsl:value-of select="$var:v284" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v287)='true'">
            <xsl:variable name="var:v288" select="ForecastDateRecord/FCDate41/text()" />
            <xsl:variable name="var:v289" select="userCSharp:H1Date41(string($var:v288))" />
            <xsl:attribute name="Date41">
              <xsl:value-of select="$var:v289" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v290)='true'">
            <xsl:variable name="var:v291" select="&quot;&quot;" />
            <xsl:attribute name="Date41">
              <xsl:value-of select="$var:v291" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v294)='true'">
            <xsl:variable name="var:v295" select="ForecastDateRecord/FCDate42/text()" />
            <xsl:variable name="var:v296" select="userCSharp:H1Date42(string($var:v295))" />
            <xsl:attribute name="Date42">
              <xsl:value-of select="$var:v296" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v297)='true'">
            <xsl:variable name="var:v298" select="&quot;&quot;" />
            <xsl:attribute name="Date42">
              <xsl:value-of select="$var:v298" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v301)='true'">
            <xsl:variable name="var:v302" select="ForecastDateRecord/FCDate43/text()" />
            <xsl:variable name="var:v303" select="userCSharp:H1Date43(string($var:v302))" />
            <xsl:attribute name="Date43">
              <xsl:value-of select="$var:v303" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v304)='true'">
            <xsl:variable name="var:v305" select="&quot;&quot;" />
            <xsl:attribute name="Date43">
              <xsl:value-of select="$var:v305" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v308)='true'">
            <xsl:variable name="var:v309" select="ForecastDateRecord/FCDate44/text()" />
            <xsl:variable name="var:v310" select="userCSharp:H1Date44(string($var:v309))" />
            <xsl:attribute name="Date44">
              <xsl:value-of select="$var:v310" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v311)='true'">
            <xsl:variable name="var:v312" select="&quot;&quot;" />
            <xsl:attribute name="Date44">
              <xsl:value-of select="$var:v312" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v315)='true'">
            <xsl:variable name="var:v316" select="ForecastDateRecord/FCDate45/text()" />
            <xsl:variable name="var:v317" select="userCSharp:H1Date45(string($var:v316))" />
            <xsl:attribute name="Date45">
              <xsl:value-of select="$var:v317" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v318)='true'">
            <xsl:variable name="var:v319" select="&quot;&quot;" />
            <xsl:attribute name="Date45">
              <xsl:value-of select="$var:v319" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v322)='true'">
            <xsl:variable name="var:v323" select="ForecastDateRecord/FCDate46/text()" />
            <xsl:variable name="var:v324" select="userCSharp:H1Date46(string($var:v323))" />
            <xsl:attribute name="Date46">
              <xsl:value-of select="$var:v324" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v325)='true'">
            <xsl:variable name="var:v326" select="&quot;&quot;" />
            <xsl:attribute name="Date46">
              <xsl:value-of select="$var:v326" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v329)='true'">
            <xsl:variable name="var:v330" select="ForecastDateRecord/FCDate47/text()" />
            <xsl:variable name="var:v331" select="userCSharp:H1Date47(string($var:v330))" />
            <xsl:attribute name="Date47">
              <xsl:value-of select="$var:v331" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v332)='true'">
            <xsl:variable name="var:v333" select="&quot;&quot;" />
            <xsl:attribute name="Date47">
              <xsl:value-of select="$var:v333" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v336)='true'">
            <xsl:variable name="var:v337" select="ForecastDateRecord/FCDate48/text()" />
            <xsl:variable name="var:v338" select="userCSharp:H1Date48(string($var:v337))" />
            <xsl:attribute name="Date48">
              <xsl:value-of select="$var:v338" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v339)='true'">
            <xsl:variable name="var:v340" select="&quot;&quot;" />
            <xsl:attribute name="Date48">
              <xsl:value-of select="$var:v340" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v343)='true'">
            <xsl:variable name="var:v344" select="ForecastDateRecord/FCDate49/text()" />
            <xsl:variable name="var:v345" select="userCSharp:H1Date49(string($var:v344))" />
            <xsl:attribute name="Date49">
              <xsl:value-of select="$var:v345" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v346)='true'">
            <xsl:variable name="var:v347" select="&quot;&quot;" />
            <xsl:attribute name="Date49">
              <xsl:value-of select="$var:v347" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v350)='true'">
            <xsl:variable name="var:v351" select="ForecastDateRecord/FCDate50/text()" />
            <xsl:variable name="var:v352" select="userCSharp:H1Date50(string($var:v351))" />
            <xsl:attribute name="Date50">
              <xsl:value-of select="$var:v352" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v355)='true'">
            <xsl:variable name="var:v356" select="ForecastDateRecord/FCDate51/text()" />
            <xsl:variable name="var:v357" select="userCSharp:H1Date51(string($var:v356))" />
            <xsl:attribute name="Date51">
              <xsl:value-of select="$var:v357" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v358)='true'">
            <xsl:variable name="var:v359" select="&quot;&quot;" />
            <xsl:attribute name="Date51">
              <xsl:value-of select="$var:v359" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v362)='true'">
            <xsl:variable name="var:v363" select="ForecastDateRecord/FCDate52/text()" />
            <xsl:variable name="var:v364" select="userCSharp:H1To(string($var:v363))" />
            <xsl:attribute name="Date52">
              <xsl:value-of select="$var:v364" />
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string($var:v365)='true'">
            <xsl:variable name="var:v366" select="&quot;&quot;" />
            <xsl:attribute name="Date52">
              <xsl:value-of select="$var:v366" />
            </xsl:attribute>
          </xsl:if>
        </ns0:Header1>
        <ns0:Header2>
          <xsl:attribute name="Month_Year">
            <xsl:value-of select="$var:v367" />
          </xsl:attribute>
          <xsl:variable name="var:v368" select="userCSharp:aDayEarlier1($var:v12 , string($var:v17))" />
          <xsl:variable name="var:v371" select="userCSharp:H2W1($var:v5 , string($var:v368) , string($var:v370))" />
          <xsl:attribute name="Date1">
            <xsl:value-of select="$var:v371" />
          </xsl:attribute>
          <xsl:variable name="var:v372" select="userCSharp:aDayEarlier2($var:v19 , string($var:v24))" />
          <xsl:variable name="var:v374" select="userCSharp:H2W2($var:v12 , string($var:v372) , string($var:v373))" />
          <xsl:attribute name="Date2">
            <xsl:value-of select="$var:v374" />
          </xsl:attribute>
          <xsl:variable name="var:v375" select="userCSharp:aDayEarlier3($var:v26 , string($var:v31))" />
          <xsl:variable name="var:v377" select="userCSharp:H2W3($var:v19 , string($var:v375) , string($var:v376))" />
          <xsl:attribute name="Date3">
            <xsl:value-of select="$var:v377" />
          </xsl:attribute>
          <xsl:variable name="var:v378" select="userCSharp:aDayEarlier4($var:v33 , string($var:v38))" />
          <xsl:variable name="var:v380" select="userCSharp:H2W4($var:v26 , string($var:v378) , string($var:v379))" />
          <xsl:attribute name="Date4">
            <xsl:value-of select="$var:v380" />
          </xsl:attribute>
          <xsl:variable name="var:v381" select="userCSharp:aDayEarlier5($var:v40 , string($var:v45))" />
          <xsl:variable name="var:v383" select="userCSharp:H2W5($var:v33 , string($var:v381) , string($var:v382))" />
          <xsl:attribute name="Date5">
            <xsl:value-of select="$var:v383" />
          </xsl:attribute>
          <xsl:variable name="var:v384" select="userCSharp:aDayEarlier6($var:v47 , string($var:v52))" />
          <xsl:variable name="var:v386" select="userCSharp:H2W6($var:v40 , string($var:v384) , string($var:v385))" />
          <xsl:attribute name="Date6">
            <xsl:value-of select="$var:v386" />
          </xsl:attribute>
          <xsl:variable name="var:v387" select="userCSharp:aDayEarlier7($var:v54 , string($var:v59))" />
          <xsl:variable name="var:v389" select="userCSharp:H2W7($var:v47 , string($var:v387) , string($var:v388))" />
          <xsl:attribute name="Date7">
            <xsl:value-of select="$var:v389" />
          </xsl:attribute>
          <xsl:variable name="var:v390" select="userCSharp:aDayEarlier8($var:v61 , string($var:v66))" />
          <xsl:variable name="var:v392" select="userCSharp:H2W8($var:v54 , string($var:v390) , string($var:v391))" />
          <xsl:attribute name="Date8">
            <xsl:value-of select="$var:v392" />
          </xsl:attribute>
          <xsl:variable name="var:v393" select="userCSharp:aDayEarlier9($var:v68 , string($var:v73))" />
          <xsl:variable name="var:v395" select="userCSharp:H2W9($var:v61 , string($var:v393) , string($var:v394))" />
          <xsl:attribute name="Date9">
            <xsl:value-of select="$var:v395" />
          </xsl:attribute>
          <xsl:variable name="var:v396" select="userCSharp:aDayEarlier10($var:v75 , string($var:v80))" />
          <xsl:variable name="var:v398" select="userCSharp:H2W10($var:v68 , string($var:v396) , string($var:v397))" />
          <xsl:attribute name="Date10">
            <xsl:value-of select="$var:v398" />
          </xsl:attribute>
          <xsl:variable name="var:v399" select="userCSharp:aDayEarlier11($var:v82 , string($var:v87))" />
          <xsl:variable name="var:v401" select="userCSharp:H2W11($var:v75 , string($var:v399) , string($var:v400))" />
          <xsl:attribute name="Date11">
            <xsl:value-of select="$var:v401" />
          </xsl:attribute>
          <xsl:variable name="var:v402" select="userCSharp:aDayEarlier12($var:v89 , string($var:v94))" />
          <xsl:variable name="var:v404" select="userCSharp:H2W12($var:v82 , string($var:v402) , string($var:v403))" />
          <xsl:attribute name="Date12">
            <xsl:value-of select="$var:v404" />
          </xsl:attribute>
          <xsl:variable name="var:v405" select="userCSharp:aDayEarlier13($var:v96 , string($var:v101))" />
          <xsl:variable name="var:v407" select="userCSharp:H2W13($var:v89 , string($var:v405) , string($var:v406))" />
          <xsl:attribute name="Date13">
            <xsl:value-of select="$var:v407" />
          </xsl:attribute>
          <xsl:variable name="var:v408" select="userCSharp:aDayEarlier14($var:v103 , string($var:v108))" />
          <xsl:variable name="var:v410" select="userCSharp:H2W14($var:v96 , string($var:v408) , string($var:v409))" />
          <xsl:attribute name="Date14">
            <xsl:value-of select="$var:v410" />
          </xsl:attribute>
          <xsl:variable name="var:v411" select="userCSharp:aDayEarlier15($var:v110 , string($var:v115))" />
          <xsl:variable name="var:v413" select="userCSharp:H2W15($var:v103 , string($var:v411) , string($var:v412))" />
          <xsl:attribute name="Date15">
            <xsl:value-of select="$var:v413" />
          </xsl:attribute>
          <xsl:variable name="var:v414" select="userCSharp:aDayEarlier16($var:v117 , string($var:v122))" />
          <xsl:variable name="var:v416" select="userCSharp:H2W16($var:v110 , string($var:v414) , string($var:v415))" />
          <xsl:attribute name="Date16">
            <xsl:value-of select="$var:v416" />
          </xsl:attribute>
          <xsl:variable name="var:v417" select="userCSharp:aDayEarlier17($var:v124 , string($var:v129))" />
          <xsl:variable name="var:v419" select="userCSharp:H2W17($var:v117 , string($var:v417) , string($var:v418))" />
          <xsl:attribute name="Date17">
            <xsl:value-of select="$var:v419" />
          </xsl:attribute>
          <xsl:variable name="var:v420" select="userCSharp:aDayEarlier18($var:v131 , string($var:v136))" />
          <xsl:variable name="var:v422" select="userCSharp:H2W18($var:v124 , string($var:v420) , string($var:v421))" />
          <xsl:attribute name="Date18">
            <xsl:value-of select="$var:v422" />
          </xsl:attribute>
          <xsl:variable name="var:v423" select="userCSharp:aDayEarlier19($var:v138 , string($var:v143))" />
          <xsl:variable name="var:v425" select="userCSharp:H2W19($var:v131 , string($var:v423) , string($var:v424))" />
          <xsl:attribute name="Date19">
            <xsl:value-of select="$var:v425" />
          </xsl:attribute>
          <xsl:variable name="var:v426" select="userCSharp:aDayEarlier20($var:v145 , string($var:v150))" />
          <xsl:variable name="var:v428" select="userCSharp:H2W20($var:v138 , string($var:v426) , string($var:v427))" />
          <xsl:attribute name="Date20">
            <xsl:value-of select="$var:v428" />
          </xsl:attribute>
          <xsl:variable name="var:v429" select="userCSharp:aDayEarlier21($var:v152 , string($var:v157))" />
          <xsl:variable name="var:v431" select="userCSharp:H2W21($var:v145 , string($var:v429) , string($var:v430))" />
          <xsl:attribute name="Date21">
            <xsl:value-of select="$var:v431" />
          </xsl:attribute>
          <xsl:variable name="var:v432" select="userCSharp:aDayEarlier22($var:v159 , string($var:v164))" />
          <xsl:variable name="var:v434" select="userCSharp:H2W22($var:v152 , string($var:v432) , string($var:v433))" />
          <xsl:attribute name="Date22">
            <xsl:value-of select="$var:v434" />
          </xsl:attribute>
          <xsl:variable name="var:v435" select="userCSharp:aDayEarlier23($var:v166 , string($var:v171))" />
          <xsl:variable name="var:v437" select="userCSharp:H2W23($var:v159 , string($var:v435) , string($var:v436))" />
          <xsl:attribute name="Date23">
            <xsl:value-of select="$var:v437" />
          </xsl:attribute>
          <xsl:variable name="var:v438" select="userCSharp:aDayEarlier24($var:v173 , string($var:v178))" />
          <xsl:variable name="var:v440" select="userCSharp:H2W24($var:v166 , string($var:v438) , string($var:v439))" />
          <xsl:attribute name="Date24">
            <xsl:value-of select="$var:v440" />
          </xsl:attribute>
          <xsl:variable name="var:v441" select="userCSharp:aDayEarlier25($var:v180 , string($var:v185))" />
          <xsl:variable name="var:v443" select="userCSharp:H2W25($var:v173 , string($var:v441) , string($var:v442))" />
          <xsl:attribute name="Date25">
            <xsl:value-of select="$var:v443" />
          </xsl:attribute>
          <xsl:variable name="var:v444" select="userCSharp:aDayEarlier26($var:v187 , string($var:v192))" />
          <xsl:variable name="var:v446" select="userCSharp:H2W26($var:v180 , string($var:v444) , string($var:v445))" />
          <xsl:attribute name="Date26">
            <xsl:value-of select="$var:v446" />
          </xsl:attribute>
          <xsl:variable name="var:v447" select="userCSharp:aDayEarlier27($var:v194 , string($var:v199))" />
          <xsl:variable name="var:v449" select="userCSharp:H2W27($var:v187 , string($var:v447) , string($var:v448))" />
          <xsl:attribute name="Date27">
            <xsl:value-of select="$var:v449" />
          </xsl:attribute>
          <xsl:variable name="var:v450" select="userCSharp:aDayEarlier28($var:v201 , string($var:v206))" />
          <xsl:variable name="var:v452" select="userCSharp:H2W28($var:v194 , string($var:v450) , string($var:v451))" />
          <xsl:attribute name="Date28">
            <xsl:value-of select="$var:v452" />
          </xsl:attribute>
          <xsl:variable name="var:v453" select="userCSharp:aDayEarlier29($var:v208 , string($var:v213))" />
          <xsl:variable name="var:v455" select="userCSharp:H2W29($var:v201 , string($var:v453) , string($var:v454))" />
          <xsl:attribute name="Date29">
            <xsl:value-of select="$var:v455" />
          </xsl:attribute>
          <xsl:variable name="var:v456" select="userCSharp:aDayEarlier30($var:v215 , string($var:v220))" />
          <xsl:variable name="var:v458" select="userCSharp:H2W30($var:v208 , string($var:v456) , string($var:v457))" />
          <xsl:attribute name="Date30">
            <xsl:value-of select="$var:v458" />
          </xsl:attribute>
          <xsl:variable name="var:v459" select="userCSharp:aDayEarlier31($var:v222 , string($var:v227))" />
          <xsl:variable name="var:v461" select="userCSharp:H2W31($var:v215 , string($var:v459) , string($var:v460))" />
          <xsl:attribute name="Date31">
            <xsl:value-of select="$var:v461" />
          </xsl:attribute>
          <xsl:variable name="var:v462" select="userCSharp:aDayEarlier32($var:v229 , string($var:v234))" />
          <xsl:variable name="var:v464" select="userCSharp:H2W32($var:v222 , string($var:v462) , string($var:v463))" />
          <xsl:attribute name="Date32">
            <xsl:value-of select="$var:v464" />
          </xsl:attribute>
          <xsl:variable name="var:v465" select="userCSharp:aDayEarlier33($var:v236 , string($var:v241))" />
          <xsl:variable name="var:v467" select="userCSharp:H2W33($var:v229 , string($var:v465) , string($var:v466))" />
          <xsl:attribute name="Date33">
            <xsl:value-of select="$var:v467" />
          </xsl:attribute>
          <xsl:variable name="var:v468" select="userCSharp:aDayEarlier34($var:v243 , string($var:v248))" />
          <xsl:variable name="var:v470" select="userCSharp:H2W34($var:v236 , string($var:v468) , string($var:v469))" />
          <xsl:attribute name="Date34">
            <xsl:value-of select="$var:v470" />
          </xsl:attribute>
          <xsl:variable name="var:v471" select="userCSharp:aDayEarlier35($var:v250 , string($var:v255))" />
          <xsl:variable name="var:v473" select="userCSharp:H2W35($var:v243 , string($var:v471) , string($var:v472))" />
          <xsl:attribute name="Date35">
            <xsl:value-of select="$var:v473" />
          </xsl:attribute>
          <xsl:variable name="var:v474" select="userCSharp:aDayEarlier36($var:v257 , string($var:v262))" />
          <xsl:variable name="var:v476" select="userCSharp:H2W36($var:v250 , string($var:v474) , string($var:v475))" />
          <xsl:attribute name="Date36">
            <xsl:value-of select="$var:v476" />
          </xsl:attribute>
          <xsl:variable name="var:v477" select="userCSharp:aDayEarlier37($var:v264 , string($var:v269))" />
          <xsl:variable name="var:v479" select="userCSharp:H2W37($var:v257 , string($var:v477) , string($var:v478))" />
          <xsl:attribute name="Date37">
            <xsl:value-of select="$var:v479" />
          </xsl:attribute>
          <xsl:variable name="var:v480" select="userCSharp:aDayEarlier38($var:v271 , string($var:v276))" />
          <xsl:variable name="var:v482" select="userCSharp:H2W38($var:v264 , string($var:v480) , string($var:v481))" />
          <xsl:attribute name="Date38">
            <xsl:value-of select="$var:v482" />
          </xsl:attribute>
          <xsl:variable name="var:v483" select="userCSharp:aDayEarlier39($var:v278 , string($var:v283))" />
          <xsl:variable name="var:v485" select="userCSharp:H2W39($var:v271 , string($var:v483) , string($var:v484))" />
          <xsl:attribute name="Date39">
            <xsl:value-of select="$var:v485" />
          </xsl:attribute>
          <xsl:variable name="var:v486" select="userCSharp:aDayEarlier40($var:v285 , string($var:v290))" />
          <xsl:variable name="var:v488" select="userCSharp:H2W40($var:v278 , string($var:v486) , string($var:v487))" />
          <xsl:attribute name="Date40">
            <xsl:value-of select="$var:v488" />
          </xsl:attribute>
          <xsl:variable name="var:v489" select="userCSharp:aDayEarlier41($var:v292 , string($var:v297))" />
          <xsl:variable name="var:v491" select="userCSharp:H2W41($var:v285 , string($var:v489) , string($var:v490))" />
          <xsl:attribute name="Date41">
            <xsl:value-of select="$var:v491" />
          </xsl:attribute>
          <xsl:variable name="var:v492" select="userCSharp:aDayEarlier42($var:v299 , string($var:v304))" />
          <xsl:variable name="var:v494" select="userCSharp:H2W42($var:v292 , string($var:v492) , string($var:v493))" />
          <xsl:attribute name="Date42">
            <xsl:value-of select="$var:v494" />
          </xsl:attribute>
          <xsl:variable name="var:v495" select="userCSharp:aDayEarlier43($var:v306 , string($var:v311))" />
          <xsl:variable name="var:v497" select="userCSharp:H2W43($var:v299 , string($var:v495) , string($var:v496))" />
          <xsl:attribute name="Date43">
            <xsl:value-of select="$var:v497" />
          </xsl:attribute>
          <xsl:variable name="var:v498" select="userCSharp:aDayEarlier44($var:v313 , string($var:v318))" />
          <xsl:variable name="var:v500" select="userCSharp:H2W44($var:v306 , string($var:v498) , string($var:v499))" />
          <xsl:attribute name="Date44">
            <xsl:value-of select="$var:v500" />
          </xsl:attribute>
          <xsl:variable name="var:v501" select="userCSharp:aDayEarlier45($var:v320 , string($var:v325))" />
          <xsl:variable name="var:v503" select="userCSharp:H2W45($var:v313 , string($var:v501) , string($var:v502))" />
          <xsl:attribute name="Date45">
            <xsl:value-of select="$var:v503" />
          </xsl:attribute>
          <xsl:variable name="var:v504" select="userCSharp:aDayEarlier46($var:v327 , string($var:v332))" />
          <xsl:variable name="var:v506" select="userCSharp:H2W46($var:v320 , string($var:v504) , string($var:v505))" />
          <xsl:attribute name="Date46">
            <xsl:value-of select="$var:v506" />
          </xsl:attribute>
          <xsl:variable name="var:v507" select="userCSharp:aDayEarlier47($var:v334 , string($var:v339))" />
          <xsl:variable name="var:v509" select="userCSharp:H2W47($var:v327 , string($var:v507) , string($var:v508))" />
          <xsl:attribute name="Date47">
            <xsl:value-of select="$var:v509" />
          </xsl:attribute>
          <xsl:variable name="var:v510" select="userCSharp:aDayEarlier48($var:v341 , string($var:v346))" />
          <xsl:variable name="var:v512" select="userCSharp:H2W48($var:v334 , string($var:v510) , string($var:v511))" />
          <xsl:attribute name="Date48">
            <xsl:value-of select="$var:v512" />
          </xsl:attribute>
          <xsl:variable name="var:v514" select="userCSharp:aDayEarlier49($var:v348 , string($var:v513))" />
          <xsl:variable name="var:v516" select="userCSharp:H2W49($var:v341 , string($var:v514) , string($var:v515))" />
          <xsl:attribute name="Date49">
            <xsl:value-of select="$var:v516" />
          </xsl:attribute>
          <xsl:variable name="var:v517" select="userCSharp:aDayEarlier50($var:v353 , string($var:v358))" />
          <xsl:variable name="var:v519" select="userCSharp:H2W50($var:v348 , string($var:v517) , string($var:v518))" />
          <xsl:attribute name="Date50">
            <xsl:value-of select="$var:v519" />
          </xsl:attribute>
          <xsl:variable name="var:v520" select="userCSharp:aDayEarlier51($var:v360 , string($var:v365))" />
          <xsl:variable name="var:v522" select="userCSharp:H2W51($var:v353 , string($var:v520) , string($var:v521))" />
          <xsl:attribute name="Date51">
            <xsl:value-of select="$var:v522" />
          </xsl:attribute>
          <xsl:variable name="var:v524" select="userCSharp:H2W52($var:v360 , string($var:v523))" />
          <xsl:attribute name="Date52">
            <xsl:value-of select="$var:v524" />
          </xsl:attribute>
        </ns0:Header2>
        <ns0:Header3>
          <xsl:attribute name="Customer">
            <xsl:value-of select="$var:v525" />
          </xsl:attribute>
          <xsl:attribute name="Name">
            <xsl:value-of select="$var:v526" />
          </xsl:attribute>
          <xsl:attribute name="Ship_To">
            <xsl:value-of select="$var:v527" />
          </xsl:attribute>
          <xsl:attribute name="Product">
            <xsl:value-of select="$var:v528" />
          </xsl:attribute>
          <xsl:attribute name="Description">
            <xsl:value-of select="$var:v529" />
          </xsl:attribute>
          <xsl:attribute name="Qty1">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty2">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty3">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty4">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty5">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty6">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty7">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty8">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty9">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty10">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty11">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty12">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty13">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty14">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty15">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty16">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty17">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty18">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty19">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty20">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty21">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty22">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty23">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty24">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty25">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty26">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty27">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty28">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty29">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty30">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty31">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty32">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty33">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty34">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty35">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty36">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty37">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty38">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty39">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty40">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty41">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty42">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty43">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty44">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty45">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty46">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty47">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty48">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty49">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty50">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty51">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
          <xsl:attribute name="Qty52">
            <xsl:value-of select="$var:v530" />
          </xsl:attribute>
        </ns0:Header3>
        <xsl:for-each select="Product">
          <xsl:variable name="var:v531" select="userCSharp:StringSize(string(MaterialID/text()))" />
          <xsl:variable name="var:v532" select="userCSharp:LogicalGt(string($var:v531) , &quot;0&quot;)" />
          <xsl:variable name="var:v533" select="userCSharp:LogicalGt(string(Qty1/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v534" select="userCSharp:LogicalGt(string(Qty2/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v535" select="userCSharp:LogicalGt(string(Qty3/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v536" select="userCSharp:LogicalGt(string(Qty4/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v537" select="userCSharp:LogicalGt(string(Qty5/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v538" select="userCSharp:LogicalGt(string(Qty7/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v539" select="userCSharp:LogicalGt(string(Qty8/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v540" select="userCSharp:LogicalGt(string(Qty9/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v541" select="userCSharp:LogicalGt(string(Qty10/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v542" select="userCSharp:LogicalGt(string(Qty6/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v543" select="userCSharp:LogicalGt(string(Qty11/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v544" select="userCSharp:LogicalGt(string(Qty12/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v545" select="userCSharp:LogicalGt(string(Qty13/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v546" select="userCSharp:LogicalGt(string(Qty14/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v547" select="userCSharp:LogicalGt(string(Qty15/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v548" select="userCSharp:LogicalGt(string(Qty16/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v549" select="userCSharp:LogicalGt(string(Qty17/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v550" select="userCSharp:LogicalGt(string(Qty18/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v551" select="userCSharp:LogicalGt(string(Qty19/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v552" select="userCSharp:LogicalGt(string(Qty20/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v553" select="userCSharp:LogicalGt(string(Qty21/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v554" select="userCSharp:LogicalGt(string(Qty22/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v555" select="userCSharp:LogicalGt(string(Qty23/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v556" select="userCSharp:LogicalGt(string(Qty24/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v557" select="userCSharp:LogicalGt(string(Qty25/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v558" select="userCSharp:LogicalGt(string(Qty26/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v559" select="userCSharp:LogicalGt(string(Qty27/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v560" select="userCSharp:LogicalGt(string(Qty28/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v561" select="userCSharp:LogicalGt(string(Qty29/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v562" select="userCSharp:LogicalGt(string(Qty30/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v563" select="userCSharp:LogicalGt(string(Qty31/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v564" select="userCSharp:LogicalGt(string(Qty32/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v565" select="userCSharp:LogicalGt(string(Qty33/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v566" select="userCSharp:LogicalGt(string(Qty34/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v567" select="userCSharp:LogicalGt(string(Qty35/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v568" select="userCSharp:LogicalGt(string(Qty36/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v569" select="userCSharp:LogicalGt(string(Qty37/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v570" select="userCSharp:LogicalGt(string(Qty38/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v571" select="userCSharp:LogicalGt(string(Qty39/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v572" select="userCSharp:LogicalGt(string(Qty40/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v573" select="userCSharp:LogicalGt(string(Qty41/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v574" select="userCSharp:LogicalGt(string(Qty42/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v575" select="userCSharp:LogicalGt(string(Qty43/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v576" select="userCSharp:LogicalGt(string(Qty44/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v577" select="userCSharp:LogicalGt(string(Qty45/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v578" select="userCSharp:LogicalGt(string(Qty46/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v579" select="userCSharp:LogicalGt(string(Qty47/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v580" select="userCSharp:LogicalGt(string(Qty48/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v581" select="userCSharp:LogicalGt(string(Qty49/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v582" select="userCSharp:LogicalGt(string(Qty50/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v583" select="userCSharp:LogicalGt(string(Qty51/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v584" select="userCSharp:LogicalGt(string(Qty52/text()) , &quot;0&quot;)" />
          <xsl:variable name="var:v585" select="userCSharp:LogicalOr(string($var:v533) , string($var:v534) , string($var:v535) , string($var:v536) , string($var:v537) , string($var:v538) , string($var:v539) , string($var:v540) , string($var:v541) , string($var:v542) , string($var:v543) , string($var:v544) , string($var:v545) , string($var:v546) , string($var:v547) , string($var:v548) , string($var:v549) , string($var:v550) , string($var:v551) , string($var:v552) , string($var:v553) , string($var:v554) , string($var:v555) , string($var:v556) , string($var:v557) , string($var:v558) , string($var:v559) , string($var:v560) , string($var:v561) , string($var:v562) , string($var:v563) , string($var:v564) , string($var:v565) , string($var:v566) , string($var:v567) , string($var:v568) , string($var:v569) , string($var:v570) , string($var:v571) , string($var:v572) , string($var:v573) , string($var:v574) , string($var:v575) , string($var:v576) , string($var:v577) , string($var:v578) , string($var:v579) , string($var:v580) , string($var:v581) , string($var:v582) , string($var:v583) , string($var:v584))" />
          <xsl:variable name="var:v586" select="userCSharp:LogicalAnd(string($var:v532) , string($var:v585))" />
          <xsl:if test="$var:v586">
            <xsl:variable name="var:v587" select="userCSharp:LogicalEq(string(UOM/text()) , &quot;EA&quot;)" />
            <xsl:variable name="var:v589" select="string(UOM/text())" />
            <xsl:variable name="var:v590" select="userCSharp:LogicalEq($var:v589 , &quot;TH&quot;)" />
            <ns0:Detail>
              <xsl:attribute name="Customer">
                <xsl:value-of select="../CustomerSAPCode/text()" />
              </xsl:attribute>
              <xsl:attribute name="Name">
                <xsl:value-of select="../CustomerName/text()" />
              </xsl:attribute>
              <xsl:attribute name="Ship_To">
                <xsl:value-of select="../ShipToCode/text()" />
              </xsl:attribute>
              <xsl:attribute name="Product">
                <xsl:value-of select="MaterialID/text()" />
              </xsl:attribute>
              <xsl:attribute name="Description">
                <xsl:value-of select="ProductDescription/text()" />
              </xsl:attribute>
              <xsl:attribute name="UOM">
                <xsl:value-of select="UOM/text()" />
              </xsl:attribute>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v588" select="Qty1/text()" />
                <xsl:attribute name="Qty1">
                  <xsl:value-of select="$var:v588" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v591" select="Qty1/text()" />
                <xsl:variable name="var:v592" select="userCSharp:MathDivide(string($var:v591) , &quot;1000&quot;)" />
                <xsl:variable name="var:v593" select="userCSharp:MathRound(string($var:v592) , &quot;3&quot;)" />
                <xsl:attribute name="Qty1">
                  <xsl:value-of select="$var:v593" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v594" select="Qty2/text()" />
                <xsl:attribute name="Qty2">
                  <xsl:value-of select="$var:v594" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v595" select="Qty2/text()" />
                <xsl:variable name="var:v596" select="userCSharp:MathDivide(string($var:v595) , &quot;1000&quot;)" />
                <xsl:variable name="var:v597" select="userCSharp:MathRound(string($var:v596) , &quot;3&quot;)" />
                <xsl:attribute name="Qty2">
                  <xsl:value-of select="$var:v597" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v598" select="Qty3/text()" />
                <xsl:attribute name="Qty3">
                  <xsl:value-of select="$var:v598" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v599" select="Qty3/text()" />
                <xsl:variable name="var:v600" select="userCSharp:MathDivide(string($var:v599) , &quot;1000&quot;)" />
                <xsl:variable name="var:v601" select="userCSharp:MathRound(string($var:v600) , &quot;3&quot;)" />
                <xsl:attribute name="Qty3">
                  <xsl:value-of select="$var:v601" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v602" select="Qty4/text()" />
                <xsl:attribute name="Qty4">
                  <xsl:value-of select="$var:v602" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v603" select="Qty4/text()" />
                <xsl:variable name="var:v604" select="userCSharp:MathDivide(string($var:v603) , &quot;1000&quot;)" />
                <xsl:variable name="var:v605" select="userCSharp:MathRound(string($var:v604) , &quot;3&quot;)" />
                <xsl:attribute name="Qty4">
                  <xsl:value-of select="$var:v605" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v606" select="Qty5/text()" />
                <xsl:attribute name="Qty5">
                  <xsl:value-of select="$var:v606" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v607" select="Qty5/text()" />
                <xsl:variable name="var:v608" select="userCSharp:MathDivide(string($var:v607) , &quot;1000&quot;)" />
                <xsl:variable name="var:v609" select="userCSharp:MathRound(string($var:v608) , &quot;3&quot;)" />
                <xsl:attribute name="Qty5">
                  <xsl:value-of select="$var:v609" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v610" select="Qty6/text()" />
                <xsl:attribute name="Qty6">
                  <xsl:value-of select="$var:v610" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v611" select="Qty6/text()" />
                <xsl:variable name="var:v612" select="userCSharp:MathDivide(string($var:v611) , &quot;1000&quot;)" />
                <xsl:variable name="var:v613" select="userCSharp:MathRound(string($var:v612) , &quot;3&quot;)" />
                <xsl:attribute name="Qty6">
                  <xsl:value-of select="$var:v613" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v614" select="Qty7/text()" />
                <xsl:attribute name="Qty7">
                  <xsl:value-of select="$var:v614" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v615" select="Qty7/text()" />
                <xsl:variable name="var:v616" select="userCSharp:MathDivide(string($var:v615) , &quot;1000&quot;)" />
                <xsl:variable name="var:v617" select="userCSharp:MathRound(string($var:v616) , &quot;3&quot;)" />
                <xsl:attribute name="Qty7">
                  <xsl:value-of select="$var:v617" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v618" select="Qty8/text()" />
                <xsl:attribute name="Qty8">
                  <xsl:value-of select="$var:v618" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v619" select="Qty8/text()" />
                <xsl:variable name="var:v620" select="userCSharp:MathDivide(string($var:v619) , &quot;1000&quot;)" />
                <xsl:variable name="var:v621" select="userCSharp:MathRound(string($var:v620) , &quot;3&quot;)" />
                <xsl:attribute name="Qty8">
                  <xsl:value-of select="$var:v621" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v622" select="Qty9/text()" />
                <xsl:attribute name="Qty9">
                  <xsl:value-of select="$var:v622" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v623" select="Qty9/text()" />
                <xsl:variable name="var:v624" select="userCSharp:MathDivide(string($var:v623) , &quot;1000&quot;)" />
                <xsl:variable name="var:v625" select="userCSharp:MathRound(string($var:v624) , &quot;3&quot;)" />
                <xsl:attribute name="Qty9">
                  <xsl:value-of select="$var:v625" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v626" select="Qty10/text()" />
                <xsl:attribute name="Qty10">
                  <xsl:value-of select="$var:v626" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v627" select="Qty10/text()" />
                <xsl:variable name="var:v628" select="userCSharp:MathDivide(string($var:v627) , &quot;1000&quot;)" />
                <xsl:variable name="var:v629" select="userCSharp:MathRound(string($var:v628) , &quot;3&quot;)" />
                <xsl:attribute name="Qty10">
                  <xsl:value-of select="$var:v629" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v630" select="Qty11/text()" />
                <xsl:attribute name="Qty11">
                  <xsl:value-of select="$var:v630" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v631" select="Qty11/text()" />
                <xsl:variable name="var:v632" select="userCSharp:MathDivide(string($var:v631) , &quot;1000&quot;)" />
                <xsl:variable name="var:v633" select="userCSharp:MathRound(string($var:v632) , &quot;3&quot;)" />
                <xsl:attribute name="Qty11">
                  <xsl:value-of select="$var:v633" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v634" select="Qty12/text()" />
                <xsl:attribute name="Qty12">
                  <xsl:value-of select="$var:v634" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v635" select="Qty12/text()" />
                <xsl:variable name="var:v636" select="userCSharp:MathDivide(string($var:v635) , &quot;1000&quot;)" />
                <xsl:variable name="var:v637" select="userCSharp:MathRound(string($var:v636) , &quot;3&quot;)" />
                <xsl:attribute name="Qty12">
                  <xsl:value-of select="$var:v637" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v638" select="Qty13/text()" />
                <xsl:attribute name="Qty13">
                  <xsl:value-of select="$var:v638" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v639" select="Qty13/text()" />
                <xsl:variable name="var:v640" select="userCSharp:MathDivide(string($var:v639) , &quot;1000&quot;)" />
                <xsl:variable name="var:v641" select="userCSharp:MathRound(string($var:v640) , &quot;3&quot;)" />
                <xsl:attribute name="Qty13">
                  <xsl:value-of select="$var:v641" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v642" select="Qty14/text()" />
                <xsl:attribute name="Qty14">
                  <xsl:value-of select="$var:v642" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v643" select="Qty14/text()" />
                <xsl:variable name="var:v644" select="userCSharp:MathDivide(string($var:v643) , &quot;1000&quot;)" />
                <xsl:variable name="var:v645" select="userCSharp:MathRound(string($var:v644) , &quot;3&quot;)" />
                <xsl:attribute name="Qty14">
                  <xsl:value-of select="$var:v645" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v646" select="Qty15/text()" />
                <xsl:attribute name="Qty15">
                  <xsl:value-of select="$var:v646" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v647" select="Qty15/text()" />
                <xsl:variable name="var:v648" select="userCSharp:MathDivide(string($var:v647) , &quot;1000&quot;)" />
                <xsl:variable name="var:v649" select="userCSharp:MathRound(string($var:v648) , &quot;3&quot;)" />
                <xsl:attribute name="Qty15">
                  <xsl:value-of select="$var:v649" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v650" select="Qty16/text()" />
                <xsl:attribute name="Qty16">
                  <xsl:value-of select="$var:v650" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v651" select="Qty16/text()" />
                <xsl:variable name="var:v652" select="userCSharp:MathDivide(string($var:v651) , &quot;1000&quot;)" />
                <xsl:variable name="var:v653" select="userCSharp:MathRound(string($var:v652) , &quot;3&quot;)" />
                <xsl:attribute name="Qty16">
                  <xsl:value-of select="$var:v653" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v654" select="Qty17/text()" />
                <xsl:attribute name="Qty17">
                  <xsl:value-of select="$var:v654" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v655" select="Qty17/text()" />
                <xsl:variable name="var:v656" select="userCSharp:MathDivide(string($var:v655) , &quot;1000&quot;)" />
                <xsl:variable name="var:v657" select="userCSharp:MathRound(string($var:v656) , &quot;3&quot;)" />
                <xsl:attribute name="Qty17">
                  <xsl:value-of select="$var:v657" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v658" select="Qty18/text()" />
                <xsl:attribute name="Qty18">
                  <xsl:value-of select="$var:v658" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v659" select="Qty18/text()" />
                <xsl:variable name="var:v660" select="userCSharp:MathDivide(string($var:v659) , &quot;1000&quot;)" />
                <xsl:variable name="var:v661" select="userCSharp:MathRound(string($var:v660) , &quot;3&quot;)" />
                <xsl:attribute name="Qty18">
                  <xsl:value-of select="$var:v661" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v662" select="Qty19/text()" />
                <xsl:attribute name="Qty19">
                  <xsl:value-of select="$var:v662" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v663" select="Qty19/text()" />
                <xsl:variable name="var:v664" select="userCSharp:MathDivide(string($var:v663) , &quot;1000&quot;)" />
                <xsl:variable name="var:v665" select="userCSharp:MathRound(string($var:v664) , &quot;3&quot;)" />
                <xsl:attribute name="Qty19">
                  <xsl:value-of select="$var:v665" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v666" select="Qty20/text()" />
                <xsl:attribute name="Qty20">
                  <xsl:value-of select="$var:v666" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v667" select="Qty20/text()" />
                <xsl:variable name="var:v668" select="userCSharp:MathDivide(string($var:v667) , &quot;1000&quot;)" />
                <xsl:variable name="var:v669" select="userCSharp:MathRound(string($var:v668) , &quot;3&quot;)" />
                <xsl:attribute name="Qty20">
                  <xsl:value-of select="$var:v669" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v670" select="Qty21/text()" />
                <xsl:attribute name="Qty21">
                  <xsl:value-of select="$var:v670" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v671" select="Qty21/text()" />
                <xsl:variable name="var:v672" select="userCSharp:MathDivide(string($var:v671) , &quot;1000&quot;)" />
                <xsl:variable name="var:v673" select="userCSharp:MathRound(string($var:v672) , &quot;3&quot;)" />
                <xsl:attribute name="Qty21">
                  <xsl:value-of select="$var:v673" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v674" select="Qty22/text()" />
                <xsl:attribute name="Qty22">
                  <xsl:value-of select="$var:v674" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v675" select="Qty22/text()" />
                <xsl:variable name="var:v676" select="userCSharp:MathDivide(string($var:v675) , &quot;1000&quot;)" />
                <xsl:variable name="var:v677" select="userCSharp:MathRound(string($var:v676) , &quot;3&quot;)" />
                <xsl:attribute name="Qty22">
                  <xsl:value-of select="$var:v677" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v678" select="Qty23/text()" />
                <xsl:attribute name="Qty23">
                  <xsl:value-of select="$var:v678" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v679" select="Qty23/text()" />
                <xsl:variable name="var:v680" select="userCSharp:MathDivide(string($var:v679) , &quot;1000&quot;)" />
                <xsl:variable name="var:v681" select="userCSharp:MathRound(string($var:v680) , &quot;3&quot;)" />
                <xsl:attribute name="Qty23">
                  <xsl:value-of select="$var:v681" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v682" select="Qty24/text()" />
                <xsl:attribute name="Qty24">
                  <xsl:value-of select="$var:v682" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v683" select="Qty24/text()" />
                <xsl:variable name="var:v684" select="userCSharp:MathDivide(string($var:v683) , &quot;1000&quot;)" />
                <xsl:variable name="var:v685" select="userCSharp:MathRound(string($var:v684) , &quot;3&quot;)" />
                <xsl:attribute name="Qty24">
                  <xsl:value-of select="$var:v685" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v686" select="Qty25/text()" />
                <xsl:attribute name="Qty25">
                  <xsl:value-of select="$var:v686" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v687" select="Qty25/text()" />
                <xsl:variable name="var:v688" select="userCSharp:MathDivide(string($var:v687) , &quot;1000&quot;)" />
                <xsl:variable name="var:v689" select="userCSharp:MathRound(string($var:v688) , &quot;3&quot;)" />
                <xsl:attribute name="Qty25">
                  <xsl:value-of select="$var:v689" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v690" select="Qty26/text()" />
                <xsl:attribute name="Qty26">
                  <xsl:value-of select="$var:v690" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v691" select="Qty26/text()" />
                <xsl:variable name="var:v692" select="userCSharp:MathDivide(string($var:v691) , &quot;1000&quot;)" />
                <xsl:variable name="var:v693" select="userCSharp:MathRound(string($var:v692) , &quot;3&quot;)" />
                <xsl:attribute name="Qty26">
                  <xsl:value-of select="$var:v693" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v694" select="Qty27/text()" />
                <xsl:attribute name="Qty27">
                  <xsl:value-of select="$var:v694" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v695" select="Qty27/text()" />
                <xsl:variable name="var:v696" select="userCSharp:MathDivide(string($var:v695) , &quot;1000&quot;)" />
                <xsl:variable name="var:v697" select="userCSharp:MathRound(string($var:v696) , &quot;3&quot;)" />
                <xsl:attribute name="Qty27">
                  <xsl:value-of select="$var:v697" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v698" select="Qty28/text()" />
                <xsl:attribute name="Qty28">
                  <xsl:value-of select="$var:v698" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v699" select="Qty28/text()" />
                <xsl:variable name="var:v700" select="userCSharp:MathDivide(string($var:v699) , &quot;1000&quot;)" />
                <xsl:variable name="var:v701" select="userCSharp:MathRound(string($var:v700) , &quot;3&quot;)" />
                <xsl:attribute name="Qty28">
                  <xsl:value-of select="$var:v701" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v702" select="Qty29/text()" />
                <xsl:attribute name="Qty29">
                  <xsl:value-of select="$var:v702" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v703" select="Qty29/text()" />
                <xsl:variable name="var:v704" select="userCSharp:MathDivide(string($var:v703) , &quot;1000&quot;)" />
                <xsl:variable name="var:v705" select="userCSharp:MathRound(string($var:v704) , &quot;3&quot;)" />
                <xsl:attribute name="Qty29">
                  <xsl:value-of select="$var:v705" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v706" select="Qty30/text()" />
                <xsl:attribute name="Qty30">
                  <xsl:value-of select="$var:v706" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v707" select="Qty30/text()" />
                <xsl:variable name="var:v708" select="userCSharp:MathDivide(string($var:v707) , &quot;1000&quot;)" />
                <xsl:variable name="var:v709" select="userCSharp:MathRound(string($var:v708) , &quot;3&quot;)" />
                <xsl:attribute name="Qty30">
                  <xsl:value-of select="$var:v709" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v710" select="Qty31/text()" />
                <xsl:attribute name="Qty31">
                  <xsl:value-of select="$var:v710" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v711" select="Qty31/text()" />
                <xsl:variable name="var:v712" select="userCSharp:MathDivide(string($var:v711) , &quot;1000&quot;)" />
                <xsl:variable name="var:v713" select="userCSharp:MathRound(string($var:v712) , &quot;3&quot;)" />
                <xsl:attribute name="Qty31">
                  <xsl:value-of select="$var:v713" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v714" select="Qty32/text()" />
                <xsl:attribute name="Qty32">
                  <xsl:value-of select="$var:v714" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v715" select="Qty32/text()" />
                <xsl:variable name="var:v716" select="userCSharp:MathDivide(string($var:v715) , &quot;1000&quot;)" />
                <xsl:variable name="var:v717" select="userCSharp:MathRound(string($var:v716) , &quot;3&quot;)" />
                <xsl:attribute name="Qty32">
                  <xsl:value-of select="$var:v717" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v718" select="Qty33/text()" />
                <xsl:attribute name="Qty33">
                  <xsl:value-of select="$var:v718" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v719" select="Qty33/text()" />
                <xsl:variable name="var:v720" select="userCSharp:MathDivide(string($var:v719) , &quot;1000&quot;)" />
                <xsl:variable name="var:v721" select="userCSharp:MathRound(string($var:v720) , &quot;3&quot;)" />
                <xsl:attribute name="Qty33">
                  <xsl:value-of select="$var:v721" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v722" select="Qty34/text()" />
                <xsl:attribute name="Qty34">
                  <xsl:value-of select="$var:v722" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v723" select="Qty34/text()" />
                <xsl:variable name="var:v724" select="userCSharp:MathDivide(string($var:v723) , &quot;1000&quot;)" />
                <xsl:variable name="var:v725" select="userCSharp:MathRound(string($var:v724) , &quot;3&quot;)" />
                <xsl:attribute name="Qty34">
                  <xsl:value-of select="$var:v725" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v726" select="Qty35/text()" />
                <xsl:attribute name="Qty35">
                  <xsl:value-of select="$var:v726" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v727" select="Qty35/text()" />
                <xsl:variable name="var:v728" select="userCSharp:MathDivide(string($var:v727) , &quot;1000&quot;)" />
                <xsl:variable name="var:v729" select="userCSharp:MathRound(string($var:v728) , &quot;3&quot;)" />
                <xsl:attribute name="Qty35">
                  <xsl:value-of select="$var:v729" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v730" select="Qty36/text()" />
                <xsl:attribute name="Qty36">
                  <xsl:value-of select="$var:v730" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v731" select="Qty36/text()" />
                <xsl:variable name="var:v732" select="userCSharp:MathDivide(string($var:v731) , &quot;1000&quot;)" />
                <xsl:variable name="var:v733" select="userCSharp:MathRound(string($var:v732) , &quot;3&quot;)" />
                <xsl:attribute name="Qty36">
                  <xsl:value-of select="$var:v733" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v734" select="Qty37/text()" />
                <xsl:attribute name="Qty37">
                  <xsl:value-of select="$var:v734" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v735" select="Qty37/text()" />
                <xsl:variable name="var:v736" select="userCSharp:MathDivide(string($var:v735) , &quot;1000&quot;)" />
                <xsl:variable name="var:v737" select="userCSharp:MathRound(string($var:v736) , &quot;3&quot;)" />
                <xsl:attribute name="Qty37">
                  <xsl:value-of select="$var:v737" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v738" select="Qty38/text()" />
                <xsl:attribute name="Qty38">
                  <xsl:value-of select="$var:v738" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v739" select="Qty38/text()" />
                <xsl:variable name="var:v740" select="userCSharp:MathDivide(string($var:v739) , &quot;1000&quot;)" />
                <xsl:variable name="var:v741" select="userCSharp:MathRound(string($var:v740) , &quot;3&quot;)" />
                <xsl:attribute name="Qty38">
                  <xsl:value-of select="$var:v741" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v742" select="Qty39/text()" />
                <xsl:attribute name="Qty39">
                  <xsl:value-of select="$var:v742" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v743" select="Qty39/text()" />
                <xsl:variable name="var:v744" select="userCSharp:MathDivide(string($var:v743) , &quot;1000&quot;)" />
                <xsl:variable name="var:v745" select="userCSharp:MathRound(string($var:v744) , &quot;3&quot;)" />
                <xsl:attribute name="Qty39">
                  <xsl:value-of select="$var:v745" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v746" select="Qty40/text()" />
                <xsl:attribute name="Qty40">
                  <xsl:value-of select="$var:v746" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v747" select="Qty40/text()" />
                <xsl:variable name="var:v748" select="userCSharp:MathDivide(string($var:v747) , &quot;1000&quot;)" />
                <xsl:variable name="var:v749" select="userCSharp:MathRound(string($var:v748) , &quot;3&quot;)" />
                <xsl:attribute name="Qty40">
                  <xsl:value-of select="$var:v749" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v750" select="Qty41/text()" />
                <xsl:attribute name="Qty41">
                  <xsl:value-of select="$var:v750" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v751" select="Qty41/text()" />
                <xsl:variable name="var:v752" select="userCSharp:MathDivide(string($var:v751) , &quot;1000&quot;)" />
                <xsl:variable name="var:v753" select="userCSharp:MathRound(string($var:v752) , &quot;3&quot;)" />
                <xsl:attribute name="Qty41">
                  <xsl:value-of select="$var:v753" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v754" select="Qty42/text()" />
                <xsl:attribute name="Qty42">
                  <xsl:value-of select="$var:v754" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v755" select="Qty42/text()" />
                <xsl:variable name="var:v756" select="userCSharp:MathDivide(string($var:v755) , &quot;1000&quot;)" />
                <xsl:variable name="var:v757" select="userCSharp:MathRound(string($var:v756) , &quot;3&quot;)" />
                <xsl:attribute name="Qty42">
                  <xsl:value-of select="$var:v757" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v758" select="Qty43/text()" />
                <xsl:attribute name="Qty43">
                  <xsl:value-of select="$var:v758" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v759" select="Qty43/text()" />
                <xsl:variable name="var:v760" select="userCSharp:MathDivide(string($var:v759) , &quot;1000&quot;)" />
                <xsl:variable name="var:v761" select="userCSharp:MathRound(string($var:v760) , &quot;3&quot;)" />
                <xsl:attribute name="Qty43">
                  <xsl:value-of select="$var:v761" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v762" select="Qty44/text()" />
                <xsl:attribute name="Qty44">
                  <xsl:value-of select="$var:v762" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v763" select="Qty44/text()" />
                <xsl:variable name="var:v764" select="userCSharp:MathDivide(string($var:v763) , &quot;1000&quot;)" />
                <xsl:variable name="var:v765" select="userCSharp:MathRound(string($var:v764) , &quot;3&quot;)" />
                <xsl:attribute name="Qty44">
                  <xsl:value-of select="$var:v765" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v766" select="Qty45/text()" />
                <xsl:attribute name="Qty45">
                  <xsl:value-of select="$var:v766" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v767" select="Qty45/text()" />
                <xsl:variable name="var:v768" select="userCSharp:MathDivide(string($var:v767) , &quot;1000&quot;)" />
                <xsl:variable name="var:v769" select="userCSharp:MathRound(string($var:v768) , &quot;3&quot;)" />
                <xsl:attribute name="Qty45">
                  <xsl:value-of select="$var:v769" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v770" select="Qty46/text()" />
                <xsl:attribute name="Qty46">
                  <xsl:value-of select="$var:v770" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v771" select="Qty46/text()" />
                <xsl:variable name="var:v772" select="userCSharp:MathDivide(string($var:v771) , &quot;1000&quot;)" />
                <xsl:variable name="var:v773" select="userCSharp:MathRound(string($var:v772) , &quot;3&quot;)" />
                <xsl:attribute name="Qty46">
                  <xsl:value-of select="$var:v773" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v774" select="Qty47/text()" />
                <xsl:attribute name="Qty47">
                  <xsl:value-of select="$var:v774" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v775" select="Qty47/text()" />
                <xsl:variable name="var:v776" select="userCSharp:MathDivide(string($var:v775) , &quot;1000&quot;)" />
                <xsl:variable name="var:v777" select="userCSharp:MathRound(string($var:v776) , &quot;3&quot;)" />
                <xsl:attribute name="Qty47">
                  <xsl:value-of select="$var:v777" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v778" select="Qty48/text()" />
                <xsl:attribute name="Qty48">
                  <xsl:value-of select="$var:v778" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v779" select="Qty48/text()" />
                <xsl:variable name="var:v780" select="userCSharp:MathDivide(string($var:v779) , &quot;1000&quot;)" />
                <xsl:variable name="var:v781" select="userCSharp:MathRound(string($var:v780) , &quot;3&quot;)" />
                <xsl:attribute name="Qty48">
                  <xsl:value-of select="$var:v781" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v782" select="Qty49/text()" />
                <xsl:attribute name="Qty49">
                  <xsl:value-of select="$var:v782" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v783" select="Qty49/text()" />
                <xsl:variable name="var:v784" select="userCSharp:MathDivide(string($var:v783) , &quot;1000&quot;)" />
                <xsl:variable name="var:v785" select="userCSharp:MathRound(string($var:v784) , &quot;3&quot;)" />
                <xsl:attribute name="Qty49">
                  <xsl:value-of select="$var:v785" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v786" select="Qty50/text()" />
                <xsl:attribute name="Qty50">
                  <xsl:value-of select="$var:v786" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v787" select="Qty50/text()" />
                <xsl:variable name="var:v788" select="userCSharp:MathDivide(string($var:v787) , &quot;1000&quot;)" />
                <xsl:variable name="var:v789" select="userCSharp:MathRound(string($var:v788) , &quot;3&quot;)" />
                <xsl:attribute name="Qty50">
                  <xsl:value-of select="$var:v789" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v790" select="Qty51/text()" />
                <xsl:attribute name="Qty51">
                  <xsl:value-of select="$var:v790" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v791" select="Qty51/text()" />
                <xsl:variable name="var:v792" select="userCSharp:MathDivide(string($var:v791) , &quot;1000&quot;)" />
                <xsl:variable name="var:v793" select="userCSharp:MathRound(string($var:v792) , &quot;3&quot;)" />
                <xsl:attribute name="Qty51">
                  <xsl:value-of select="$var:v793" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v587)='true'">
                <xsl:variable name="var:v794" select="Qty52/text()" />
                <xsl:attribute name="Qty52">
                  <xsl:value-of select="$var:v794" />
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string($var:v590)='true'">
                <xsl:variable name="var:v795" select="Qty52/text()" />
                <xsl:variable name="var:v796" select="userCSharp:MathDivide(string($var:v795) , &quot;1000&quot;)" />
                <xsl:variable name="var:v797" select="userCSharp:MathRound(string($var:v796) , &quot;3&quot;)" />
                <xsl:attribute name="Qty52">
                  <xsl:value-of select="$var:v797" />
                </xsl:attribute>
              </xsl:if>
            </ns0:Detail>
          </xsl:if>
        </xsl:for-each>
      </ns0:VP_SAP_UPLOAD>
    </ns0:VP_BSS_Upload>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[ 
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


public bool LogicalOr(string param0, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15, string param16, string param17, string param18, string param19, string param20, string param21, string param22, string param23, string param24, string param25, string param26, string param27, string param28, string param29, string param30, string param31, string param32, string param33, string param34, string param35, string param36, string param37, string param38, string param39, string param40, string param41, string param42, string param43, string param44, string param45, string param46, string param47, string param48, string param49, string param50, string param51)
{
	return ValToBool(param0) || ValToBool(param1) || ValToBool(param2) || ValToBool(param3) || ValToBool(param4) || ValToBool(param5) || ValToBool(param6) || ValToBool(param7) || ValToBool(param8) || ValToBool(param9) || ValToBool(param10) || ValToBool(param11) || ValToBool(param12) || ValToBool(param13) || ValToBool(param14) || ValToBool(param15) || ValToBool(param16) || ValToBool(param17) || ValToBool(param18) || ValToBool(param19) || ValToBool(param20) || ValToBool(param21) || ValToBool(param22) || ValToBool(param23) || ValToBool(param24) || ValToBool(param25) || ValToBool(param26) || ValToBool(param27) || ValToBool(param28) || ValToBool(param29) || ValToBool(param30) || ValToBool(param31) || ValToBool(param32) || ValToBool(param33) || ValToBool(param34) || ValToBool(param35) || ValToBool(param36) || ValToBool(param37) || ValToBool(param38) || ValToBool(param39) || ValToBool(param40) || ValToBool(param41) || ValToBool(param42) || ValToBool(param43) || ValToBool(param44) || ValToBool(param45) || ValToBool(param46) || ValToBool(param47) || ValToBool(param48) || ValToBool(param49) || ValToBool(param50) || ValToBool(param51);
	return false;
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public bool LogicalAnd(string param0, string param1)
{
	return ValToBool(param0) && ValToBool(param1);
	return false;
}


public string StringConcat(string param0)
{
 return param0;
}


public string H1From(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1To(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date2(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date3(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date4(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date5(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date6(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date7(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date8(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date9(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date10(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date11(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date12(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date13(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date14(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date15(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date16(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date17(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date18(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date19(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date20(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date21(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date22(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date23(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date24(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date25(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date26(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date27(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date28(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date29(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date30(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date31(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date32(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date33(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date34(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date35(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date36(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date37(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date38(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date39(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date40(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date41(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date42(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date43(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date44(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date45(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date46(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date47(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date48(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date49(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date50(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H1Date51(string param)
{
string day,other,month,year;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);
	return month + "." + year;
}

public string H2W1(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W2(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W3(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W5(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W6(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W7(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W4(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W8(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W9(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W10(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W11(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W12(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W13(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W14(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W15(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W16(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W17(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W18(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W19(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W20(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W21(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W22(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W23(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W24(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W25(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W26(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W27(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W28(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W29(string param1, string param2, Boolean last)
{
 string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W30(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W31(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W32(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W33(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W34(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W35(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W36(string param1, string param2, Boolean last)
{
 string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W37(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W38(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W39(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W40(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W41(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W42(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W43(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W45(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W44(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W46(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W47(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W48(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W49(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W50(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W51(string param1, string param2, Boolean last)
{
string day1,other1,month1,year1,day2,other2,month2,year2;
if(!last && !param2.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
month2= param2.Substring(0, param2.IndexOf("/"));
other2 = param2.Substring(param2.IndexOf("/")+1);
day2= other2.Substring(0, other2.IndexOf("/"));
year2 = other2.Substring(other2.IndexOf("/")+1);
if (day2.Length==1)
day2 = "0" +day2;
return day1+ "-" + day2;
}
else if (!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1);
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
 return "";
}

public string H2W52(string param1, Boolean last)
{
string day1,other1,month1,year1;
if(!param1.Equals(""))
{
month1= param1.Substring(0, param1.IndexOf("/"));
other1 = param1.Substring(param1.IndexOf("/")+1);
day1= other1.Substring(0, other1.IndexOf("/"));
year1 = other1.Substring(other1.IndexOf("/")+1); 
DateTime date = new DateTime(int.Parse(year1), int.Parse(month1),int.Parse(day1));
System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar; 
date = date +TimeSpan.FromDays(6);
if (date.Day.ToString().Length == 1)
 	 return day1 + "-0" + date.Day.ToString();
return day1 + "-" + date.Day.ToString();
}
else
return "";

}

public string aDayEarlier51(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier50(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier49(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier48(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier47(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier46(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier45(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier44(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier43(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier42(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier41(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier40(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier39(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier38(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier37(string param, Boolean empty)
{
 string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier36(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier35(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier34(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier33(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier32(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier31(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier30(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier29(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier28(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier27(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier26(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier25(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier24(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier23(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier22(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier21(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier20(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier19(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier18(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier17(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier16(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier15(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier14(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier13(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier12(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier11(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier10(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier9(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier8(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier7(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier6(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier5(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier4(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier3(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier2(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string aDayEarlier1(string param, Boolean empty)
{
string daystr,other,monthstr,yearstr;
if(!empty)
{
int day, month, year;
monthstr= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
daystr= other.Substring(0, other.IndexOf("/"));
yearstr = other.Substring(other.IndexOf("/")+1);
day = int.Parse(daystr);
month = int.Parse(monthstr);
year = int.Parse(yearstr);


day = day - 1;
if (day==0)
{
month = month - 1;
switch(month)
{
 case 1: day = 31;
 break;
 case 2: day = 29;
 break;
 case 3: day = 31;
 break;
 case 4: day = 30;
 break;
 case 5: day = 31;
 break;
 case 6: day = 30;
 break;
 case 7: day = 31;
 break;
 case 8: day = 31;
 break;
 case 9: day = 30;
 break;
 case 10:day = 31;
 break;
 case 11:day = 30;
 break;
 default:day = 31;
 break;
}
}
if(month==0)
{
 month = 12;
 year = year - 1;
}

	return month.ToString() + "/" +day.ToString() + "/" + year.ToString();
}
else
return "";
}

public string FromPeriod(string param)
{
string day,other,month,year;
int iYear;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);

	DateTime date = new DateTime(int.Parse(year), int.Parse(month),int.Parse(day));
System.Globalization.CultureInfo auCulture =
System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar;
int weekNo = cal.GetWeekOfYear(date,
auCulture.DateTimeFormat.CalendarWeekRule,
auCulture.DateTimeFormat.FirstDayOfWeek);
 


 if (weekNo ==53)
 {
weekNo = 1;
iYear = int.Parse(year) + 1;
year = iYear.ToString();
 }
 return weekNo.ToString() + "." + year;

}

public string ToPeriod(string d1,string d2, string d3, string d4, string d5, string d6, string d7, string d8, string d9,string d10,string d11, string d12, string d13, string d14, string d15, string d16, string d17, string d18, string d19, string d20, string d21,string d22, string d23, string d24, string d25, string d26, string d27, string d28, string d29, string d30, string d31, string d32, string d33, string d34, string d35, string d36, string d37, string d38, string d39, string d40, string d41,string d42, string d43, string d44, string d45, string d46, string d47, string d48, string d49, string d50, string d51, string d52, string total)
{
string param = "";
if (total.Equals("1"))
 param = d1;
if (total.Equals("2"))
 param = d2;
if (total.Equals("3"))
 param = d3;
if (total.Equals("4"))
 param = d4;
if (total.Equals("5"))
 param = d5;
if (total.Equals("6"))
 param = d6;
if (total.Equals("7"))
 param = d7;
if (total.Equals("8"))
 param = d8;
if (total.Equals("9"))
 param = d9;
if (total.Equals("10"))
 param = d10;
if (total.Equals("11"))
 param = d11;
if (total.Equals("12"))
 param = d12;
if (total.Equals("13"))
 param = d13;
if (total.Equals("14"))
 param = d14;
if (total.Equals("15"))
 param = d15;
if (total.Equals("16"))
 param = d16;
if (total.Equals("17"))
 param = d17;
if (total.Equals("18"))
 param = d18;
if (total.Equals("19"))
 param = d19;
if (total.Equals("20"))
 param = d20;
if (total.Equals("21"))
 param = d21;
if (total.Equals("22"))
 param = d22;
if (total.Equals("23"))
 param = d23;
if (total.Equals("24"))
 param = d24;
if (total.Equals("25"))
 param = d25;
if (total.Equals("26"))
 param = d26;
if (total.Equals("27"))
 param = d27;
if (total.Equals("28"))
 param = d28;
if (total.Equals("29"))
 param = d29;
if (total.Equals("30"))
 param = d30;
if (total.Equals("31"))
 param = d31;
if (total.Equals("32"))
 param = d32;
if (total.Equals("33"))
 param = d33;
if (total.Equals("34"))
 param = d34;
if (total.Equals("35"))
 param = d35;
if (total.Equals("36"))
 param = d36;
if (total.Equals("37"))
 param = d37;
if (total.Equals("38"))
 param = d38;
if (total.Equals("39"))
 param = d39;
if (total.Equals("40"))
 param = d40;
if (total.Equals("41"))
 param = d41;
if (total.Equals("42"))
 param = d42;
if (total.Equals("43"))
 param = d43;
if (total.Equals("44"))
 param = d44;
if (total.Equals("45"))
 param = d45;
if (total.Equals("46"))
 param = d46;
if (total.Equals("47"))
 param = d47;
if (total.Equals("48"))
 param = d48;
if (total.Equals("49"))
 param = d49;
if (total.Equals("50"))
 param = d50;
if (total.Equals("51"))
 param = d51;
if (total.Equals("52"))
 param = d52;


string day,other,month,year; 
int iYear;
month= param.Substring(0, param.IndexOf("/"));
other = param.Substring(param.IndexOf("/")+1);
day= other.Substring(0, other.IndexOf("/"));
year = other.Substring(other.IndexOf("/")+1);

	DateTime date = new DateTime(int.Parse(year), int.Parse(month),int.Parse(day));
System.Globalization.CultureInfo auCulture =
System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
System.Globalization.Calendar cal = auCulture.Calendar;
int weekNo = cal.GetWeekOfYear(date,
auCulture.DateTimeFormat.CalendarWeekRule,
auCulture.DateTimeFormat.FirstDayOfWeek);

 if (weekNo ==53)
 {
weekNo = 1;
iYear = int.Parse(year) + 1;
year = iYear.ToString();
 }
 return weekNo.ToString() + "." + year;

}

public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public string MathDivide(string val1, string val2)
{
	string retval = "";
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		if (d2 != 0)
		{
			double ret = d1 / d2;
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
	}
	return retval;
}


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


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
}


public bool LogicalLte(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 <= d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) <= 0;
	}
	return ret;
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