<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<!--xsl:strip-space elements="*"/ --> 
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <!--<xsl:template match="Bouquet">
        <Bouquet>
        <xsl:if test="@s='-8'">
    		<xsl:attribute name="name">
    			<xsl:value-of select="@name"/>
    		</xsl:attribute>
            <xsl:apply-templates/>
    	</xsl:if>
        </Bouquet>
	</xsl:template>-->

  <xsl:template match="s">
        <xsl:if test="@s= '-8'">
        <!--<xsl:if test="Name=$[E004.8]_name">-->
        <Bouquet>
    		<xsl:attribute name="name">
    			<xsl:value-of select="@name"/>
    		</xsl:attribute>
            <xsl:apply-templates/>
        </Bouquet>
      </xsl:if>
	</xsl:template>

    <xsl:template match="S">
 		<S>
    		<xsl:attribute name="i">
    			<xsl:value-of select="@i"/>
    		</xsl:attribute>
    		<xsl:attribute name="t">
    			<xsl:value-of select="@t"/>
    		</xsl:attribute>
    		<xsl:attribute name="on">
    			<xsl:value-of select="@on"/>
    		</xsl:attribute>
    		<xsl:attribute name="s">
    			<xsl:value-of select="@s"/>
    		</xsl:attribute>
    		<xsl:attribute name="frq">
    			<xsl:value-of select="@frq"/>
    		</xsl:attribute>
    		<xsl:attribute name="n">
    			<xsl:value-of select="@n"/>
    		</xsl:attribute>
		</S>
	</xsl:template>

	<xsl:template match="attribute::*|node()">
		<xsl:copy>
			<xsl:apply-templates select="attribute::*|node()"/>
		</xsl:copy>
	</xsl:template>

	<!--<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>-->

</xsl:stylesheet>

