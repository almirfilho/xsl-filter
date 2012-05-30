<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 08:</span> <span id="title">Atividades econômicas por Estado</span></h1>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<th>Nome</th>
				<th>Região</th>
				<th>Atividades Econômicas</th>
			</thead>
			<tbody>
			<xsl:apply-templates select="estado[count(ativEcon/tipo)>0]">
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
				<xsl:apply-templates select="ativEcon/tipo">
					<xsl:sort select="." />
				</xsl:apply-templates>
				</ul>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="tipo">
		<li><xsl:value-of select="." /></li>
	</xsl:template>

</xsl:stylesheet>