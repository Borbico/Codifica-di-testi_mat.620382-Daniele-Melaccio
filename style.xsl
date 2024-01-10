<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>

            <head>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt"/>
                </title>

                <script src="https://code.jquery.com/jquery-3.2.1.js" crossorigin="anonymous"></script>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
                <link rel="stylesheet" type="text/css" href="pagine.css"></link>
                <script src="pagine.js"></script>
            </head>

            <body>

                <header>
                    <div id="head-container">

                        <div id="head-title">
                            <h1><xsl:apply-templates select="//tei:titleStmt"/></h1>
                        </div>

                        <ul class="headnav">
                            <li class="nav-item">
                                <a href="#info" class="nav-link">Informazioni</a>
                            </li>
                            <li class="nav-item">
                                <a href="#manoscritto" class="nav-link">Descrizione del manoscritto</a>
                            </li>
                            <li class="nav-item">
                                <a href="#p14" class="nav-link">Pagina 14</a>
                            </li>
                            <li class="nav-item">
                                <a href="#p15" class="nav-link">Pagina 15</a>
                            </li>
                            <li class="nav-item">
                                <a href="#p19" class="nav-link">Pagina 19</a>
                            </li>
                            <li class="nav-item">
                                <a href="#org-cit" class="nav-link">Organizzazioni citate</a>
                            </li>
                            <li class="nav-item">
                                <a href="#per-cit" class="nav-link">Persone citate</a>
                            </li>
                        </ul>
                    </div>
                </header>

                <div class="main">
                    
                    <div id="info">

                        <div id="info-left">
                            <h2>Alcune informazioni sul progetto</h2>
                            <p><xsl:apply-templates select="//tei:msDesc/tei:history"/></p>
                            <p><xsl:apply-templates select="//tei:editionStmt"/></p>
                            <p><xsl:apply-templates select="//tei:publicationStmt"/></p>
                        </div>

                        <div id="info-right">
                            <h2>Scelte di codifica</h2>
                            <ul class="codifica-list">
                                <xsl:apply-templates select="//tei:encodingDesc/tei:editorialDecl"/>
                            </ul>  
                        </div>
                        
                    </div>

                    <div id="manoscritto">
                        <h2>Descrizione del manoscritto</h2>
                        <p><xsl:apply-templates select="//tei:sourceDesc/tei:msDesc"/></p>
                    </div>

                    <div id="pages">
                        <h2>Pagine codificate</h2>
                        <xsl:apply-templates select="//tei:body"/>
                    </div>

                    <div id="cit">
                        <div id="org-cit">
                            <h2>Organizzazioni citate nel testo</h2>
                            <xsl:apply-templates select="//tei:standOff/tei:listOrg"/>
                        </div>

                        <div id="per-cit">
                            <h2>Persone citate nel testo</h2>
                            <xsl:apply-templates select="//tei:standOff/tei:listPerson"/>
                        </div>
                    </div>
                    
                </div>

            </body>

            <footer>
                <div id="footer">
                    <p>Webpage realizzata da Daniele Melaccio (mat.620382) per l'esame di Codifica di Testi, tenuto dal prof. Angelo Mario Del Grosso.</p>
                    <p>Corso di Laurea Triennale in Informatica Umanistica</p>
                </div>
            </footer>

        </html>

    </xsl:template>

    <xsl:template match="tei:titleStmt">
        <xsl:value-of select="tei:title"/>
    </xsl:template>

    <xsl:template match="tei:msDesc/tei:history">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <xsl:element name="p">
            <xsl:value-of select="tei:edition"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:respStmt[1]"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:respStmt[2]"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <xsl:element name="p">
            <xsl:value-of select="tei:publisher/tei:orgName"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:street"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:postCode"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:settlement"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:availability"/> - <xsl:value-of select="tei:date"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:sourceDesc/tei:msDesc">
        <xsl:element name="p">
            Documento cartaceo conservato a <xsl:value-of select="tei:msIdentifier/tei:settlement"/> presso la <xsl:value-of select="tei:msIdentifier/tei:institution/tei:orgName"/>.
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:msIdentifier/tei:collection"/> - <xsl:value-of select="tei:msIdentifier/tei:idno"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:foliation"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:collation"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:layoutDesc"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:handDesc"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:accMat"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:encodingDesc/tei:editorialDecl">
        <xsl:element name="li"><xsl:value-of select="tei:correction"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:normalization"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:punctuation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:hyphenation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:interpretation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:segmentation"/></xsl:element>
    </xsl:template>

    <xsl:template match="tei:surface">
        <xsl:element name="div">
            <xsl:attribute name="class">replica</xsl:attribute>
            <xsl:element name="p">Muovi il cursore sull'immagine per evidenziare la riga corrispondente nella trascrizione.</xsl:element>
            <xsl:element name="img">
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="alt">Immagine <xsl:value-of select="@xml:id"/></xsl:attribute>
            </xsl:element>

            <xsl:element name="map">
                <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="onmouseout">evidenzia(this, false)</xsl:attribute>
                        <xsl:attribute name="onmouseover">evidenzia(this, true)</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:attribute name="shape">rectangle</xsl:attribute>
                        <xsl:attribute name="coords"><xsl:value-of select="@ulx * (0.66)"/>,<xsl:value-of select="@uly * (0.66)"/>,<xsl:value-of select="@lrx * (0.66)"/>,<xsl:value-of select="@lry * (0.66)"/></xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:body">
        <xsl:for-each-group select="tei:div/tei:ab/tei:s/node() | tei:div//tei:pb" group-starting-with="tei:pb">
            <xsl:variable name="pagina">
                <xsl:value-of select="@n"/>
            </xsl:variable>
            <xsl:element name="div">
                <xsl:attribute name="class">pagina-body</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:element name="h2">Pagina <xsl:value-of select="$pagina"/></xsl:element>
                <h3>Clicca sui pulsanti per visualizzare</h3>
                <button class="pers_org_btn" onclick="person_organization_function('pers_org_btn')">Persone e organizzazioni</button>
                <button class="deleted_btn" onclick="deleted_function('deleted_btn')">Interventi dell'autore</button>
                <button class="correction_btn" onclick="correction_function('correction_btn')">Correzioni</button>
                <button class="regolarized_btn" onclick="regolarized_function('regolarized_btn')">Normalizzazioni</button>
                <button class="expanded_btn" onclick="expanded_function('expanded_btn')">Abbreviazioni</button>
                <xsl:element name="div">
                    <xsl:attribute name="class">pagina-img</xsl:attribute>
                    <xsl:apply-templates select="//tei:surface[@n=$pagina]"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">pagina-text</xsl:attribute>
                        <xsl:apply-templates select="current-group()"/>
                    </xsl:element>  
                </xsl:element>
            </xsl:element>
        </xsl:for-each-group> 
    </xsl:template>

    <xsl:template match="tei:s/tei:persName">
        <xsl:element name="span">
            <xsl:attribute name="class">person</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:s/tei:orgName">
        <xsl:element name="span">
            <xsl:attribute name="class">organization</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">deleted</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">added</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">error</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">correction</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">arcaic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">regolarized</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expanded</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">short</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element><xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:standOff/tei:listOrg">
        <xsl:for-each select="tei:org">
            <xsl:element name="h3">
                <xsl:value-of select="tei:orgName"/> 
            </xsl:element>
            <xsl:element name="p">
                <xsl:value-of select="tei:desc"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:standOff/tei:listPerson">
        <xsl:for-each select="tei:person">
            <xsl:element name="h3">
                <xsl:value-of select="tei:persName"/> 
            </xsl:element>
            <xsl:if test="tei:note" > 
                <xsl:element name="p">
                    <xsl:value-of select="tei:note"/>
                </xsl:element></xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>