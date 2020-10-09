<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" >

  <xsl:include href="http://www.topelius.fi/xslt/poem_nohtml_adv.xsl" />
  
  <xsl:template match="tei:body">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="http://www.topelius.fi/css/tei.css"/>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
    <xsl:call-template name="listFootnotes">
      <xsl:with-param name="sectionToProcess"><xsl:value-of select="$sectionId"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="endSpace"/>
  </xsl:template>

</xsl:stylesheet>