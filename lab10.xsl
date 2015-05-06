<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
  <html> 
  <head><meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/> 
  <title>Zwierzaki</title>
  </head>
  <body>
  <h2>Zwierzaki lab10</h2>

<ol>
      <xsl:for-each select="zwierzaki/zwierze">
<li>
	  <xsl:if test="plec='k' and gatunek='kot'">
	  <xsl:text>kotka </xsl:text>
	  <span style="color: green; text-decoration: underline"><xsl:value-of select="imie "/></span>
      <xsl:text> </xsl:text>
      </xsl:if>
    
      <xsl:if test="plec='m' and gatunek='kot'">
      <xsl:text>kot </xsl:text>
      <span style="color: green; text-decoration: underline"><xsl:value-of select="imie "/></span>
      <xsl:text> </xsl:text>
      </xsl:if>
      
      <xsl:if test="plec='k' and gatunek='pies'">
      <xsl:text>suka </xsl:text>
      <span style="text-decoration: underline"><xsl:value-of select="imie "/></span>
      <xsl:text> </xsl:text>
      </xsl:if>
      
      <xsl:if test="plec='m' and gatunek='pies'">
      <xsl:text>pies </xsl:text>
      <span style="text-decoration: underline"><xsl:value-of select="imie "/></span>
      <xsl:text> </xsl:text>
      </xsl:if>
      
      
	  <xsl:value-of select="gatunek "/>
</li>		
</xsl:for-each>
</ol>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
