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

       <h1>Index</h1>
       <xsl:apply-templates select="/spec/body" />
     </BODY>
   </HTML>
 </xsl:template>


 <xsl:template match="//body">
  <xsl:variable name="maxdepth">1</xsl:variable>
  <xsl:variable name="tab" select='"  "' />

  <xsl:for-each select="//div1">
    <xsl:variable name="d1" select="position()" />
    <xsl:value-of select="$d1" />.
    <xsl:apply-templates select="./head" /><br/>

    <xsl:if test="$maxdepth &gt; 1">
      <xsl:for-each select="./div2">
        <xsl:variable name="d2" select="position()" />
        <xsl:value-of select="$d1" />.
        <xsl:value-of select="$d2" />.
        <xsl:value-of select="./head" /><br/>

        <xsl:if test="$maxdepth &gt; 2">
          <xsl:for-each select="./div3">
            <xsl:variable name="d3" select="position()" />
            <xsl:value-of select="$d1" />.
            <xsl:value-of select="$d2" />.
            <xsl:value-of select="$d3" />.
            <xsl:value-of select="./head" /><br/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:if>

      </xsl:for-each>
    </xsl:if>

  </xsl:for-each>


</xsl:template>

</xsl:stylesheet>
