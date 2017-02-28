<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         generic-remove-if-no-group.xslt
    # Purpose:	Remove group node if there are not two elements inside
    # Part of:      Vimod Pub - https://github.com/SILAsiaPub/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2017-02-23
    # Copyright:    (c) 2017 SIL International
    # Licence:      <MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:include href="inc-copy-anything.xslt"/>
<xsl:param name="remove"/>
<xsl:param name="greaterthan" select="1"/>
      <xsl:template match="*[local-name() = $remove]">
            <xsl:if test="count(*) gt number($greaterthan)">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
