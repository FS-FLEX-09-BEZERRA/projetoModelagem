-- Ordenação de busca de dados (ORDER BY nomeDaColuna ASC ou DESC)
SELECT * FROM public.compras
ORDER BY id DESC;

SELECT * FROM public.clientes
ORDER BY id ASC;

-- Não faça DELETE/UPDATE sem WHERE
--UPDATE:
UPDATE categorias_prod SET categoria = 'Hotroll' WHERE id = 3;

UPDATE produtos SET categoria_id = 2 WHERE categoria_id = 1;

UPDATE produtos SET categoria_id = 3 WHERE nome LIKE '%Hot%';

UPDATE produtos SET categoria_id = 4 WHERE id = 5 AND nome = 'Temaki Salmão';
UPDATE produtos SET categoria_id = 4 WHERE nome LIKE '%Temaki%';

UPDATE produtos SET categoria_id = 5 WHERE nome LIKE '%Yakissoba%';
UPDATE produtos SET categoria_id = 6 WHERE nome LIKE '%Sashimi%';
UPDATE produtos SET categoria_id = 7 WHERE nome LIKE '%Niguiri%';

--DELETE:
DELETE FROM categorias_prod WHERE id = 3; 
--erro: categoria id = 3 é usado na tabela produtos
--e não tem a constraint ON DELETE CASCADE ou ON DELETE SET NULL

DELETE FROM clientes WHERE id = 9;

INSERT INTO compras (data_compra, valor_total, cliente_id) VALUES 
('16-06-2026', 52.40, 1),
('16-06-2026', 29.90, 2);

INSERT INTO compra_produtos (compra_id, produto_id, qtd) VALUES 
(3,3,1), (3,4,1), (4,5,1);

DROP TABLE compra_produtos;

CREATE TABLE compra_produtos (
compra_id INT REFERENCES compras(id) ON DELETE CASCADE,
produto_id INT REFERENCES produtos(id),
qtd INT DEFAULT(1) NOT NULL,
PRIMARY KEY (compra_id, produto_id)
);

DELETE FROM compras; -- todas as compras e as linhas da tabela compra_produtos foram deletados por falta do where


-- Funções agregadas (MAX, MIN, COUNT, AVG, SUM)
-- Selects com funções retornam um valor único com nome da coluna referente a função utilizada
SELECT MAX(preco) FROM produtos;
SELECT MIN(valor_total) FROM compras;
SELECT COUNT(*) FROM compras;
SELECT COUNT(*) FROM clientes WHERE active = 'true';
SELECT COUNT(*) FROM clientes WHERE nome LIKE '%maria%';
-- ROUND serve para fixar o número de casas decimais
-- AS serve para renomear 
SELECT ROUND(AVG(preco), 2) AS media_preco_prod FROM produtos;
SELECT ROUND(SUM(preco), 2) AS somatoria_valor_produtos FROM produtos;
SELECT ROUND(SUM(preco * qtd_estoque), 2) AS valor_total_estoque FROM produtos;

ALTER TABLE clientes ADD COLUMN active BOOLEAN NOT NULL DEFAULT 'true';
ALTER TABLE produtos ADD COLUMN qtd_estoque INT NOT NULL DEFAULT '10';

UPDATE clientes SET active = 'false' WHERE nome LIKE '%Maria%';

-- GROUP BY (funções por agrupamento)
SELECT categoria_id, COUNT(*) AS quantidade_produtos 
FROM produtos GROUP BY categoria_id ORDER BY categoria_id ASC;
