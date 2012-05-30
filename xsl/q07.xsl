<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 07:</span> <span id="title">Estados organizados em ordem decrescente de área territorial</span></h1>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<th>Nome</th>
				<th>Região</th>
				<th>Área Territorial</th>
			</thead>
			<tbody>
			<xsl:apply-templates select="estado">
				<xsl:sort select="area" data-type="number" order="descending" />
			</xsl:apply-templates>
			</tbody>
		</table>

	</xsl:template>
	
	<xsl:decimal-format name="num" decimal-separator="," grouping-separator="." />

	<xsl:template match="estado">
		<tr>
			<td><xsl:value-of select="nome" /></td>
			<td><xsl:value-of select="regiao" /></td>
			<td><xsl:value-of select="format-number(area,'#.###','num')" /><xsl:text> km²</xsl:text></td>
		</tr>
	</xsl:template>

</xsl:stylesheet>