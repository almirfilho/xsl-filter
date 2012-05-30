<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 04:</span> <span id="title">As divisas do Estado da Paraíba</span></h1>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<th>Divisas</th>
			</thead>
			<tbody>
			<xsl:apply-templates select="estado[@sigla='PB']"></xsl:apply-templates>
			</tbody>
		</table>

	</xsl:template>

	<xsl:template match="estado">
		<xsl:apply-templates select="divisas/uf">
			<xsl:sort select="." />
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="uf">
		<tr><td><xsl:value-of select="." /></td></tr>
	</xsl:template>

</xsl:stylesheet>