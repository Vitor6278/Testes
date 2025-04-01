SELECT
    reg_ans,
    descricao,
    ano,
    SUM(vl_saldo_final) AS total_despesas
FROM
    despesas_contabeis
WHERE
    descricao ILIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND ano = (SELECT MAX(ano) FROM despesas_contabeis)
GROUP BY
    reg_ans,
    descricao,
    ano
ORDER BY
    total_despesas DESC
LIMIT
    10;