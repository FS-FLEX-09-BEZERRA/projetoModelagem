-- para criar tabela: precisa do nome da tabela e entre parênteses trazer cada 
-- atributo com seu tipo de dado e regra

CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
rg VARCHAR(20) UNIQUE,
telefone VARCHAR(11) UNIQUE,
endereco VARCHAR(100)
);


-- Select serve para fazer consulta, * representa todos os atributos (colunas)
SELECT * FROM clientes;


-- Exclusão de tabela:
DROP TABLE clientes;
DROP TABLE compras;

--Alteração de tabela 
ALTER TABLE clientes DROP COLUMN RG;
ALTER TABLE clientes ADD COLUMN rg VARCHAR(20) UNIQUE;
ALTER TABLE clientes RENAME COLUMN rg TO document;

CREATE TABLE compras (
id SERIAL PRIMARY KEY,
data_compra DATE NOT NULL,  
valor_total DECIMAL(10,2) NOT NULL,
cliente_id INTEGER REFERENCES clientes(id)
);

-- Criar tabela categoriasProd com atributos id e categoria,
-- onde categoria precisa ser único

CREATE TABLE categoriasProd (
id SERIAL PRIMARY KEY,
categoria VARCHAR(15) NOT NULL UNIQUE
);

--Criar tabela de produtos atributos (id, nome, preco, categoria_id)

CREATE TABLE produtos (
id SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
preco DECIMAL(4,2) NOT NULL,
categoria_id INTEGER REFERENCES categoriasProd(id) ON DELETE CASCADE --Ao deletar uma categoria o produto daquela categoria é deletado junto
);

-- AO DELETAR UMA CATEGORIA, A TABELA DE PRODUTOS ONDE O PRODUTO QUE POSSUIA AQUELA CATEGORIA VAI SER ALTERADO O CAMPO DE categoria_id como NULL
categoria_id INTEGER REFERENCES categoriasProd(id) ON DELETE SET NULL 

-- Altera a tabela adicionando a regra para não permitir nulo 
--("SET" faz parte do dialeto do postgres)
ALTER TABLE produtos ALTER COLUMN nome SET NOT NULL; 

CREATE TABLE compraProdutos (
compra_id INT REFERENCES compras(id),
produto_id INT REFERENCES produtos(id),
qtd INT DEFAULT(1) NOT NULL,
PRIMARY KEY (compra_id, produto_id)
);

-- Renomeando nome da tabela
ALTER TABLE categoriasProd RENAME TO categorias_prod;
ALTER TABLE compraProdutos RENAME TO compra_produtos;

-- Inserindo dados
INSERT INTO categorias_prod (categoria) VALUES ('Hossomaki'), ('Hot'),
('Temaki'), ('Yakissoba'), ('Sashimi'), ('Niguiri');

SELECT * FROM categorias_prod;

INSERT INTO produtos (nome, preco, categoria_id) VALUES
('Hossomaki Salmão', 18.90, 1),
('Hossomaki Kani', 16.50, 1),
('Hot Philadelphia', 24.90, 2),
('Hot Camarão', 27.50, 2),
('Temaki Salmão', 29.90, 3),
('Temaki Skin', 25.90, 3),
('Yakissoba Frango', 32.90, 4),
('Yakissoba Misto', 36.90, 4),
('Sashimi Salmão', 34.90, 5),
('Niguiri Atum', 22.90, 6);

-- Consulta de dados com filtro 
select * from produtos where categoria_id = 4;

-- Consulta com filtro de parte do valor do campo  
-- "%" no inicio = termina com 
-- "%" no final = começa com 
-- "%" no inicio e final = filtra pelo texto independente da posição 
SELECT * FROM produtos WHERE nome LIKE '%Salmão%';

INSERT INTO clientes (nome, rg, telefone, endereco) VALUES
('João Silva',      '123456789', '85999990001', 'Rua das Flores, 100'),
('Maria Oliveira',  '123456790', '85999990002', 'Av. Beira Mar, 250'),
('Carlos Santos',   '123456791', '85999990003', 'Rua José de Alencar, 45'),
('Ana Souza',       '123456792', '85999990004', 'Rua Padre Cícero, 320'),
('Pedro Lima',      '123456793', '85999990005', 'Av. Santos Dumont, 1500'),
('Juliana Costa',   '123456794', '85999990006', 'Rua Dom Manuel, 88'),
('Lucas Ferreira',  '123456795', '85999990007', 'Rua Barão do Rio Branco, 67'),
('Fernanda Rocha',  '123456796', '85999990008', 'Av. Washington Soares, 2100'),
('Rafael Gomes',    '123456797', '85999990009', 'Rua 24 de Maio, 500'),
('Patricia Alves',  '123456798', '85999990010', 'Rua General Sampaio, 725');

