SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM item_pedido;
SELECT * FROM pedido;
-- 1)
SELECT des_produto as "Produto"
FROM produto
WHERE val_produto in
    (SELECT max(val_produto) FROM produto);
    
-- 2)
SELECT pe.num_pedido as "Numero Pedido",
        pe.dat_pedido as "Data Pedido",
        cl.nom_cliente as "Nome Cliente",
        pr.id_produto as "Codigo Produto",
        pr.des_produto as "Descrição"
FROM pedido pe JOIN cliente cl
ON(pe.id_cliente = cl.id_cliente)
left outer JOIN item_pedido ip
ON(pe.num_pedido = ip.num_pedido)
left outer JOIN produto pr
ON(pr.id_produto = ip.id_produto);

-- 3)
SELECT pr.id_produto as "Codigo Produto",
        pr.des_produto as "Produto"
FROM produto pr JOIN item_pedido ip
ON(pr.id_produto = ip.id_produto(+))
WHERE pr.id_produto not in
    (SELECT id_produto FROM item_pedido);

-- 4)
SELECT cl.id_cliente as "Código",
        cl.nom_cliente as "Nome",
        count(pe.id_cliente) as "Quantidade de Pedidos"
FROM cliente cl JOIN pedido pe
ON(cl.id_cliente = pe.id_cliente)
GROUP BY cl.id_cliente,cl.nom_cliente;

-- 5)
SELECT pe.num_pedido as "Numero do Pedido",
        cl.nom_cliente as "Cliente",
        sum(pr.val_produto * ip.qtd_produto_pedido) as "Total da Nota"
FROM cliente cl JOIN pedido pe
ON(cl.id_cliente = pe.id_cliente)
JOIN item_pedido ip
ON(ip.num_pedido = pe.num_pedido)
JOIN produto pr
ON(ip.id_produto = pr.id_produto)
GROUP BY pe.num_pedido,cl.nom_cliente;