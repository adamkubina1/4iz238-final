<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:g="http://www.vse.cz/4iz238/sem/kuba10/gameSave"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xs g fo" version="2.0">

    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="297mm" page-width="210mm"
                    margin-top="25mm" margin-left="20mm" margin-right="20mm" margin-bottom="10mm">
                    <fo:region-body/>
                    <fo:region-before extent="10mm"/>
                    <fo:region-after extent="10mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">

                <fo:static-content flow-name="xsl-region-before" font-size="10pt">
                    <fo:block text-align="right" margin-top="-20mm">
                        <xsl:text>Representation of game save</xsl:text>
                    </fo:block>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after" font-size="10pt">
                    <fo:block text-align="center" margin-bottom="-20mm">
                        <xsl:text>Page </xsl:text>
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body" font-family="Calibri" font-size="16pt">
                    <xsl:apply-templates/>
                </fo:flow>


            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="g:game">
        <fo:block font-size="200%">Game save</fo:block>

        <fo:block font-size="150%" margin-top="10mm">
            <fo:inline font-weight="bold">Map: </fo:inline>
            <xsl:value-of select="g:map"/>
        </fo:block>

        <fo:block font-size="150%">
            <fo:inline font-weight="bold">Player on turn: </fo:inline>
            <xsl:value-of select="g:playerOnTurn/g:name"/>
        </fo:block>

        <fo:block font-size="120%" margin-top="10mm" font-weight="bold">Player info</fo:block>
        <xsl:apply-templates select="g:players" mode="links"/>
        <xsl:apply-templates select="g:players" mode="page"/>
    </xsl:template>

    <xsl:template match="g:players" mode="page">
        <xsl:for-each select="g:player">
            <fo:block id="{generate-id(.)}" break-before="page" font-size="200%">
                <xsl:value-of select="g:name"/>
            </fo:block>
            <fo:block margin-top="20mm" >
                <fo:inline font-size="150%" font-weight="bold"
                    >Commodities</fo:inline>
                <xsl:apply-templates select="g:commodities" mode="displayAll"/>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Units</fo:inline>
                <xsl:apply-templates select="g:units" mode="displayAll"/>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold"
                    >Buildings</fo:inline>
                <xsl:apply-templates select="g:buildings" mode="displayAll"/>
            </fo:block>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="g:players" mode="links">
        <xsl:for-each select="g:player">
            <fo:block>
                <fo:basic-link internal-destination="{generate-id(.)}">
                    <xsl:value-of select="g:name"/>
                </fo:basic-link>
            </fo:block>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="g:commodities" mode="displayAll">
        <fo:list-block>
            <xsl:for-each select="g:commodity"> 
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block>&#x2022;</fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:value-of select="@amount"/> amount of <xsl:value-of select="@form"/>
                        </fo:block>                        
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:for-each>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="g:units" mode="displayAll">
        <fo:table>
            <fo:table-body>
                <fo:table-row font-weight="bold">
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Unit</fo:block>                            
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Name</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>HP</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Damage</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Action reach</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Position</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Action queue</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                </fo:table-row>
                <xsl:for-each select="g:unit">
                    <fo:table-row font-size="60%" border="1px" border-color="#076787" border-style="solid">
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <fo:external-graphic src="url('imgs/{@category}.jpg')"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="@category"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="g:hp"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="g:damage"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="g:actionReach"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    x = <xsl:value-of select="g:position/@x"/>,
                                    y = <xsl:value-of select="g:position/@y"/>
                             </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                  <xsl:apply-templates select="g:actionQueue" mode="unitDisplayAll"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="g:buildings" mode="displayAll">
        <fo:table>
            <fo:table-body>
                <fo:table-row font-weight="bold">
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Building</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Name</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>HP</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Position</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" text-align="center">
                        <fo:block-container>
                            <fo:block>Action queue</fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                </fo:table-row>
                <xsl:for-each select="g:building">
                    <fo:table-row font-size="60%" border="1px" border-color="#076787" border-style="solid">
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <fo:external-graphic src="url('imgs/{@category}.jpg')"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="@category"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:value-of select="g:hp"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    x = <xsl:value-of select="g:position/@x"/>,
                                    y = <xsl:value-of select="g:position/@y"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                        <fo:table-cell border="1px" border-color="#076787" border-style="solid" display-align="center" text-align="center">
                            <fo:block-container>
                                <fo:block>
                                    <xsl:apply-templates select="g:actionQueue" mode="buildingDisplayAll"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="g:actionQueue" mode="unitDisplayAll">
        <xsl:for-each select="g:action">
            <fo:block>
                <xsl:value-of select="position()" /><xsl:text>. </xsl:text>
                <xsl:choose>
                    <xsl:when test="@type = 'move'">
                        <xsl:text>Moving to x = </xsl:text> <xsl:value-of select="g:position/@x"/> <xsl:text> y = </xsl:text> <xsl:value-of select="g:position/@y"/>
                    </xsl:when>
                    <xsl:when test="@type = 'mine'"><xsl:text>Mining</xsl:text></xsl:when>
                    <xsl:when test="@type = 'attack'"><xsl:text>Attacking</xsl:text></xsl:when>
                </xsl:choose>
                <xsl:if test="@repeat = 'true'">, repeating this action</xsl:if>
                <xsl:text>, turns to complete </xsl:text> <xsl:value-of select="g:turnsToComplete"/>
            </fo:block>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="g:actionQueue" mode="buildingDisplayAll">
        <xsl:for-each select="g:action">
            <fo:block>
                <xsl:value-of select="position()" /><xsl:text>. </xsl:text>
                <xsl:choose>
                    <xsl:when test="@type = 'produce'">
                        <xsl:text>Producing </xsl:text>
                        <xsl:value-of select="g:commodity/@amount"/>
                        <xsl:text> of </xsl:text>
                        <xsl:value-of select="g:commodity/@form"/>
                    </xsl:when>
                    <xsl:when test="@type = 'spawn'">
                        <xsl:text>Spawning a </xsl:text>
                        <xsl:value-of select="g:unit/@category"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="@repeat = 'true'">, repeating this action</xsl:if>
                <xsl:text>, turns to complete </xsl:text> <xsl:value-of select="g:turnsToComplete"/>
            </fo:block>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
