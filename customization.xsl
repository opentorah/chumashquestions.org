<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">

    <xsl:import href="/usr/share/sgml/docbook/xsl-ns-stylesheets/fo/docbook.xsl"/>


    <xsl:param name="local.l10n.xml" select="document('')"/>

    <!-- Paper size; double-sidedness; not a draft -->
    <xsl:param name="paper.type">USletter</xsl:param>
    <xsl:param name="double.sided">1</xsl:param>
    <xsl:param name="draft.mode">no</xsl:param>

    <!-- Font family and size -->
    <xsl:param name="body.font.family">sans-serif</xsl:param>
    <xsl:param name="body.font.master">14</xsl:param>

    <!-- FOP extensions -->
    <xsl:param name="fop.extensions">0</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>

    <!-- Remove trailing period after honorific -->
    <xsl:param name="punct.honorific"/>

    <!-- Remove trailing period after run-in head (e.g., formal paragraph title) -->
    <xsl:param name="runinhead.default.title.end.punct"/>    

    <!-- Remove "Chapter" in chapter title -->
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="en"> 
            <l:context name="title-numbered">
                <l:template name="chapter" text="%n.&#160;%t"/>
            </l:context>
        </l:l10n>
    </l:i18n>

    <!-- Break before each section -->
    <xsl:attribute-set name="section.title.level1.properties">
        <xsl:attribute name="break-before">page</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="body.start.indent">0pt</xsl:param>

    <xsl:param name="orderedlist.label.width">2em</xsl:param>
</xsl:stylesheet>
