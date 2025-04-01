COPY operadoras (
    registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero,
    complemento, bairro, cidade, uf, cep, ddd, telefone, fax, email, representante,
    cargo_representante, regiao_de_comercializacao, data_registro
)
FROM './data/operadoras.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8';