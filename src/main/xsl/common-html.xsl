<?xml version="1.0" encoding="UTF-8"?>
<!-- Customizations common for all HTML-based output formats (HTML, EPUB, EPUB3) -->
<!-- This needs to be imported into the customization *after* the custamizable is! -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <xsl:import href="common.xsl"/>

    <xsl:param name="chunker.output.encoding">UTF-8</xsl:param>
    
    <!-- Pretty-print the HTML -->
    <xsl:param name="chunker.output.indent">yes</xsl:param>
    
    <!-- Use ids as names -->
    <xsl:param name="use.id.as.filename">yes</xsl:param>
    
    <!-- "role" attribute on "para", "emphasis", "phrase" will become "class" in HTML -->
    <xsl:param name="para.propagates.style">yes</xsl:param>
    <xsl:param name="emphasis.propagates.style">yes</xsl:param>
    <xsl:param name="phrase.propagates.style">yes</xsl:param>

    <!-- CSS stylesheet -->
    <xsl:param name="html.stylesheet">css/docbook.css</xsl:param>

    <!-- Images -->
    <xsl:param name="img.src.path">images/</xsl:param>
</xsl:stylesheet>
