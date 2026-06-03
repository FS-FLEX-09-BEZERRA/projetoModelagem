-- para criar tabela: precisa do nome da tabela e entre parênteses trazer cada 
-- atributo com seu tipo de dado e regra

CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
RG VARCHAR(20) UNIQUE,
telefone VARCHAR(11) UNIQUE,
endereco VARCHAR(100)
);

-- Select serve para fazer consulta, * representa todos os atributos (colunas)
SELECT * FROM clientes;