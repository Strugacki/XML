<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
  
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/> 
	<link rel="stylesheet" type="text/css" href="styles.css"/>
 <title>PROJEKT 3</title>
  
</head>
<body>



<xsl:for-each select="/ksiazka/grupa">

<xsl:variable name="kod">
	<xsl:value-of select="@id"/>
</xsl:variable>

  <h2 style="text-decoration:underline">GRUPA:<xsl:value-of select="nazwa"/></h2>
	
<table style="border: 2px dotted black;background:aqua;">
	<tr style="border: 2px solid black">
		<td>Nr</td>
		<td>Nazwisko</td>
		<td>Imie</td>
		<td>Adres</td>
		<td>gg</td>
		<td>Telefon</td>
		<td>email</td>
		<td>www</td>
</tr>



<xsl:for-each select="/ksiazka/kontakt">

<xsl:variable name="Nr">
	<xsl:number/>
</xsl:variable>

<xsl:variable name="gg">
	<xsl:value-of select="dane_kontaktowe/gg"/>
</xsl:variable>


<xsl:variable name="email">
	<xsl:value-of select="dane_kontaktowe/email"/>
</xsl:variable>

<xsl:variable name="www">
	<xsl:value-of select="strDom"/>
</xsl:variable>






<xsl:choose>
	
<xsl:when test="$Nr mod 2">
<xsl:if test="@id_grupa=$kod">	
<tr style="background: orange">
<td>
	<xsl:value-of select="$Nr"/>
</td>
<td>
	<xsl:value-of select="dane_personalne/nazwisko"/>
</td>

<td>
	<xsl:value-of select="dane_personalne/imie"/>
</td>

<td>
	<xsl:value-of select="adres"/>
</td>

<td>
	<xsl:value-of select="dane_kontaktowe/gg"/>
</td>

<td>
	<xsl:value-of select="dane_kontaktowe/tel"/>
</td>

<td>
	<a href="mailto:{$email}"><xsl:value-of select="$email"/></a>
</td>

<td>
	<a href="$www"><xsl:value-of select="strDom"/></a>
</td>
</tr>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:if test="@id_grupa=$kod">
<tr>
<td>
	<xsl:value-of select="$Nr"/>
</td>
<td>
	<xsl:value-of select="dane_personalne/nazwisko"/>
</td>

<td>
	<xsl:value-of select="dane_personalne/imie"/>
</td>

<td>
	<xsl:value-of select="adres"/>
</td>

<td>
	<xsl:value-of select="dane_kontaktowe/gg"/>
</td>

<td>
	<xsl:value-of select="dane_kontaktowe/tel"/>
</td>

<td>
	<a href="mailto:{$email}"><xsl:value-of select="$email"/></a>
</td>

<td>
	<a href="$www"><xsl:value-of select="strDom"/></a>
</td>
</tr>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</table>
</xsl:for-each>


<h2  style="text-decoration:underline;">Kobitki z gmail :) </h2>
<table style="border: 2px dotted black;background:aqua">
<tr>
	<td>Imie</td>
 	<td>Nazwisko</td>
  	<td>email</td></tr>
<xsl:for-each select="/ksiazka/kontakt">
<xsl:if test="(dane_kontaktowe/email[contains(string(),'@gmail.com')] and @plec='k')">
<tr>
  	<td>
		<xsl:value-of select="dane_personalne/nazwisko"/>
	</td>

	<td>
   		<xsl:value-of select="dane_personalne/imie"/>
   	</td>

   	<td>
		<xsl:value-of select="dane_kontaktowe/email"/>
	</td>

</tr>
</xsl:if>
</xsl:for-each>
</table>

<h2 style="text-decoration:underline;">Chopy z mylionami :)</h2>
<table style="border: 2px dotted black;background:aqua;">
<tr>
	<td>Nazwisko</td>
	<td>Imie</td>
	<td>gg</td>
	<td>Telefon</td>
	<td>Myliony</td></tr>

<xsl:for-each select="/ksiazka/kontakt">
<xsl:sort select="(dane_kontaktowe/gg) + (dane_kontaktowe/tel)"/>
<xsl:variable name="myliony"></xsl:variable>
<xsl:variable name="gg" >
	<xsl:value-of select="dane_kontaktowe/gg"/>
</xsl:variable> 
<xsl:variable name="tel" >
	<xsl:value-of select="dane_kontaktowe/tel"/>
</xsl:variable> 
<xsl:variable name="Nr">
<xsl:number/>
</xsl:variable>



<xsl:if test="((@plec='m') and ($gg + $tel > 900000000))">
<tr>
<td>
	<xsl:value-of select="dane_personalne/nazwisko"/>
</td>
<td>
   	<xsl:value-of select="dane_personalne/imie"/>
</td>
<td>
   <xsl:value-of select="$gg"/>
</td>
<td>
   	<xsl:value-of select="$tel"/>
</td>
<td>
	<xsl:value-of select="$gg + $tel"/>
</td>
</tr>
</xsl:if>
</xsl:for-each>
</table>  


   

</body>
</html>
</xsl:template>
</xsl:stylesheet>
