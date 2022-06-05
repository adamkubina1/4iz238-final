<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="urn:Test.Namespace"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="html" version="5" encoding="UTF-8"/>
    
    <xsl:param name="Druhpísma" select="'Raleway, sans-serif'"/>
    
        
    <xsl:template match="/">
        <html lang="cs">
            <head>
                <title><xsl:value-of select="průvodce/názevDíla"/></title>
                <link rel="stylesheet" href="pruvodceStyly.css" type="text/css"/>
                <style>
                    @import url('https://fonts.googleapis.com/css?family=Lobster|Raleway:500');
                    
                    body {
                    font-size: 110%;
                    font-family: <xsl:value-of select="$Druhpísma"/>;
                    text-align:center;
                    }
                    h1 {
                    font-family: 'Lobster', cursive;
                    font-weight:100;
                    font-size: 3em;
                    }
                </style>
            </head>
            
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="průvodce">
        
        <div class="nadpis">
            <h1><xsl:value-of select="názevDíla"/></h1>
            <h3>
                <p>
                    <em>AUTOR: 
                        <xsl:apply-templates select="autor"/>
                    </em>                   
                </p>
            </h3>
        </div>
        
        <div class="obsah">
            <xsl:apply-templates select="památky"/>
        </div>
    </xsl:template>
    
    
    <!-- KATEGORIE - OBSAH -->
    <xsl:template match="památky">
        <div id="kategorie">
            <h4>Co hledáte?</h4>
            <div class="flex-container">
                <table>
                    <tr>
                        <th>HRADY</th></tr>
                    <xsl:for-each select="památka[@druh='hrad']">
                        <xsl:sort select="název" lang="cs"/>
                        <tr>
                            <td>
                                <a href="{generate-id(.)}.html">
                                    <xsl:value-of select="název"/>
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <table>
                    <tr>
                        <th>ZÁMKY</th></tr>
                    <xsl:for-each select="//památka[@druh='zámek']">
                        <xsl:sort select="název" lang="cs"/>
                        <tr>
                            <td>
                                <a href="{generate-id(.)}.html">
                                    <xsl:value-of select="název"/>
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>                  
                    
                <table>
                    <tr>
                        <th>JINÉ</th></tr>
                    <xsl:for-each select="//památka[@druh='jiné']">
                        <xsl:sort select="název" lang="cs"/>
                        <tr>
                            <td>
                                <a href="{generate-id()}.html">
                                    <xsl:value-of select="název"/>
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>                
            </div>
        </div>
        <xsl:apply-templates select="//památka"/>        
    </xsl:template>
    
    
    <!-- VÝSLEDNÝ DOKUMENT -->
    <xsl:template match="památka">
        <xsl:result-document href="{generate-id(.)}.html">
            <html>
                <head>
                    <title>
                        <xsl:value-of select="název"/>
                    </title>
                    <link rel="stylesheet" href="pruvodceStyly.css" type="text/css"/>
                    <style>
                        @import url('https://fonts.googleapis.com/css?family=Lobster|Raleway:500');
                        body {
                        font-size: 110%;
                        font-family: <xsl:value-of select="$Druhpísma"/>;
                        text-align:center;
                        }
                        h1 {
                        font-family: 'Lobster', cursive;
                        font-weight:100;
                        font-size: 3em;
                        }
                    </style>
                </head>
                <body>
                    <div id="hlavni">
                        <xsl:apply-templates select="název"/>
                        <div class="grid-container">
                            <div class="jedna oddil">
                                <p>
                                    <xsl:text>DRUH: </xsl:text>
                                    <xsl:value-of select="@druh"/>
                                </p>
                                <p>
                                    <xsl:text>POSTAVEN: </xsl:text>
                                    <xsl:apply-templates select="postaven"/>
                                </p>
                                <p>
                                    <xsl:text>SLOH: </xsl:text>
                                    <xsl:value-of select="sloh"/>
                                </p>
                                <p>
                                    <xsl:text>PŘÍSTUPNÝ PRO VEŘEJNOST: </xsl:text>
                                    <xsl:value-of select="navštívitelný"/>
                                </p>
                            </div>
                            
                            <div class="dva oddil">
                                <p>
                                    <xsl:text>OBLÍBENOST: </xsl:text>
                                    <xsl:value-of select="oblíbenost"/>
                                    <xsl:text> /5 &#9733;</xsl:text>
                                </p>
                                <p>
                                    <xsl:text>KRAJ: </xsl:text>
                                    <xsl:value-of select="umístění/kraj"/>
                                </p>
                                <p>
                                    <xsl:text>PAMÁTKA POBLÍŽ: </xsl:text>
                                    <xsl:value-of select="památkaPoblíž"/>
                                </p>
                                <p>
                                    <xsl:text>CENA VSTUPNÉHO: </xsl:text>
                                    <xsl:value-of select="vstupné"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="vstupné/@měna"/>
                                </p>
                            </div>
                            <div class="tri oddil">
                                <h3>POPIS:</h3>
                                <div>
                                    <xsl:apply-templates select="popis"/>
                                </div>
                            </div>
                            <div class="ctyri oddil">
                                <xsl:apply-templates select="foto"/>
                            </div>
                            <div class="pet oddil">
                                <h3>ZAJÍMAVOST:</h3>
                                <div>
                                    <xsl:apply-templates select="zajímavost"/>
                                </div>
                            </div>
                            <div class="sest oddil">
                                <p>
                                    MAPA: 
                                    <a href="{umístění/mapa/@href}">
                                        <xsl:value-of select="umístění/mapa/@href"/>
                                    </a> 
                                </p>
                                <p>
                                    WEBOVKY: 
                                    <a href="{webovky/@href}">
                                        <xsl:value-of select="webovky/@href"/>
                                    </a>
                               </p>
                            </div>
                            <div class="sedm oddil">
                                <p>MAJITELÉ:</p>
                                <xsl:apply-templates select="majitelé"/>
                            </div>
                            <div class="osm oddil">
                                <p>VHODNÝ PRO:</p>
                                <xsl:apply-templates select="přístupnost"/>
                            </div>
                            <div class="devet oddil">
                                <p>SLUŽBY:</p>
                                <xsl:apply-templates select="služby"/>
                            </div>
                            <div class="deset oddil">
                                <p>REFERENCE / ŘEKLI O NÁS</p>
                                <xsl:apply-templates select="reference"/>
                            </div>
                        </div>
                        <div class="zpet">
                            <a href="pruvodceHTML.html">
                                <xsl:text>ZPĚT</xsl:text>
                            </a>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- MALÉ TEMPLATES -->
    <xsl:template match="název">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
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
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="zajímavost">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="foto">
        <div class="flex-container">
            <img src="{@src}" alt="{..//název}"  />
        </div>
    </xsl:template>
    
    <xsl:template match="majitelé">
        <ol>
            <xsl:apply-templates select="majitel"/>
        </ol>
    </xsl:template>
    
    <xsl:template match="majitel">
        <li><xsl:apply-templates/></li> <!-- v css upravím na 
            <ul style="list-style-image: URL('puntik.gif')">
            <li>položka s obrázkovou odrážkou</li>
            </ul> -->
    </xsl:template>
    
    <xsl:template match="přístupnost">
        <ul>
            <xsl:apply-templates select="kategorie"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="kategorie">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="služby">
        <ul>
            <xsl:apply-templates select="služba"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="služba">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="reference">
        <div>
            <xsl:apply-templates select="hodnocení"/>
        </div>
    </xsl:template>
    
    <xsl:template match="hodnocení">
        <p><xsl:apply-templates select="počet_hvězd"/></p>
        <p><xsl:apply-templates select="datum"/></p>
        <p><xsl:value-of select="komentář"/></p>
    </xsl:template>
    
    <xsl:template match="počet_hvězd">
        <xsl:text>POČET HVĚZD: </xsl:text>
        <xsl:if test="text()='5'">
            <xsl:text>&#9733; &#9733; &#9733; &#9733; &#9733;</xsl:text>            
        </xsl:if>
        <xsl:if test="text()='4'">
            <xsl:text>&#9733; &#9733; &#9733; &#9733;</xsl:text>            
        </xsl:if>
        <xsl:if test="text()='3'">
            <xsl:text>&#9733; &#9733; &#9733;</xsl:text>            
        </xsl:if>
        <xsl:if test="text()='2'">
            <xsl:text>&#9733; &#9733;</xsl:text>            
        </xsl:if>
        <xsl:if test="text()='1'">
            <xsl:text>&#9733;</xsl:text>            
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="datum">
        <xsl:value-of select="format-date(xs:date(.),'[D].[M].[Y]')"/>
    </xsl:template>
        
</xsl:stylesheet>