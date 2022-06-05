<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
    queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:title>Validace průvodce</sch:title>
    <sch:ns uri="urn:Test.Namespace" prefix="o"/>
    <sch:ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs"/>
    
    <sch:pattern>
        <sch:title>Rok je zadán v pořádku</sch:title>
        <sch:rule context="o:postaven">
            <sch:assert test="max(../o:postaven) &lt; 2019">
                Památka musí být postavená dříve než v roce 2019.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    
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