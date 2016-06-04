<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <!--<xml:output method="xml" encoding="UTF-8"/> -->

  <xsl:template match="/" >
    <HTML>

      <style>
	body {background-color:lightgrey;}
	h1   {color:blue;}
	div  { margin-left: 40px; }
      </style>
      <BODY>
      	<h1>Table of Contents</h1>
	<xsl:apply-templates select="//termdef" />
	<h1>where terms used</h1>
	<xsl:apply-templates select="//p[termref]" />
      </BODY>
    </HTML>
  </xsl:template>
  
  <xsl:template match="//termdef">

    <xsl:variable name="termid" select="@id" />
    
    <xsl:element name="a">
      <xsl:attribute name="id">
	<xsl:value-of select="$termid" />
      </xsl:attribute>
      
      <xsl:value-of select="position()"/>.
      <xsl:value-of select="@term" /> . <xsl:value-of select="@id" /> <br/>
      <xsl:value-of select="."/><BR/>
      <xsl:text> --- </xsl:text> <br/>
    
    </xsl:element>

  </xsl:template>    

  <xsl:template match="//p[termref]">
    <xsl:variable name="defname" select="./termref/@def" />
    
    <xsl:element name="a">
      <xsl:attribute name="href">
	<xsl:value-of select="concat('#',$defname)" />
      </xsl:attribute>
      <xsl:value-of select="$defname" /> <br/>
    </xsl:element>
      <!--<xsl:copy-of select="."/><br/><br/>-->
      <xsl:apply-templates select="@*|node()" mode="string" /> <br/><br/>
      
  </xsl:template>    

  <xsl:template match="//termref" mode="string">
    <strong>
      <xsl:copy-of select="."/>
    </strong>
  </xsl:template>  

</xsl:stylesheet>
