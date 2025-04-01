CREATE TABLE despesas_trimestrais (
    data DATE,
    reg_ans VARCHAR(6),
    cd_conta_contabil VARCHAR(50),
    descricao TEXT,
    vl_saldo_inicial NUMERIC,
    vl_saldo_final NUMERIC,
    trimestre INT,
    ano INT
);
