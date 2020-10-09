<?xml version="1.0" encoding="utf-8"?>
<!--
This notice must be visible at all times.

Copyright (c) 2010 Mikael Norrgård (See Sharp IT). All rights reserved.
Created 2010 by Mikael Norrgård (Web: http://swww.seesharp.fi )
email: seesharp@witchmastercreations.com or mikael.norrgard@gmail.com

Rights to use and further develop given to Svenska litteratursällskapet i Finland.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">

  <!--<xsl:output method="html" version="1.0" encoding="utf-8" indent="no"/>-->

  <xsl:include href="inc_common.xsl" />

  <xsl:param name="bookId" />
  <xsl:param name="sectionId" />
  
  <xsl:template match="tei:teiHeader"/>
  
  <xsl:template match="tei:body">
    <xsl:choose>
      <xsl:when test="string-length($sectionId)&gt;0">
        <xsl:for-each select="//tei:div[@id=$sectionId]">
          <xsl:apply-templates/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="listFootnotes">
      <xsl:with-param name="sectionToProcess"><xsl:value-of select="$sectionId"/></xsl:with-param>
    </xsl:call-template>
    <!--<xsl:call-template name="endSpace"/>-->
  </xsl:template>

  <xsl:template match="tei:head">
    <xsl:choose>
	  <xsl:when test="@type='letter'">
        <p class="noIndent topMargin bottomMargin">
			<xsl:attribute name="class">
				<xsl:text>noIndent topMargin bottomMargin </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:when test="@type='title'">
<xsl:choose>
  <xsl:when test="parent::tei:div[@type='poem']">
	    <h1 class="poemtitle">
	      <xsl:attribute name="class">
	        <xsl:text>poemtitle </xsl:text>
	        <xsl:if test="@style='blackletter'">
	          <xsl:text>blackletter</xsl:text>
	        </xsl:if>
	      </xsl:attribute>
	      <xsl:apply-templates/>
	    </h1>
  </xsl:when>
        <xsl:otherwise>
        <h1 class="title">
			<xsl:attribute name="class">
				<xsl:text>title </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h1>
        </xsl:otherwise>
</xsl:choose>
      </xsl:when>
	     <xsl:when test="@type='titleFromMs'">
        <h1 class="poemtitleFromMs">
          <xsl:attribute name="class">
            <xsl:text>poemtitleFromMs </xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text>blackletter</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </h1>
      </xsl:when>
	  <xsl:when test="@type='section'">
	    <xsl:choose>
	      <xsl:when test="parent::tei:div[@type='poem']">
        <h2 class="poemsection">
			<xsl:attribute name="class">
				<xsl:text>poemsection </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
	      <xsl:otherwise>
        <h2 class="section">
	        <xsl:attribute name="class">
	          <xsl:text>section </xsl:text>
	          <xsl:if test="@style='blackletter'">
	            <xsl:text>blackletter</xsl:text>
	          </xsl:if>
	        </xsl:attribute>
	        <xsl:apply-templates/>
	      </h2>
</xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
	  <xsl:when test="@type='section2'">
	    <xsl:choose>
	      <xsl:when test="parent::tei:div[@type='poem']">
        <h2 class="poemsection2">
			<xsl:attribute name="class">
				<xsl:text>poemsection2 </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
	      <xsl:otherwise>
	        <h2 class="section2">
	          <xsl:attribute name="class">
	            <xsl:text>section2 </xsl:text>
	            <xsl:if test="@style='blackletter'">
	              <xsl:text>blackletter</xsl:text>
	            </xsl:if>
	          </xsl:attribute>
	          <xsl:apply-templates/>
	        </h2>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
	  <xsl:when test="@type='sub'">
	    <xsl:choose>
	      <xsl:when test="parent::tei:div[@type='poem'] and $bookId='29'">
         <h4 class="poemsubdiary">
			        <xsl:attribute name="class">
				         <xsl:text>poemsubdiary </xsl:text>
				         <xsl:if test="@style='blackletter'">
					          <xsl:text>blackletter</xsl:text>
				         </xsl:if>
			        </xsl:attribute>
           <xsl:apply-templates/>
         </h4>
       </xsl:when>
	        <xsl:when test="parent::tei:div[@type='poem'] and not($bookId='29')">
        <h4 class="poemsub">
			<xsl:attribute name="class">
				<xsl:text>poemsub </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h4>
      </xsl:when>
	      <xsl:otherwise>
	      <h4 class="sub">
	        <xsl:attribute name="class">
	          <xsl:text>sub </xsl:text>
	          <xsl:if test="@style='blackletter'">
	            <xsl:text>blackletter</xsl:text>
	          </xsl:if>
	        </xsl:attribute>
	        <xsl:apply-templates/>
	      </h4>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
      <xsl:when test="@type='sub2' or @type='incorp'">
        <xsl:choose>
          <xsl:when test="parent::tei:div[@type='poem']">
            <h5 class="poemsub2">
              <xsl:attribute name="class">
                <xsl:text>poemsub2 </xsl:text>
                <xsl:if test="@style='blackletter'">
                  <xsl:text>blackletter</xsl:text>
                </xsl:if>
              </xsl:attribute>
              <xsl:apply-templates/>
            </h5>
          </xsl:when>
          <xsl:otherwise>
            <h5 class="sub2est">
              <xsl:attribute name="class">
                <xsl:text>sub2est </xsl:text>
                <xsl:if test="@style='blackletter'">
                  <xsl:text>blackletter</xsl:text>
                </xsl:if>
              </xsl:attribute>
              <xsl:apply-templates/>
            </h5>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
	  <xsl:when test="@type='motto'">
	    <xsl:choose>
	      <xsl:when test="parent::tei:div[@type='poem']">
        <h5 class="poemmotto">
			<xsl:attribute name="class">
				<xsl:text>poemmotto </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h5>
      </xsl:when>
	      <xsl:otherwise>
	      <h5 class="motto">
	        <xsl:attribute name="class">
	          <xsl:text>motto </xsl:text>
	          <xsl:if test="@style='blackletter'">
	            <xsl:text>blackletter</xsl:text>
	          </xsl:if>
	        </xsl:attribute>
	        <xsl:apply-templates/>
	      </h5>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
	  <xsl:when test="@type='motto2'">
	    <xsl:choose>
	      <xsl:when test="parent::tei:div[@type='poem']">
        <h6 class="poemmotto2">
			<xsl:attribute name="class">
				<xsl:text>poemmotto2 </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
          <xsl:apply-templates/>
        </h6>
      </xsl:when>
	      <xsl:otherwise>
	      <h6 class="motto2">
	        <xsl:attribute name="class">
	          <xsl:text>motto2 </xsl:text>
	          <xsl:if test="@style='blackletter'">
	            <xsl:text>blackletter</xsl:text>
	          </xsl:if>
	        </xsl:attribute>
	        <xsl:apply-templates/>
	      </h6>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
      <xsl:when test="@type='sub3'">
        <xsl:choose>
          <xsl:when test="parent::tei:div[@type='poem']">
            <h6 class="sub3">
              <xsl:attribute name="class">                 <xsl:text>sub3 </xsl:text>
                <xsl:if test="@style='blackletter'">                   <xsl:text>blackletter</xsl:text>
                </xsl:if>
              </xsl:attribute>
              <xsl:apply-templates/>
            </h6>
          </xsl:when>
          <xsl:otherwise>
            <h6 class="sub3">
			           <xsl:attribute name="class">
				            <xsl:text>sub3 </xsl:text>                 <xsl:if test="@style='blackletter'">                   <xsl:text>blackletter</xsl:text>
			             </xsl:if>
              </xsl:attribute>
              <xsl:apply-templates/>
            </h6>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="parent::tei:div[@type='poem'] and not(@type) and $bookId='29'">
        <h3 class="poemdiary">
          <xsl:attribute name="class">
            <xsl:text>poemdiary </xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text>blackletter</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </h3>
      </xsl:when>
      <xsl:when test="parent::tei:div[@type='poem'] and not(@type) and not($bookId='29')">
        <h3 class="poem">
          <xsl:attribute name="class">
            <xsl:text>poem </xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text>blackletter</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </h3>
      </xsl:when>
        <xsl:when test="ancestor::tei:div[@type='diary'] and not(@type)">
          <h3 class="diary">
            <xsl:attribute name="class">
              <xsl:text>diary </xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
          </h3>
      </xsl:when>
      <xsl:when test="parent::tei:castList and not(@type)">
        <h4 class="poemsub">
          <xsl:attribute name="class">
            <xsl:text>poemsub </xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text>blackletter</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </h4>
      </xsl:when>
      <xsl:when test="parent::tei:castGroup and not(@type)">
        <h5 class="poemsub2">
          <xsl:attribute name="class">
            <xsl:text>poemsub2 </xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text>blackletter</xsl:text>
            </xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </h5>
      </xsl:when>
      <xsl:otherwise>
        <h3 class="chapter">
			<xsl:attribute name="class">
				<xsl:text>chapter </xsl:text>
				<xsl:if test="@style='blackletter'">
					<xsl:text>blackletter</xsl:text>
				</xsl:if>
			</xsl:attribute>
                <xsl:apply-templates/>
        </h3>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="($bookId='30' or $bookId='31') and @rend='left' and not(@type)">
      <xsl:if test="count(/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p) > 1">
        <p class="noIndent">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p[2]" />
          <xsl:text>]</xsl:text>
        </p>
      </xsl:if>
      <p class="paragraphSpace" />
    </xsl:if>
  </xsl:template>
  
   <xsl:template match="tei:div">

       <xsl:if test="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:creation/tei:title[@type='readingtext'] and @type='letter'">
         <h3 class="title left">
           <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:creation/tei:title[@type='readingtext']"/>
         </h3>
         <p class="paragraphSpace" />
       </xsl:if>

    <xsl:choose>
      <xsl:when test="@type='comment'"/>
      <xsl:otherwise>
        <xsl:if test="@type='letterpart' and @part='f'">
          <p>&#160;</p>
        </xsl:if>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:lg">
    <xsl:if test="not(ancestor::tei:note)">
      <xsl:if test="@xml:id">
        <p>
          <xsl:attribute name="class">
            <xsl:text>invisiblelg </xsl:text>
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
        </p>
      </xsl:if>
      <xsl:if test="@type='empty'">
        <span class="corr corr_hide">
          <p class="strofeSpacing" />
          <img src="images/squared_times_gray.png"/>
        </span>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="not(name(following-sibling::*[1]) = 'lg')">
         <p>
          <xsl:attribute name="class">
            <xsl:text>invisiblelg </xsl:text>
           </xsl:attribute>
         </p>
      </xsl:if>
     </xsl:if>
     <xsl:if test="ancestor::tei:note">
      <xsl:apply-templates/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:l">
    <xsl:choose>
      <xsl:when test="@empty='true'"/>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="child::tei:seg[@type='split']">
            <p>
              <xsl:attribute name="class">
                <xsl:text>l l</xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:if test="@rend='indent' or $bookId='4' or $bookId='5'">
                  <xsl:text> lIndent</xsl:text>
                </xsl:if>
				<xsl:if test="@style='blackletter'">
					<xsl:text> blackletter </xsl:text>
				</xsl:if>
              </xsl:attribute>
              <xsl:choose>
                <xsl:when test="(@n mod 5) = 0 and ancestor::tei:div[@type='poem'] and ($bookId='1' or $bookId='2' or $bookId='16' or $bookId='32' or $bookId='24')">
                  <span>
                    <xsl:attribute name="class">
                      <xsl:text>lNumber l</xsl:text>
                      <xsl:value-of select="@n"/>
                    </xsl:attribute>
                    <xsl:value-of select="@n"/>
                  </span>
                </xsl:when>
                <xsl:when
                  test="count(preceding-sibling::tei:l)&lt;1 and (ancestor::tei:div[@type='main'] or ancestor::tei:div[@type='letter'] or not(ancestor::tei:div[@type]))">
                  <span class="lNumber">
                    <xsl:choose>
                      <xsl:when test="$bookId='30' or $bookId='31'">
                        <xsl:number count="tei:p|tei:lg|tei:list" level="any" from="//tei:body"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:number count="tei:p|tei:lg|tei:list"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </span>
                </xsl:when>
              </xsl:choose>
              <xsl:value-of select="text()"/>
            </p>
            <xsl:apply-templates select="child::tei:seg" mode="split"/>
          </xsl:when>
          <xsl:when test="ancestor::tei:note">
            <span class="footnotePoem">
<xsl:apply-templates/>
</span>
          </xsl:when>
          <xsl:otherwise>
    <p>
      <xsl:attribute name="class">
        <xsl:text>l l</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:if test="@rend='indent' or $bookId='4' or $bookId='5' or $bookId='6' or $bookId='8' or $bookId='18'">           <xsl:text> lIndent</xsl:text>
        </xsl:if>
        <xsl:if test="$bookId='29'">
          <xsl:text> lIndentDiary</xsl:text>
        </xsl:if>
		<xsl:if test="@style='blackletter'">
			<xsl:text> blackletter </xsl:text>
		</xsl:if>
        <xsl:if test="@rend='center' and not($bookId='2')">
          <xsl:text> lcenter </xsl:text>
        </xsl:if>
        <xsl:if test="@rend='center' and $bookId='2'">
          <xsl:text> lmedial </xsl:text>
        </xsl:if>
        <xsl:if test="@part='M'">
          <xsl:text> lmedial </xsl:text>
        </xsl:if>
        <xsl:if test="@part='F'">
          <xsl:text> lfinal </xsl:text>
        </xsl:if>
        <xsl:if test="@part='F2'">
          <xsl:text> lfinal2 </xsl:text>
        </xsl:if>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="(@n mod 5) = 0 and ancestor::tei:div[@type='poem'] and ($bookId='1' or $bookId='2' or $bookId='16' or $bookId='32' or $bookId='24')">
          <span>
            <xsl:attribute name="class">
              <xsl:text>lNumber l</xsl:text>
              <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:value-of select="@n"/>
          </span>
        </xsl:when>
        <xsl:when test="count(preceding-sibling::tei:l)&lt;1 and (ancestor::tei:div[@type='main'] or ancestor::tei:div[@type='letter'] or not(ancestor::tei:div[@type]))">
          <span class="lNumber">
            <xsl:choose>
              <xsl:when test="$bookId='30' or $bookId='31'">
                <xsl:number count="tei:p|tei:lg|tei:list" level="any" from="//tei:body"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:number count="tei:p|tei:lg|tei:list"/>
              </xsl:otherwise>
            </xsl:choose>
          </span>
        </xsl:when>
      </xsl:choose>
      <xsl:apply-templates/>
    </p>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>  
  </xsl:template>
  
<xsl:template match="tei:note">
    <xsl:choose>
      <xsl:when test="(@type='instruction' or @type='editorial')" /><!-- Dont' show if @type=instruction or @type=editorial -->
      <xsl:otherwise>
        <xsl:if test="@type='editor'">
          <img src="images/asterix.png">
            <xsl:attribute name="class">
              <xsl:text>comment commentScrollTarget tooltiptrigger ttComment </xsl:text>
              <xsl:value-of select="@id" />
            </xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="@id" />
            </xsl:attribute>
          </img>
          <span class="tooltip">
            <span class="ttFixed">
              <xsl:apply-templates/>
            </span>
          </span>
        </xsl:if>
        <xsl:if test="contains(@place, 'foot') or contains(@place, 'end') or contains(@id, 'ftn')">
          <span class="footnoteindicator hand">
            <xsl:attribute name="class">
              <xsl:text>footnoteindicator tooltiptrigger ttFoot </xsl:text>
              <xsl:value-of select="@id" />
            </xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="@id" />
            </xsl:attribute>
            <xsl:value-of select="@n" />
          </span>
          <span class="tooltip ttFoot">
            <span class="ttFixed">
              <xsl:attribute name="id">
                <xsl:value-of select="@id" />
              </xsl:attribute>
              <xsl:apply-templates/>
            </span>
          </span>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:seg">
    <xsl:choose>
      <xsl:when test="@type='alt'">
        <xsl:apply-templates select="tei:add[@reason='choice']" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:seg" mode="split">
    <xsl:if test="@type='split'">
      <p>
        <xsl:attribute name="class">
          <xsl:text>l l</xsl:text>
          <xsl:value-of select="@n"/>
          <xsl:if test="@rend='indent' or $bookId='4' or $bookId='5'">
            <xsl:text> lIndent</xsl:text>
          </xsl:if>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="(@n mod 5) = 0 and ancestor::tei:div[@type='poem']">
            <span>
              <xsl:attribute name="class">
                <xsl:text>lNumber l</xsl:text>
                <xsl:value-of select="@n"/>
              </xsl:attribute>
              <xsl:value-of select="@n"/>
            </span>
          </xsl:when>
          <xsl:when test="count(preceding-sibling::tei:l)&lt;1 and (ancestor::tei:div[@type='main'] or ancestor::tei:div[@type='letter'] or not(ancestor::tei:div[@type]))">
            <span class="lNumber">
              <xsl:choose>
                <xsl:when test="$bookId='30' or $bookId='31'">
                  <xsl:number count="tei:p|tei:lg|tei:list" level="any" from="//tei:body"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:number count="tei:p|tei:lg|tei:list"/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:when>
        </xsl:choose>
        <xsl:apply-templates/>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:title">
    <span>
      <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">
          <xsl:text>title tooltiptrigger ttTitle</xsl:text>
        <xsl:if test="@correspUncert='Y'">
          <xsl:text> uncertain</xsl:text>
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

  <xsl:template match="tei:placeName">
    <span>
      <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">
          <xsl:text>placeName tooltiptrigger ttPlace</xsl:text>
          <xsl:if test="@correspUncert='Y'">
            <xsl:text> uncertain</xsl:text>
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

  <xsl:template match="tei:persName|tei:rs">
    <span>
      <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">
          <xsl:text>person tooltiptrigger ttPerson</xsl:text>
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

  <xsl:template match="tei:speaker">
    <xsl:choose>
      <xsl:when test="ancestor::tei:p">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <p class="noIndent">
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:trailer">
    <p>
      <xsl:call-template name="attRend">
      <xsl:with-param name="defaultClasses">
        <xsl:text>paragraphDiary right</xsl:text>
      </xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:stage">
    <xsl:choose>
      <xsl:when test="ancestor::tei:p or ancestor::tei:head or ancestor::tei:stage">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <p>
          <xsl:call-template name="attRend">
            <xsl:with-param name="defaultClasses">
              <xsl:if test="@xml:id">
                <xsl:value-of select="@xml:id"/>
                <xsl:text> </xsl:text>
              </xsl:if>
              <xsl:if test="@n='1'">
                <xsl:text>noIndent </xsl:text>
              </xsl:if>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:p">
    <xsl:call-template name="paragraph" />
  </xsl:template>

  <xsl:template name="paragraph">
    <xsl:variable name="paragraphNumber">
      <!--<xsl:choose>
        <xsl:when test="$bookId='15'">
          <xsl:number count="tei:p|tei:lg|tei:list" level="any" from="//tei:body"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number count="tei:p|tei:lg|tei:list"/>
        </xsl:otherwise>
      </xsl:choose>-->
      <xsl:choose>
        <xsl:when test="contains(@xml:id, '_')">
          <xsl:value-of select="substring-after(@xml:id, '_')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-after(@xml:id, 'p')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="not(@empty='true')">
    <p>
  <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">
          <xsl:if test="@xml:id">
            <xsl:value-of select="@xml:id"/>
            <xsl:text> </xsl:text>
          </xsl:if>
          <xsl:if test="parent::tei:div[@type='poem'] and $bookId='29'">
            <xsl:text>poemP</xsl:text>
          </xsl:if>
          <xsl:if test="@n='1' or ($paragraphNumber='1' and $bookId='15') or parent::tei:postscript">
            <xsl:text>noIndent </xsl:text>
          </xsl:if>
			<xsl:if test="@style='blackletter'">
				<xsl:text> blackletter </xsl:text>
			</xsl:if>
          <xsl:if test="@rend='parIndent'">
            <xsl:text> parIndent </xsl:text>
          </xsl:if>
           <xsl:if test="ancestor::tei:div[@type='diary'] and child::tei:date">
            <xsl:text> paragraphDiary </xsl:text>
          </xsl:if>
          <xsl:choose>
          <xsl:when test="ancestor::tei:div[@type='diary'] and parent::tei:div[@type='frontmatter'] and following-sibling::tei:p and not(preceding-sibling::tei:p)">
            <xsl:text> frontmatterPrevious </xsl:text>
          </xsl:when>
            <xsl:when test="ancestor::tei:div[@type='diary'] and parent::tei:div[@type='frontmatter'] and preceding-sibling::tei:p and not(following-sibling::tei:p)">
            <xsl:text> frontmatterNext </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::tei:div[@type='diary'] and parent::tei:div[@type='frontmatter'] and following-sibling::tei:p and preceding-sibling::tei:p">
            <xsl:text> frontmatterMiddle </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::tei:div[@type='diary'] and parent::tei:div[@type='frontmatter']">
            <xsl:text> frontmatter </xsl:text>
          </xsl:when>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>

      <span>
        <xsl:attribute name="class">
          <xsl:text>paragraph_number p</xsl:text>
          <xsl:value-of select="$paragraphNumber"/>
        </xsl:attribute>
        <xsl:value-of select="$paragraphNumber"/>
      </span>

      <xsl:choose>
        <xsl:when test="preceding::tei:addSpan[@subtype='revision']">
          <xsl:variable name="addSpanId1" select="substring(preceding::tei:addSpan[@subtype='revision'][1]/@spanTo, 2)" />
          <xsl:variable name="addSpanId2" select="substring(preceding::tei:addSpan[@subtype='revision'][2]/@spanTo, 2)" />
          <xsl:choose>
            <xsl:when test="following::tei:anchor[@id=$addSpanId1] or following::tei:anchor[@id=$addSpanId2]">
              <span class="revision tooltiptrigger ttFoot">
               <xsl:text>Repetition</xsl:text> 
              </span>
              <span class="tooltip ttFoot">
                <span class="ttFixed">
                  <xsl:apply-templates/>
                </span>
              </span>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="preceding::tei:addSpan[@subtype='keyword']">
                  <xsl:variable name="addSpanId3" select="substring(preceding::tei:addSpan[@subtype='keyword'][1]/@spanTo, 2)" />
                  <xsl:variable name="addSpanId4" select="substring(preceding::tei:addSpan[@subtype='keyword'][2]/@spanTo, 2)" />
                  <xsl:choose>
                    <xsl:when test="following::tei:anchor[@id=$addSpanId3] or following::tei:anchor[@id=$addSpanId4]">
                      <span class="tooltiptrigger ttFoot">
                        <img src="images/keyword_symbol.gif" /> 
                      </span>
                      <span class="tooltip ttFoot">
                        <span class="ttFixed">
                          <xsl:apply-templates/>
                        </span>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:apply-templates />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="@xml:lang">
                      <span class="foreign tooltiptrigger ttLang">
                        <xsl:attribute name="lang">
                          <xsl:value-of select="@xml:lang"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                      </span>
                      <xsl:call-template name="xmlLang"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:apply-templates />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="preceding::tei:addSpan[@subtype='keyword']">
              <xsl:variable name="addSpanId1" select="substring(preceding::tei:addSpan[@subtype='keyword'][1]/@spanTo, 2)" />
              <xsl:variable name="addSpanId2" select="substring(preceding::tei:addSpan[@subtype='keyword'][2]/@spanTo, 2)" />
              <xsl:choose>
                <xsl:when test="following::tei:anchor[@id=$addSpanId1] or following::tei:anchor[@id=$addSpanId2]">
                  <span class="tooltiptrigger ttFoot">
                    <img src="images/keyword_symbol.gif" />
                  </span>
                  <span class="tooltip ttFoot">
                    <span class="ttFixed">
                      <xsl:apply-templates/>
                    </span>
                  </span>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="@xml:lang">
                      <span class="foreign tooltiptrigger ttLang">
                        <xsl:attribute name="lang">
                          <xsl:value-of select="@xml:lang"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                      </span>
                      <xsl:call-template name="xmlLang"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:apply-templates />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="@xml:lang">
                  <span class="foreign tooltiptrigger ttLang">
                    <xsl:attribute name="lang">
                      <xsl:value-of select="@xml:lang"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                  </span>
                  <xsl:call-template name="xmlLang"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </p>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:item">
    <xsl:choose>
      <xsl:when test="ancestor::tei:switchPos">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="position()=1">
        <p class="item">
          <xsl:if test="parent::tei:list[@xml:id]">
            <span>
              <xsl:attribute name="class">
                <xsl:text>lNumber </xsl:text>
                <xsl:value-of select="parent::tei:list/@xml:id"/>
              </xsl:attribute>
              <xsl:value-of select="substring(parent::tei:list/@xml:id, 3)"/>
            </span>
          </xsl:if>
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:when test="ancestor::tei:p">
        <xsl:if test="not(preceding-sibling::tei:item)">
          <br/>
        </xsl:if>
        <xsl:apply-templates/>
        <br/>
      </xsl:when>
      <xsl:otherwise>
        <p class="item">
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:anchor">
    <xsl:variable name="attJoin" select="concat('#', @id)" />
    <xsl:choose>
      <xsl:when test="contains(@xml:id, 'start')">
        <span class="anchor_lemma symbol_red">
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
          <img src="images/ms_arrow_right.png"/>
        </span>
      </xsl:when>
      <xsl:when test="contains(@xml:id, 'end')">
        <img src="images/asterix.png">
          <xsl:attribute name="class">
            <xsl:text>comment commentScrollTarget tooltiptrigger ttComment en</xsl:text>
            <xsl:value-of select="substring(@xml:id,4)" />
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id" />
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:when test="contains(@id, 'pos')">
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="@id"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>anchor </xsl:text>
            <xsl:value-of select="@id"/>
          </xsl:attribute>
        </a>
      </xsl:when>
      <xsl:when test="contains(@xml:id, 'pos')">
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>anchor </xsl:text>
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
        </a>
      </xsl:when>
      <xsl:when test="contains(@id, 'jn')">
        <xsl:text> </xsl:text>
        <xsl:value-of select="//tei:seg[@location=$attJoin]"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:choice">
    <span>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="child::tei:sic or child::tei:orig">
            <xsl:text>choice tooltiptrigger ttChanges</xsl:text>
          </xsl:when>
          <xsl:when test="child::tei:abbr">
            <xsl:text>abbr tooltiptrigger ttAbbreviations</xsl:text>
          </xsl:when>
          <xsl:when test="child::tei:var">
            <xsl:text>choice tooltiptrigger ttChanges</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>choice</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
    <xsl:choose>
      <xsl:when test="child::tei:sic">
        <span class="tooltip ttChanges">
          <xsl:text>original: </xsl:text>
          <xsl:apply-templates mode="tooltip"/>
          <!--<xsl:value-of select="tei:sic"/>-->
        </span>
      </xsl:when>
      <xsl:when test="child::tei:orig">
        <span class="tooltip ttChanges">
          <xsl:text>original: </xsl:text>
          <xsl:apply-templates mode="tooltip"/>
              <xsl:if test="child::tei:reg/@source">
                <xsl:text> (källa för ändring: </xsl:text>
               <xsl:value-of select="tei:reg/@source"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
        </span>
      </xsl:when>
      <xsl:when test="child::tei:expan">
        <span class="tooltip ttAbbreviations">
          <xsl:apply-templates mode="tooltip"/>
        </span>
      </xsl:when>
      <xsl:when test="child::tei:var">
        <span class="tooltip ttChanges">
          <xsl:text>tryckvarians: </xsl:text>
          <xsl:apply-templates mode="tooltip"/>
        </span>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:orig|tei:sic|tei:expan|tei:var" mode="tooltip">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:corr|tei:reg|tei:abbr|tei:edVar" mode="tooltip" />

  <xsl:template match="tei:sic">
    <!--<span style="background-color:#EF8066">
      <xsl:apply-templates/>
    </span>-->
  </xsl:template>

  <xsl:template match="tei:abbr">
    <span class="abbr">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:expan"/>

  <xsl:template match="tei:corr">

   <xsl:choose>
      <xsl:when test="parent::tei:choice">
        <xsl:choose>
          <xsl:when test="@type='empty'">
            <span class="corr corr_hide">
              <img src="images/squared_times_gray.png"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span class="corr">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="@type='empty'">
        <span class="corr_hide tooltiptrigger ttChanges">
          <img src="images/squared_times_gray.png"/>
        </span>
        <span class="tooltip ttChanges">
          <xsl:text>rättelse i originalet</xsl:text>
        </span>
      </xsl:when>
      <xsl:when test="@source='Rättelser'">
        <span class="corr_red tooltiptrigger ttChanges">
          <xsl:apply-templates/>
        </span>
        <span class="tooltip ttChanges">
          <xsl:text>rättelse i originalet</xsl:text>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="parent::tei:choice/tei:reg"/>
          <xsl:otherwise>
            <span class="corr">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:reg">
    <xsl:choose>
      <xsl:when test="parent::tei:choice">
        <xsl:choose>
          <xsl:when test="@type='empty'">
            <span class="corr corr_hide">
              <img src="images/squared_times_gray.png"/>
            </span>
          </xsl:when>
          <xsl:when test="@type='decoded'">
            <span class="reg tooltiptrigger ttNormalisations">
              <xsl:apply-templates/>
            </span>
             <span class="tooltip ttNormalisations">
              <xsl:text>uttolkad personkod</xsl:text>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span class="corr">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="@type='decoded'">
        <span class="reg tooltiptrigger ttNormalisations">
          <xsl:apply-templates/>
        </span>         <span class="tooltip ttNormalisations">
          <xsl:text>uttolkad chifferskrift</xsl:text>
        </span>
 
    </xsl:when>
      <xsl:when test="@type='empty'">
        <span class="reg_hide tooltiptrigger ttNormalisations">
          <img src="images/squared_times_gray.png"/>
        </span>
        <span class="tooltip ttNormalisations">
          <xsl:text>konsekvensändrat/normaliserat</xsl:text>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span class="reg tooltiptrigger ttNormalisations">
          <xsl:apply-templates/>
        </span>
        <span class="tooltip ttNormalisations">
          <xsl:text>konsekvensändrat/normaliserat</xsl:text>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:edVar">
    <xsl:choose>
      <xsl:when test="parent::tei:choice">
        <xsl:choose>
          <xsl:when test="@type='empty'">
            <span class="corr corr_hide">
              <img src="images/squared_times_gray.png"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span class="corr">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="@type='empty'">
        <span class="corr_hide tooltiptrigger ttChanges">
          <img src="images/squared_times_gray.png"/>
        </span>
        <span class="tooltip ttChanges">
          <xsl:text>tryckvarians</xsl:text>
        </span>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:orig">
    <!--<span style="background-color:#e76c4f">
      <xsl:apply-templates/>
    </span>-->
  </xsl:template>

  <xsl:template match="tei:var">
    <!--<span style="background-color:#e76c4f">
      <xsl:apply-templates/>
    </span>-->
  </xsl:template>

  <!-- Recursive for-loop to create non-breaking spaces (for reg type=empty) -->
  <xsl:template name="for.loop">
    <xsl:param name="i" />
    <xsl:param name="count" />
    <xsl:if test="$i &lt;= $count">
      <xsl:text>&#160;</xsl:text>
    </xsl:if>
    <xsl:if test="$i &lt;= $count">
      <xsl:call-template name="for.loop">
        <xsl:with-param name="i">
          <xsl:value-of select="$i + 1"/>
        </xsl:with-param>
        <xsl:with-param name="count">
          <xsl:value-of select="$count"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:supplied">
    <span class="corr_red choice tooltiptrigger ttChanges">
      <xsl:apply-templates/>
    </span>
    <span class="tooltip ttChanges">
      <xsl:call-template name="attReasonSupplied"/>
    </span>
  </xsl:template>

  <xsl:template match="tei:foreign">
    <span>
      <xsl:call-template name="attRend">
        <xsl:with-param name="defaultClasses">foreign tooltiptrigger ttLang</xsl:with-param>
      </xsl:call-template>
      <xsl:attribute name="lang">
        <xsl:value-of select="@xml:lang"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>      <xsl:call-template name="xmlLang"/>
       </xsl:template>

  <xsl:template match="tei:hi">
    <xsl:choose>
      <xsl:when test="@rend='raised' and not(contains(text(),','))">
        <xsl:text>:</xsl:text>
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="@rend='raised' and contains(text(),',')">
        <span class="raised">
         <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:when test="@rend='uppercase' and $bookId='29'">
        <span class="uppercaseDiary">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:when test="parent::tei:head">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="parent::tei:date and ancestor::tei:div[@type='diary']">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <span>
          <xsl:call-template name="attRend"/>
          <xsl:apply-templates/>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:switchPos">
    <xsl:choose>
      <xsl:when test="child::tei:p">
        <xsl:for-each select="child::tei:p">
          <xsl:sort select="@n" data-type="number"/>
          <xsl:call-template name="paragraph" />
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="child::tei:lg">
        <xsl:for-each select="child::tei:lg">
          <xsl:sort select="@n" data-type="number"/>
          <xsl:apply-templates />
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="child::tei:l">
        <xsl:for-each select="child::tei:l">
          <xsl:sort select="@n" data-type="number"/>
          <xsl:choose>
            <xsl:when test="preceding-sibling::tei:delSpan">
              <xsl:variable name="delSpanId" select="substring(preceding-sibling::tei:delSpan[1]/@spanTo, 2)" />
              <xsl:choose>
                <xsl:when test="following-sibling::tei:anchor[@id=$delSpanId]"/>
                <xsl:otherwise>
                  <p class="l">
                    <xsl:apply-templates/>
                  </p>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <p class="l">
                <xsl:apply-templates/>
              </p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="child::tei:item">
        <xsl:variable name="countItems" select="count(child::tei:item)" />
        <xsl:for-each select="child::tei:item">
          <xsl:sort select="@n" data-type="number"/>
          <xsl:apply-templates />
          <xsl:if test="position() != $countItems">
            <xsl:text> </xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!--<xsl:template match="tei:hi">
    <span>
      <xsl:call-template name="attRend"/>
      <xsl:apply-templates/>
    </span>
    *<xsl:choose>
      <xsl:when test="@rend='raised'">
        <span style="vertical-align: 20%;">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <i>
          <xsl:apply-templates/>
        </i>
      </xsl:otherwise>
    </xsl:choose>*
  </xsl:template>-->

  <xsl:template match="tei:pb">
<xsl:choose>     <xsl:when test="contains(@type, 'PN')"/> <xsl:otherwise>
        <span>
          <xsl:call-template name="att_pb_class"/>
          <xsl:call-template name="pb_text"/>
        </span>
</xsl:otherwise> </xsl:choose>   </xsl:template>

  <xsl:template match="tei:add">
    <!--<span style="vertical-align: 30%;">
      <xsl:apply-templates/>
    </span>-->
    <xsl:choose>
      <xsl:when test="@subtype='revision'">
        <span class="revision tooltiptrigger ttFoot">
          <xsl:text>Repetition</xsl:text>
        </span>
        <span class="tooltip ttFoot">
          <span class="ttFixed">
            <xsl:apply-templates />
          </span>
        </span>
      </xsl:when>
      <xsl:when test="@subtype='keyword'">
        <span class="tooltiptrigger ttFoot">
          <img src="images/keyword_symbol.gif" />
        </span>
        <span class="tooltip ttFoot">
          <span class="ttFixed">
            <xsl:apply-templates />
          </span>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:del">
    <span>
        <xsl:attribute name="class">
              <xsl:text>del tooltiptrigger ttDel</xsl:text>
        </xsl:attribute>
        <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:ref">
    <a class="textreference">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text><xsl:value-of select="@target"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  <xsl:template match="tei:figure">
    <xsl:choose>
      <xsl:when test="@type='pictogram' and not(child::tei:figDesc)">
        <span class="reg tooltiptrigger ttNormalisations">
          <img class="symbol" src="images/symbol_illustration.gif">
            <xsl:attribute name="id">
              <xsl:value-of select="substring-before(@url, '.')"/>
            </xsl:attribute>
            <xsl:attribute name="class">
              <xsl:text>it_image hand doodle unknown</xsl:text>
            </xsl:attribute>
          </img>
        </span>
        <span class="tooltip ttNormalisations">
          <xsl:text>otytt piktogram</xsl:text>
        </span>
      </xsl:when>
      <xsl:when test="@type='pictogram' and $bookId='29' ">
      <xsl:apply-templates/>
        <img class="symbol" src="images/symbol_illustration.gif">
          <xsl:attribute name="id">
            <xsl:text>tag_</xsl:text>
            <xsl:value-of select="substring-before(@url, '.')"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>it_image hand doodle</xsl:text>
          </xsl:attribute>
        </img>
        
      </xsl:when>
      <xsl:when test="@type='illustration' and $bookId='29'">
        <img class="symbol" src="images/image_symbol.gif"/>
      </xsl:when>
      <xsl:when test="@type='illustration' and $bookId='22'">
        <span class="figure">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:figDesc">
    <span class="reg tooltiptrigger ttNormalisations">
      <xsl:apply-templates/>
    </span>
    <span class="tooltip ttNormalisations">
      <xsl:text>uttolkat piktogram</xsl:text>
    </span>
  </xsl:template>

  <xsl:template match="tei:graphic">
    <img align="left">
      <xsl:attribute name="src">
        <xsl:text>images/verk/</xsl:text>
        <xsl:value-of select="@url"/>
      </xsl:attribute>
	  <xsl:attribute name="class">
        <xsl:text>est_figure_graphic</xsl:text>
		<xsl:if test="@align != ''">
			<xsl:text>_</xsl:text>
		</xsl:if>
        <xsl:value-of select="@align"/>
      </xsl:attribute>
    </img>
  </xsl:template>

  <xsl:template match="tei:unclear">
      <span>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="@reason='overstrike' or @reason='overwritten'">
              <xsl:text>unclear tooltiptrigger ttMs</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>unclear tooltiptrigger ttMs</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:apply-templates/>
      </span>
      <span class="tooltip">
        <xsl:call-template name="attReasonUnclear"/>
      </span>
  </xsl:template>
  
  <!-- OVERRIDES (Overrides inc_common.xsl) -->

  <xsl:template match="tei:gap | tei:space">
    <xsl:if test="( not(@reason='overstrike') and not(@reason='overwritten') and not(@reason='erased') ) or not(@reason)">
      <span>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="@reason='overstrike' or @reason='erased' or @reason='overwritten'">
              <xsl:text>gap deletion tooltiptrigger ttMs</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>gap tooltiptrigger ttMs</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:call-template name="spaceText"/>
      </span>
      <span class="tooltip">
        <xsl:choose>
          <xsl:when test="name() = 'space'">
            <xsl:call-template name="spaceTooltipText"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="attReasonSupplied"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:date">
    <xsl:choose>
      <xsl:when test="ancestor::tei:div[@type='diary']">         <span class="smallcaps">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
<xsl:otherwise>
  <xsl:choose>
    <xsl:when test="@rend">
      <span>         <xsl:call-template name="attRend"/>         <xsl:apply-templates/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:castItem">
  <p>
    <xsl:call-template name="attRend">
      <xsl:with-param name="defaultClasses">
          <xsl:text>noIndent </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
  </p>   </xsl:template>    <xsl:template match="tei:castList">
    <xsl:apply-templates/>   <p class="paragraphSpace"/>
  </xsl:template>

  <xsl:template match="tei:lb">
    <xsl:choose>       <xsl:when test="ancestor::tei:div[@type='diary'] and parent::tei:head">
        <xsl:text> </xsl:text>
      </xsl:when>
      <xsl:when test="ancestor::tei:p or ancestor::tei:l or ancestor::tei:head or ancestor::tei:note or ancestor::tei:opener or ancestor::tei:closer">
        <br />       </xsl:when>
      <xsl:otherwise>
        <p>&#160;</p>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- overrides inc_common due to milestone type editorial only in main text -->
  <xsl:template match="tei:milestone">
<xsl:choose>
    <xsl:when test="@type='editorial'">
        <br/>
      </xsl:when>     <xsl:when test="@type='bar'">
      <p class="center"><img src="images/bar.png"/></p>
    </xsl:when>
    <xsl:when test="@type='smallBar'">
      <p class="center">
        <img src="images/smallbar.png"/>
      </p>
    </xsl:when>
    <xsl:when test="@unit='part' and @when">
      <span class="milestoneWhen center">
        <xsl:choose>
          <xsl:when test="$bookId='4' or $bookId='5' or $bookId='6'">
            <xsl:text>Avsnittet ingår i HT </xsl:text>
          </xsl:when>
          <xsl:when test="$bookId='23'">
            <xsl:text>Notisen/artikeln ingår i HT </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Avsnittet publicerades </xsl:text>           </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="substring(@when,9,1)='0'">
            <xsl:value-of select="substring(@when,10,1)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring(@when,9,2)"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>/</xsl:text>
        <xsl:choose>
          <xsl:when test="substring(@when,6,1)='0'">
            <xsl:value-of select="substring(@when,7,1)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring(@when,6,2)"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring(@when,1,4)"/>
        <xsl:text>:</xsl:text>
      </span>
    </xsl:when>
    <xsl:when test="@unit='part'">
      <p class="milestonePart">
        <xsl:text>&#160;</xsl:text>
      </p>
    </xsl:when>
    </xsl:choose>
  </xsl:template>

<!-- overrides inc_common due to dateline i div type poem in main text in bookId 29 -->
  <xsl:template match="tei:dateline">
    <xsl:choose>
      <xsl:when test="ancestor::tei:opener or ancestor::tei:closer">
        <xsl:if test="preceding-sibling::*">
          <br />
          <br />
        </xsl:if>
        <span>
          <xsl:call-template name="attRend"/>
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:when test="parent::tei:div[@type='poem'] and $bookId='29'">
        <p>
          <xsl:attribute name="class">poemP</xsl:attribute>
          <xsl:apply-templates/>
        </p>       </xsl:when>
      <xsl:otherwise>
        <p class="dateline noIndent">           <xsl:attribute name="class">
            <xsl:text>dateline noIndent</xsl:text>
            <xsl:if test="@style='blackletter'">
              <xsl:text> blackletter </xsl:text>
            </xsl:if>
          </xsl:attribute>
          <span>

           <xsl:call-template name="attRend"/>
            <xsl:apply-templates/>
          </span>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
