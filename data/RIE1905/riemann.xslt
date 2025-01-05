<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    <xsl:template match="TEI">
        
            
            
            <TEI>
                <xsl:copy-of select="teiHeader"/>
                <text>
                    <body>
                        <xsl:apply-templates select="facsimile[@xml:id]"/>
                    </body></text>
            </TEI>
        
    </xsl:template>
    
    <xsl:template match="facsimile">
        <xsl:copy-of select="//pb[@facs=concat('#',current()/@xml:id)]"/>
        <xsl:apply-templates select="surface/zone"/>
    </xsl:template>
    
    <xsl:template match="zone">
        <xsl:choose>
            <xsl:when test="@rendition='TextRegion'">
                
                <div rend="TEI"><xsl:copy select="@xml:id"/>
                    <xsl:copy-of select="//p[@facs=concat('#',current()/@xml:id)]"/>
                </div>
            </xsl:when>
            <xsl:when test="@rendition='Graphic'">
                <div rend="GRAPHIC"><xsl:copy select="@xml:id"/><figure><graphic height="100px" width="500px"> <xsl:attribute name="url" select="concat('graphic/',@xml:id,'.png')"/></graphic></figure></div>
            </xsl:when>
            <xsl:when test="@rendition='Music'">
                <div rend="MEI"><xsl:copy select="@xml:id"/>
                    <xsl:attribute name="id" select="concat(@xml:id,'.mei')"/>MUSIK</div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>