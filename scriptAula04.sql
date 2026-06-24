-- JOIN 
SELECT categorias_prod.categoria AS categoria, COUNT(*) AS quantidade_produtos FROM 
produtos INNER JOIN categorias_prod 
ON produtos.categoria_id = categorias_prod.id GROUP BY categoria ORDER BY categoria ASC;

SELECT clientes.nome AS Cliente, compras.id AS Codigo_compra, produtos.nome AS Produtos FROM compras INNER JOIN clientes ON compras.cliente_id = clientes.id INNER JOIN compra_produtos ON compras.id = compra_produtos.compra_id INNER JOIN produtos ON compra_produtos.produto_id = produtos.id WHERE compras.id = 3;

-- exemplo ficticio
UPDATE produtos SET categoria_id = 1 WHERE nome LIKE '%Corre%';