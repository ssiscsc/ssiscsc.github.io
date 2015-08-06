<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Daily Activity Log</title>
        <link rel="stylesheet" type="text/css" href="events.css" />
        <link rel="styleshrrt" type="text/css" href="../lib/css/main.css" />
      </head>
      <body>
        <div class="header fixed at-top">What's happening ...</div>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="events">
    <ul class="with-top-margin">
      <xsl:apply-templates select="event"/>
    </ul>
  </xsl:template>

  <xsl:template match="event">
    <li class="event">
      <xsl:apply-templates select="action"/>
      <br/>
      <small>
        <xsl:value-of select="@date"/>
        <xsl:apply-templates select="references"/>
      </small>
    </li>
  </xsl:template>

  <xsl:template match="action">
    <span class="action-type"><xsl:value-of select="@type"/></span>
    <span class="event-title"><xsl:value-of select="."/></span>
  </xsl:template>

  <xsl:template match="references">
    <span class="references">
      (<xsl:apply-templates select="reference"/>)
    </span>
  </xsl:template>

  <xsl:template match="reference">
      <a target="_blank">
        <xsl:attribute name="href">
          <xsl:value-of select="@src"/>
        </xsl:attribute>
        <xsl:value-of select="@type"/>
    </a>
    <xsl:if test="position() != last()">, </xsl:if>
  </xsl:template>

</xsl:stylesheet>
