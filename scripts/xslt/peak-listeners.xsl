<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
 <xsl:output method="text"/>
 <xsl:param name="mount"/>

 <xsl:template match="/icestats">
  <xsl:apply-templates select="source"/>
 </xsl:template>

 <xsl:template match="source">
   <xsl:if test="@mount=$mount">
    <xsl:value-of select="listener_peak/text()"/>
   </xsl:if>
 </xsl:template>
</xsl:stylesheet>
