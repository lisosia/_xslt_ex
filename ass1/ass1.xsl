<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xml:output method="html" encoding="UTF-8"/>
  <xsl:template match="/" >
    <HTML>

      <style>
	body {background-color:lightgrey;}
	h1   {color:blue;}
	div  { margin-left: 40px; }
      </style>
      <BODY>
	<h1>Table of Contents</h1>
	<xsl:apply-templates select='//body//div1' />	
      </BODY>
    </HTML>
  </xsl:template>
  
  <xsl:template match="//div1">
    <xsl:apply-templates select="head" />
    <div>
    <xsl:apply-templates select="div2" />
    </div>
  </xsl:template>    

  <xsl:template match="//div1//div2">
    <xsl:apply-templates select="head" />
    <div>
    <xsl:apply-templates select="div3" />
    </div>
  </xsl:template>    

  <xsl:template match="//div1//div2//div3">
    <xsl:apply-templates select="head" />
    <xsl:apply-templates select="div4" />
  </xsl:template>    

  <xsl:template match="//div2/head">
    <xsl:apply-templates select="head" />
  </xsl:template>    

  <xsl:template match="//head">
    <!--
    <xsl:value-of select="position()"/>
    <xsl:text> </xsl:text>
    -->
    <xsl:value-of select="."/><BR/>
  </xsl:template>    

</xsl:stylesheet>
