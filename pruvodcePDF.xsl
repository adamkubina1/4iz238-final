<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="urn:Test.Namespace"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"    
    
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    
    
    
    <xsl:template match="/">
        <fo:root language="cs" font-family="Arial">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="297mm" page-width="210mm"
                    margin-top="20mm" margin-right="15mm" margin-bottom="20mm" margin-left="15mm">
                    <fo:region-body margin-bottom="1cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="A4">
                
                <fo:static-content flow-name="xsl-region-before" color="#076787" font-size="18px">
                    <fo:block text-align="right" margin-top="-15mm">                            
                            <xsl:value-of select="průvodce/autor"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="průvodce/názevDíla"/>
                        </fo:block>
                </fo:static-content>
                
                <fo:static-content flow-name="xsl-region-after" color="#076787" font-size="18px">
                    <fo:block text-align="center" margin-bottom="-15mm">
                        <xsl:text>Strana </xsl:text>
                        <fo:page-number/>
                        <xsl:text> / </xsl:text>
                        <fo:page-number-citation ref-id="posledni"/>
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    <fo:block id="nadpis" font-size="50px" font-weight="bold" text-align="center"
                        space-before="50pt" space-after="20pt" color="black">
                        <xsl:value-of select="průvodce/názevDíla"/>
                    </fo:block>
                    <fo:block text-align="center" space-before="25px" space-after="25px">
                        <xsl:text>Autor: </xsl:text>
                        <xsl:value-of select="průvodce/autor"/>
                    </fo:block>
                    <fo:block text-align="center" space-before="35px" space-after="30px" color="white" background-color="#076787" padding="3mm">
                        <xsl:text>Co hledáte?</xsl:text>
                    </fo:block>
                    
                    <fo:block-container font-size="15px">
                        <fo:block padding="1mm" color="white" background-color="#076787" width="6cm">
                            HRADY
                        </fo:block>
                        <fo:block margin="3mm" padding="3mm" >
                            <xsl:for-each select="průvodce/památky/památka[@druh='hrad']">
                                <xsl:sort select="název" data-type="text" order="ascending"/>
                                <fo:block text-align-last="justify">
                                    <fo:basic-link internal-destination="{generate-id(.)}">
                                        <xsl:value-of select="název"/>
                                        <fo:leader leader-pattern="dots"/>
                                        <fo:page-number-citation ref-id="{generate-id(.)}"/>
                                    </fo:basic-link>
                                </fo:block>  
                            </xsl:for-each>
                        </fo:block>
                    </fo:block-container>
                    <fo:block-container font-size="15px">
                        <fo:block padding="1mm" color="white" background-color="#076787" width="6cm">
                            ZÁMKY
                        </fo:block>
                        <fo:block margin="3mm" padding="3mm">
                            <xsl:for-each select="průvodce/památky/památka[@druh='zámek']">
                                <xsl:sort select="název" data-type="text" order="ascending"/>
                                <fo:block text-align-last="justify">
                                    <fo:basic-link internal-destination="{generate-id(.)}">
                                        <xsl:value-of select="název"/>
                                        <fo:leader leader-pattern="dots"/>
                                        <fo:page-number-citation ref-id="{generate-id(.)}"/>
                                    </fo:basic-link>
                                </fo:block>  
                            </xsl:for-each>
                        </fo:block>
                    </fo:block-container>
                    <fo:block-container font-size="15px">
                        <fo:block padding="1mm" color="white" background-color="#076787" width="6cm">
                            JINÉ
                        </fo:block>
                        <fo:block margin="3mm" padding="3mm">
                            <xsl:for-each select="průvodce/památky/památka[@druh='jiné']">
                                <xsl:sort select="název" data-type="text" order="ascending"/>
                                <fo:block text-align-last="justify">
                                    <fo:basic-link internal-destination="{generate-id(.)}">
                                        <xsl:value-of select="název"/>
                                        <fo:leader leader-pattern="dots"/>
                                        <fo:page-number-citation ref-id="{generate-id(.)}"/>
                                    </fo:basic-link>
                                </fo:block>  
                            </xsl:for-each>
                        </fo:block>
                    </fo:block-container>
                    
                    <xsl:apply-templates/>
                    
                    <fo:block id="posledni"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    
 <!-- formátování jednotlivých stran -->   
    <xsl:template match="památka">
        <fo:block id="{generate-id(.)}" break-before="page" font-size="30px">            
                <xsl:value-of select="název"/>                
        </fo:block>
        
                     
        
<!-- VLOŽENÍ TABULKY -->

        <fo:table>
            
            <fo:table-body>
                <fo:table-row>                    
                    <fo:table-cell>
                        <fo:block-container border="1px" border-color="#076787" border-style="solid" padding="1mm" width="84mm" margin-right="0mm" margin="2mm">
                            <fo:block>
                                <fo:inline font-weight="bold">DRUH: </fo:inline>
                                <xsl:value-of select="@druh"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">POSTAVEN: </fo:inline>
                                <xsl:apply-templates select="postaven"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">SLOH: </fo:inline>
                                <xsl:value-of select="sloh"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">PŘÍSTUPNÝ PRO VEŘEJNOST: </fo:inline>
                                <xsl:value-of select="navštívitelný"/>
                            </fo:block>
                        </fo:block-container>                        
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block-container  border="1px" border-color="#076787" border-style="solid" padding="1mm" width="86mm" margin-left="0mm" margin="2mm">
                            <fo:block>
                                <fo:inline font-weight="bold">OBLÍBENOST: </fo:inline>
                                <xsl:value-of select="oblíbenost"/>                    
                                <xsl:text> /5</xsl:text> <fo:inline font="18px ZapfDingbats">&#x2605;</fo:inline> 
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">KRAJ: </fo:inline>
                                <xsl:value-of select="umístění/kraj"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">PAMÁTKA POBLÍŽ: </fo:inline>
                                <xsl:value-of select="památkaPoblíž"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">CENA VSTUPNÉHO: </fo:inline>
                                <xsl:value-of select="vstupné"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="vstupné/@měna"/>
                            </fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                </fo:table-row>
                
                <fo:table-row>                    
                    <fo:table-cell>                        
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">POPIS: </fo:inline>            
                            <xsl:apply-templates select="popis"/>
                        </fo:block>
                    </fo:table-cell>                        
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="foto"/>
                        </fo:block>
                    </fo:table-cell>
                    
                </fo:table-row>
                
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">ZAJÍMAVOST: </fo:inline>            
                            <xsl:apply-templates select="zajímavost"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">MAPA:             
                                <xsl:value-of select="umístění/mapa/@href"/> 
                            </fo:inline>                        
                        </fo:block>    
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">WEBOVKY: 
                                <xsl:value-of select="webovky/@href"/>
                            </fo:inline>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                
            </fo:table-body>
            
        </fo:table>
        
        <fo:table>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell width="8cm">
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">MAJITELÉ: </fo:inline>            
                            <xsl:apply-templates select="majitelé"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">VHODNÝ PRO: </fo:inline>            
                            <xsl:apply-templates select="přístupnost"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin="2mm">
                            <fo:inline font-weight="bold">SLUŽBY: </fo:inline>            
                            <xsl:apply-templates select="služby"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
                
        <fo:block-container margin="2mm">
            <fo:block>
                <fo:inline font-weight="bold">REFERENCE / ŘEKLI O NÁS: </fo:inline>
                <xsl:apply-templates select="reference"/>
            </fo:block>           
        </fo:block-container>                 
        
    </xsl:template>
    
    <!-- malé template -->
    <xsl:template match="postaven">
        <xsl:if test="@upřesnění='století'">
            <xsl:apply-templates/>
            <xsl:text>. století</xsl:text>
        </xsl:if>
        <xsl:if test="@upřesnění='rok'">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="popis">
        <fo:block margin-top="2mm" text-align="justify">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="foto">
        <fo:external-graphic src="url('{@src}')" content-width="88mm" margin-top="2mm"/>
    </xsl:template>
    
    <xsl:template match="zajímavost">
        <fo:block margin-top="2mm" text-align="justify">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="majitelé">
        <fo:block-container>
            <fo:list-block>
                <xsl:for-each select="majitel">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>&#x2022;</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </xsl:for-each>
            </fo:list-block>
        </fo:block-container>
    </xsl:template>
    
    <xsl:template match="přístupnost">
        <fo:block-container>
            <fo:list-block>
                <xsl:for-each select="kategorie">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>&#x2022;</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </xsl:for-each>
            </fo:list-block>
        </fo:block-container>
    </xsl:template>
    
    <xsl:template match="služby">
        <fo:block-container>
            <fo:list-block>
                <xsl:for-each select="služba">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>&#x2022;</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </xsl:for-each>
            </fo:list-block>
        </fo:block-container>
    </xsl:template>
    
    <xsl:template match="reference">
        <fo:block margin="2mm">
            <xsl:apply-templates select="hodnocení"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="hodnocení">
        <fo:block><xsl:apply-templates select="počet_hvězd"/></fo:block>
        <fo:block><xsl:apply-templates select="datum"/></fo:block>
        <fo:block><xsl:value-of select="komentář"/></fo:block>
    </xsl:template>
    
    <xsl:template match="počet_hvězd">
        <fo:block margin="2mm">
            <xsl:if test="text()='5'">
                <fo:inline font="14pt ZapfDingbats">&#x2605; &#9733; &#9733; &#9733; &#9733;</fo:inline>            
            </xsl:if>
            <xsl:if test="text()='4'">
                <fo:inline font="14pt ZapfDingbats">&#x2605; &#9733; &#9733; &#9733;</fo:inline>            
            </xsl:if>
            <xsl:if test="text()='3'">
                <fo:inline font="14pt ZapfDingbats">&#x2605; &#9733; &#9733;</fo:inline>            
            </xsl:if>
            <xsl:if test="text()='2'">
                <fo:inline font="14pt ZapfDingbats">&#x2605; &#9733;</fo:inline>            
            </xsl:if>
            <xsl:if test="text()='1'">
                <fo:inline font="14pt ZapfDingbats">&#x2605;</fo:inline>            
            </xsl:if>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="datum">
        <xsl:value-of select="format-date(xs:date(.),'[D].[M].[Y]')"/>
    </xsl:template>
    
    
    
</xsl:stylesheet>
