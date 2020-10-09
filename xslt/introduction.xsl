<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:zte="http://www.topelius.fi">

  <xsl:include href="inc_common.xsl" />
  
  <xsl:template match="tei:teiHeader"/>
  
  <xsl:template match="tei:body">
    <div class="container" id="cont_introduction">
      <xsl:apply-templates/>
      <xsl:if test="not(//tei:div[@type='section'])">
        <xsl:call-template name="listFootnotes" />
      </xsl:if>
      <xsl:call-template name="endSpace"/>
    </div>
  </xsl:template>

  <xsl:template match="tei:head">
    <xsl:choose>
      <xsl:when test="@type='main'">
        <h3>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">tei mainHeader</xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </h3>
      </xsl:when>
      <xsl:when test="parent::tei:div[@type='content'] and @type='section'">
        <h2>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">contentSection</xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
      <xsl:when test="not(parent::tei:div[@type='content']) and @type='section'">
        <h2>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">tei section</xsl:with-param>
          </xsl:call-template>           <xsl:apply-templates/>
        </h2>
      </xsl:when>
      <xsl:when test="@type='author'">
        <p>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">authorHeader</xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:when test="parent::tei:div[@type='content'] and @type='sub2'">
        <h5>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">
   <xsl:text>tei contentSub2</xsl:text>             </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </h5>
      </xsl:when>
      <xsl:when test="not(parent::tei:div[@type='content']) and @type='sub2'">
        <h5>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">
              <xsl:text>tei sub2</xsl:text>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </h5>
      </xsl:when>
      <xsl:when test="@type='sub'">
        <h4>
          <xsl:call-template name="attRend"/>
          <xsl:apply-templates/>
        </h4>
      </xsl:when>
      
      <xsl:when test="parent::tei:div[@type='content']">
        <h4>
          <xsl:call-template name="attRend" />
          <xsl:apply-templates/>
        </h4>
      </xsl:when>
      <xsl:when test="@type='illustration'">
        <p class="noIndent halfLinePadding bold">
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <h3>
          <!--<xsl:choose>
            <xsl:when test="@rend='italics'">
              <i>
                <xsl:apply-templates/>
              </i>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>-->
          <xsl:call-template name="attRend"/>
          <xsl:apply-templates/>
        </h3>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
   <xsl:template match="tei:div">
    <xsl:choose>
      <xsl:when test="@type='comments'"/>
      <xsl:when test="@type='section'">
        <xsl:apply-templates/>
        <xsl:call-template name="listFootnotes">
          <xsl:with-param name="sectionToProcess">
            <xsl:value-of select="@id"/>
          </xsl:with-param>
          <xsl:with-param name="noEmptyLines">
            <xsl:text>yes</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <div>
          <xsl:if test="@id">
            <xsl:attribute name="id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:opener">
      <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:ref">
    <a class="textreference">
      <xsl:attribute name="href">
        <xsl:value-of select="@target"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <!--<xsl:template match="tei:xref">
    <a>
      <xsl:attribute name="target">
        <xsl:text>_blank</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="href">
        <xsl:text>pdf_zts/</xsl:text>
        <xsl:value-of select="@target"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>-->

  <!--<xsl:template match="tei:lg">
    <p class="strofe">
      <span class="lNumber">
        <xsl:number level="any" count="tei:p|tei:lg"/>
      </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>-->

  <xsl:template match="tei:lg">
    <xsl:if test="not(ancestor::tei:note)">
      <xsl:if test="name(preceding-sibling::*[1]) = 'p' or name(preceding-sibling::*[1]) = 'pb'">
        <p class="strofeSpacing" />
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="name(following-sibling::*[1]) = 'lg' or name(following-sibling::*[1]) = 'pb' or name(following-sibling::*[1]) = 'p'">
        <p class="strofeSpacing" />
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!--<xsl:template match="tei:l">
    <xsl:if test="(@n mod 5) = 0">
      <span style="position:absolute;left:-12px;width:18px;color:#a9a49a;">
        <xsl:value-of select="@n"/>
      </span>
    </xsl:if>
    <xsl:if test="@rend='indent'">
      <xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
    <br />
  </xsl:template>-->

  <xsl:template match="tei:l">
    <p>
      <xsl:attribute name="class">
        <xsl:text>l</xsl:text>
        <xsl:if test="parent::tei:lg[@rend='indent']">
          <xsl:text> lIndent</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <xsl:if test="count(preceding-sibling::tei:l)&lt;1">
        <span class="lNumber">
          <xsl:number level="any" count="tei:p|tei:lg"/>
        </span>
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:address">
    <p style="font-style: italic;">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:dateline">
    <p style="margin-bottom: 1.0em;">
      <xsl:choose>
        <xsl:when test="@rend='italics'">
          <span style="font-style:italic">
            <xsl:apply-templates/>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:template>

  <xsl:template match="tei:salute">
    <xsl:choose>
      <xsl:when test="parent::tei:closer">
        <p>
          &#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:signed">
    <xsl:choose>
      <xsl:when test="parent::tei:closer">
        <p style="text-align: right;">
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:title">
    <span>
      <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">tei title tooltiptrigger ttTitle</xsl:with-param>
      </xsl:call-template>
      <xsl:if test="@corresp">
        <xsl:attribute name="id">
          <xsl:value-of select="@corresp"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:placeName">
    <span>
      <xsl:call-template name="attRend"/>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:persName">
    <span>
      <xsl:call-template name="attRend">
      <xsl:with-param name="defaultClasses">
        <xsl:text>tei person tooltiptrigger ttPerson</xsl:text>
        <xsl:if test="@correspUncert='Y'">
          <xsl:text> uncertain</xsl:text>
        </xsl:if>
        <xsl:if test="@role='fictional'">
          <xsl:text> fictional</xsl:text>
        </xsl:if>
      </xsl:with-param>
      </xsl:call-template>
      <xsl:if test="@corresp">
        <xsl:attribute name="id">
          <xsl:value-of select="@corresp"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:p">
    <xsl:choose>
      <xsl:when test="parent::tei:note">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="paragraphNumber">
          <xsl:number level="any" count="tei:p|tei:lg"/>
        </xsl:variable>
        <p>
          <xsl:choose>
            <xsl:when test="ancestor::tei:div[@type='sources']">
              <xsl:call-template name="attRend">
                <xsl:with-param name="defaultClasses">
                  <xsl:choose>
                    <xsl:when test="contains(@rend, 'noPadding')">
                      <xsl:text>tei noIndent </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>tei noIndent halfLinePadding </xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:value-of select="@xml:id"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="@rend">
              <xsl:call-template name="attRend">
                <xsl:with-param name="defaultClasses">
                  <xsl:if test="@xml:id">
                    <xsl:value-of select="@xml:id"/>
                    <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:if test="@n='1'">
                    <xsl:text> noIndent </xsl:text>
                  </xsl:if>
                  <xsl:if test="@rend='parIndent'">
                    <xsl:text> parIndent </xsl:text>
                  </xsl:if>
                  <xsl:if test="@rend='noIndent'">
                    <xsl:text> noIndent </xsl:text>
                  </xsl:if>
                </xsl:with-param>
              </xsl:call-template> 
            </xsl:when>
            <xsl:when test="parent::tei:postscript">
              <xsl:attribute name="class">
                <xsl:text>noIndent </xsl:text>
                <xsl:value-of select="@xml:id"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="ancestor::tei:div[@type='imageAppendix']">
              <xsl:attribute name="class">
                <xsl:text>noIndent halfLinePadding </xsl:text>
                <xsl:value-of select="@xml:id"/>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <xsl:if test="not(ancestor::tei:div[@type='sources'])">
            <span>
              <xsl:attribute name="class">
                <xsl:text>paragraph_number p</xsl:text>
                <xsl:value-of select="$paragraphNumber"/>
              </xsl:attribute>
              <xsl:value-of select="$paragraphNumber"/>
            </span>
          </xsl:if>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

 <xsl:template match="tei:hi"
mode="tooltip">
    <xsl:call-template
name="tei-hi"/>
  </xsl:template>
  <xsl:template
match="tei:hi">
    <xsl:call-template
name="tei-hi"/>
  </xsl:template>
  <xsl:template name="tei-hi">
<xsl:choose>     <xsl:when test="@rend='expanded'">
      <span class="trueexpanded">
        <xsl:apply-templates/>
      </span>
    </xsl:when>
<xsl:otherwise>
    <span>
      <xsl:call-template name="attRend"/>
      <xsl:apply-templates/>
    </span>
</xsl:otherwise> </xsl:choose>   </xsl:template>

  <xsl:template match="tei:pb">
    <span>
      <xsl:call-template name="att_pb_class"/>
      <xsl:call-template name="pb_text"/>
    </span>
  </xsl:template>

  <xsl:template match="tei:add">
    <span style="vertical-align: 30%;">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:del">
    <span style="text-decoration: line-through;">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:figure">
    <xsl:if test="@type='illustration'">
      <img class="symbol" src="images/image_symbol.gif"/>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:graphic">
    <img>
<xsl:choose>
      <xsl:when test="parent::tei:figure/@rend">
        <xsl:attribute name="class">
          <xsl:text>img_</xsl:text>
          <xsl:value-of select="parent::tei:figure/@rend"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="class">
          <xsl:text>est_figure_graphic</xsl:text>
          <xsl:if test="@align != ''">
            <xsl:text>_</xsl:text>
          </xsl:if>
          <xsl:value-of select="@align"/>
        </xsl:attribute>
      </xsl:otherwise>
</xsl:choose>
      <xsl:attribute name="src">
        <xsl:text>images/tei/</xsl:text>
        <xsl:value-of select="@url"/>
      </xsl:attribute>
    </img>
  </xsl:template>

  <!--<xsl:template match="tei:xref">
    <a>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@type='readingtext'">
            <xsl:text>xreference ref_readingtext</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text><xsl:value-of select="@target"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>-->
  
  <xsl:template match="tei:xptr">
    <a>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@type='illustration'">
            <xsl:text>xreference ref_illustration</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text><xsl:value-of select="@target"/>
      </xsl:attribute>
      <img src="images/image_symbol.gif"/>
    </a>
  </xsl:template>
  
</xsl:stylesheet>
