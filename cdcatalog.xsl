<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
      <th style="text-align:left">Price</th>

    </tr>
    <xsl:for-each select="catalog/cd">

      <!-- Ordenar-->
      <xsl:sort select="artist"></xsl:sort>
      <xsl:sort select="price" data-type="number" order="descending"></xsl:sort>
    

      <!-- Condicional-->
      <xsl:if test="((price &lt; 10) and (price &gt; 7.5) or (price &gt; 12))">
        <tr>
          <td><xsl:value-of select="title"/></td>
        </tr>

      <!-- Con choose elegimos entre varias opciones -->
      <xsl:choose>

        <!-- Con When especifcamos la condición a cumplir -->
        <xsl:when test="price &gt; 10">
          <td bgcolor="#ff00ff">
          <xsl:value-of select="artist"/></td>
        </xsl:when>

        <!-- Añadimos otro when/condición para que si el precio está entre 0 y 8 el fondo se ponga de otro color -->
        <xsl:when test="price &gt; 0 and price &lt; 8">
          <td bgcolor="#ff0000">
          <xsl:value-of select="artist"/></td>
        </xsl:when>

        <!-- Con otherwise, especificamos que se hace si la condición no se cumple-->
        <xsl:otherwise>
          <td><xsl:value-of select="artist"/></td>
        </xsl:otherwise>
        
      </xsl:choose>


    <td><xsl:value-of select="price"/></td>

    </xsl:if>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>