<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<xsl:template match="brasil">
		
		<div class="page-header">
			<h1><span class="small">Questão 01:</span> <span id="title">Informações completas sobre todos os Estados brasileiros</span></h1>
		</div>
		
		<xsl:apply-templates select="estado">
			<xsl:sort select="nome" />
		</xsl:apply-templates>

	</xsl:template>
	
	<xsl:decimal-format name="num" decimal-separator="," grouping-separator="." />

	<xsl:template match="estado">
		<table class="table table-striped table-bordered">
			<thead>
				<th class="h1">Nome</th>
				<th class="h2">Região</th>
				<th class="h3">Capital</th>
				<th class="h4">Área</th>
				<th class="h5">População</th>
				<th class="h6">Municípios</th>
			</thead>
			<tbody>
				<tr>
					<td rowspan="3"><xsl:value-of select="nome" /></td>
					<td><xsl:value-of select="regiao" /></td>
					<td><xsl:value-of select="capital" /></td>
					<td><xsl:value-of select="format-number(area, '#.###,00', 'num')" /><xsl:text> km²</xsl:text></td>
					<td><xsl:value-of select="format-number(populacao, '#.###', 'num')" /></td>
					<td><xsl:value-of select="numMunic" /></td>
				</tr>
				<tr>
					<th>Ativ. Econômicas</th>
					<th>Divisas</th>
					<th>Times de Futebol</th>
					<th>Universidades Públicas</th>
					<th>Dados</th>
				</tr>
				<tr>
					<td>
						<ul>
						<xsl:apply-templates select="ativEcon/tipo">
							<xsl:sort select="." />
						</xsl:apply-templates>
						</ul>
					</td>
					<td>
						<ul>
						<xsl:apply-templates select="divisas/uf">
							<xsl:sort select="." />
						</xsl:apply-templates>
				
						<xsl:apply-templates select="divisas/pais">
							<xsl:sort select="." />
						</xsl:apply-templates>
						</ul>
					</td>
					<td>
						<ul>
						<xsl:apply-templates select="timesFutebol/nomeTime">
							<xsl:sort select="." />
						</xsl:apply-templates>
						</ul>
					</td>
					<td>
						<ul>
						<xsl:apply-templates select="universidadesPublicas/nomeUniversidade">
							<xsl:sort select="." />
						</xsl:apply-templates>
						</ul>
					</td>
					<td>
						<ul>
						<xsl:apply-templates select="dadosInteresse/dado">
							<xsl:sort select="." />
						</xsl:apply-templates>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="tipo">
		<li><xsl:value-of select="." /></li>
	</xsl:template>
	
	<xsl:template match="uf">
		<li><xsl:value-of select="." /><span><xsl:text> (UF)</xsl:text></span></li>
	</xsl:template>
	
	<xsl:template match="pais">
		<li><xsl:value-of select="." /><span><xsl:text> (País)</xsl:text></span></li>
	</xsl:template>
	
	<xsl:template match="nomeTime">
		<li><xsl:value-of select="." /></li>
	</xsl:template>
	
	<xsl:template match="nomeUniversidade">
		<li><xsl:value-of select="." /></li>
	</xsl:template>
	
	<xsl:template match="dado">
		<li><xsl:value-of select="." /></li>
	</xsl:template>

</xsl:stylesheet>