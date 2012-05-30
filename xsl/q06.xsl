<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 06:</span> <span id="title">Estados que têm mais de um clube de futebol</span></h1>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<th>Nome</th>
				<th>Região</th>
				<th>Times de Futebol</th>
			</thead>
			<tbody>
			<xsl:apply-templates select="estado[count(timesFutebol/nomeTime)>1]">
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
				<xsl:apply-templates select="timesFutebol/nomeTime">
					<xsl:sort select="." />
				</xsl:apply-templates>
				</ul>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="nomeTime">
		<li><xsl:value-of select="." /></li>
	</xsl:template>

</xsl:stylesheet>