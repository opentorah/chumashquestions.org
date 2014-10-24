<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">

    <xsl:import href="/usr/share/sgml/docbook/xsl-ns-stylesheets/html/docbook.xsl"/>  <!-- I do not need to chunk.xml! -->

    <xsl:import href="common.xsl"/>

    <!-- TODO I do not chunk; what are the equivalents - and do I need them? -->
    <xsl:param name="chunker.output.encoding">UTF-8</xsl:param>
    <xsl:param name="chunker.output.indent">yes</xsl:param>  <!-- Pretty-print the HTML -->

    <!-- TODO do I need this? -->
    <xsl:param name="para.propagates.style">yes</xsl:param>  <!-- "role" attribute on "para" will become "class" in HTML -->
</xsl:stylesheet>
