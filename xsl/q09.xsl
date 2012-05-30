<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 09:</span> <span id="title">Universidades públicas dos Estados da Região Sudeste</span></h1>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<th>Nome</th>
				<th>Região</th>
				<th>Universidades Públicas</th>
			</thead>
			<tbody>
			<xsl:apply-templates select="estado[regiao='SE']">
				<xsl:sort select="nome" />
			</xsl:apply-templates>
			</tbody>
		</table>

	</xsl:template>

	<xsl:template match="estado">
		<tr>
			<td><xsl:value-of select="nome" /></td>
			<td><xsl:value-of select="regiao" /></td>
			<td>
				<ul>
				<xsl:apply-templates select="universidadesPublicas/nomeUniversidade">
					<xsl:sort select="." />
				</xsl:apply-templates>
				</ul>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="nomeUniversidade">
		<li><xsl:value-of select="." /></li>
	</xsl:template>

</xsl:stylesheet>