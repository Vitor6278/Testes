BEGIN TRANSACTION;

CREATE TEMPORARY TABLE despesas_contabeis_temp (
    id SERIAL PRIMARY KEY,
    data DATE,
    reg_ans TEXT,
    cd_conta_contabil TEXT,
    descricao TEXT,
    vl_saldo_inicial TEXT,
    vl_saldo_final TEXT
);

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/1T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/2T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/3T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/4T2023.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/1T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/2T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/3T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY despesas_contabeis_temp (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM './data/4T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

INSERT INTO despesas_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SELECT
    data,
    reg_ans,
    cd_conta_contabil,
    descricao,
    REPLACE(vl_saldo_inicial, ',', '.')::NUMERIC,
    REPLACE(vl_saldo_final, ',', '.')::NUMERIC,
    EXTRACT(YEAR FROM data),
    EXTRACT(QUARTER FROM data)
FROM despesas_contabeis_temp;

DROP TABLE despesas_contabeis_temp;

COMMIT;