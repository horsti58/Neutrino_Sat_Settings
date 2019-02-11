<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<!--xsl:strip-space elements="*"/ --> 
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

 	<xsl:template match="sat">
        <xsl:if test="@position='70'">
		    <sat name="7.0E Ku-band Eutelsat 7A/7B" position="70" diseqc="-1" uncommited="-1">
                <xsl:apply-templates/>
		    </sat>
    	</xsl:if>
	</xsl:template>

    <xsl:template match="S">
		<S>
		<xsl:attribute name="i">
			<xsl:value-of select="@i"/>
		</xsl:attribute>
		<xsl:attribute name="f">
			<xsl:value-of select="@f"/>
		</xsl:attribute>
		<xsl:attribute name="s">
			<xsl:value-of select="@s"/>
		</xsl:attribute>
		<xsl:attribute name="t">
			<xsl:value-of select="@t"/>
		</xsl:attribute>
<!--
		<xsl:attribute name="num">
			<xsl:value-of select="@num"/>
		</xsl:attribute>
-->
		<xsl:attribute name="n">
			<xsl:value-of select="@n"/>
		</xsl:attribute>
		</S>
	</xsl:template>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>

