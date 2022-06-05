<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:g="http://www.vse.cz/4iz238/sem/kuba10/gameSave"
    exclude-result-prefixes="xs g"
    version="2.0">
    
    <xsl:output method="html" version="5"/>
    
    <!-- BASE -->
    <xsl:template match="/">
        <html lang="en">
            <head>
                <title>Game Save</title>
                <link rel="stylesheet" href="style.css" type="text/css"/>
            </head>
            <body>
                <xsl:apply-templates/> 
            </body>
        </html>
    </xsl:template>
    
    <!-- MAIN PAGE -->
    <xsl:template match="g:game">
        <h1>Game save file</h1>
        <h2>Map: <xsl:value-of select="./g:map"/></h2>
        <h2>Player on turn: <xsl:apply-templates select="./g:playerOnTurn" mode="name"/></h2>
        <div>
            <h2>Players:</h2>
            <xsl:apply-templates select="g:players" mode="menu"/>
        </div>

        <xsl:apply-templates select="./g:players/g:player" mode="pages"/>
        
    </xsl:template>
    
    <!-- PLAYER PAGES -->
    <xsl:template match="g:player" mode="pages">
        <xsl:result-document href="{generate-id(.)}.html">
            <html lang="en">
                <head>
                    <title><xsl:value-of select="g:name"/></title>
                    <link rel="stylesheet" href="style.css" type="text/css"/>
                </head>
                <body>
                    <h1><xsl:value-of select="g:name"/></h1>
                    <h2>Commodities:</h2>
                    <xsl:apply-templates select="g:commodities" mode="displayAll"/>
                    <h2>Units</h2>
                    <xsl:apply-templates select="g:units" mode="displayAll"/>                  
                    <h2>Buildings</h2>
                    <xsl:apply-templates select="g:buildings" mode="displayAll"/>
                    
                    <a style="margin-top: 100px;" href="gameSave.html">Go back to main page</a>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- _________________SMALL TEMPLATES________________ -->
    
    <xsl:template match="g:playerOnTurn" mode="name">
        <xsl:value-of select="./g:name"/>
    </xsl:template>
    
    <xsl:template match="g:players" mode="menu">
        <xsl:for-each select="g:player">
            <xsl:sort lang="en" select="g:name"/>
            <a href="{generate-id(.)}.html"><xsl:value-of select="g:name"/></a>
            <br/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="g:commodities" mode="displayAll">
        <xsl:for-each select="g:commodity">
            <p><span style="font-weight: bold;"><xsl:value-of select="@form"/></span> : <xsl:value-of select="@amount"/></p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="g:units" mode="displayAll">
        <table>
            <tr style="font-size: 120%; margin-bottom: 10px; margin-top: 10px;">
                <th>Unit</th>
                <th>Name</th>
                <th>HP</th>
                <th>Action reach</th>
                <th>Damage</th>
                <th>Position</th>
                <th>Action Queue</th>
            </tr>
            <xsl:for-each select="g:unit">
                <tr>
                    <th><img src="imgs/{@category}.webp" alt="unit"></img></th>
                    <th><xsl:value-of select="@category"/></th>
                    <th><xsl:value-of select="g:hp"/></th>
                    <th><xsl:value-of select="g:actionReach"/></th>
                    <th><xsl:value-of select="g:damage"/></th>
                    <th>x = <xsl:value-of select="g:position/@x"/>, y = <xsl:value-of select="g:position/@y"/></th>
                    <th><xsl:apply-templates select="g:actionQueue" mode="unitDisplayAll"/></th>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="g:buildings" mode="displayAll">
        <table>
            <tr style="font-size: 120%; margin-bottom: 10px; margin-top: 10px;">
                <th>Unit</th>
                <th>Name</th>
                <th>HP</th>
                <th>Position</th>
                <th>Action Queue</th>
            </tr>
            <xsl:for-each select="g:building">
                <tr>
                    <th><img src="imgs/{@category}.webp" alt="building"></img></th>
                    <th><xsl:value-of select="@category"/></th>
                    <th><xsl:value-of select="g:hp"/></th>
                    <th>x = <xsl:value-of select="g:position/@x"/>, y = <xsl:value-of select="g:position/@y"/></th>
                    <th><xsl:apply-templates select="g:actionQueue" mode="buildingDisplayAll"/></th>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="g:actionQueue" mode="unitDisplayAll">
        <xsl:for-each select="g:action">
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
            <br/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="g:actionQueue" mode="buildingDisplayAll">
        <xsl:for-each select="g:action">
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
            <br/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>