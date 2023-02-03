CREATE VIEW vw_operacoes_estados AS
	SELECT uf, SUM(financiamento.valor_de_operacao) total_operacoes FROM
		financiamento 
			INNER JOIN cliente
				ON financiamento.cnpj_cliente = cliente.cnpj_cliente
			INNER JOIN municipio
				ON municipio.cod_municipio = cliente.cod_municipio
		GROUP BY uf;

CREATE VIEW vw_operacoes_clientes AS
    SELECT nome_cliente, SUM(valor_de_operacao) as total_operacoes FROM
	    financiamento 
		    INNER JOIN cliente
			    ON financiamento.cnpj_cliente = cliente.cnpj_cliente
	    GROUP BY nome_cliente;

CREATE VIEW vw_financiamentos AS
	SELECT cod_financiamento, cnpj_cliente, situacao_da_operacao, 
		data_de_contratacao, instrumento_financeiro, modalidade_de_apoio, forma_apoio
		FROM financiamento;

CREATE VIEW vw_count_instrumento_financeiro AS	
	SELECT instrumento_financeiro, COUNT(*)
    	FROM financiamento
    	GROUP BY instrumento_financeiro;

