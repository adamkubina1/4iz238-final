<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    
    <sch:pattern>
        <sch:title>Maximální cena vstupného</sch:title>
        <sch:rule context="o:památka">           
            <sch:assert test="if(../o:vstupné/@měna='Kč') 
                then(max(../o:vstupné[@měna='Kč'])&gt;= 5000) 
                else(true())">Maximální cena může být 5000 Kč</sch:assert>
            <sch:assert test="if(../o:vstupné/@měna='Euro') 
                then(max(../o:vstupné[@měna='Euro'])&gt;= 200) 
                else(true())">Maximální cena může být 200 Euro</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>