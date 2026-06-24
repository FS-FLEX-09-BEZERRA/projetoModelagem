-- JOIN 
SELECT categorias_prod.categoria AS categoria, COUNT(*) AS quantidade_produtos FROM 
produtos INNER JOIN categorias_prod 
ON produtos.categoria_id = categorias_prod.id GROUP BY categoria ORDER BY categoria ASC;



-- exemplo ficticio
UPDATE produtos SET categoria_id = 1 WHERE nome LIKE '%Corre%';