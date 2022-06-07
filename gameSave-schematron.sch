<?xml version="1.0" encoding="UTF-8"?>
<sch:schema 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    >
    <sch:ns uri="http://www.vse.cz/4iz238/sem/kuba10/XML/gameSave" prefix="g"/>
    
    <sch:pattern>
        <sch:title>Limits on position coordinates</sch:title>
        <sch:rule context="g:building">
            <sch:assert test="@id">Building must have id</sch:assert>
            <sch:assert test="@category">Building must have category</sch:assert>
            <sch:assert test="g:hp">Building must have hp</sch:assert>
            <sch:assert test="g:position">Building must have position</sch:assert>
            <sch:assert test="g:position/@x">Position of the building must have x coordinate</sch:assert>
            <sch:assert test="g:position/@y">Position of the building must have y coordinate</sch:assert>
            <sch:assert test="g:actionQueue">Building must have action queue</sch:assert>
            <sch:report test="g:hp[2]|g:position[2]|g:actionQueue[2]">Building can not have duplicite information</sch:report>
        </sch:rule>
    </sch:pattern>
    
    
    <sch:pattern>
        <sch:title>Limits on position coordinates</sch:title>
        <sch:rule context="g:position">           
            <sch:assert test="@x &lt; 999 and @x &gt; -999">X coordinate must be in -999 to 999 range</sch:assert>
            <sch:assert test="@y &lt; 999 and @x &gt; -999">Y coordinate must be in -999 to 999 range</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:title>Player count</sch:title>
        <sch:rule context="g:players">
            <report test="count(./g:player) &gt; 10">Max number of players</report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>