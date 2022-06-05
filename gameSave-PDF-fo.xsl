<?xml version="1.0" encoding="UTF-8"?>
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
            <fo:block text-align="right" margin-top="-20mm">Representation of game save</fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after" font-size="10pt">
            <fo:block text-align="center" margin-bottom="-20mm">Page <fo:page-number/></fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body" font-family="Calibri" font-size="16pt">
            <fo:block font-size="200%">Game save</fo:block>
            <fo:block font-size="150%" margin-top="10mm"><fo:inline font-weight="bold">Map:
                </fo:inline>Map 1</fo:block>
            <fo:block font-size="150%"><fo:inline font-weight="bold">Player on turn:
                </fo:inline>Player 1</fo:block>
            <fo:block font-size="120%" margin-top="10mm" font-weight="bold">Player info</fo:block>
            <fo:block>
                <fo:basic-link internal-destination="d1e13">Player 1</fo:basic-link>
            </fo:block>
            <fo:block>
                <fo:basic-link internal-destination="d1e138">Player 2</fo:basic-link>
            </fo:block>
            <fo:block id="d1e13" break-before="page" font-size="200%">Player 1</fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Commodities</fo:inline>
                <fo:list-block>
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>•</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>100 amount of gold</fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>•</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>0 amount of wheat</fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Units</fo:inline>
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
                        <fo:table-row font-size="60%" border="1px" border-color="#076787"
                            border-style="solid">
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:external-graphic src="url('imgs/villager.jpg')"/>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>villager</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>100</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>0</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>10</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block> x = 0, y = 0</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:block>1. Moving to x = 12 y = -100, turns to complete
                                            3</fo:block>
                                        <fo:block>2. Mining, repeating this action, turns to
                                            complete 1</fo:block>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-size="60%" border="1px" border-color="#076787"
                            border-style="solid">
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:external-graphic src="url('imgs/soldier.jpg')"/>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>soldier</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>200</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>10</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>20</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block> x = 100, y = 100</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:block>1. Moving to x = 10 y = 100, turns to complete
                                            5</fo:block>
                                        <fo:block>2. Attacking, turns to complete 1</fo:block>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Buildings</fo:inline>
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
                        <fo:table-row font-size="60%" border="1px" border-color="#076787"
                            border-style="solid">
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:external-graphic src="url('imgs/townCenter.jpg')"/>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>townCenter</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>500</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block> x = 10, y = 10</fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                            <fo:table-cell border="1px" border-color="#076787" border-style="solid"
                                display-align="center" text-align="center">
                                <fo:block-container>
                                    <fo:block>
                                        <fo:block>1. Spawning a soldier, turns to complete
                                            3</fo:block>
                                        <fo:block>2. Spawning a villager, turns to complete
                                            1</fo:block>
                                        <fo:block>3. Producing 10 of gold, repeating this action,
                                            turns to complete 1</fo:block>
                                    </fo:block>
                                </fo:block-container>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
            <fo:block id="d1e138" break-before="page" font-size="200%">Player 2</fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Commodities</fo:inline>
                <fo:list-block>
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>•</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>0 amount of gold</fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>•</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>100 amount of wheat</fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Units</fo:inline>
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
                    </fo:table-body>
                </fo:table>
            </fo:block>
            <fo:block margin-top="20mm">
                <fo:inline font-size="150%" font-weight="bold">Buildings</fo:inline>
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
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:flow>
    </fo:page-sequence>
</fo:root>