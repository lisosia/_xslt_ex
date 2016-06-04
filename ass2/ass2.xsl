<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xml:output method="html" encoding="UTF-8"/>
  <xsl:template match="/" >
    <HTML>
      <BODY>
	<h1>Term Definitions</h1>

	<table border="1">
	  <tr><th>word</th><th>definition</th></tr>
	  <xsl:apply-templates select="//termdef" />	
	</table>

	<h1>Definitions(described in paragraph) ,vcnote</h1>

	<table border="1">
	  <tr><th>word</th><th>definition</th></tr>
	  <xsl:apply-templates select="//vcnote" />	
	</table>

      </BODY>
    </HTML>
  </xsl:template>
  
  <xsl:template match="termdef">
    <tr>
      <td><xsl:value-of select="@term"/></td>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>    

  <xsl:template match="vcnote">
    <tr>
      <td><xsl:value-of select="head"/></td>
      <td><xsl:value-of select="p"/></td>
    </tr>
  </xsl:template>    

</xsl:stylesheet>
