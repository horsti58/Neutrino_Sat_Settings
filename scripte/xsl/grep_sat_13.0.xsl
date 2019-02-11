<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<!--xsl:strip-space elements="*"/ --> 
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

 	<xsl:template match="sat">
        <xsl:if test="@position='130'">
		    <sat name="13.0E Hotbird 13B/13C/13E" flags="1" position="130">
                <xsl:apply-templates/>
		    </sat>
    	</xsl:if>
	</xsl:template>

    <xsl:template match="transponder">
		<transponder>
		<xsl:attribute name="frequency">
			<xsl:value-of select="@frequency"/>
		</xsl:attribute>
		<xsl:attribute name="symbol_rate">
			<xsl:value-of select="@symbol_rate"/>
		</xsl:attribute>
		<xsl:attribute name="polarization">
			<xsl:value-of select="@polarization"/>
		</xsl:attribute>
		<xsl:attribute name="fec_inner">
			<xsl:value-of select="@fec_inner"/>
		</xsl:attribute>
		<xsl:attribute name="system">
			<xsl:value-of select="@system"/>
		</xsl:attribute>
		<xsl:attribute name="modulation">
			<xsl:value-of select="@modulation"/>
		</xsl:attribute>
		</transponder>
	</xsl:template>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>

