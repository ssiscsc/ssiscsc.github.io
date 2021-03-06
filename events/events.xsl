<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>SSISCSC - Events</title>
        <link rel="stylesheet" type="text/css" href="../lib/css/main.css" />
        <style>
          div.body hr { margin-bottom: 10px; }
          div.footer {
            position: relative;
            bottom: 0;
            left: 0;
            height: 2em;
            width: 40em;
          }
       </style>
      </head>
      <body>
        <div class="wrapper">
          <div class="header">
            <a href="/"><h1>ssiscsc</h1></a>
          </div>
          <div class="nav">
            <ul>
              <li><a href="../" style="color: red;">index</a></li>
              <li><span class="separator">|</span></li>
              <li><a href="../events/">events</a></li>
              <li><span class="separator">|</span></li>
              <li><a href="../faq/">faq</a></li>
            </ul>
          </div>
          <div class="body">
            <h1>Events</h1><hr/>
            <div class="feed">
              <xsl:apply-templates/>
            </div>
          </div>
          <div class="footer">
            <p>
              The Site is Licensed Under the 
                <a href="https://raw.githubusercontent.com/ssiscsc/ssiscsc.github.io/master/LICENSE">
                  MIT License.</a>
            </p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="events">
    <ul class="without-top-margin">
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
