<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	


<xsl:template match="/">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl"> 
    <head> 
        <meta charset="utf-8"/> 
		<link rel="stylesheet" type="text/css" href="style.css" />
        <title>Projekt 3</title> 
    </head> 
  <body>
  
  <xsl:for-each select="ksiazka/prace/praca">
	    <h2>Firma: <xsl:value-of select="nazwa_pr"/> </h2>

  <xsl:variable name="kod" ><xsl:value-of select="@kod_pr"/></xsl:variable> 

  

  <table>
  <tr><td>ID</td><td>Nazwisko</td><td>Imie</td><td>adres</td><td>GG</td><td>Telefony</td><td>strona www</td><td>email</td></tr>
  <xsl:for-each select="/ksiazka/osoby/osoba">

  <xsl:variable name="number">
  <xsl:number/>
</xsl:variable>

  
   <xsl:variable name="www" ><xsl:value-of select="strona"/></xsl:variable> 
  <xsl:variable name="email" ><xsl:value-of select="email"/></xsl:variable> 
       <xsl:choose>
         <xsl:when test="$number mod 2"> 
	 
	<xsl:if test="@kod_praca=$kod">
	<tr style="background: red">
	<td><xsl:value-of select="$number"/></td>
	<td>
	<xsl:value-of select="nazwisko"/>
	</td>
	<td>
   <xsl:value-of select="imie"/>
   </td>
   <td style="width: 250px">
   <xsl:value-of select="adres"/>
		</td>
		<td>
   <xsl:value-of select="gg"/>
		</td>
		   <td>
   <xsl:value-of select="telefony"/>
		</td>
		   <td>
	<a href="{$www}" ><xsl:value-of select="$www"/></a>	   
		</td>
				   <td>
	<a href="mailto:{$email}" ><xsl:value-of select="email"/></a>	   
		</td></tr>
	</xsl:if>
	
         </xsl:when>
         <xsl:otherwise>
          	 
	<xsl:if test="@kod_praca=$kod">
	<tr style="background: blue">
	<td><xsl:value-of select="$number"/></td>
	<td>
	<xsl:value-of select="nazwisko"/>
	</td>
	<td>
   <xsl:value-of select="imie"/>
   </td>
   <td style="width: 250px">
   <xsl:value-of select="adres"/>
		</td>
		<td>
   <xsl:value-of select="gg"/>
		</td>
		   <td>
   <xsl:value-of select="telefony"/>
		</td>
		   <td>
<a href="{$www}"><xsl:value-of select="$www"/></a>	
		</td>
				   <td>
	<a href="mailto:{$email}" ><xsl:value-of select="email"/></a>	   
		</td>
		</tr>
	</xsl:if>
	
         </xsl:otherwise>
       </xsl:choose>

  </xsl:for-each>
  </table>
  </xsl:for-each>
  
  <br></br>
  <h3>GMAIL</h3>
  <table style="border: 2px solid black">
  <tr><td>Imie</td><td>Nazwisko</td><td>email</td></tr>
  <xsl:for-each select="/ksiazka/osoby/osoba">
  <xsl:if test="(email[contains(string(),'@gmail.com')]) and (@plec='k')">
  <tr>
  <td>
	<xsl:value-of select="nazwisko"/>
	</td>
	<td>
   <xsl:value-of select="imie"/>
   </td>
   <td>
	<xsl:value-of select="email"/>
	</td>
	</tr>
  </xsl:if>
  </xsl:for-each>
  
  </table>
  
  
  <br></br>
  <h3>SUMY</h3>
  <table style="border: 2px solid black">
  <tr><td>ID</td><td>Nazwisko</td><td>Imie</td><td>gg</td><td>Telefon</td><td>SUMA</td></tr>

 

<xsl:variable name="suma" ></xsl:variable>

<xsl:for-each select="/ksiazka/osoby/osoba">
<xsl:sort select="gg + telefony"/>

 <xsl:variable name="gg" ><xsl:value-of select="gg"/></xsl:variable> 
<xsl:variable name="tel" ><xsl:value-of select="telefony"/></xsl:variable> 
  <xsl:variable name="number">
  <xsl:number/>
</xsl:variable>



<xsl:if test="(@plec='m') and ($gg + $tel > 900000000)">
<tr>
<td>
	<xsl:value-of select="$number"/>
	</td>
<td>
	<xsl:value-of select="nazwisko"/>
	</td>
	<td>
   <xsl:value-of select="imie"/>
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
  
  <br></br><br></br>
<div id="w3c">
  <a id="w3" href="http://validator.w3.org/check?uri=https%3A%2F%2Finf.ug.edu.pl%2F~mgrabowski%2FXML%2Fxml.xhtml"><b> W3C Validator </b></a> </div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>