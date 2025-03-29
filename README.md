Análise de Despesas de Operadoras de Saúde

Este repositório contém um exercício para importar e analisar dados financeiros de operadoras de saúde usando MySQL.

Passos para Execução

Criação do Banco de Dados:

Crie um banco de dados chamado ans_data para armazenar os dados das operadoras.

Criação da Tabela operadoras:

Crie a tabela operadoras com os campos necessários para armazenar as informações dos arquivos CSV importados, como data, código da operadora, descrição das despesas e valores de saldo.

Importação dos Arquivos CSV:

Importe os arquivos CSV (relacionados ao 3º e 4º trimestres de 2024) para a tabela operadoras, realizando a conversão de valores monetários no processo.

Consultas Analíticas:

Último Trimestre (Jul-Sep 2024): Realize uma consulta para listar as 10 operadoras com maiores despesas na categoria "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR".

Último Ano (Out 2023-Sep 2024): Execute uma consulta similar para o último ano, ajustando as datas conforme necessário.

Observações

Substitua os caminhos dos arquivos CSV conforme necessário para a sua máquina.

As consultas retornam as 10 operadoras com as maiores despesas nas categorias específicas, utilizando a diferença entre os saldos final e inicial para determinar as despesas.
