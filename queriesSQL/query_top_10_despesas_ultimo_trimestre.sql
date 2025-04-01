SELECT
    reg_ans,
    descricao,
    ano,
    trimestre,
    SUM(vl_saldo_final) AS total_despesas
FROM
    despesas_contabeis
WHERE
    descricao ILIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND ano = (SELECT MAX(ano) FROM despesas_contabeis)
    AND trimestre = (SELECT MAX(trimestre) FROM despesas_contabeis WHERE ano = (SELECT MAX(ano) FROM despesas_contabeis))
GROUP BY
    reg_ans,
    descricao,
    ano,
    trimestre
ORDER BY
    total_despesas DESC
LIMIT
    10;