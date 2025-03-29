#CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE ans_data;

#CRIAÇÃO DA TABELA ADAPTADA PRA RECEBER OS ARQUIVOS CSV
CREATE TABLE operadoras (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(50),
    descricao VARCHAR(255),
    vl_saldo_inicial DECIMAL(15,2),
    vl_saldo_final DECIMAL(15,2)
);

#IMPORTAÇÃO DO PRIMEIRO ARQUIVO
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/3T2024.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET
    vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
    vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');
    
    
#IMPORTAÇÃO DO SEGUNDO ARQUIVO    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/4T2024.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET
    vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
    vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');
    



#LISTAR 10 OPERADORAS COM MAIORES DESPESAS NO ULTIMO ANO DA CATEGORIA 
#"EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTENCIA A SAUDE MEDICO HOSPITALAR"
SELECT * 
FROM operadoras
WHERE descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'
AND data BETWEEN '2024-07-01' AND '2024-09-30'  -- Último trimestre
ORDER BY (vl_saldo_final - vl_saldo_inicial) DESC
LIMIT 10;

#LISTAR 10 OPERADORAS COM MAIORES DESPESAS NO ULTIMO ANO DA CATEGORIA 
#"EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTENCIA A SAUDE MEDICO HOSPITALAR"
SELECT * 
FROM operadoras
WHERE descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'
AND data BETWEEN '2023-10-01' AND '2024-09-30'  -- Último ano
ORDER BY (vl_saldo_final - vl_saldo_inicial) DESC
LIMIT 10;






