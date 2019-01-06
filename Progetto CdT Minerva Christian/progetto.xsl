<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=0.8"/>
                <title>Progetto Codifica di Testi Christian Minerva</title>
                <link rel="stylesheet" href="node_modules/normalize.css/normalize.css"/>
                <link rel="stylesheet" href="node_modules/skeleton-css/css/skeleton.css"/>
                <link rel="stylesheet" type="text/css" href="node_modules/fullpage.js/dist/jquery.fullpage.min.css"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <img id="loader" fill="#030303" width="140" height="64" viewBox="0 0 140 64" src="tail-spin.svg"/><!--controlla tail-spin-->
                <div id="fullpage">
                    <xsl:apply-templates/>
                </div>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"/>
                <script type="text/javascript" src="node_modules/fullpage.js/vendors/scrolloverflow.min.js"/>
                <script type="text/javascript" src="node_modules/fullpage.js/dist/jquery.fullpage.min.mod.js"/>
                <script type="text/javascript" src="script.js"/>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="teiHeader">
        <div class="home section">
          
            <h1>
                <strong>
                    <xsl:value-of select="//biblStruct/monogr/title"/>
                </strong>
            </h1>
            
            <h2>
                <xsl:value-of select="//biblStruct/monogr/author"/>
            </h2>
            
            <h5>
                 Introduzione e traduzione di <br/>
                 <xsl:value-of select="//editionStmt/respStmt/name"/>
            </h5>
            
            <h6> 
                Casa editrice: <xsl:value-of select="//publicationStmt/publisher"/>
                <br/>
                <xsl:value-of select="//availability/licence"/>
            </h6>
            <hr/>
            <h4>
                <xsl:value-of select="fileDesc/titleStmt/respStmt/resp"/>: <xsl:value-of
                    select="fileDesc/titleStmt/respStmt/name"/>
            </h4>
            <h5>
                <i>Le parti codificate sono evidenziate all'interno del testo</i>
                <br/>
            </h5>
            <hr/>
            <h6> "scorri verso il basso"</h6>
        </div>
    </xsl:template>

    
    <xsl:template match="text"> 
        <div class="pages section">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    

    <xsl:template match="body/div"> <!--la pagina scorre lateralmente in base al numero di pagina indicato nel div-->
        <div class="slide">
            <xsl:value-of select="./@n"/>
            <hr/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
  
    <xsl:template match="div"> <!--i div sono le tabelle-->
        <table>
            <xsl:apply-templates/>
        </table> 
    </xsl:template>
    
    
    <xsl:template match="p"> <!--i p sono gli elementi  delle tabelle-->
        <div class="inline">
            <tr>
                <td>
                    <xsl:apply-templates/>
                </td> 
            </tr>
       </div>
    </xsl:template>
    
    <xsl:template match="num">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="seg">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="name">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="date">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="soCalled">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="time">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="orgName">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="persName">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="emph">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="said">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="quote">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="foreign">
        <b><i><xsl:apply-templates/></i></b>
    </xsl:template>
    
    <xsl:template match="q">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
   
</xsl:stylesheet>