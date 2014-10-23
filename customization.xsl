<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="1.0">

    <xsl:import href="/usr/share/sgml/docbook/xsl-ns-stylesheets/fo/docbook.xsl"/>
    
    <xsl:param name="local.l10n.xml" select="document('')"/> 

    <!-- remove trailing period after honorific -->
    <xsl:param name="punct.honorific"/>    

    <!-- remove trailing period after run-in head (e.g., formal paragraph title) -->
    <xsl:param name="runinhead.default.title.end.punct"/>    
    
    <!-- remove "Chapter" in chapter title. -->
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="en"> 
            <l:context name="title-numbered">
                <l:template name="chapter" text="%n.&#160;%t"/>
            </l:context>    
        </l:l10n>
    </l:i18n>

    <!-- break before each section -->
    <xsl:attribute-set name="section.title.level1.properties">
        <xsl:attribute name="break-before">page</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
